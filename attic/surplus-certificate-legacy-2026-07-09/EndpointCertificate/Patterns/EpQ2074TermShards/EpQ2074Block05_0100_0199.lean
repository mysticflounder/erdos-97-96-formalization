/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 5:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_05_0100_0199 : Poly :=
[
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0100 : Poly :=
[
  term ((693 : Rat) / 1538) [(0, 1), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 100 for generator 5. -/
def ep_Q2_074_partial_05_0100 : Poly :=
[
  term ((693 : Rat) / 1538) [(0, 1), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((693 : Rat) / 1538) [(0, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-693 : Rat) / 1538) [(0, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-693 : Rat) / 1538) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem ep_Q2_074_partial_05_0100_valid :
    mulPoly ep_Q2_074_coefficient_05_0100
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0101 : Poly :=
[
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 5. -/
def ep_Q2_074_partial_05_0101 : Poly :=
[
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem ep_Q2_074_partial_05_0101_valid :
    mulPoly ep_Q2_074_coefficient_05_0101
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0102 : Poly :=
[
  term ((-23370 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 5. -/
def ep_Q2_074_partial_05_0102 : Poly :=
[
  term ((-23370 : Rat) / 769) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23370 : Rat) / 769) [(0, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((23370 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23370 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem ep_Q2_074_partial_05_0102_valid :
    mulPoly ep_Q2_074_coefficient_05_0102
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0103 : Poly :=
[
  term ((60171 : Rat) / 1538) [(0, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 103 for generator 5. -/
def ep_Q2_074_partial_05_0103 : Poly :=
[
  term ((60171 : Rat) / 1538) [(0, 1), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((60171 : Rat) / 1538) [(0, 1), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-60171 : Rat) / 1538) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-60171 : Rat) / 1538) [(0, 1), (4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem ep_Q2_074_partial_05_0103_valid :
    mulPoly ep_Q2_074_coefficient_05_0103
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0104 : Poly :=
[
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 5. -/
def ep_Q2_074_partial_05_0104 : Poly :=
[
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (6, 2), (15, 2), (16, 1)],
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem ep_Q2_074_partial_05_0104_valid :
    mulPoly ep_Q2_074_coefficient_05_0104
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0105 : Poly :=
[
  term ((-19701 : Rat) / 3076) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 105 for generator 5. -/
def ep_Q2_074_partial_05_0105 : Poly :=
[
  term ((-19701 : Rat) / 3076) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((-19701 : Rat) / 3076) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((19701 : Rat) / 3076) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((19701 : Rat) / 3076) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem ep_Q2_074_partial_05_0105_valid :
    mulPoly ep_Q2_074_coefficient_05_0105
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0106 : Poly :=
[
  term ((-5472 : Rat) / 769) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 5. -/
def ep_Q2_074_partial_05_0106 : Poly :=
[
  term ((-5472 : Rat) / 769) [(0, 1), (6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5472 : Rat) / 769) [(0, 1), (7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem ep_Q2_074_partial_05_0106_valid :
    mulPoly ep_Q2_074_coefficient_05_0106
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0107 : Poly :=
[
  term ((-5472 : Rat) / 769) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 5. -/
def ep_Q2_074_partial_05_0107 : Poly :=
[
  term ((-5472 : Rat) / 769) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-5472 : Rat) / 769) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem ep_Q2_074_partial_05_0107_valid :
    mulPoly ep_Q2_074_coefficient_05_0107
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0108 : Poly :=
[
  term ((8202 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 108 for generator 5. -/
def ep_Q2_074_partial_05_0108 : Poly :=
[
  term ((8202 : Rat) / 769) [(0, 1), (6, 2), (10, 1), (12, 1), (16, 1)],
  term ((8202 : Rat) / 769) [(0, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((-8202 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8202 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem ep_Q2_074_partial_05_0108_valid :
    mulPoly ep_Q2_074_coefficient_05_0108
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0109 : Poly :=
[
  term ((-13644 : Rat) / 769) [(0, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 109 for generator 5. -/
def ep_Q2_074_partial_05_0109 : Poly :=
[
  term ((-13644 : Rat) / 769) [(0, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-13644 : Rat) / 769) [(0, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((13644 : Rat) / 769) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((13644 : Rat) / 769) [(0, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem ep_Q2_074_partial_05_0109_valid :
    mulPoly ep_Q2_074_coefficient_05_0109
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0110 : Poly :=
[
  term ((12264 : Rat) / 769) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 110 for generator 5. -/
def ep_Q2_074_partial_05_0110 : Poly :=
[
  term ((12264 : Rat) / 769) [(0, 1), (6, 2), (10, 1), (16, 1)],
  term ((12264 : Rat) / 769) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-12264 : Rat) / 769) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((-12264 : Rat) / 769) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem ep_Q2_074_partial_05_0110_valid :
    mulPoly ep_Q2_074_coefficient_05_0110
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0111 : Poly :=
[
  term ((57321 : Rat) / 1538) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 111 for generator 5. -/
def ep_Q2_074_partial_05_0111 : Poly :=
[
  term ((57321 : Rat) / 1538) [(0, 1), (6, 2), (12, 1), (14, 1), (16, 1)],
  term ((57321 : Rat) / 1538) [(0, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-57321 : Rat) / 1538) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-57321 : Rat) / 1538) [(0, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem ep_Q2_074_partial_05_0111_valid :
    mulPoly ep_Q2_074_coefficient_05_0111
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0112 : Poly :=
[
  term ((2736 : Rat) / 769) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 5. -/
def ep_Q2_074_partial_05_0112 : Poly :=
[
  term ((2736 : Rat) / 769) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem ep_Q2_074_partial_05_0112_valid :
    mulPoly ep_Q2_074_coefficient_05_0112
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0113 : Poly :=
[
  term ((-11445 : Rat) / 3076) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 113 for generator 5. -/
def ep_Q2_074_partial_05_0113 : Poly :=
[
  term ((-11445 : Rat) / 3076) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-11445 : Rat) / 3076) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((11445 : Rat) / 3076) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((11445 : Rat) / 3076) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem ep_Q2_074_partial_05_0113_valid :
    mulPoly ep_Q2_074_coefficient_05_0113
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0114 : Poly :=
[
  term ((-2736 : Rat) / 769) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 5. -/
def ep_Q2_074_partial_05_0114 : Poly :=
[
  term ((-2736 : Rat) / 769) [(0, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem ep_Q2_074_partial_05_0114_valid :
    mulPoly ep_Q2_074_coefficient_05_0114
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0115 : Poly :=
[
  term ((26181 : Rat) / 769) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 5. -/
def ep_Q2_074_partial_05_0115 : Poly :=
[
  term ((26181 : Rat) / 769) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((26181 : Rat) / 769) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26181 : Rat) / 769) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26181 : Rat) / 769) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem ep_Q2_074_partial_05_0115_valid :
    mulPoly ep_Q2_074_coefficient_05_0115
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0116 : Poly :=
[
  term ((-35091 : Rat) / 3076) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 116 for generator 5. -/
def ep_Q2_074_partial_05_0116 : Poly :=
[
  term ((-35091 : Rat) / 3076) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-35091 : Rat) / 3076) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((35091 : Rat) / 3076) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((35091 : Rat) / 3076) [(0, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem ep_Q2_074_partial_05_0116_valid :
    mulPoly ep_Q2_074_coefficient_05_0116
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0117 : Poly :=
[
  term ((-2736 : Rat) / 769) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 5. -/
def ep_Q2_074_partial_05_0117 : Poly :=
[
  term ((-2736 : Rat) / 769) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem ep_Q2_074_partial_05_0117_valid :
    mulPoly ep_Q2_074_coefficient_05_0117
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0118 : Poly :=
[
  term ((-242439 : Rat) / 6152) [(0, 1), (16, 1)]
]

/-- Partial product 118 for generator 5. -/
def ep_Q2_074_partial_05_0118 : Poly :=
[
  term ((-242439 : Rat) / 6152) [(0, 1), (6, 2), (16, 1)],
  term ((-242439 : Rat) / 6152) [(0, 1), (7, 2), (16, 1)],
  term ((242439 : Rat) / 6152) [(0, 1), (14, 2), (16, 1)],
  term ((242439 : Rat) / 6152) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem ep_Q2_074_partial_05_0118_valid :
    mulPoly ep_Q2_074_coefficient_05_0118
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0119 : Poly :=
[
  term ((-22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 5. -/
def ep_Q2_074_partial_05_0119 : Poly :=
[
  term ((-22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem ep_Q2_074_partial_05_0119_valid :
    mulPoly ep_Q2_074_coefficient_05_0119
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0120 : Poly :=
[
  term ((24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 5. -/
def ep_Q2_074_partial_05_0120 : Poly :=
[
  term ((24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem ep_Q2_074_partial_05_0120_valid :
    mulPoly ep_Q2_074_coefficient_05_0120
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0121 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)]
]

/-- Partial product 121 for generator 5. -/
def ep_Q2_074_partial_05_0121 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (6, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem ep_Q2_074_partial_05_0121_valid :
    mulPoly ep_Q2_074_coefficient_05_0121
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0122 : Poly :=
[
  term ((-16542 : Rat) / 769) [(0, 2), (2, 1), (16, 1)]
]

/-- Partial product 122 for generator 5. -/
def ep_Q2_074_partial_05_0122 : Poly :=
[
  term ((-16542 : Rat) / 769) [(0, 2), (2, 1), (6, 2), (16, 1)],
  term ((-16542 : Rat) / 769) [(0, 2), (2, 1), (7, 2), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 2), (2, 1), (14, 2), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 2), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem ep_Q2_074_partial_05_0122_valid :
    mulPoly ep_Q2_074_coefficient_05_0122
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0123 : Poly :=
[
  term ((-11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (16, 1)]
]

/-- Partial product 123 for generator 5. -/
def ep_Q2_074_partial_05_0123 : Poly :=
[
  term ((-11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (6, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (7, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (14, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem ep_Q2_074_partial_05_0123_valid :
    mulPoly ep_Q2_074_coefficient_05_0123
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0124 : Poly :=
[
  term ((24813 : Rat) / 1538) [(0, 2), (2, 2), (16, 1)]
]

/-- Partial product 124 for generator 5. -/
def ep_Q2_074_partial_05_0124 : Poly :=
[
  term ((24813 : Rat) / 1538) [(0, 2), (2, 2), (6, 2), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 2), (7, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 2), (14, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem ep_Q2_074_partial_05_0124_valid :
    mulPoly ep_Q2_074_coefficient_05_0124
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0125 : Poly :=
[
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 125 for generator 5. -/
def ep_Q2_074_partial_05_0125 : Poly :=
[
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem ep_Q2_074_partial_05_0125_valid :
    mulPoly ep_Q2_074_coefficient_05_0125
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0126 : Poly :=
[
  term ((3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 126 for generator 5. -/
def ep_Q2_074_partial_05_0126 : Poly :=
[
  term ((3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (7, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem ep_Q2_074_partial_05_0126_valid :
    mulPoly ep_Q2_074_coefficient_05_0126
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0127 : Poly :=
[
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 5. -/
def ep_Q2_074_partial_05_0127 : Poly :=
[
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem ep_Q2_074_partial_05_0127_valid :
    mulPoly ep_Q2_074_coefficient_05_0127
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0128 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 128 for generator 5. -/
def ep_Q2_074_partial_05_0128 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem ep_Q2_074_partial_05_0128_valid :
    mulPoly ep_Q2_074_coefficient_05_0128
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0129 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 129 for generator 5. -/
def ep_Q2_074_partial_05_0129 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem ep_Q2_074_partial_05_0129_valid :
    mulPoly ep_Q2_074_coefficient_05_0129
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0130 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 5. -/
def ep_Q2_074_partial_05_0130 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem ep_Q2_074_partial_05_0130_valid :
    mulPoly ep_Q2_074_coefficient_05_0130
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0131 : Poly :=
[
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 131 for generator 5. -/
def ep_Q2_074_partial_05_0131 : Poly :=
[
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem ep_Q2_074_partial_05_0131_valid :
    mulPoly ep_Q2_074_coefficient_05_0131
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0132 : Poly :=
[
  term ((-8271 : Rat) / 1538) [(0, 2), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 132 for generator 5. -/
def ep_Q2_074_partial_05_0132 : Poly :=
[
  term ((-8271 : Rat) / 1538) [(0, 2), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (3, 1), (7, 1), (14, 2), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem ep_Q2_074_partial_05_0132_valid :
    mulPoly ep_Q2_074_coefficient_05_0132
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0133 : Poly :=
[
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 5. -/
def ep_Q2_074_partial_05_0133 : Poly :=
[
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem ep_Q2_074_partial_05_0133_valid :
    mulPoly ep_Q2_074_coefficient_05_0133
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0134 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 134 for generator 5. -/
def ep_Q2_074_partial_05_0134 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem ep_Q2_074_partial_05_0134_valid :
    mulPoly ep_Q2_074_coefficient_05_0134
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0135 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 5. -/
def ep_Q2_074_partial_05_0135 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem ep_Q2_074_partial_05_0135_valid :
    mulPoly ep_Q2_074_coefficient_05_0135
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0136 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 5. -/
def ep_Q2_074_partial_05_0136 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem ep_Q2_074_partial_05_0136_valid :
    mulPoly ep_Q2_074_coefficient_05_0136
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0137 : Poly :=
[
  term ((22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 137 for generator 5. -/
def ep_Q2_074_partial_05_0137 : Poly :=
[
  term ((22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem ep_Q2_074_partial_05_0137_valid :
    mulPoly ep_Q2_074_coefficient_05_0137
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0138 : Poly :=
[
  term ((-11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (16, 1)]
]

/-- Partial product 138 for generator 5. -/
def ep_Q2_074_partial_05_0138 : Poly :=
[
  term ((-11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (6, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (7, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (14, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem ep_Q2_074_partial_05_0138_valid :
    mulPoly ep_Q2_074_coefficient_05_0138
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0139 : Poly :=
[
  term ((-24813 : Rat) / 769) [(0, 2), (3, 2), (12, 1), (16, 1)]
]

/-- Partial product 139 for generator 5. -/
def ep_Q2_074_partial_05_0139 : Poly :=
[
  term ((-24813 : Rat) / 769) [(0, 2), (3, 2), (6, 2), (12, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (3, 2), (7, 2), (12, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (3, 2), (12, 1), (14, 2), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem ep_Q2_074_partial_05_0139_valid :
    mulPoly ep_Q2_074_coefficient_05_0139
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0140 : Poly :=
[
  term ((24813 : Rat) / 1538) [(0, 2), (3, 2), (16, 1)]
]

/-- Partial product 140 for generator 5. -/
def ep_Q2_074_partial_05_0140 : Poly :=
[
  term ((24813 : Rat) / 1538) [(0, 2), (3, 2), (6, 2), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (3, 2), (7, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (3, 2), (14, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem ep_Q2_074_partial_05_0140_valid :
    mulPoly ep_Q2_074_coefficient_05_0140
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0141 : Poly :=
[
  term ((11070 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 141 for generator 5. -/
def ep_Q2_074_partial_05_0141 : Poly :=
[
  term ((11070 : Rat) / 769) [(0, 2), (4, 1), (6, 2), (12, 1), (14, 1), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (4, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem ep_Q2_074_partial_05_0141_valid :
    mulPoly ep_Q2_074_coefficient_05_0141
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0142 : Poly :=
[
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 142 for generator 5. -/
def ep_Q2_074_partial_05_0142 : Poly :=
[
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem ep_Q2_074_partial_05_0142_valid :
    mulPoly ep_Q2_074_coefficient_05_0142
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0143 : Poly :=
[
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 143 for generator 5. -/
def ep_Q2_074_partial_05_0143 : Poly :=
[
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem ep_Q2_074_partial_05_0143_valid :
    mulPoly ep_Q2_074_coefficient_05_0143
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0144 : Poly :=
[
  term ((-35055 : Rat) / 1538) [(0, 2), (4, 1), (16, 1)]
]

/-- Partial product 144 for generator 5. -/
def ep_Q2_074_partial_05_0144 : Poly :=
[
  term ((-35055 : Rat) / 1538) [(0, 2), (4, 1), (6, 2), (16, 1)],
  term ((-35055 : Rat) / 1538) [(0, 2), (4, 1), (7, 2), (16, 1)],
  term ((35055 : Rat) / 1538) [(0, 2), (4, 1), (14, 2), (16, 1)],
  term ((35055 : Rat) / 1538) [(0, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem ep_Q2_074_partial_05_0144_valid :
    mulPoly ep_Q2_074_coefficient_05_0144
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0145 : Poly :=
[
  term ((-24813 : Rat) / 1538) [(0, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 145 for generator 5. -/
def ep_Q2_074_partial_05_0145 : Poly :=
[
  term ((-24813 : Rat) / 1538) [(0, 2), (6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem ep_Q2_074_partial_05_0145_valid :
    mulPoly ep_Q2_074_coefficient_05_0145
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0146 : Poly :=
[
  term ((-24813 : Rat) / 3076) [(0, 2), (12, 1), (16, 1)]
]

/-- Partial product 146 for generator 5. -/
def ep_Q2_074_partial_05_0146 : Poly :=
[
  term ((-24813 : Rat) / 3076) [(0, 2), (6, 2), (12, 1), (16, 1)],
  term ((-24813 : Rat) / 3076) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((24813 : Rat) / 3076) [(0, 2), (12, 1), (14, 2), (16, 1)],
  term ((24813 : Rat) / 3076) [(0, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem ep_Q2_074_partial_05_0146_valid :
    mulPoly ep_Q2_074_coefficient_05_0146
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0147 : Poly :=
[
  term ((29667 : Rat) / 3076) [(0, 2), (14, 1), (16, 1)]
]

/-- Partial product 147 for generator 5. -/
def ep_Q2_074_partial_05_0147 : Poly :=
[
  term ((29667 : Rat) / 3076) [(0, 2), (6, 2), (14, 1), (16, 1)],
  term ((29667 : Rat) / 3076) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-29667 : Rat) / 3076) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-29667 : Rat) / 3076) [(0, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem ep_Q2_074_partial_05_0147_valid :
    mulPoly ep_Q2_074_coefficient_05_0147
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0148 : Poly :=
[
  term ((142587 : Rat) / 6152) [(0, 2), (16, 1)]
]

/-- Partial product 148 for generator 5. -/
def ep_Q2_074_partial_05_0148 : Poly :=
[
  term ((142587 : Rat) / 6152) [(0, 2), (6, 2), (16, 1)],
  term ((142587 : Rat) / 6152) [(0, 2), (7, 2), (16, 1)],
  term ((-142587 : Rat) / 6152) [(0, 2), (14, 2), (16, 1)],
  term ((-142587 : Rat) / 6152) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem ep_Q2_074_partial_05_0148_valid :
    mulPoly ep_Q2_074_coefficient_05_0148
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0149 : Poly :=
[
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 149 for generator 5. -/
def ep_Q2_074_partial_05_0149 : Poly :=
[
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem ep_Q2_074_partial_05_0149_valid :
    mulPoly ep_Q2_074_coefficient_05_0149
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0150 : Poly :=
[
  term ((2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (16, 1)]
]

/-- Partial product 150 for generator 5. -/
def ep_Q2_074_partial_05_0150 : Poly :=
[
  term ((2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (6, 2), (16, 1)],
  term ((2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (7, 2), (16, 1)],
  term ((-2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)],
  term ((-2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem ep_Q2_074_partial_05_0150_valid :
    mulPoly ep_Q2_074_coefficient_05_0150
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0151 : Poly :=
[
  term ((-3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 151 for generator 5. -/
def ep_Q2_074_partial_05_0151 : Poly :=
[
  term ((-3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (6, 2), (7, 1), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem ep_Q2_074_partial_05_0151_valid :
    mulPoly ep_Q2_074_coefficient_05_0151
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0152 : Poly :=
[
  term ((-3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 152 for generator 5. -/
def ep_Q2_074_partial_05_0152 : Poly :=
[
  term ((-3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem ep_Q2_074_partial_05_0152_valid :
    mulPoly ep_Q2_074_coefficient_05_0152
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0153 : Poly :=
[
  term ((-198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 5. -/
def ep_Q2_074_partial_05_0153 : Poly :=
[
  term ((-198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 5. -/
theorem ep_Q2_074_partial_05_0153_valid :
    mulPoly ep_Q2_074_coefficient_05_0153
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0154 : Poly :=
[
  term ((-99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

/-- Partial product 154 for generator 5. -/
def ep_Q2_074_partial_05_0154 : Poly :=
[
  term ((-99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (6, 2), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (7, 2), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 5. -/
theorem ep_Q2_074_partial_05_0154_valid :
    mulPoly ep_Q2_074_coefficient_05_0154
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0155 : Poly :=
[
  term ((-576 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 155 for generator 5. -/
def ep_Q2_074_partial_05_0155 : Poly :=
[
  term ((-576 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((576 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 769) [(1, 1), (2, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 5. -/
theorem ep_Q2_074_partial_05_0155_valid :
    mulPoly ep_Q2_074_coefficient_05_0155
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0156 : Poly :=
[
  term ((6534 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 156 for generator 5. -/
def ep_Q2_074_partial_05_0156 : Poly :=
[
  term ((6534 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (7, 1), (16, 1)],
  term ((-6534 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((-6534 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((6534 : Rat) / 769) [(1, 1), (2, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 5. -/
theorem ep_Q2_074_partial_05_0156_valid :
    mulPoly ep_Q2_074_coefficient_05_0156
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0157 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 157 for generator 5. -/
def ep_Q2_074_partial_05_0157 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (9, 1), (12, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 5. -/
theorem ep_Q2_074_partial_05_0157_valid :
    mulPoly ep_Q2_074_coefficient_05_0157
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0158 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 158 for generator 5. -/
def ep_Q2_074_partial_05_0158 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (9, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (9, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 5. -/
theorem ep_Q2_074_partial_05_0158_valid :
    mulPoly ep_Q2_074_coefficient_05_0158
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0159 : Poly :=
[
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 5. -/
def ep_Q2_074_partial_05_0159 : Poly :=
[
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 5. -/
theorem ep_Q2_074_partial_05_0159_valid :
    mulPoly ep_Q2_074_coefficient_05_0159
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0160 : Poly :=
[
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 160 for generator 5. -/
def ep_Q2_074_partial_05_0160 : Poly :=
[
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 5. -/
theorem ep_Q2_074_partial_05_0160_valid :
    mulPoly ep_Q2_074_coefficient_05_0160
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0161 : Poly :=
[
  term ((6642 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 161 for generator 5. -/
def ep_Q2_074_partial_05_0161 : Poly :=
[
  term ((6642 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (13, 1), (16, 1)],
  term ((6642 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((-6642 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6642 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 5. -/
theorem ep_Q2_074_partial_05_0161_valid :
    mulPoly ep_Q2_074_coefficient_05_0161
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0162 : Poly :=
[
  term ((-20307 : Rat) / 769) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 5. -/
def ep_Q2_074_partial_05_0162 : Poly :=
[
  term ((-20307 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-20307 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((20307 : Rat) / 769) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((20307 : Rat) / 769) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 5. -/
theorem ep_Q2_074_partial_05_0162_valid :
    mulPoly ep_Q2_074_coefficient_05_0162
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0163 : Poly :=
[
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (16, 1)]
]

/-- Partial product 163 for generator 5. -/
def ep_Q2_074_partial_05_0163 : Poly :=
[
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (6, 2), (7, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 5. -/
theorem ep_Q2_074_partial_05_0163_valid :
    mulPoly ep_Q2_074_coefficient_05_0163
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0164 : Poly :=
[
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

/-- Partial product 164 for generator 5. -/
def ep_Q2_074_partial_05_0164 : Poly :=
[
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (6, 2), (13, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (7, 2), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 5. -/
theorem ep_Q2_074_partial_05_0164_valid :
    mulPoly ep_Q2_074_coefficient_05_0164
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0165 : Poly :=
[
  term ((3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 165 for generator 5. -/
def ep_Q2_074_partial_05_0165 : Poly :=
[
  term ((3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 5. -/
theorem ep_Q2_074_partial_05_0165_valid :
    mulPoly ep_Q2_074_coefficient_05_0165
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0166 : Poly :=
[
  term ((198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 166 for generator 5. -/
def ep_Q2_074_partial_05_0166 : Poly :=
[
  term ((198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 5. -/
theorem ep_Q2_074_partial_05_0166_valid :
    mulPoly ep_Q2_074_coefficient_05_0166
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0167 : Poly :=
[
  term ((-6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

/-- Partial product 167 for generator 5. -/
def ep_Q2_074_partial_05_0167 : Poly :=
[
  term ((-6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 2), (16, 1)],
  term ((-6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 2), (16, 1)],
  term ((6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)],
  term ((6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 5. -/
theorem ep_Q2_074_partial_05_0167_valid :
    mulPoly ep_Q2_074_coefficient_05_0167
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0168 : Poly :=
[
  term ((-5526 : Rat) / 769) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 168 for generator 5. -/
def ep_Q2_074_partial_05_0168 : Poly :=
[
  term ((-5526 : Rat) / 769) [(1, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((-5526 : Rat) / 769) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((5526 : Rat) / 769) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((5526 : Rat) / 769) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 5. -/
theorem ep_Q2_074_partial_05_0168_valid :
    mulPoly ep_Q2_074_coefficient_05_0168
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0169 : Poly :=
[
  term ((38685 : Rat) / 1538) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 169 for generator 5. -/
def ep_Q2_074_partial_05_0169 : Poly :=
[
  term ((38685 : Rat) / 1538) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((38685 : Rat) / 1538) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-38685 : Rat) / 1538) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-38685 : Rat) / 1538) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 5. -/
theorem ep_Q2_074_partial_05_0169_valid :
    mulPoly ep_Q2_074_coefficient_05_0169
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0170 : Poly :=
[
  term ((1332 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 170 for generator 5. -/
def ep_Q2_074_partial_05_0170 : Poly :=
[
  term ((1332 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-1332 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1332 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((1332 : Rat) / 769) [(1, 1), (4, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 5. -/
theorem ep_Q2_074_partial_05_0170_valid :
    mulPoly ep_Q2_074_coefficient_05_0170
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0171 : Poly :=
[
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 171 for generator 5. -/
def ep_Q2_074_partial_05_0171 : Poly :=
[
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 3), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 5. -/
theorem ep_Q2_074_partial_05_0171_valid :
    mulPoly ep_Q2_074_coefficient_05_0171
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0172 : Poly :=
[
  term ((3231 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 172 for generator 5. -/
def ep_Q2_074_partial_05_0172 : Poly :=
[
  term ((3231 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (7, 1), (16, 1)],
  term ((-3231 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((-3231 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((3231 : Rat) / 769) [(1, 1), (4, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 5. -/
theorem ep_Q2_074_partial_05_0172_valid :
    mulPoly ep_Q2_074_coefficient_05_0172
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0173 : Poly :=
[
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 5. -/
def ep_Q2_074_partial_05_0173 : Poly :=
[
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 5. -/
theorem ep_Q2_074_partial_05_0173_valid :
    mulPoly ep_Q2_074_coefficient_05_0173
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0174 : Poly :=
[
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 174 for generator 5. -/
def ep_Q2_074_partial_05_0174 : Poly :=
[
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 5. -/
theorem ep_Q2_074_partial_05_0174_valid :
    mulPoly ep_Q2_074_coefficient_05_0174
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0175 : Poly :=
[
  term ((-5328 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 175 for generator 5. -/
def ep_Q2_074_partial_05_0175 : Poly :=
[
  term ((-5328 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((-5328 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((5328 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((5328 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 5. -/
theorem ep_Q2_074_partial_05_0175_valid :
    mulPoly ep_Q2_074_coefficient_05_0175
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0176 : Poly :=
[
  term ((2763 : Rat) / 769) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 5. -/
def ep_Q2_074_partial_05_0176 : Poly :=
[
  term ((2763 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((2763 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2763 : Rat) / 769) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2763 : Rat) / 769) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 5. -/
theorem ep_Q2_074_partial_05_0176_valid :
    mulPoly ep_Q2_074_coefficient_05_0176
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0177 : Poly :=
[
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 177 for generator 5. -/
def ep_Q2_074_partial_05_0177 : Poly :=
[
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (10, 1), (12, 1), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 5. -/
theorem ep_Q2_074_partial_05_0177_valid :
    mulPoly ep_Q2_074_coefficient_05_0177
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0178 : Poly :=
[
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 178 for generator 5. -/
def ep_Q2_074_partial_05_0178 : Poly :=
[
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 5. -/
theorem ep_Q2_074_partial_05_0178_valid :
    mulPoly ep_Q2_074_coefficient_05_0178
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0179 : Poly :=
[
  term ((4920 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 179 for generator 5. -/
def ep_Q2_074_partial_05_0179 : Poly :=
[
  term ((4920 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((4920 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((-4920 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4920 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 5. -/
theorem ep_Q2_074_partial_05_0179_valid :
    mulPoly ep_Q2_074_coefficient_05_0179
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0180 : Poly :=
[
  term ((7062 : Rat) / 769) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 180 for generator 5. -/
def ep_Q2_074_partial_05_0180 : Poly :=
[
  term ((7062 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((7062 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((-7062 : Rat) / 769) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7062 : Rat) / 769) [(1, 1), (5, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 5. -/
theorem ep_Q2_074_partial_05_0180_valid :
    mulPoly ep_Q2_074_coefficient_05_0180
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0181 : Poly :=
[
  term ((-29133 : Rat) / 1538) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 181 for generator 5. -/
def ep_Q2_074_partial_05_0181 : Poly :=
[
  term ((-29133 : Rat) / 1538) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-29133 : Rat) / 1538) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((29133 : Rat) / 1538) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((29133 : Rat) / 1538) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 5. -/
theorem ep_Q2_074_partial_05_0181_valid :
    mulPoly ep_Q2_074_coefficient_05_0181
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0182 : Poly :=
[
  term ((264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 182 for generator 5. -/
def ep_Q2_074_partial_05_0182 : Poly :=
[
  term ((264 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 3), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 5. -/
theorem ep_Q2_074_partial_05_0182_valid :
    mulPoly ep_Q2_074_coefficient_05_0182
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0183 : Poly :=
[
  term ((-264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 183 for generator 5. -/
def ep_Q2_074_partial_05_0183 : Poly :=
[
  term ((-264 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 5. -/
theorem ep_Q2_074_partial_05_0183_valid :
    mulPoly ep_Q2_074_coefficient_05_0183
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0184 : Poly :=
[
  term ((-1188 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 184 for generator 5. -/
def ep_Q2_074_partial_05_0184 : Poly :=
[
  term ((-1188 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (14, 3), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (7, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 5. -/
theorem ep_Q2_074_partial_05_0184_valid :
    mulPoly ep_Q2_074_coefficient_05_0184
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0185 : Poly :=
[
  term ((-2466 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 185 for generator 5. -/
def ep_Q2_074_partial_05_0185 : Poly :=
[
  term ((-2466 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((2466 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((2466 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2466 : Rat) / 769) [(1, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 5. -/
theorem ep_Q2_074_partial_05_0185_valid :
    mulPoly ep_Q2_074_coefficient_05_0185
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0186 : Poly :=
[
  term ((-1188 : Rat) / 769) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 5. -/
def ep_Q2_074_partial_05_0186 : Poly :=
[
  term ((-1188 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 5. -/
theorem ep_Q2_074_partial_05_0186_valid :
    mulPoly ep_Q2_074_coefficient_05_0186
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0187 : Poly :=
[
  term ((1353 : Rat) / 769) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 187 for generator 5. -/
def ep_Q2_074_partial_05_0187 : Poly :=
[
  term ((1353 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((-1353 : Rat) / 769) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353 : Rat) / 769) [(1, 1), (7, 1), (14, 3), (16, 1)],
  term ((1353 : Rat) / 769) [(1, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 5. -/
theorem ep_Q2_074_partial_05_0187_valid :
    mulPoly ep_Q2_074_coefficient_05_0187
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0188 : Poly :=
[
  term ((-6675 : Rat) / 769) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 188 for generator 5. -/
def ep_Q2_074_partial_05_0188 : Poly :=
[
  term ((-6675 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((6675 : Rat) / 769) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((6675 : Rat) / 769) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6675 : Rat) / 769) [(1, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 5. -/
theorem ep_Q2_074_partial_05_0188_valid :
    mulPoly ep_Q2_074_coefficient_05_0188
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0189 : Poly :=
[
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 189 for generator 5. -/
def ep_Q2_074_partial_05_0189 : Poly :=
[
  term ((528 : Rat) / 769) [(1, 1), (6, 2), (9, 1), (12, 1), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 5. -/
theorem ep_Q2_074_partial_05_0189_valid :
    mulPoly ep_Q2_074_coefficient_05_0189
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0190 : Poly :=
[
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 190 for generator 5. -/
def ep_Q2_074_partial_05_0190 : Poly :=
[
  term ((-528 : Rat) / 769) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 5. -/
theorem ep_Q2_074_partial_05_0190_valid :
    mulPoly ep_Q2_074_coefficient_05_0190
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0191 : Poly :=
[
  term ((-264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 191 for generator 5. -/
def ep_Q2_074_partial_05_0191 : Poly :=
[
  term ((-264 : Rat) / 769) [(1, 1), (6, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 5. -/
theorem ep_Q2_074_partial_05_0191_valid :
    mulPoly ep_Q2_074_coefficient_05_0191
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0192 : Poly :=
[
  term ((264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 192 for generator 5. -/
def ep_Q2_074_partial_05_0192 : Poly :=
[
  term ((264 : Rat) / 769) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 5. -/
theorem ep_Q2_074_partial_05_0192_valid :
    mulPoly ep_Q2_074_coefficient_05_0192
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0193 : Poly :=
[
  term ((1188 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 193 for generator 5. -/
def ep_Q2_074_partial_05_0193 : Poly :=
[
  term ((1188 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 5. -/
theorem ep_Q2_074_partial_05_0193_valid :
    mulPoly ep_Q2_074_coefficient_05_0193
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0194 : Poly :=
[
  term ((132 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 194 for generator 5. -/
def ep_Q2_074_partial_05_0194 : Poly :=
[
  term ((132 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 5. -/
theorem ep_Q2_074_partial_05_0194_valid :
    mulPoly ep_Q2_074_coefficient_05_0194
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0195 : Poly :=
[
  term ((1188 : Rat) / 769) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 5. -/
def ep_Q2_074_partial_05_0195 : Poly :=
[
  term ((1188 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 5. -/
theorem ep_Q2_074_partial_05_0195_valid :
    mulPoly ep_Q2_074_coefficient_05_0195
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0196 : Poly :=
[
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 196 for generator 5. -/
def ep_Q2_074_partial_05_0196 : Poly :=
[
  term ((-1188 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 5. -/
theorem ep_Q2_074_partial_05_0196_valid :
    mulPoly ep_Q2_074_coefficient_05_0196
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0197 : Poly :=
[
  term ((-132 : Rat) / 769) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 197 for generator 5. -/
def ep_Q2_074_partial_05_0197 : Poly :=
[
  term ((-132 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((132 : Rat) / 769) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 5. -/
theorem ep_Q2_074_partial_05_0197_valid :
    mulPoly ep_Q2_074_coefficient_05_0197
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0198 : Poly :=
[
  term ((4326 : Rat) / 769) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 5. -/
def ep_Q2_074_partial_05_0198 : Poly :=
[
  term ((4326 : Rat) / 769) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((4326 : Rat) / 769) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4326 : Rat) / 769) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4326 : Rat) / 769) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 5. -/
theorem ep_Q2_074_partial_05_0198_valid :
    mulPoly ep_Q2_074_coefficient_05_0198
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 5. -/
def ep_Q2_074_coefficient_05_0199 : Poly :=
[
  term ((-4326 : Rat) / 769) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 199 for generator 5. -/
def ep_Q2_074_partial_05_0199 : Poly :=
[
  term ((-4326 : Rat) / 769) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4326 : Rat) / 769) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((4326 : Rat) / 769) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4326 : Rat) / 769) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 5. -/
theorem ep_Q2_074_partial_05_0199_valid :
    mulPoly ep_Q2_074_coefficient_05_0199
        ep_Q2_074_generator_05_0100_0199 =
      ep_Q2_074_partial_05_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_05_0100_0199 : List Poly :=
[
  ep_Q2_074_partial_05_0100,
  ep_Q2_074_partial_05_0101,
  ep_Q2_074_partial_05_0102,
  ep_Q2_074_partial_05_0103,
  ep_Q2_074_partial_05_0104,
  ep_Q2_074_partial_05_0105,
  ep_Q2_074_partial_05_0106,
  ep_Q2_074_partial_05_0107,
  ep_Q2_074_partial_05_0108,
  ep_Q2_074_partial_05_0109,
  ep_Q2_074_partial_05_0110,
  ep_Q2_074_partial_05_0111,
  ep_Q2_074_partial_05_0112,
  ep_Q2_074_partial_05_0113,
  ep_Q2_074_partial_05_0114,
  ep_Q2_074_partial_05_0115,
  ep_Q2_074_partial_05_0116,
  ep_Q2_074_partial_05_0117,
  ep_Q2_074_partial_05_0118,
  ep_Q2_074_partial_05_0119,
  ep_Q2_074_partial_05_0120,
  ep_Q2_074_partial_05_0121,
  ep_Q2_074_partial_05_0122,
  ep_Q2_074_partial_05_0123,
  ep_Q2_074_partial_05_0124,
  ep_Q2_074_partial_05_0125,
  ep_Q2_074_partial_05_0126,
  ep_Q2_074_partial_05_0127,
  ep_Q2_074_partial_05_0128,
  ep_Q2_074_partial_05_0129,
  ep_Q2_074_partial_05_0130,
  ep_Q2_074_partial_05_0131,
  ep_Q2_074_partial_05_0132,
  ep_Q2_074_partial_05_0133,
  ep_Q2_074_partial_05_0134,
  ep_Q2_074_partial_05_0135,
  ep_Q2_074_partial_05_0136,
  ep_Q2_074_partial_05_0137,
  ep_Q2_074_partial_05_0138,
  ep_Q2_074_partial_05_0139,
  ep_Q2_074_partial_05_0140,
  ep_Q2_074_partial_05_0141,
  ep_Q2_074_partial_05_0142,
  ep_Q2_074_partial_05_0143,
  ep_Q2_074_partial_05_0144,
  ep_Q2_074_partial_05_0145,
  ep_Q2_074_partial_05_0146,
  ep_Q2_074_partial_05_0147,
  ep_Q2_074_partial_05_0148,
  ep_Q2_074_partial_05_0149,
  ep_Q2_074_partial_05_0150,
  ep_Q2_074_partial_05_0151,
  ep_Q2_074_partial_05_0152,
  ep_Q2_074_partial_05_0153,
  ep_Q2_074_partial_05_0154,
  ep_Q2_074_partial_05_0155,
  ep_Q2_074_partial_05_0156,
  ep_Q2_074_partial_05_0157,
  ep_Q2_074_partial_05_0158,
  ep_Q2_074_partial_05_0159,
  ep_Q2_074_partial_05_0160,
  ep_Q2_074_partial_05_0161,
  ep_Q2_074_partial_05_0162,
  ep_Q2_074_partial_05_0163,
  ep_Q2_074_partial_05_0164,
  ep_Q2_074_partial_05_0165,
  ep_Q2_074_partial_05_0166,
  ep_Q2_074_partial_05_0167,
  ep_Q2_074_partial_05_0168,
  ep_Q2_074_partial_05_0169,
  ep_Q2_074_partial_05_0170,
  ep_Q2_074_partial_05_0171,
  ep_Q2_074_partial_05_0172,
  ep_Q2_074_partial_05_0173,
  ep_Q2_074_partial_05_0174,
  ep_Q2_074_partial_05_0175,
  ep_Q2_074_partial_05_0176,
  ep_Q2_074_partial_05_0177,
  ep_Q2_074_partial_05_0178,
  ep_Q2_074_partial_05_0179,
  ep_Q2_074_partial_05_0180,
  ep_Q2_074_partial_05_0181,
  ep_Q2_074_partial_05_0182,
  ep_Q2_074_partial_05_0183,
  ep_Q2_074_partial_05_0184,
  ep_Q2_074_partial_05_0185,
  ep_Q2_074_partial_05_0186,
  ep_Q2_074_partial_05_0187,
  ep_Q2_074_partial_05_0188,
  ep_Q2_074_partial_05_0189,
  ep_Q2_074_partial_05_0190,
  ep_Q2_074_partial_05_0191,
  ep_Q2_074_partial_05_0192,
  ep_Q2_074_partial_05_0193,
  ep_Q2_074_partial_05_0194,
  ep_Q2_074_partial_05_0195,
  ep_Q2_074_partial_05_0196,
  ep_Q2_074_partial_05_0197,
  ep_Q2_074_partial_05_0198,
  ep_Q2_074_partial_05_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_05_0100_0199 : Poly :=
[
  term ((693 : Rat) / 1538) [(0, 1), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23370 : Rat) / 769) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((60171 : Rat) / 1538) [(0, 1), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-19701 : Rat) / 3076) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((693 : Rat) / 1538) [(0, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23370 : Rat) / 769) [(0, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((60171 : Rat) / 1538) [(0, 1), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-19701 : Rat) / 3076) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((-693 : Rat) / 1538) [(0, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-693 : Rat) / 1538) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((23370 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((23370 : Rat) / 769) [(0, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-60171 : Rat) / 1538) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((19701 : Rat) / 3076) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((-60171 : Rat) / 1538) [(0, 1), (4, 1), (14, 3), (16, 1)],
  term ((19701 : Rat) / 3076) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (15, 4), (16, 1)],
  term ((-5472 : Rat) / 769) [(0, 1), (6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 769) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((8202 : Rat) / 769) [(0, 1), (6, 2), (10, 1), (12, 1), (16, 1)],
  term ((-13644 : Rat) / 769) [(0, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((12264 : Rat) / 769) [(0, 1), (6, 2), (10, 1), (16, 1)],
  term ((57321 : Rat) / 1538) [(0, 1), (6, 2), (12, 1), (14, 1), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-11445 : Rat) / 3076) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((26181 : Rat) / 769) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35091 : Rat) / 3076) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-242439 : Rat) / 6152) [(0, 1), (6, 2), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((5472 : Rat) / 769) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((8202 : Rat) / 769) [(0, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((-13644 : Rat) / 769) [(0, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((12264 : Rat) / 769) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((57321 : Rat) / 1538) [(0, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-11445 : Rat) / 3076) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((26181 : Rat) / 769) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35091 : Rat) / 3076) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-242439 : Rat) / 6152) [(0, 1), (7, 2), (16, 1)],
  term ((-5472 : Rat) / 769) [(0, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 769) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-8202 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8202 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((13644 : Rat) / 769) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12264 : Rat) / 769) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((13644 : Rat) / 769) [(0, 1), (10, 1), (14, 3), (16, 1)],
  term ((-12264 : Rat) / 769) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-57321 : Rat) / 1538) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((11445 : Rat) / 3076) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-57321 : Rat) / 1538) [(0, 1), (12, 1), (14, 3), (16, 1)],
  term ((11445 : Rat) / 3076) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 769) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-26181 : Rat) / 769) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-26181 : Rat) / 769) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((35091 : Rat) / 3076) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((242439 : Rat) / 6152) [(0, 1), (14, 2), (16, 1)],
  term ((35091 : Rat) / 3076) [(0, 1), (14, 3), (16, 1)],
  term ((242439 : Rat) / 6152) [(0, 1), (15, 2), (16, 1)],
  term ((2736 : Rat) / 769) [(0, 1), (15, 4), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (6, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-16542 : Rat) / 769) [(0, 2), (2, 1), (6, 2), (16, 1)],
  term ((-16542 : Rat) / 769) [(0, 2), (2, 1), (7, 2), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 2), (2, 1), (14, 2), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (6, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (7, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (14, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (15, 2), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 2), (6, 2), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 2), (7, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 2), (14, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 2), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (7, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 3), (12, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (7, 3), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 3), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (3, 1), (7, 1), (14, 2), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (7, 3), (12, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (3, 1), (7, 3), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 3), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (6, 2), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (7, 2), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (14, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (3, 2), (6, 2), (12, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (3, 2), (6, 2), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (3, 2), (7, 2), (12, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (3, 2), (7, 2), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (3, 2), (12, 1), (14, 2), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (3, 2), (14, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (4, 1), (6, 2), (12, 1), (14, 1), (16, 1)],
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-35055 : Rat) / 1538) [(0, 2), (4, 1), (6, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (4, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-35055 : Rat) / 1538) [(0, 2), (4, 1), (7, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (14, 3), (16, 1)],
  term ((-5535 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((35055 : Rat) / 1538) [(0, 2), (4, 1), (14, 2), (16, 1)],
  term ((5535 : Rat) / 769) [(0, 2), (4, 1), (14, 3), (16, 1)],
  term ((35055 : Rat) / 1538) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24813 : Rat) / 3076) [(0, 2), (6, 2), (12, 1), (16, 1)],
  term ((29667 : Rat) / 3076) [(0, 2), (6, 2), (14, 1), (16, 1)],
  term ((142587 : Rat) / 6152) [(0, 2), (6, 2), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24813 : Rat) / 3076) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((29667 : Rat) / 3076) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((142587 : Rat) / 6152) [(0, 2), (7, 2), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24813 : Rat) / 3076) [(0, 2), (12, 1), (14, 2), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (12, 1), (14, 3), (16, 1)],
  term ((24813 : Rat) / 3076) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-29667 : Rat) / 3076) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-142587 : Rat) / 6152) [(0, 2), (14, 2), (16, 1)],
  term ((-29667 : Rat) / 3076) [(0, 2), (14, 3), (16, 1)],
  term ((-142587 : Rat) / 6152) [(0, 2), (15, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (6, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (7, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)],
  term ((-2592 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (6, 2), (7, 1), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 3), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (6, 2), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (7, 2), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((6534 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (9, 1), (12, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (9, 1), (16, 1)],
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((6642 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (13, 1), (16, 1)],
  term ((-20307 : Rat) / 769) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6534 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((-6534 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (9, 1), (16, 1)],
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((6642 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((-20307 : Rat) / 769) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 769) [(1, 1), (2, 1), (7, 3), (12, 1), (16, 1)],
  term ((6534 : Rat) / 769) [(1, 1), (2, 1), (7, 3), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-360 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6642 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((360 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 3), (16, 1)],
  term ((-6642 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((20307 : Rat) / 769) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((20307 : Rat) / 769) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (6, 2), (7, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (6, 2), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (7, 2), (13, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (7, 3), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 2), (12, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 2), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 2), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (14, 3), (16, 1)],
  term ((6093 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-5526 : Rat) / 769) [(1, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((38685 : Rat) / 1538) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-5526 : Rat) / 769) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((38685 : Rat) / 1538) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((5526 : Rat) / 769) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((5526 : Rat) / 769) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-38685 : Rat) / 1538) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-38685 : Rat) / 1538) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((1332 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((3231 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (7, 1), (16, 1)],
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5328 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((2763 : Rat) / 769) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1332 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1332 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3231 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 3), (16, 1)],
  term ((-3231 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5328 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((2763 : Rat) / 769) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((1332 : Rat) / 769) [(1, 1), (4, 1), (7, 3), (12, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (7, 3), (14, 1), (16, 1)],
  term ((3231 : Rat) / 769) [(1, 1), (4, 1), (7, 3), (16, 1)],
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2664 : Rat) / 769) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5328 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2664 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 3), (16, 1)],
  term ((5328 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2763 : Rat) / 769) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2763 : Rat) / 769) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (10, 1), (12, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((4920 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((7062 : Rat) / 769) [(1, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((-29133 : Rat) / 1538) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((4920 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((7062 : Rat) / 769) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((-29133 : Rat) / 1538) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-4920 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4920 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7062 : Rat) / 769) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((29133 : Rat) / 1538) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-7062 : Rat) / 769) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((29133 : Rat) / 1538) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2466 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((-6675 : Rat) / 769) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (6, 2), (9, 1), (12, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (6, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((4326 : Rat) / 769) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4326 : Rat) / 769) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2466 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (14, 3), (16, 1)],
  term ((2466 : Rat) / 769) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353 : Rat) / 769) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((6675 : Rat) / 769) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-1353 : Rat) / 769) [(1, 1), (7, 1), (14, 3), (16, 1)],
  term ((6675 : Rat) / 769) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((4326 : Rat) / 769) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4326 : Rat) / 769) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (7, 3), (10, 1), (12, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (7, 3), (10, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (7, 3), (12, 1), (14, 1), (16, 1)],
  term ((-2466 : Rat) / 769) [(1, 1), (7, 3), (12, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((1353 : Rat) / 769) [(1, 1), (7, 3), (14, 1), (16, 1)],
  term ((-6675 : Rat) / 769) [(1, 1), (7, 3), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((132 : Rat) / 769) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((1188 : Rat) / 769) [(1, 1), (11, 1), (14, 3), (16, 1)],
  term ((132 : Rat) / 769) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4326 : Rat) / 769) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4326 : Rat) / 769) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((4326 : Rat) / 769) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4326 : Rat) / 769) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 199. -/
theorem ep_Q2_074_block_05_0100_0199_valid :
    checkProductSumEq ep_Q2_074_partials_05_0100_0199
      ep_Q2_074_block_05_0100_0199 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
