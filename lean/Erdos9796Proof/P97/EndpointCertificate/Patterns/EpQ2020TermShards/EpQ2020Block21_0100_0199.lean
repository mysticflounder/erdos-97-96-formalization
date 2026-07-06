/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 21:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_21_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0100 : Poly :=
[
  term ((115141595105499072 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def ep_Q2_020_partial_21_0100 : Poly :=
[
  term ((230283190210998144 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-115141595105499072 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem ep_Q2_020_partial_21_0100_valid :
    mulPoly ep_Q2_020_coefficient_21_0100
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0101 : Poly :=
[
  term ((-27932160166342500 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 21. -/
def ep_Q2_020_partial_21_0101 : Poly :=
[
  term ((-55864320332685000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((27932160166342500 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem ep_Q2_020_partial_21_0101_valid :
    mulPoly ep_Q2_020_coefficient_21_0101
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0102 : Poly :=
[
  term ((-87052458741583608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 21. -/
def ep_Q2_020_partial_21_0102 : Poly :=
[
  term ((-174104917483167216 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((87052458741583608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem ep_Q2_020_partial_21_0102_valid :
    mulPoly ep_Q2_020_coefficient_21_0102
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0103 : Poly :=
[
  term ((211687499867098608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 21. -/
def ep_Q2_020_partial_21_0103 : Poly :=
[
  term ((423374999734197216 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-211687499867098608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem ep_Q2_020_partial_21_0103_valid :
    mulPoly ep_Q2_020_coefficient_21_0103
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0104 : Poly :=
[
  term ((5524223176628283 : Rat) / 975806724737959) [(0, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 21. -/
def ep_Q2_020_partial_21_0104 : Poly :=
[
  term ((11048446353256566 : Rat) / 975806724737959) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5524223176628283 : Rat) / 975806724737959) [(0, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem ep_Q2_020_partial_21_0104_valid :
    mulPoly ep_Q2_020_coefficient_21_0104
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0105 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 21. -/
def ep_Q2_020_partial_21_0105 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem ep_Q2_020_partial_21_0105_valid :
    mulPoly ep_Q2_020_coefficient_21_0105
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0106 : Poly :=
[
  term ((108224410732173318 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 106 for generator 21. -/
def ep_Q2_020_partial_21_0106 : Poly :=
[
  term ((216448821464346636 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((-108224410732173318 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem ep_Q2_020_partial_21_0106_valid :
    mulPoly ep_Q2_020_coefficient_21_0106
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0107 : Poly :=
[
  term ((-159544001210862618 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 107 for generator 21. -/
def ep_Q2_020_partial_21_0107 : Poly :=
[
  term ((-319088002421725236 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((159544001210862618 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem ep_Q2_020_partial_21_0107_valid :
    mulPoly ep_Q2_020_coefficient_21_0107
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0108 : Poly :=
[
  term ((-19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 108 for generator 21. -/
def ep_Q2_020_partial_21_0108 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem ep_Q2_020_partial_21_0108_valid :
    mulPoly ep_Q2_020_coefficient_21_0108
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0109 : Poly :=
[
  term ((10679298389063604 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 21. -/
def ep_Q2_020_partial_21_0109 : Poly :=
[
  term ((21358596778127208 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10679298389063604 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem ep_Q2_020_partial_21_0109_valid :
    mulPoly ep_Q2_020_coefficient_21_0109
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0110 : Poly :=
[
  term ((159544001210862618 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 110 for generator 21. -/
def ep_Q2_020_partial_21_0110 : Poly :=
[
  term ((-159544001210862618 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((319088002421725236 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem ep_Q2_020_partial_21_0110_valid :
    mulPoly ep_Q2_020_coefficient_21_0110
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0111 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 21. -/
def ep_Q2_020_partial_21_0111 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem ep_Q2_020_partial_21_0111_valid :
    mulPoly ep_Q2_020_coefficient_21_0111
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0112 : Poly :=
[
  term ((-93540257301240000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 21. -/
def ep_Q2_020_partial_21_0112 : Poly :=
[
  term ((-187080514602480000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem ep_Q2_020_partial_21_0112_valid :
    mulPoly ep_Q2_020_coefficient_21_0112
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0113 : Poly :=
[
  term ((-31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 113 for generator 21. -/
def ep_Q2_020_partial_21_0113 : Poly :=
[
  term ((-62495798436965448 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem ep_Q2_020_partial_21_0113_valid :
    mulPoly ep_Q2_020_coefficient_21_0113
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0114 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 21. -/
def ep_Q2_020_partial_21_0114 : Poly :=
[
  term ((-8585155128801024 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem ep_Q2_020_partial_21_0114_valid :
    mulPoly ep_Q2_020_coefficient_21_0114
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0115 : Poly :=
[
  term ((500424822417159987 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 115 for generator 21. -/
def ep_Q2_020_partial_21_0115 : Poly :=
[
  term ((1000849644834319974 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-500424822417159987 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem ep_Q2_020_partial_21_0115_valid :
    mulPoly ep_Q2_020_coefficient_21_0115
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0116 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 3), (16, 1)]
]

/-- Partial product 116 for generator 21. -/
def ep_Q2_020_partial_21_0116 : Poly :=
[
  term ((-383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem ep_Q2_020_partial_21_0116_valid :
    mulPoly ep_Q2_020_coefficient_21_0116
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0117 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 117 for generator 21. -/
def ep_Q2_020_partial_21_0117 : Poly :=
[
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem ep_Q2_020_partial_21_0117_valid :
    mulPoly ep_Q2_020_coefficient_21_0117
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0118 : Poly :=
[
  term ((-8767749332768322 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 21. -/
def ep_Q2_020_partial_21_0118 : Poly :=
[
  term ((8767749332768322 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17535498665536644 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem ep_Q2_020_partial_21_0118_valid :
    mulPoly ep_Q2_020_coefficient_21_0118
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0119 : Poly :=
[
  term ((46770128650620000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 21. -/
def ep_Q2_020_partial_21_0119 : Poly :=
[
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem ep_Q2_020_partial_21_0119_valid :
    mulPoly ep_Q2_020_coefficient_21_0119
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0120 : Poly :=
[
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 120 for generator 21. -/
def ep_Q2_020_partial_21_0120 : Poly :=
[
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 21. -/
theorem ep_Q2_020_partial_21_0120_valid :
    mulPoly ep_Q2_020_coefficient_21_0120
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0121 : Poly :=
[
  term ((2146288782200256 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 21. -/
def ep_Q2_020_partial_21_0121 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 21. -/
theorem ep_Q2_020_partial_21_0121_valid :
    mulPoly ep_Q2_020_coefficient_21_0121
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0122 : Poly :=
[
  term ((-5759956455579255 : Rat) / 975806724737959) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 122 for generator 21. -/
def ep_Q2_020_partial_21_0122 : Poly :=
[
  term ((-11519912911158510 : Rat) / 975806724737959) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((5759956455579255 : Rat) / 975806724737959) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 21. -/
theorem ep_Q2_020_partial_21_0122_valid :
    mulPoly ep_Q2_020_coefficient_21_0122
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0123 : Poly :=
[
  term ((-64967414562003324 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 21. -/
def ep_Q2_020_partial_21_0123 : Poly :=
[
  term ((-129934829124006648 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((64967414562003324 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 21. -/
theorem ep_Q2_020_partial_21_0123_valid :
    mulPoly ep_Q2_020_coefficient_21_0123
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0124 : Poly :=
[
  term ((-3990221915077974 : Rat) / 1230365000756557) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 21. -/
def ep_Q2_020_partial_21_0124 : Poly :=
[
  term ((-7980443830155948 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3990221915077974 : Rat) / 1230365000756557) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 21. -/
theorem ep_Q2_020_partial_21_0124_valid :
    mulPoly ep_Q2_020_coefficient_21_0124
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0125 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 125 for generator 21. -/
def ep_Q2_020_partial_21_0125 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 21. -/
theorem ep_Q2_020_partial_21_0125_valid :
    mulPoly ep_Q2_020_coefficient_21_0125
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0126 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 2), (16, 1)]
]

/-- Partial product 126 for generator 21. -/
def ep_Q2_020_partial_21_0126 : Poly :=
[
  term ((383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 21. -/
theorem ep_Q2_020_partial_21_0126_valid :
    mulPoly ep_Q2_020_coefficient_21_0126
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0127 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 127 for generator 21. -/
def ep_Q2_020_partial_21_0127 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 21. -/
theorem ep_Q2_020_partial_21_0127_valid :
    mulPoly ep_Q2_020_coefficient_21_0127
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0128 : Poly :=
[
  term ((28386508802492742 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 128 for generator 21. -/
def ep_Q2_020_partial_21_0128 : Poly :=
[
  term ((56773017604985484 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-28386508802492742 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 21. -/
theorem ep_Q2_020_partial_21_0128_valid :
    mulPoly ep_Q2_020_coefficient_21_0128
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0129 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 129 for generator 21. -/
def ep_Q2_020_partial_21_0129 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 21. -/
theorem ep_Q2_020_partial_21_0129_valid :
    mulPoly ep_Q2_020_coefficient_21_0129
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0130 : Poly :=
[
  term ((84461150693780340 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 21. -/
def ep_Q2_020_partial_21_0130 : Poly :=
[
  term ((168922301387560680 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-84461150693780340 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 21. -/
theorem ep_Q2_020_partial_21_0130_valid :
    mulPoly ep_Q2_020_coefficient_21_0130
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0131 : Poly :=
[
  term ((3247925600737500 : Rat) / 28298395017400811) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 131 for generator 21. -/
def ep_Q2_020_partial_21_0131 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 21. -/
theorem ep_Q2_020_partial_21_0131_valid :
    mulPoly ep_Q2_020_coefficient_21_0131
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0132 : Poly :=
[
  term ((70617084149382912 : Rat) / 28298395017400811) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 21. -/
def ep_Q2_020_partial_21_0132 : Poly :=
[
  term ((141234168298765824 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70617084149382912 : Rat) / 28298395017400811) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 21. -/
theorem ep_Q2_020_partial_21_0132_valid :
    mulPoly ep_Q2_020_coefficient_21_0132
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0133 : Poly :=
[
  term ((-227550356839339176 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 21. -/
def ep_Q2_020_partial_21_0133 : Poly :=
[
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 21. -/
theorem ep_Q2_020_partial_21_0133_valid :
    mulPoly ep_Q2_020_coefficient_21_0133
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0134 : Poly :=
[
  term ((14193254401246371 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 134 for generator 21. -/
def ep_Q2_020_partial_21_0134 : Poly :=
[
  term ((28386508802492742 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14193254401246371 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 21. -/
theorem ep_Q2_020_partial_21_0134_valid :
    mulPoly ep_Q2_020_coefficient_21_0134
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0135 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 135 for generator 21. -/
def ep_Q2_020_partial_21_0135 : Poly :=
[
  term ((-2384765313555840 : Rat) / 1230365000756557) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 21. -/
theorem ep_Q2_020_partial_21_0135_valid :
    mulPoly ep_Q2_020_coefficient_21_0135
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0136 : Poly :=
[
  term ((-14193254401246371 : Rat) / 56596790034801622) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 136 for generator 21. -/
def ep_Q2_020_partial_21_0136 : Poly :=
[
  term ((-14193254401246371 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((14193254401246371 : Rat) / 56596790034801622) [(0, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 21. -/
theorem ep_Q2_020_partial_21_0136_valid :
    mulPoly ep_Q2_020_coefficient_21_0136
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0137 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 137 for generator 21. -/
def ep_Q2_020_partial_21_0137 : Poly :=
[
  term ((3247925600737500 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 21. -/
theorem ep_Q2_020_partial_21_0137_valid :
    mulPoly ep_Q2_020_coefficient_21_0137
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0138 : Poly :=
[
  term ((-42230575346890170 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 21. -/
def ep_Q2_020_partial_21_0138 : Poly :=
[
  term ((42230575346890170 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-84461150693780340 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 21. -/
theorem ep_Q2_020_partial_21_0138_valid :
    mulPoly ep_Q2_020_coefficient_21_0138
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0139 : Poly :=
[
  term ((-28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 139 for generator 21. -/
def ep_Q2_020_partial_21_0139 : Poly :=
[
  term ((-56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 21. -/
theorem ep_Q2_020_partial_21_0139_valid :
    mulPoly ep_Q2_020_coefficient_21_0139
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0140 : Poly :=
[
  term ((-40979858146626028 : Rat) / 975806724737959) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 140 for generator 21. -/
def ep_Q2_020_partial_21_0140 : Poly :=
[
  term ((-81959716293252056 : Rat) / 975806724737959) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((40979858146626028 : Rat) / 975806724737959) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 21. -/
theorem ep_Q2_020_partial_21_0140_valid :
    mulPoly ep_Q2_020_coefficient_21_0140
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0141 : Poly :=
[
  term ((221054505637864176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 141 for generator 21. -/
def ep_Q2_020_partial_21_0141 : Poly :=
[
  term ((442109011275728352 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-221054505637864176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 21. -/
theorem ep_Q2_020_partial_21_0141_valid :
    mulPoly ep_Q2_020_coefficient_21_0141
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0142 : Poly :=
[
  term ((-2262820924738585911 : Rat) / 113193580069603244) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 21. -/
def ep_Q2_020_partial_21_0142 : Poly :=
[
  term ((-2262820924738585911 : Rat) / 56596790034801622) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2262820924738585911 : Rat) / 113193580069603244) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 21. -/
theorem ep_Q2_020_partial_21_0142_valid :
    mulPoly ep_Q2_020_coefficient_21_0142
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0143 : Poly :=
[
  term ((894286992583440 : Rat) / 1230365000756557) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 21. -/
def ep_Q2_020_partial_21_0143 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 21. -/
theorem ep_Q2_020_partial_21_0143_valid :
    mulPoly ep_Q2_020_coefficient_21_0143
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0144 : Poly :=
[
  term ((-738089099041479429 : Rat) / 56596790034801622) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 21. -/
def ep_Q2_020_partial_21_0144 : Poly :=
[
  term ((-738089099041479429 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((738089099041479429 : Rat) / 56596790034801622) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 21. -/
theorem ep_Q2_020_partial_21_0144_valid :
    mulPoly ep_Q2_020_coefficient_21_0144
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0145 : Poly :=
[
  term ((-28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 145 for generator 21. -/
def ep_Q2_020_partial_21_0145 : Poly :=
[
  term ((28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 21. -/
theorem ep_Q2_020_partial_21_0145_valid :
    mulPoly ep_Q2_020_coefficient_21_0145
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0146 : Poly :=
[
  term ((31180085767080000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 21. -/
def ep_Q2_020_partial_21_0146 : Poly :=
[
  term ((62360171534160000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 21. -/
theorem ep_Q2_020_partial_21_0146_valid :
    mulPoly ep_Q2_020_coefficient_21_0146
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0147 : Poly :=
[
  term ((-77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 147 for generator 21. -/
def ep_Q2_020_partial_21_0147 : Poly :=
[
  term ((-155209900834614600 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 21. -/
theorem ep_Q2_020_partial_21_0147_valid :
    mulPoly ep_Q2_020_coefficient_21_0147
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0148 : Poly :=
[
  term ((1430859188133504 : Rat) / 1230365000756557) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 148 for generator 21. -/
def ep_Q2_020_partial_21_0148 : Poly :=
[
  term ((2861718376267008 : Rat) / 1230365000756557) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 21. -/
theorem ep_Q2_020_partial_21_0148_valid :
    mulPoly ep_Q2_020_coefficient_21_0148
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0149 : Poly :=
[
  term ((-199033700675695096 : Rat) / 28298395017400811) [(0, 1), (9, 2), (16, 1)]
]

/-- Partial product 149 for generator 21. -/
def ep_Q2_020_partial_21_0149 : Poly :=
[
  term ((-398067401351390192 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((199033700675695096 : Rat) / 28298395017400811) [(0, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 21. -/
theorem ep_Q2_020_partial_21_0149_valid :
    mulPoly ep_Q2_020_coefficient_21_0149
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0150 : Poly :=
[
  term ((-43522203049882500 : Rat) / 28298395017400811) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 21. -/
def ep_Q2_020_partial_21_0150 : Poly :=
[
  term ((43522203049882500 : Rat) / 28298395017400811) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-87044406099765000 : Rat) / 28298395017400811) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 21. -/
theorem ep_Q2_020_partial_21_0150_valid :
    mulPoly ep_Q2_020_coefficient_21_0150
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0151 : Poly :=
[
  term ((-1997240950103016 : Rat) / 1230365000756557) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 21. -/
def ep_Q2_020_partial_21_0151 : Poly :=
[
  term ((1997240950103016 : Rat) / 1230365000756557) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3994481900206032 : Rat) / 1230365000756557) [(0, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 21. -/
theorem ep_Q2_020_partial_21_0151_valid :
    mulPoly ep_Q2_020_coefficient_21_0151
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0152 : Poly :=
[
  term ((164030632278182688 : Rat) / 28298395017400811) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 21. -/
def ep_Q2_020_partial_21_0152 : Poly :=
[
  term ((328061264556365376 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-164030632278182688 : Rat) / 28298395017400811) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 21. -/
theorem ep_Q2_020_partial_21_0152_valid :
    mulPoly ep_Q2_020_coefficient_21_0152
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0153 : Poly :=
[
  term ((-19487553604425000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 153 for generator 21. -/
def ep_Q2_020_partial_21_0153 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 21. -/
theorem ep_Q2_020_partial_21_0153_valid :
    mulPoly ep_Q2_020_coefficient_21_0153
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0154 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 21. -/
def ep_Q2_020_partial_21_0154 : Poly :=
[
  term ((-31180085767080000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 21. -/
theorem ep_Q2_020_partial_21_0154_valid :
    mulPoly ep_Q2_020_coefficient_21_0154
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0155 : Poly :=
[
  term ((206932265528512692 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 21. -/
def ep_Q2_020_partial_21_0155 : Poly :=
[
  term ((413864531057025384 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-206932265528512692 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 21. -/
theorem ep_Q2_020_partial_21_0155_valid :
    mulPoly ep_Q2_020_coefficient_21_0155
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0156 : Poly :=
[
  term ((3845434068108792 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 21. -/
def ep_Q2_020_partial_21_0156 : Poly :=
[
  term ((7690868136217584 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3845434068108792 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 21. -/
theorem ep_Q2_020_partial_21_0156_valid :
    mulPoly ep_Q2_020_coefficient_21_0156
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0157 : Poly :=
[
  term ((97117694093985517 : Rat) / 28298395017400811) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 21. -/
def ep_Q2_020_partial_21_0157 : Poly :=
[
  term ((194235388187971034 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97117694093985517 : Rat) / 28298395017400811) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 21. -/
theorem ep_Q2_020_partial_21_0157_valid :
    mulPoly ep_Q2_020_coefficient_21_0157
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0158 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 158 for generator 21. -/
def ep_Q2_020_partial_21_0158 : Poly :=
[
  term ((-1430859188133504 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 21. -/
theorem ep_Q2_020_partial_21_0158_valid :
    mulPoly ep_Q2_020_coefficient_21_0158
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0159 : Poly :=
[
  term ((589410376663348278 : Rat) / 28298395017400811) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 159 for generator 21. -/
def ep_Q2_020_partial_21_0159 : Poly :=
[
  term ((1178820753326696556 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 21. -/
theorem ep_Q2_020_partial_21_0159_valid :
    mulPoly ep_Q2_020_coefficient_21_0159
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0160 : Poly :=
[
  term ((-813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 160 for generator 21. -/
def ep_Q2_020_partial_21_0160 : Poly :=
[
  term ((-813239842215664911 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 21. -/
theorem ep_Q2_020_partial_21_0160_valid :
    mulPoly ep_Q2_020_coefficient_21_0160
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0161 : Poly :=
[
  term ((-328061264556365376 : Rat) / 28298395017400811) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 161 for generator 21. -/
def ep_Q2_020_partial_21_0161 : Poly :=
[
  term ((-656122529112730752 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 21. -/
theorem ep_Q2_020_partial_21_0161_valid :
    mulPoly ep_Q2_020_coefficient_21_0161
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0162 : Poly :=
[
  term ((22239498191917428 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 162 for generator 21. -/
def ep_Q2_020_partial_21_0162 : Poly :=
[
  term ((44478996383834856 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-22239498191917428 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 21. -/
theorem ep_Q2_020_partial_21_0162_valid :
    mulPoly ep_Q2_020_coefficient_21_0162
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0163 : Poly :=
[
  term ((3897510720885000 : Rat) / 975806724737959) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 21. -/
def ep_Q2_020_partial_21_0163 : Poly :=
[
  term ((7795021441770000 : Rat) / 975806724737959) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 21. -/
theorem ep_Q2_020_partial_21_0163_valid :
    mulPoly ep_Q2_020_coefficient_21_0163
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0164 : Poly :=
[
  term ((1792715456239232463 : Rat) / 113193580069603244) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 21. -/
def ep_Q2_020_partial_21_0164 : Poly :=
[
  term ((1792715456239232463 : Rat) / 56596790034801622) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1792715456239232463 : Rat) / 113193580069603244) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 21. -/
theorem ep_Q2_020_partial_21_0164_valid :
    mulPoly ep_Q2_020_coefficient_21_0164
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0165 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 21. -/
def ep_Q2_020_partial_21_0165 : Poly :=
[
  term ((-8585155128801024 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 21. -/
theorem ep_Q2_020_partial_21_0165_valid :
    mulPoly ep_Q2_020_coefficient_21_0165
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0166 : Poly :=
[
  term ((4027020598921492485 : Rat) / 113193580069603244) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 166 for generator 21. -/
def ep_Q2_020_partial_21_0166 : Poly :=
[
  term ((4027020598921492485 : Rat) / 56596790034801622) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4027020598921492485 : Rat) / 113193580069603244) [(0, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 21. -/
theorem ep_Q2_020_partial_21_0166_valid :
    mulPoly ep_Q2_020_coefficient_21_0166
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0167 : Poly :=
[
  term ((-2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 2), (16, 1)]
]

/-- Partial product 167 for generator 21. -/
def ep_Q2_020_partial_21_0167 : Poly :=
[
  term ((-4739721060692232 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 21. -/
theorem ep_Q2_020_partial_21_0167_valid :
    mulPoly ep_Q2_020_coefficient_21_0167
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0168 : Poly :=
[
  term ((20684070395160855 : Rat) / 1380409513043942) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 168 for generator 21. -/
def ep_Q2_020_partial_21_0168 : Poly :=
[
  term ((20684070395160855 : Rat) / 690204756521971) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-20684070395160855 : Rat) / 1380409513043942) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 21. -/
theorem ep_Q2_020_partial_21_0168_valid :
    mulPoly ep_Q2_020_coefficient_21_0168
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0169 : Poly :=
[
  term ((-16990792537917459 : Rat) / 2760819026087884) [(0, 1), (16, 1)]
]

/-- Partial product 169 for generator 21. -/
def ep_Q2_020_partial_21_0169 : Poly :=
[
  term ((-16990792537917459 : Rat) / 1380409513043942) [(0, 1), (10, 1), (16, 1)],
  term ((16990792537917459 : Rat) / 2760819026087884) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 21. -/
theorem ep_Q2_020_partial_21_0169_valid :
    mulPoly ep_Q2_020_coefficient_21_0169
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0170 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 170 for generator 21. -/
def ep_Q2_020_partial_21_0170 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 21. -/
theorem ep_Q2_020_partial_21_0170_valid :
    mulPoly ep_Q2_020_coefficient_21_0170
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0171 : Poly :=
[
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 21. -/
def ep_Q2_020_partial_21_0171 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 21. -/
theorem ep_Q2_020_partial_21_0171_valid :
    mulPoly ep_Q2_020_coefficient_21_0171
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0172 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 172 for generator 21. -/
def ep_Q2_020_partial_21_0172 : Poly :=
[
  term ((46176170406949440 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 21. -/
theorem ep_Q2_020_partial_21_0172_valid :
    mulPoly ep_Q2_020_coefficient_21_0172
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0173 : Poly :=
[
  term ((30014510764517136 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 173 for generator 21. -/
def ep_Q2_020_partial_21_0173 : Poly :=
[
  term ((60029021529034272 : Rat) / 28298395017400811) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-30014510764517136 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 21. -/
theorem ep_Q2_020_partial_21_0173_valid :
    mulPoly ep_Q2_020_coefficient_21_0173
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0174 : Poly :=
[
  term ((-83117106732508992 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 21. -/
def ep_Q2_020_partial_21_0174 : Poly :=
[
  term ((-166234213465017984 : Rat) / 28298395017400811) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 21. -/
theorem ep_Q2_020_partial_21_0174_valid :
    mulPoly ep_Q2_020_coefficient_21_0174
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0175 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 175 for generator 21. -/
def ep_Q2_020_partial_21_0175 : Poly :=
[
  term ((-575680206406485024 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 21. -/
theorem ep_Q2_020_partial_21_0175_valid :
    mulPoly ep_Q2_020_coefficient_21_0175
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0176 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 176 for generator 21. -/
def ep_Q2_020_partial_21_0176 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 21. -/
theorem ep_Q2_020_partial_21_0176_valid :
    mulPoly ep_Q2_020_coefficient_21_0176
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0177 : Poly :=
[
  term ((-227550356839339176 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 177 for generator 21. -/
def ep_Q2_020_partial_21_0177 : Poly :=
[
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 21. -/
theorem ep_Q2_020_partial_21_0177_valid :
    mulPoly ep_Q2_020_coefficient_21_0177
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0178 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 21. -/
def ep_Q2_020_partial_21_0178 : Poly :=
[
  term ((-2384765313555840 : Rat) / 1230365000756557) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 21. -/
theorem ep_Q2_020_partial_21_0178_valid :
    mulPoly ep_Q2_020_coefficient_21_0178
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0179 : Poly :=
[
  term ((134377968022292784 : Rat) / 28298395017400811) [(0, 2), (9, 2), (16, 1)]
]

/-- Partial product 179 for generator 21. -/
def ep_Q2_020_partial_21_0179 : Poly :=
[
  term ((268755936044585568 : Rat) / 28298395017400811) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(0, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 21. -/
theorem ep_Q2_020_partial_21_0179_valid :
    mulPoly ep_Q2_020_coefficient_21_0179
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0180 : Poly :=
[
  term ((-33778426247670000 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 180 for generator 21. -/
def ep_Q2_020_partial_21_0180 : Poly :=
[
  term ((-67556852495340000 : Rat) / 28298395017400811) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((33778426247670000 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 21. -/
theorem ep_Q2_020_partial_21_0180_valid :
    mulPoly ep_Q2_020_coefficient_21_0180
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0181 : Poly :=
[
  term ((-102841225448806200 : Rat) / 28298395017400811) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 21. -/
def ep_Q2_020_partial_21_0181 : Poly :=
[
  term ((-205682450897612400 : Rat) / 28298395017400811) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((102841225448806200 : Rat) / 28298395017400811) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 21. -/
theorem ep_Q2_020_partial_21_0181_valid :
    mulPoly ep_Q2_020_coefficient_21_0181
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0182 : Poly :=
[
  term ((295107209334679176 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 21. -/
def ep_Q2_020_partial_21_0182 : Poly :=
[
  term ((590214418669358352 : Rat) / 28298395017400811) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-295107209334679176 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 21. -/
theorem ep_Q2_020_partial_21_0182_valid :
    mulPoly ep_Q2_020_coefficient_21_0182
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0183 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 183 for generator 21. -/
def ep_Q2_020_partial_21_0183 : Poly :=
[
  term ((8585155128801024 : Rat) / 1230365000756557) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 21. -/
theorem ep_Q2_020_partial_21_0183_valid :
    mulPoly ep_Q2_020_coefficient_21_0183
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0184 : Poly :=
[
  term ((-405029483731866171 : Rat) / 56596790034801622) [(0, 2), (16, 1)]
]

/-- Partial product 184 for generator 21. -/
def ep_Q2_020_partial_21_0184 : Poly :=
[
  term ((-405029483731866171 : Rat) / 28298395017400811) [(0, 2), (10, 1), (16, 1)],
  term ((405029483731866171 : Rat) / 56596790034801622) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 21. -/
theorem ep_Q2_020_partial_21_0184_valid :
    mulPoly ep_Q2_020_coefficient_21_0184
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0185 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 185 for generator 21. -/
def ep_Q2_020_partial_21_0185 : Poly :=
[
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 21. -/
theorem ep_Q2_020_partial_21_0185_valid :
    mulPoly ep_Q2_020_coefficient_21_0185
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0186 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 186 for generator 21. -/
def ep_Q2_020_partial_21_0186 : Poly :=
[
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 21. -/
theorem ep_Q2_020_partial_21_0186_valid :
    mulPoly ep_Q2_020_coefficient_21_0186
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0187 : Poly :=
[
  term ((175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 187 for generator 21. -/
def ep_Q2_020_partial_21_0187 : Poly :=
[
  term ((351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 21. -/
theorem ep_Q2_020_partial_21_0187_valid :
    mulPoly ep_Q2_020_coefficient_21_0187
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0188 : Poly :=
[
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 188 for generator 21. -/
def ep_Q2_020_partial_21_0188 : Poly :=
[
  term ((-351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 21. -/
theorem ep_Q2_020_partial_21_0188_valid :
    mulPoly ep_Q2_020_coefficient_21_0188
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0189 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 189 for generator 21. -/
def ep_Q2_020_partial_21_0189 : Poly :=
[
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 21. -/
theorem ep_Q2_020_partial_21_0189_valid :
    mulPoly ep_Q2_020_coefficient_21_0189
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0190 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 190 for generator 21. -/
def ep_Q2_020_partial_21_0190 : Poly :=
[
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 21. -/
theorem ep_Q2_020_partial_21_0190_valid :
    mulPoly ep_Q2_020_coefficient_21_0190
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0191 : Poly :=
[
  term ((468860529909088347 : Rat) / 56596790034801622) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 21. -/
def ep_Q2_020_partial_21_0191 : Poly :=
[
  term ((468860529909088347 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-468860529909088347 : Rat) / 56596790034801622) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 21. -/
theorem ep_Q2_020_partial_21_0191_valid :
    mulPoly ep_Q2_020_coefficient_21_0191
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0192 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 192 for generator 21. -/
def ep_Q2_020_partial_21_0192 : Poly :=
[
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 21. -/
theorem ep_Q2_020_partial_21_0192_valid :
    mulPoly ep_Q2_020_coefficient_21_0192
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0193 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 193 for generator 21. -/
def ep_Q2_020_partial_21_0193 : Poly :=
[
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 21. -/
theorem ep_Q2_020_partial_21_0193_valid :
    mulPoly ep_Q2_020_coefficient_21_0193
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0194 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 194 for generator 21. -/
def ep_Q2_020_partial_21_0194 : Poly :=
[
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 21. -/
theorem ep_Q2_020_partial_21_0194_valid :
    mulPoly ep_Q2_020_coefficient_21_0194
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0195 : Poly :=
[
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 21. -/
def ep_Q2_020_partial_21_0195 : Poly :=
[
  term ((-979528844998953843 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 21. -/
theorem ep_Q2_020_partial_21_0195_valid :
    mulPoly ep_Q2_020_coefficient_21_0195
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0196 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 21. -/
def ep_Q2_020_partial_21_0196 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 21. -/
theorem ep_Q2_020_partial_21_0196_valid :
    mulPoly ep_Q2_020_coefficient_21_0196
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0197 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 21. -/
def ep_Q2_020_partial_21_0197 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 21. -/
theorem ep_Q2_020_partial_21_0197_valid :
    mulPoly ep_Q2_020_coefficient_21_0197
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0198 : Poly :=
[
  term ((140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 198 for generator 21. -/
def ep_Q2_020_partial_21_0198 : Poly :=
[
  term ((281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 21. -/
theorem ep_Q2_020_partial_21_0198_valid :
    mulPoly ep_Q2_020_coefficient_21_0198
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0199 : Poly :=
[
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 199 for generator 21. -/
def ep_Q2_020_partial_21_0199 : Poly :=
[
  term ((-281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 21. -/
theorem ep_Q2_020_partial_21_0199_valid :
    mulPoly ep_Q2_020_coefficient_21_0199
        ep_Q2_020_generator_21_0100_0199 =
      ep_Q2_020_partial_21_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_21_0100_0199 : List Poly :=
[
  ep_Q2_020_partial_21_0100,
  ep_Q2_020_partial_21_0101,
  ep_Q2_020_partial_21_0102,
  ep_Q2_020_partial_21_0103,
  ep_Q2_020_partial_21_0104,
  ep_Q2_020_partial_21_0105,
  ep_Q2_020_partial_21_0106,
  ep_Q2_020_partial_21_0107,
  ep_Q2_020_partial_21_0108,
  ep_Q2_020_partial_21_0109,
  ep_Q2_020_partial_21_0110,
  ep_Q2_020_partial_21_0111,
  ep_Q2_020_partial_21_0112,
  ep_Q2_020_partial_21_0113,
  ep_Q2_020_partial_21_0114,
  ep_Q2_020_partial_21_0115,
  ep_Q2_020_partial_21_0116,
  ep_Q2_020_partial_21_0117,
  ep_Q2_020_partial_21_0118,
  ep_Q2_020_partial_21_0119,
  ep_Q2_020_partial_21_0120,
  ep_Q2_020_partial_21_0121,
  ep_Q2_020_partial_21_0122,
  ep_Q2_020_partial_21_0123,
  ep_Q2_020_partial_21_0124,
  ep_Q2_020_partial_21_0125,
  ep_Q2_020_partial_21_0126,
  ep_Q2_020_partial_21_0127,
  ep_Q2_020_partial_21_0128,
  ep_Q2_020_partial_21_0129,
  ep_Q2_020_partial_21_0130,
  ep_Q2_020_partial_21_0131,
  ep_Q2_020_partial_21_0132,
  ep_Q2_020_partial_21_0133,
  ep_Q2_020_partial_21_0134,
  ep_Q2_020_partial_21_0135,
  ep_Q2_020_partial_21_0136,
  ep_Q2_020_partial_21_0137,
  ep_Q2_020_partial_21_0138,
  ep_Q2_020_partial_21_0139,
  ep_Q2_020_partial_21_0140,
  ep_Q2_020_partial_21_0141,
  ep_Q2_020_partial_21_0142,
  ep_Q2_020_partial_21_0143,
  ep_Q2_020_partial_21_0144,
  ep_Q2_020_partial_21_0145,
  ep_Q2_020_partial_21_0146,
  ep_Q2_020_partial_21_0147,
  ep_Q2_020_partial_21_0148,
  ep_Q2_020_partial_21_0149,
  ep_Q2_020_partial_21_0150,
  ep_Q2_020_partial_21_0151,
  ep_Q2_020_partial_21_0152,
  ep_Q2_020_partial_21_0153,
  ep_Q2_020_partial_21_0154,
  ep_Q2_020_partial_21_0155,
  ep_Q2_020_partial_21_0156,
  ep_Q2_020_partial_21_0157,
  ep_Q2_020_partial_21_0158,
  ep_Q2_020_partial_21_0159,
  ep_Q2_020_partial_21_0160,
  ep_Q2_020_partial_21_0161,
  ep_Q2_020_partial_21_0162,
  ep_Q2_020_partial_21_0163,
  ep_Q2_020_partial_21_0164,
  ep_Q2_020_partial_21_0165,
  ep_Q2_020_partial_21_0166,
  ep_Q2_020_partial_21_0167,
  ep_Q2_020_partial_21_0168,
  ep_Q2_020_partial_21_0169,
  ep_Q2_020_partial_21_0170,
  ep_Q2_020_partial_21_0171,
  ep_Q2_020_partial_21_0172,
  ep_Q2_020_partial_21_0173,
  ep_Q2_020_partial_21_0174,
  ep_Q2_020_partial_21_0175,
  ep_Q2_020_partial_21_0176,
  ep_Q2_020_partial_21_0177,
  ep_Q2_020_partial_21_0178,
  ep_Q2_020_partial_21_0179,
  ep_Q2_020_partial_21_0180,
  ep_Q2_020_partial_21_0181,
  ep_Q2_020_partial_21_0182,
  ep_Q2_020_partial_21_0183,
  ep_Q2_020_partial_21_0184,
  ep_Q2_020_partial_21_0185,
  ep_Q2_020_partial_21_0186,
  ep_Q2_020_partial_21_0187,
  ep_Q2_020_partial_21_0188,
  ep_Q2_020_partial_21_0189,
  ep_Q2_020_partial_21_0190,
  ep_Q2_020_partial_21_0191,
  ep_Q2_020_partial_21_0192,
  ep_Q2_020_partial_21_0193,
  ep_Q2_020_partial_21_0194,
  ep_Q2_020_partial_21_0195,
  ep_Q2_020_partial_21_0196,
  ep_Q2_020_partial_21_0197,
  ep_Q2_020_partial_21_0198,
  ep_Q2_020_partial_21_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_21_0100_0199 : Poly :=
[
  term ((230283190210998144 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-115141595105499072 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((-55864320332685000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-174104917483167216 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((423374999734197216 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11048446353256566 : Rat) / 975806724737959) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((216448821464346636 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((27932160166342500 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((87052458741583608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211687499867098608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5524223176628283 : Rat) / 975806724737959) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-108224410732173318 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)],
  term ((-319088002421725236 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((21358596778127208 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((159544001210862618 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-10679298389063604 : Rat) / 28298395017400811) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-187080514602480000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62495798436965448 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8585155128801024 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((841305643623457356 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((319088002421725236 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-500424822417159987 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 3), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11519912911158510 : Rat) / 975806724737959) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-136430680325481648 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-174782458760818482 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-17535498665536644 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((5759956455579255 : Rat) / 975806724737959) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((64967414562003324 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((3990221915077974 : Rat) / 1230365000756557) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)],
  term ((56773017604985484 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((168922301387560680 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28386508802492742 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-84461150693780340 : Rat) / 28298395017400811) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((141234168298765824 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((28386508802492742 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2384765313555840 : Rat) / 1230365000756557) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14193254401246371 : Rat) / 28298395017400811) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-70617084149382912 : Rat) / 28298395017400811) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14193254401246371 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((14193254401246371 : Rat) / 56596790034801622) [(0, 1), (8, 1), (16, 1)],
  term ((-56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-81959716293252056 : Rat) / 975806724737959) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((442109011275728352 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2256325073537110911 : Rat) / 56596790034801622) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-695858523694589259 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-84461150693780340 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((40979858146626028 : Rat) / 975806724737959) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((-221054505637864176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2262820924738585911 : Rat) / 113193580069603244) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((738089099041479429 : Rat) / 56596790034801622) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((62360171534160000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-155209900834614600 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((2861718376267008 : Rat) / 1230365000756557) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-369680892548897450 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 2), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((199033700675695096 : Rat) / 28298395017400811) [(0, 1), (9, 2), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((413864531057025384 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((7690868136217584 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((194235388187971034 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((1178820753326696556 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-813239842215664911 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-656122529112730752 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 975806724737959) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1879759862338997463 : Rat) / 56596790034801622) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8585155128801024 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4027020598921492485 : Rat) / 56596790034801622) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4739721060692232 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((893983428053964423 : Rat) / 28298395017400811) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-16990792537917459 : Rat) / 1380409513043942) [(0, 1), (10, 1), (16, 1)],
  term ((-87044406099765000 : Rat) / 28298395017400811) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3994481900206032 : Rat) / 1230365000756557) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-164030632278182688 : Rat) / 28298395017400811) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-206932265528512692 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3845434068108792 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97117694093985517 : Rat) / 28298395017400811) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(0, 1), (11, 2), (16, 1)],
  term ((813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22239498191917428 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792715456239232463 : Rat) / 113193580069603244) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4027020598921492485 : Rat) / 113193580069603244) [(0, 1), (14, 1), (16, 1)],
  term ((2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 2), (16, 1)],
  term ((-20684070395160855 : Rat) / 1380409513043942) [(0, 1), (15, 2), (16, 1)],
  term ((16990792537917459 : Rat) / 2760819026087884) [(0, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((46176170406949440 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((60029021529034272 : Rat) / 28298395017400811) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-166234213465017984 : Rat) / 28298395017400811) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-30014510764517136 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-575680206406485024 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2384765313555840 : Rat) / 1230365000756557) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(0, 2), (9, 2), (16, 1)],
  term ((-67556852495340000 : Rat) / 28298395017400811) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-205682450897612400 : Rat) / 28298395017400811) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((590214418669358352 : Rat) / 28298395017400811) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8585155128801024 : Rat) / 1230365000756557) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-405029483731866171 : Rat) / 28298395017400811) [(0, 2), (10, 1), (16, 1)],
  term ((33778426247670000 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((102841225448806200 : Rat) / 28298395017400811) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-295107209334679176 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 2), (15, 2), (16, 1)],
  term ((405029483731866171 : Rat) / 56596790034801622) [(0, 2), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (8, 1), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((-351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((468860529909088347 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)],
  term ((-468860529909088347 : Rat) / 56596790034801622) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((-281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 199. -/
theorem ep_Q2_020_block_21_0100_0199_valid :
    checkProductSumEq ep_Q2_020_partials_21_0100_0199
      ep_Q2_020_block_21_0100_0199 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
