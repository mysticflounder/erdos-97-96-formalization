/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 2:200-257

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 2 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_02_0200_0257 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (14, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0200 : Poly :=
[
  term (-11460 : Rat) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 200 for generator 2. -/
def ep_Q2_064_partial_02_0200 : Poly :=
[
  term (22920 : Rat) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-22920 : Rat) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (22920 : Rat) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-22920 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term (-11460 : Rat) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-11460 : Rat) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (11460 : Rat) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term (11460 : Rat) [(6, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 2. -/
theorem ep_Q2_064_partial_02_0200_valid :
    mulPoly ep_Q2_064_coefficient_02_0200
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0201 : Poly :=
[
  term ((8535 : Rat) / 2) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 201 for generator 2. -/
def ep_Q2_064_partial_02_0201 : Poly :=
[
  term (-8535 : Rat) [(0, 1), (2, 1), (6, 1), (12, 1), (15, 2)],
  term (8535 : Rat) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term (-8535 : Rat) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term (8535 : Rat) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((8535 : Rat) / 2) [(2, 2), (6, 1), (12, 1), (15, 2)],
  term ((8535 : Rat) / 2) [(3, 2), (6, 1), (12, 1), (15, 2)],
  term ((-8535 : Rat) / 2) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-8535 : Rat) / 2) [(6, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 2. -/
theorem ep_Q2_064_partial_02_0201_valid :
    mulPoly ep_Q2_064_coefficient_02_0201
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0202 : Poly :=
[
  term ((-57823 : Rat) / 8) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 202 for generator 2. -/
def ep_Q2_064_partial_02_0202 : Poly :=
[
  term ((57823 : Rat) / 4) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-57823 : Rat) / 4) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((57823 : Rat) / 4) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-57823 : Rat) / 4) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-57823 : Rat) / 8) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-57823 : Rat) / 8) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((57823 : Rat) / 8) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((57823 : Rat) / 8) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 2. -/
theorem ep_Q2_064_partial_02_0202_valid :
    mulPoly ep_Q2_064_coefficient_02_0202
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0203 : Poly :=
[
  term ((15819 : Rat) / 8) [(6, 1), (13, 2)]
]

/-- Partial product 203 for generator 2. -/
def ep_Q2_064_partial_02_0203 : Poly :=
[
  term ((-15819 : Rat) / 4) [(0, 1), (2, 1), (6, 1), (13, 2)],
  term ((15819 : Rat) / 4) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((-15819 : Rat) / 4) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((15819 : Rat) / 4) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((15819 : Rat) / 8) [(2, 2), (6, 1), (13, 2)],
  term ((15819 : Rat) / 8) [(3, 2), (6, 1), (13, 2)],
  term ((-15819 : Rat) / 8) [(6, 1), (13, 2), (14, 2)],
  term ((-15819 : Rat) / 8) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 2. -/
theorem ep_Q2_064_partial_02_0203_valid :
    mulPoly ep_Q2_064_coefficient_02_0203
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0204 : Poly :=
[
  term ((-26797 : Rat) / 16) [(6, 1), (15, 2)]
]

/-- Partial product 204 for generator 2. -/
def ep_Q2_064_partial_02_0204 : Poly :=
[
  term ((26797 : Rat) / 8) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-26797 : Rat) / 8) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((26797 : Rat) / 8) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-26797 : Rat) / 8) [(1, 1), (6, 1), (15, 3)],
  term ((-26797 : Rat) / 16) [(2, 2), (6, 1), (15, 2)],
  term ((-26797 : Rat) / 16) [(3, 2), (6, 1), (15, 2)],
  term ((26797 : Rat) / 16) [(6, 1), (14, 2), (15, 2)],
  term ((26797 : Rat) / 16) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 2. -/
theorem ep_Q2_064_partial_02_0204_valid :
    mulPoly ep_Q2_064_coefficient_02_0204
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0205 : Poly :=
[
  term ((-42615 : Rat) / 4) [(6, 2), (11, 1), (15, 1)]
]

/-- Partial product 205 for generator 2. -/
def ep_Q2_064_partial_02_0205 : Poly :=
[
  term ((42615 : Rat) / 2) [(0, 1), (2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 2) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term ((42615 : Rat) / 2) [(1, 1), (3, 1), (6, 2), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 2) [(1, 1), (6, 2), (11, 1), (15, 2)],
  term ((-42615 : Rat) / 4) [(2, 2), (6, 2), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 4) [(3, 2), (6, 2), (11, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 2. -/
theorem ep_Q2_064_partial_02_0205_valid :
    mulPoly ep_Q2_064_coefficient_02_0205
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0206 : Poly :=
[
  term (11364 : Rat) [(6, 2), (13, 1), (15, 1)]
]

/-- Partial product 206 for generator 2. -/
def ep_Q2_064_partial_02_0206 : Poly :=
[
  term (-22728 : Rat) [(0, 1), (2, 1), (6, 2), (13, 1), (15, 1)],
  term (22728 : Rat) [(0, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term (-22728 : Rat) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1)],
  term (22728 : Rat) [(1, 1), (6, 2), (13, 1), (15, 2)],
  term (11364 : Rat) [(2, 2), (6, 2), (13, 1), (15, 1)],
  term (11364 : Rat) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term (-11364 : Rat) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term (-11364 : Rat) [(6, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 2. -/
theorem ep_Q2_064_partial_02_0206_valid :
    mulPoly ep_Q2_064_coefficient_02_0206
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0207 : Poly :=
[
  term ((-2841 : Rat) / 4) [(6, 2), (15, 2)]
]

/-- Partial product 207 for generator 2. -/
def ep_Q2_064_partial_02_0207 : Poly :=
[
  term ((2841 : Rat) / 2) [(0, 1), (2, 1), (6, 2), (15, 2)],
  term ((-2841 : Rat) / 2) [(0, 1), (6, 2), (14, 1), (15, 2)],
  term ((2841 : Rat) / 2) [(1, 1), (3, 1), (6, 2), (15, 2)],
  term ((-2841 : Rat) / 2) [(1, 1), (6, 2), (15, 3)],
  term ((-2841 : Rat) / 4) [(2, 2), (6, 2), (15, 2)],
  term ((-2841 : Rat) / 4) [(3, 2), (6, 2), (15, 2)],
  term ((2841 : Rat) / 4) [(6, 2), (14, 2), (15, 2)],
  term ((2841 : Rat) / 4) [(6, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 2. -/
theorem ep_Q2_064_partial_02_0207_valid :
    mulPoly ep_Q2_064_coefficient_02_0207
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0208 : Poly :=
[
  term (-108 : Rat) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 208 for generator 2. -/
def ep_Q2_064_partial_02_0208 : Poly :=
[
  term (216 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 1)],
  term (-216 : Rat) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term (216 : Rat) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term (-216 : Rat) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term (-108 : Rat) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term (-108 : Rat) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term (108 : Rat) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term (108 : Rat) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 2. -/
theorem ep_Q2_064_partial_02_0208_valid :
    mulPoly ep_Q2_064_coefficient_02_0208
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0209 : Poly :=
[
  term (-27 : Rat) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 209 for generator 2. -/
def ep_Q2_064_partial_02_0209 : Poly :=
[
  term (54 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (13, 1)],
  term (-54 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term (54 : Rat) [(1, 1), (3, 1), (7, 1), (8, 1), (13, 1)],
  term (-54 : Rat) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term (-27 : Rat) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term (-27 : Rat) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term (27 : Rat) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 2. -/
theorem ep_Q2_064_partial_02_0209_valid :
    mulPoly ep_Q2_064_coefficient_02_0209
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0210 : Poly :=
[
  term (2841 : Rat) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 210 for generator 2. -/
def ep_Q2_064_partial_02_0210 : Poly :=
[
  term (-5682 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term (5682 : Rat) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term (-5682 : Rat) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term (5682 : Rat) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term (2841 : Rat) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term (2841 : Rat) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term (-2841 : Rat) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term (-2841 : Rat) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 2. -/
theorem ep_Q2_064_partial_02_0210_valid :
    mulPoly ep_Q2_064_coefficient_02_0210
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0211 : Poly :=
[
  term ((14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 211 for generator 2. -/
def ep_Q2_064_partial_02_0211 : Poly :=
[
  term ((-14079 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((14079 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-14079 : Rat) / 4) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term ((14079 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((14079 : Rat) / 8) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term ((14079 : Rat) / 8) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term ((-14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((-14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 2. -/
theorem ep_Q2_064_partial_02_0211_valid :
    mulPoly ep_Q2_064_coefficient_02_0211
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0212 : Poly :=
[
  term (-1735 : Rat) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 212 for generator 2. -/
def ep_Q2_064_partial_02_0212 : Poly :=
[
  term (3470 : Rat) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1)],
  term (-3470 : Rat) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term (3470 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (12, 1)],
  term (-3470 : Rat) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term (-1735 : Rat) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term (-1735 : Rat) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term (1735 : Rat) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term (1735 : Rat) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 2. -/
theorem ep_Q2_064_partial_02_0212_valid :
    mulPoly ep_Q2_064_coefficient_02_0212
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0213 : Poly :=
[
  term ((27 : Rat) / 2) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 213 for generator 2. -/
def ep_Q2_064_partial_02_0213 : Poly :=
[
  term (-27 : Rat) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term (27 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (-27 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term (27 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((27 : Rat) / 2) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 2. -/
theorem ep_Q2_064_partial_02_0213_valid :
    mulPoly ep_Q2_064_coefficient_02_0213
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0214 : Poly :=
[
  term ((-42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 214 for generator 2. -/
def ep_Q2_064_partial_02_0214 : Poly :=
[
  term ((42975 : Rat) / 2) [(0, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((42975 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (12, 1), (15, 2)],
  term ((-42975 : Rat) / 4) [(2, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 2. -/
theorem ep_Q2_064_partial_02_0214_valid :
    mulPoly ep_Q2_064_coefficient_02_0214
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0215 : Poly :=
[
  term ((7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 215 for generator 2. -/
def ep_Q2_064_partial_02_0215 : Poly :=
[
  term ((-7149 : Rat) / 2) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((7149 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-7149 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((7149 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((7149 : Rat) / 4) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((7149 : Rat) / 4) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((-7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 2. -/
theorem ep_Q2_064_partial_02_0215_valid :
    mulPoly ep_Q2_064_coefficient_02_0215
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0216 : Poly :=
[
  term ((-87687 : Rat) / 16) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 216 for generator 2. -/
def ep_Q2_064_partial_02_0216 : Poly :=
[
  term ((87687 : Rat) / 8) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-87687 : Rat) / 8) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((87687 : Rat) / 8) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-87687 : Rat) / 8) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((-87687 : Rat) / 16) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((-87687 : Rat) / 16) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((87687 : Rat) / 16) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((87687 : Rat) / 16) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 2. -/
theorem ep_Q2_064_partial_02_0216_valid :
    mulPoly ep_Q2_064_coefficient_02_0216
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0217 : Poly :=
[
  term (351 : Rat) [(7, 1), (11, 1)]
]

/-- Partial product 217 for generator 2. -/
def ep_Q2_064_partial_02_0217 : Poly :=
[
  term (-702 : Rat) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term (702 : Rat) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term (-702 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term (702 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (351 : Rat) [(2, 2), (7, 1), (11, 1)],
  term (351 : Rat) [(3, 2), (7, 1), (11, 1)],
  term (-351 : Rat) [(7, 1), (11, 1), (14, 2)],
  term (-351 : Rat) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 2. -/
theorem ep_Q2_064_partial_02_0217_valid :
    mulPoly ep_Q2_064_coefficient_02_0217
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0218 : Poly :=
[
  term ((-27 : Rat) / 2) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 218 for generator 2. -/
def ep_Q2_064_partial_02_0218 : Poly :=
[
  term (27 : Rat) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term (-27 : Rat) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term (27 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term (-27 : Rat) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-27 : Rat) / 2) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((27 : Rat) / 2) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((27 : Rat) / 2) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 2. -/
theorem ep_Q2_064_partial_02_0218_valid :
    mulPoly ep_Q2_064_coefficient_02_0218
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0219 : Poly :=
[
  term ((-15819 : Rat) / 8) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 219 for generator 2. -/
def ep_Q2_064_partial_02_0219 : Poly :=
[
  term ((15819 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-15819 : Rat) / 4) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((15819 : Rat) / 4) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((-15819 : Rat) / 4) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 8) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-15819 : Rat) / 8) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((15819 : Rat) / 8) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((15819 : Rat) / 8) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 2. -/
theorem ep_Q2_064_partial_02_0219_valid :
    mulPoly ep_Q2_064_coefficient_02_0219
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0220 : Poly :=
[
  term ((-36227 : Rat) / 8) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 220 for generator 2. -/
def ep_Q2_064_partial_02_0220 : Poly :=
[
  term ((36227 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-36227 : Rat) / 4) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((36227 : Rat) / 4) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-36227 : Rat) / 4) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-36227 : Rat) / 8) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-36227 : Rat) / 8) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((36227 : Rat) / 8) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((36227 : Rat) / 8) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 2. -/
theorem ep_Q2_064_partial_02_0220_valid :
    mulPoly ep_Q2_064_coefficient_02_0220
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0221 : Poly :=
[
  term (11460 : Rat) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 221 for generator 2. -/
def ep_Q2_064_partial_02_0221 : Poly :=
[
  term (-22920 : Rat) [(0, 1), (2, 1), (7, 1), (12, 2), (15, 1)],
  term (22920 : Rat) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term (-22920 : Rat) [(1, 1), (3, 1), (7, 1), (12, 2), (15, 1)],
  term (22920 : Rat) [(1, 1), (7, 1), (12, 2), (15, 2)],
  term (11460 : Rat) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term (11460 : Rat) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term (-11460 : Rat) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term (-11460 : Rat) [(7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 2. -/
theorem ep_Q2_064_partial_02_0221_valid :
    mulPoly ep_Q2_064_coefficient_02_0221
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0222 : Poly :=
[
  term ((-891 : Rat) / 2) [(7, 1), (13, 1)]
]

/-- Partial product 222 for generator 2. -/
def ep_Q2_064_partial_02_0222 : Poly :=
[
  term (891 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term (-891 : Rat) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term (891 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term (-891 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-891 : Rat) / 2) [(2, 2), (7, 1), (13, 1)],
  term ((-891 : Rat) / 2) [(3, 2), (7, 1), (13, 1)],
  term ((891 : Rat) / 2) [(7, 1), (13, 1), (14, 2)],
  term ((891 : Rat) / 2) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 2. -/
theorem ep_Q2_064_partial_02_0222_valid :
    mulPoly ep_Q2_064_coefficient_02_0222
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0223 : Poly :=
[
  term ((2895 : Rat) / 2) [(7, 1), (15, 1)]
]

/-- Partial product 223 for generator 2. -/
def ep_Q2_064_partial_02_0223 : Poly :=
[
  term (-2895 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term (2895 : Rat) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term (-2895 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (2895 : Rat) [(1, 1), (7, 1), (15, 2)],
  term ((2895 : Rat) / 2) [(2, 2), (7, 1), (15, 1)],
  term ((2895 : Rat) / 2) [(3, 2), (7, 1), (15, 1)],
  term ((-2895 : Rat) / 2) [(7, 1), (14, 2), (15, 1)],
  term ((-2895 : Rat) / 2) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 2. -/
theorem ep_Q2_064_partial_02_0223_valid :
    mulPoly ep_Q2_064_coefficient_02_0223
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0224 : Poly :=
[
  term (405 : Rat) [(7, 2), (10, 1)]
]

/-- Partial product 224 for generator 2. -/
def ep_Q2_064_partial_02_0224 : Poly :=
[
  term (-810 : Rat) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term (810 : Rat) [(0, 1), (7, 2), (10, 1), (14, 1)],
  term (-810 : Rat) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term (810 : Rat) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term (405 : Rat) [(2, 2), (7, 2), (10, 1)],
  term (405 : Rat) [(3, 2), (7, 2), (10, 1)],
  term (-405 : Rat) [(7, 2), (10, 1), (14, 2)],
  term (-405 : Rat) [(7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 2. -/
theorem ep_Q2_064_partial_02_0224_valid :
    mulPoly ep_Q2_064_coefficient_02_0224
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0225 : Poly :=
[
  term (-432 : Rat) [(7, 2), (12, 1)]
]

/-- Partial product 225 for generator 2. -/
def ep_Q2_064_partial_02_0225 : Poly :=
[
  term (864 : Rat) [(0, 1), (2, 1), (7, 2), (12, 1)],
  term (-864 : Rat) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term (864 : Rat) [(1, 1), (3, 1), (7, 2), (12, 1)],
  term (-864 : Rat) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term (-432 : Rat) [(2, 2), (7, 2), (12, 1)],
  term (-432 : Rat) [(3, 2), (7, 2), (12, 1)],
  term (432 : Rat) [(7, 2), (12, 1), (14, 2)],
  term (432 : Rat) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 2. -/
theorem ep_Q2_064_partial_02_0225_valid :
    mulPoly ep_Q2_064_coefficient_02_0225
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0226 : Poly :=
[
  term ((881 : Rat) / 4) [(8, 1)]
]

/-- Partial product 226 for generator 2. -/
def ep_Q2_064_partial_02_0226 : Poly :=
[
  term ((-881 : Rat) / 2) [(0, 1), (2, 1), (8, 1)],
  term ((881 : Rat) / 2) [(0, 1), (8, 1), (14, 1)],
  term ((-881 : Rat) / 2) [(1, 1), (3, 1), (8, 1)],
  term ((881 : Rat) / 2) [(1, 1), (8, 1), (15, 1)],
  term ((881 : Rat) / 4) [(2, 2), (8, 1)],
  term ((881 : Rat) / 4) [(3, 2), (8, 1)],
  term ((-881 : Rat) / 4) [(8, 1), (14, 2)],
  term ((-881 : Rat) / 4) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 2. -/
theorem ep_Q2_064_partial_02_0226_valid :
    mulPoly ep_Q2_064_coefficient_02_0226
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0227 : Poly :=
[
  term ((-881 : Rat) / 2) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 227 for generator 2. -/
def ep_Q2_064_partial_02_0227 : Poly :=
[
  term (881 : Rat) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term (-881 : Rat) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term (881 : Rat) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term (-881 : Rat) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-881 : Rat) / 2) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((-881 : Rat) / 2) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 2. -/
theorem ep_Q2_064_partial_02_0227_valid :
    mulPoly ep_Q2_064_coefficient_02_0227
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0228 : Poly :=
[
  term ((-881 : Rat) / 8) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 228 for generator 2. -/
def ep_Q2_064_partial_02_0228 : Poly :=
[
  term ((881 : Rat) / 4) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1)],
  term ((-881 : Rat) / 4) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((881 : Rat) / 4) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)],
  term ((-881 : Rat) / 4) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-881 : Rat) / 8) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-881 : Rat) / 8) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 2. -/
theorem ep_Q2_064_partial_02_0228_valid :
    mulPoly ep_Q2_064_coefficient_02_0228
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0229 : Poly :=
[
  term (2865 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 229 for generator 2. -/
def ep_Q2_064_partial_02_0229 : Poly :=
[
  term (-5730 : Rat) [(0, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (-5730 : Rat) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term (2865 : Rat) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (2865 : Rat) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (-2865 : Rat) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term (-2865 : Rat) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 2. -/
theorem ep_Q2_064_partial_02_0229_valid :
    mulPoly ep_Q2_064_coefficient_02_0229
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0230 : Poly :=
[
  term ((-1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 230 for generator 2. -/
def ep_Q2_064_partial_02_0230 : Poly :=
[
  term ((1971 : Rat) / 8) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1971 : Rat) / 8) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1971 : Rat) / 8) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1971 : Rat) / 8) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 2. -/
theorem ep_Q2_064_partial_02_0230_valid :
    mulPoly ep_Q2_064_coefficient_02_0230
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0231 : Poly :=
[
  term (-526 : Rat) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 231 for generator 2. -/
def ep_Q2_064_partial_02_0231 : Poly :=
[
  term (1052 : Rat) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term (-1052 : Rat) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term (1052 : Rat) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term (-1052 : Rat) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term (-526 : Rat) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term (-526 : Rat) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term (526 : Rat) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term (526 : Rat) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 2. -/
theorem ep_Q2_064_partial_02_0231_valid :
    mulPoly ep_Q2_064_coefficient_02_0231
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0232 : Poly :=
[
  term ((2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 232 for generator 2. -/
def ep_Q2_064_partial_02_0232 : Poly :=
[
  term ((-2865 : Rat) / 2) [(0, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((2865 : Rat) / 4) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 2. -/
theorem ep_Q2_064_partial_02_0232_valid :
    mulPoly ep_Q2_064_coefficient_02_0232
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0233 : Poly :=
[
  term ((-26989 : Rat) / 16) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 233 for generator 2. -/
def ep_Q2_064_partial_02_0233 : Poly :=
[
  term ((26989 : Rat) / 8) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 8) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((26989 : Rat) / 8) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 8) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-26989 : Rat) / 16) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((26989 : Rat) / 16) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 2. -/
theorem ep_Q2_064_partial_02_0233_valid :
    mulPoly ep_Q2_064_coefficient_02_0233
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0234 : Poly :=
[
  term ((-1377 : Rat) / 8) [(8, 1), (13, 2)]
]

/-- Partial product 234 for generator 2. -/
def ep_Q2_064_partial_02_0234 : Poly :=
[
  term ((1377 : Rat) / 4) [(0, 1), (2, 1), (8, 1), (13, 2)],
  term ((-1377 : Rat) / 4) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((1377 : Rat) / 4) [(1, 1), (3, 1), (8, 1), (13, 2)],
  term ((-1377 : Rat) / 4) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-1377 : Rat) / 8) [(2, 2), (8, 1), (13, 2)],
  term ((-1377 : Rat) / 8) [(3, 2), (8, 1), (13, 2)],
  term ((1377 : Rat) / 8) [(8, 1), (13, 2), (14, 2)],
  term ((1377 : Rat) / 8) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 2. -/
theorem ep_Q2_064_partial_02_0234_valid :
    mulPoly ep_Q2_064_coefficient_02_0234
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0235 : Poly :=
[
  term (-2865 : Rat) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 235 for generator 2. -/
def ep_Q2_064_partial_02_0235 : Poly :=
[
  term (5730 : Rat) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (5730 : Rat) [(1, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term (-2865 : Rat) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (-2865 : Rat) [(3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (2865 : Rat) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term (2865 : Rat) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 2. -/
theorem ep_Q2_064_partial_02_0235_valid :
    mulPoly ep_Q2_064_coefficient_02_0235
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0236 : Poly :=
[
  term ((1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 236 for generator 2. -/
def ep_Q2_064_partial_02_0236 : Poly :=
[
  term ((-1971 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((1971 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1971 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((1971 : Rat) / 8) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 2. -/
theorem ep_Q2_064_partial_02_0236_valid :
    mulPoly ep_Q2_064_coefficient_02_0236
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0237 : Poly :=
[
  term (526 : Rat) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 237 for generator 2. -/
def ep_Q2_064_partial_02_0237 : Poly :=
[
  term (-1052 : Rat) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term (1052 : Rat) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (-1052 : Rat) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term (1052 : Rat) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term (526 : Rat) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term (526 : Rat) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term (-526 : Rat) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term (-526 : Rat) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 2. -/
theorem ep_Q2_064_partial_02_0237_valid :
    mulPoly ep_Q2_064_coefficient_02_0237
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0238 : Poly :=
[
  term ((11453 : Rat) / 8) [(9, 1), (11, 1)]
]

/-- Partial product 238 for generator 2. -/
def ep_Q2_064_partial_02_0238 : Poly :=
[
  term ((-11453 : Rat) / 4) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((11453 : Rat) / 4) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-11453 : Rat) / 4) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((11453 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((11453 : Rat) / 8) [(2, 2), (9, 1), (11, 1)],
  term ((11453 : Rat) / 8) [(3, 2), (9, 1), (11, 1)],
  term ((-11453 : Rat) / 8) [(9, 1), (11, 1), (14, 2)],
  term ((-11453 : Rat) / 8) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 2. -/
theorem ep_Q2_064_partial_02_0238_valid :
    mulPoly ep_Q2_064_coefficient_02_0238
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0239 : Poly :=
[
  term ((1377 : Rat) / 8) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 239 for generator 2. -/
def ep_Q2_064_partial_02_0239 : Poly :=
[
  term ((-1377 : Rat) / 4) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((1377 : Rat) / 4) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1377 : Rat) / 4) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((1377 : Rat) / 4) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 8) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((1377 : Rat) / 8) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1377 : Rat) / 8) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1377 : Rat) / 8) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 2. -/
theorem ep_Q2_064_partial_02_0239_valid :
    mulPoly ep_Q2_064_coefficient_02_0239
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0240 : Poly :=
[
  term ((35799 : Rat) / 16) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 240 for generator 2. -/
def ep_Q2_064_partial_02_0240 : Poly :=
[
  term ((-35799 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((35799 : Rat) / 8) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-35799 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((35799 : Rat) / 8) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((35799 : Rat) / 16) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((35799 : Rat) / 16) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-35799 : Rat) / 16) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-35799 : Rat) / 16) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 2. -/
theorem ep_Q2_064_partial_02_0240_valid :
    mulPoly ep_Q2_064_coefficient_02_0240
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0241 : Poly :=
[
  term ((-2865 : Rat) / 4) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 241 for generator 2. -/
def ep_Q2_064_partial_02_0241 : Poly :=
[
  term ((2865 : Rat) / 2) [(0, 1), (2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 2) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 2) [(1, 1), (9, 1), (12, 2), (15, 2)],
  term ((-2865 : Rat) / 4) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((2865 : Rat) / 4) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((2865 : Rat) / 4) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 2. -/
theorem ep_Q2_064_partial_02_0241_valid :
    mulPoly ep_Q2_064_coefficient_02_0241
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0242 : Poly :=
[
  term ((-29073 : Rat) / 16) [(9, 1), (13, 1)]
]

/-- Partial product 242 for generator 2. -/
def ep_Q2_064_partial_02_0242 : Poly :=
[
  term ((29073 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-29073 : Rat) / 8) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((29073 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-29073 : Rat) / 8) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-29073 : Rat) / 16) [(2, 2), (9, 1), (13, 1)],
  term ((-29073 : Rat) / 16) [(3, 2), (9, 1), (13, 1)],
  term ((29073 : Rat) / 16) [(9, 1), (13, 1), (14, 2)],
  term ((29073 : Rat) / 16) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 2. -/
theorem ep_Q2_064_partial_02_0242_valid :
    mulPoly ep_Q2_064_coefficient_02_0242
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0243 : Poly :=
[
  term ((23609 : Rat) / 8) [(9, 1), (15, 1)]
]

/-- Partial product 243 for generator 2. -/
def ep_Q2_064_partial_02_0243 : Poly :=
[
  term ((-23609 : Rat) / 4) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((23609 : Rat) / 4) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-23609 : Rat) / 4) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((23609 : Rat) / 4) [(1, 1), (9, 1), (15, 2)],
  term ((23609 : Rat) / 8) [(2, 2), (9, 1), (15, 1)],
  term ((23609 : Rat) / 8) [(3, 2), (9, 1), (15, 1)],
  term ((-23609 : Rat) / 8) [(9, 1), (14, 2), (15, 1)],
  term ((-23609 : Rat) / 8) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 2. -/
theorem ep_Q2_064_partial_02_0243_valid :
    mulPoly ep_Q2_064_coefficient_02_0243
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0244 : Poly :=
[
  term ((881 : Rat) / 2) [(9, 2), (10, 1)]
]

/-- Partial product 244 for generator 2. -/
def ep_Q2_064_partial_02_0244 : Poly :=
[
  term (-881 : Rat) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term (881 : Rat) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term (-881 : Rat) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term (881 : Rat) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((881 : Rat) / 2) [(2, 2), (9, 2), (10, 1)],
  term ((881 : Rat) / 2) [(3, 2), (9, 2), (10, 1)],
  term ((-881 : Rat) / 2) [(9, 2), (10, 1), (14, 2)],
  term ((-881 : Rat) / 2) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 2. -/
theorem ep_Q2_064_partial_02_0244_valid :
    mulPoly ep_Q2_064_coefficient_02_0244
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0245 : Poly :=
[
  term ((881 : Rat) / 8) [(9, 2), (12, 1)]
]

/-- Partial product 245 for generator 2. -/
def ep_Q2_064_partial_02_0245 : Poly :=
[
  term ((-881 : Rat) / 4) [(0, 1), (2, 1), (9, 2), (12, 1)],
  term ((881 : Rat) / 4) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((-881 : Rat) / 4) [(1, 1), (3, 1), (9, 2), (12, 1)],
  term ((881 : Rat) / 4) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((881 : Rat) / 8) [(2, 2), (9, 2), (12, 1)],
  term ((881 : Rat) / 8) [(3, 2), (9, 2), (12, 1)],
  term ((-881 : Rat) / 8) [(9, 2), (12, 1), (14, 2)],
  term ((-881 : Rat) / 8) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 2. -/
theorem ep_Q2_064_partial_02_0245_valid :
    mulPoly ep_Q2_064_coefficient_02_0245
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0246 : Poly :=
[
  term ((-37245 : Rat) / 4) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 246 for generator 2. -/
def ep_Q2_064_partial_02_0246 : Poly :=
[
  term ((37245 : Rat) / 2) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 2) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((37245 : Rat) / 2) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 2) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-37245 : Rat) / 4) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 4) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((37245 : Rat) / 4) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((37245 : Rat) / 4) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 2. -/
theorem ep_Q2_064_partial_02_0246_valid :
    mulPoly ep_Q2_064_coefficient_02_0246
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0247 : Poly :=
[
  term ((54789 : Rat) / 32) [(11, 1), (13, 1)]
]

/-- Partial product 247 for generator 2. -/
def ep_Q2_064_partial_02_0247 : Poly :=
[
  term ((-54789 : Rat) / 16) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((54789 : Rat) / 16) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-54789 : Rat) / 16) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((54789 : Rat) / 16) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((54789 : Rat) / 32) [(2, 2), (11, 1), (13, 1)],
  term ((54789 : Rat) / 32) [(3, 2), (11, 1), (13, 1)],
  term ((-54789 : Rat) / 32) [(11, 1), (13, 1), (14, 2)],
  term ((-54789 : Rat) / 32) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 2. -/
theorem ep_Q2_064_partial_02_0247_valid :
    mulPoly ep_Q2_064_coefficient_02_0247
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0248 : Poly :=
[
  term ((-91895 : Rat) / 16) [(11, 1), (15, 1)]
]

/-- Partial product 248 for generator 2. -/
def ep_Q2_064_partial_02_0248 : Poly :=
[
  term ((91895 : Rat) / 8) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-91895 : Rat) / 8) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((91895 : Rat) / 8) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-91895 : Rat) / 8) [(1, 1), (11, 1), (15, 2)],
  term ((-91895 : Rat) / 16) [(2, 2), (11, 1), (15, 1)],
  term ((-91895 : Rat) / 16) [(3, 2), (11, 1), (15, 1)],
  term ((91895 : Rat) / 16) [(11, 1), (14, 2), (15, 1)],
  term ((91895 : Rat) / 16) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 2. -/
theorem ep_Q2_064_partial_02_0248_valid :
    mulPoly ep_Q2_064_coefficient_02_0248
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0249 : Poly :=
[
  term ((27 : Rat) / 2) [(11, 2)]
]

/-- Partial product 249 for generator 2. -/
def ep_Q2_064_partial_02_0249 : Poly :=
[
  term (-27 : Rat) [(0, 1), (2, 1), (11, 2)],
  term (27 : Rat) [(0, 1), (11, 2), (14, 1)],
  term (-27 : Rat) [(1, 1), (3, 1), (11, 2)],
  term (27 : Rat) [(1, 1), (11, 2), (15, 1)],
  term ((27 : Rat) / 2) [(2, 2), (11, 2)],
  term ((27 : Rat) / 2) [(3, 2), (11, 2)],
  term ((-27 : Rat) / 2) [(11, 2), (14, 2)],
  term ((-27 : Rat) / 2) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 2. -/
theorem ep_Q2_064_partial_02_0249_valid :
    mulPoly ep_Q2_064_coefficient_02_0249
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0250 : Poly :=
[
  term ((1683 : Rat) / 32) [(12, 1)]
]

/-- Partial product 250 for generator 2. -/
def ep_Q2_064_partial_02_0250 : Poly :=
[
  term ((-1683 : Rat) / 16) [(0, 1), (2, 1), (12, 1)],
  term ((1683 : Rat) / 16) [(0, 1), (12, 1), (14, 1)],
  term ((-1683 : Rat) / 16) [(1, 1), (3, 1), (12, 1)],
  term ((1683 : Rat) / 16) [(1, 1), (12, 1), (15, 1)],
  term ((1683 : Rat) / 32) [(2, 2), (12, 1)],
  term ((1683 : Rat) / 32) [(3, 2), (12, 1)],
  term ((-1683 : Rat) / 32) [(12, 1), (14, 2)],
  term ((-1683 : Rat) / 32) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 2. -/
theorem ep_Q2_064_partial_02_0250_valid :
    mulPoly ep_Q2_064_coefficient_02_0250
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0251 : Poly :=
[
  term ((193815 : Rat) / 16) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 251 for generator 2. -/
def ep_Q2_064_partial_02_0251 : Poly :=
[
  term ((-193815 : Rat) / 8) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((193815 : Rat) / 8) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-193815 : Rat) / 8) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((193815 : Rat) / 8) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((193815 : Rat) / 16) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((193815 : Rat) / 16) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-193815 : Rat) / 16) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-193815 : Rat) / 16) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 2. -/
theorem ep_Q2_064_partial_02_0251_valid :
    mulPoly ep_Q2_064_coefficient_02_0251
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0252 : Poly :=
[
  term ((-33451 : Rat) / 16) [(12, 1), (15, 2)]
]

/-- Partial product 252 for generator 2. -/
def ep_Q2_064_partial_02_0252 : Poly :=
[
  term ((33451 : Rat) / 8) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-33451 : Rat) / 8) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((33451 : Rat) / 8) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-33451 : Rat) / 8) [(1, 1), (12, 1), (15, 3)],
  term ((-33451 : Rat) / 16) [(2, 2), (12, 1), (15, 2)],
  term ((-33451 : Rat) / 16) [(3, 2), (12, 1), (15, 2)],
  term ((33451 : Rat) / 16) [(12, 1), (14, 2), (15, 2)],
  term ((33451 : Rat) / 16) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 2. -/
theorem ep_Q2_064_partial_02_0252_valid :
    mulPoly ep_Q2_064_coefficient_02_0252
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0253 : Poly :=
[
  term ((-14325 : Rat) / 4) [(12, 2), (15, 2)]
]

/-- Partial product 253 for generator 2. -/
def ep_Q2_064_partial_02_0253 : Poly :=
[
  term ((14325 : Rat) / 2) [(0, 1), (2, 1), (12, 2), (15, 2)],
  term ((-14325 : Rat) / 2) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((14325 : Rat) / 2) [(1, 1), (3, 1), (12, 2), (15, 2)],
  term ((-14325 : Rat) / 2) [(1, 1), (12, 2), (15, 3)],
  term ((-14325 : Rat) / 4) [(2, 2), (12, 2), (15, 2)],
  term ((-14325 : Rat) / 4) [(3, 2), (12, 2), (15, 2)],
  term ((14325 : Rat) / 4) [(12, 2), (14, 2), (15, 2)],
  term ((14325 : Rat) / 4) [(12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 2. -/
theorem ep_Q2_064_partial_02_0253_valid :
    mulPoly ep_Q2_064_coefficient_02_0253
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0254 : Poly :=
[
  term ((-168981 : Rat) / 32) [(13, 1), (15, 1)]
]

/-- Partial product 254 for generator 2. -/
def ep_Q2_064_partial_02_0254 : Poly :=
[
  term ((168981 : Rat) / 16) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-168981 : Rat) / 16) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((168981 : Rat) / 16) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-168981 : Rat) / 16) [(1, 1), (13, 1), (15, 2)],
  term ((-168981 : Rat) / 32) [(2, 2), (13, 1), (15, 1)],
  term ((-168981 : Rat) / 32) [(3, 2), (13, 1), (15, 1)],
  term ((168981 : Rat) / 32) [(13, 1), (14, 2), (15, 1)],
  term ((168981 : Rat) / 32) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 2. -/
theorem ep_Q2_064_partial_02_0254_valid :
    mulPoly ep_Q2_064_coefficient_02_0254
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0255 : Poly :=
[
  term ((-33015 : Rat) / 16) [(13, 2)]
]

/-- Partial product 255 for generator 2. -/
def ep_Q2_064_partial_02_0255 : Poly :=
[
  term ((33015 : Rat) / 8) [(0, 1), (2, 1), (13, 2)],
  term ((-33015 : Rat) / 8) [(0, 1), (13, 2), (14, 1)],
  term ((33015 : Rat) / 8) [(1, 1), (3, 1), (13, 2)],
  term ((-33015 : Rat) / 8) [(1, 1), (13, 2), (15, 1)],
  term ((-33015 : Rat) / 16) [(2, 2), (13, 2)],
  term ((-33015 : Rat) / 16) [(3, 2), (13, 2)],
  term ((33015 : Rat) / 16) [(13, 2), (14, 2)],
  term ((33015 : Rat) / 16) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 2. -/
theorem ep_Q2_064_partial_02_0255_valid :
    mulPoly ep_Q2_064_coefficient_02_0255
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0256 : Poly :=
[
  term (-9 : Rat) [(14, 1)]
]

/-- Partial product 256 for generator 2. -/
def ep_Q2_064_partial_02_0256 : Poly :=
[
  term (18 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (-18 : Rat) [(0, 1), (14, 2)],
  term (18 : Rat) [(1, 1), (3, 1), (14, 1)],
  term (-18 : Rat) [(1, 1), (14, 1), (15, 1)],
  term (-9 : Rat) [(2, 2), (14, 1)],
  term (-9 : Rat) [(3, 2), (14, 1)],
  term (9 : Rat) [(14, 1), (15, 2)],
  term (9 : Rat) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 2. -/
theorem ep_Q2_064_partial_02_0256_valid :
    mulPoly ep_Q2_064_coefficient_02_0256
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 2. -/
def ep_Q2_064_coefficient_02_0257 : Poly :=
[
  term ((38161 : Rat) / 16) [(15, 2)]
]

/-- Partial product 257 for generator 2. -/
def ep_Q2_064_partial_02_0257 : Poly :=
[
  term ((-38161 : Rat) / 8) [(0, 1), (2, 1), (15, 2)],
  term ((38161 : Rat) / 8) [(0, 1), (14, 1), (15, 2)],
  term ((-38161 : Rat) / 8) [(1, 1), (3, 1), (15, 2)],
  term ((38161 : Rat) / 8) [(1, 1), (15, 3)],
  term ((38161 : Rat) / 16) [(2, 2), (15, 2)],
  term ((38161 : Rat) / 16) [(3, 2), (15, 2)],
  term ((-38161 : Rat) / 16) [(14, 2), (15, 2)],
  term ((-38161 : Rat) / 16) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 2. -/
theorem ep_Q2_064_partial_02_0257_valid :
    mulPoly ep_Q2_064_coefficient_02_0257
        ep_Q2_064_generator_02_0200_0257 =
      ep_Q2_064_partial_02_0257 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_02_0200_0257 : List Poly :=
[
  ep_Q2_064_partial_02_0200,
  ep_Q2_064_partial_02_0201,
  ep_Q2_064_partial_02_0202,
  ep_Q2_064_partial_02_0203,
  ep_Q2_064_partial_02_0204,
  ep_Q2_064_partial_02_0205,
  ep_Q2_064_partial_02_0206,
  ep_Q2_064_partial_02_0207,
  ep_Q2_064_partial_02_0208,
  ep_Q2_064_partial_02_0209,
  ep_Q2_064_partial_02_0210,
  ep_Q2_064_partial_02_0211,
  ep_Q2_064_partial_02_0212,
  ep_Q2_064_partial_02_0213,
  ep_Q2_064_partial_02_0214,
  ep_Q2_064_partial_02_0215,
  ep_Q2_064_partial_02_0216,
  ep_Q2_064_partial_02_0217,
  ep_Q2_064_partial_02_0218,
  ep_Q2_064_partial_02_0219,
  ep_Q2_064_partial_02_0220,
  ep_Q2_064_partial_02_0221,
  ep_Q2_064_partial_02_0222,
  ep_Q2_064_partial_02_0223,
  ep_Q2_064_partial_02_0224,
  ep_Q2_064_partial_02_0225,
  ep_Q2_064_partial_02_0226,
  ep_Q2_064_partial_02_0227,
  ep_Q2_064_partial_02_0228,
  ep_Q2_064_partial_02_0229,
  ep_Q2_064_partial_02_0230,
  ep_Q2_064_partial_02_0231,
  ep_Q2_064_partial_02_0232,
  ep_Q2_064_partial_02_0233,
  ep_Q2_064_partial_02_0234,
  ep_Q2_064_partial_02_0235,
  ep_Q2_064_partial_02_0236,
  ep_Q2_064_partial_02_0237,
  ep_Q2_064_partial_02_0238,
  ep_Q2_064_partial_02_0239,
  ep_Q2_064_partial_02_0240,
  ep_Q2_064_partial_02_0241,
  ep_Q2_064_partial_02_0242,
  ep_Q2_064_partial_02_0243,
  ep_Q2_064_partial_02_0244,
  ep_Q2_064_partial_02_0245,
  ep_Q2_064_partial_02_0246,
  ep_Q2_064_partial_02_0247,
  ep_Q2_064_partial_02_0248,
  ep_Q2_064_partial_02_0249,
  ep_Q2_064_partial_02_0250,
  ep_Q2_064_partial_02_0251,
  ep_Q2_064_partial_02_0252,
  ep_Q2_064_partial_02_0253,
  ep_Q2_064_partial_02_0254,
  ep_Q2_064_partial_02_0255,
  ep_Q2_064_partial_02_0256,
  ep_Q2_064_partial_02_0257
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_02_0200_0257 : Poly :=
[
  term (22920 : Rat) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-8535 : Rat) [(0, 1), (2, 1), (6, 1), (12, 1), (15, 2)],
  term ((57823 : Rat) / 4) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(0, 1), (2, 1), (6, 1), (13, 2)],
  term ((26797 : Rat) / 8) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((42615 : Rat) / 2) [(0, 1), (2, 1), (6, 2), (11, 1), (15, 1)],
  term (-22728 : Rat) [(0, 1), (2, 1), (6, 2), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(0, 1), (2, 1), (6, 2), (15, 2)],
  term (216 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 1)],
  term (54 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (13, 1)],
  term (-5682 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-14079 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term (3470 : Rat) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1)],
  term (-27 : Rat) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((42975 : Rat) / 2) [(0, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 2) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((87687 : Rat) / 8) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term (-702 : Rat) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term (27 : Rat) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((36227 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term (-22920 : Rat) [(0, 1), (2, 1), (7, 1), (12, 2), (15, 1)],
  term (891 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term (-2895 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term (-810 : Rat) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term (864 : Rat) [(0, 1), (2, 1), (7, 2), (12, 1)],
  term ((-881 : Rat) / 2) [(0, 1), (2, 1), (8, 1)],
  term (881 : Rat) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 4) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1)],
  term (-5730 : Rat) [(0, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term (1052 : Rat) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(0, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 8) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 4) [(0, 1), (2, 1), (8, 1), (13, 2)],
  term (5730 : Rat) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term (-1052 : Rat) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-11453 : Rat) / 4) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-1377 : Rat) / 4) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-35799 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(0, 1), (2, 1), (9, 1), (12, 2), (15, 1)],
  term ((29073 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-23609 : Rat) / 4) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term (-881 : Rat) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-881 : Rat) / 4) [(0, 1), (2, 1), (9, 2), (12, 1)],
  term ((37245 : Rat) / 2) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-54789 : Rat) / 16) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((91895 : Rat) / 8) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term (-27 : Rat) [(0, 1), (2, 1), (11, 2)],
  term ((-1683 : Rat) / 16) [(0, 1), (2, 1), (12, 1)],
  term ((-193815 : Rat) / 8) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((33451 : Rat) / 8) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((14325 : Rat) / 2) [(0, 1), (2, 1), (12, 2), (15, 2)],
  term ((168981 : Rat) / 16) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((33015 : Rat) / 8) [(0, 1), (2, 1), (13, 2)],
  term (18 : Rat) [(0, 1), (2, 1), (14, 1)],
  term ((-38161 : Rat) / 8) [(0, 1), (2, 1), (15, 2)],
  term (-22920 : Rat) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (8535 : Rat) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-57823 : Rat) / 4) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((15819 : Rat) / 4) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((-26797 : Rat) / 8) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-42615 : Rat) / 2) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term (22728 : Rat) [(0, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(0, 1), (6, 2), (14, 1), (15, 2)],
  term (-216 : Rat) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term (-54 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term (5682 : Rat) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((14079 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term (-3470 : Rat) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term (27 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-42975 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((7149 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-87687 : Rat) / 8) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term (-27 : Rat) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term (702 : Rat) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-15819 : Rat) / 4) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36227 : Rat) / 4) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term (22920 : Rat) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term (-891 : Rat) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term (2895 : Rat) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term (810 : Rat) [(0, 1), (7, 2), (10, 1), (14, 1)],
  term (-864 : Rat) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term (-881 : Rat) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-881 : Rat) / 4) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term (5730 : Rat) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term (-1052 : Rat) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26989 : Rat) / 8) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1377 : Rat) / 4) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((881 : Rat) / 2) [(0, 1), (8, 1), (14, 1)],
  term (-5730 : Rat) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term (1052 : Rat) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((11453 : Rat) / 4) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((1377 : Rat) / 4) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((35799 : Rat) / 8) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-29073 : Rat) / 8) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((23609 : Rat) / 4) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term (881 : Rat) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((881 : Rat) / 4) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((-37245 : Rat) / 2) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((54789 : Rat) / 16) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-91895 : Rat) / 8) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term (27 : Rat) [(0, 1), (11, 2), (14, 1)],
  term ((193815 : Rat) / 8) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1683 : Rat) / 16) [(0, 1), (12, 1), (14, 1)],
  term ((-33451 : Rat) / 8) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-14325 : Rat) / 2) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-168981 : Rat) / 16) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33015 : Rat) / 8) [(0, 1), (13, 2), (14, 1)],
  term ((38161 : Rat) / 8) [(0, 1), (14, 1), (15, 2)],
  term (-18 : Rat) [(0, 1), (14, 2)],
  term (22920 : Rat) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-8535 : Rat) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((57823 : Rat) / 4) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((26797 : Rat) / 8) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((42615 : Rat) / 2) [(1, 1), (3, 1), (6, 2), (11, 1), (15, 1)],
  term (-22728 : Rat) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(1, 1), (3, 1), (6, 2), (15, 2)],
  term (216 : Rat) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term (54 : Rat) [(1, 1), (3, 1), (7, 1), (8, 1), (13, 1)],
  term (-5682 : Rat) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((-14079 : Rat) / 4) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term (3470 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (12, 1)],
  term (-27 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((42975 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((87687 : Rat) / 8) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term (-702 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term (27 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 4) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((36227 : Rat) / 4) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term (-22920 : Rat) [(1, 1), (3, 1), (7, 1), (12, 2), (15, 1)],
  term (891 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term (-2895 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (-810 : Rat) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term (864 : Rat) [(1, 1), (3, 1), (7, 2), (12, 1)],
  term ((-881 : Rat) / 2) [(1, 1), (3, 1), (8, 1)],
  term (881 : Rat) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 4) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)],
  term (-5730 : Rat) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term (1052 : Rat) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 8) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 4) [(1, 1), (3, 1), (8, 1), (13, 2)],
  term (5730 : Rat) [(1, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term (-1052 : Rat) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-11453 : Rat) / 4) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-1377 : Rat) / 4) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((-35799 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1)],
  term ((29073 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-23609 : Rat) / 4) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term (-881 : Rat) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((-881 : Rat) / 4) [(1, 1), (3, 1), (9, 2), (12, 1)],
  term ((37245 : Rat) / 2) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-54789 : Rat) / 16) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((91895 : Rat) / 8) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term (-27 : Rat) [(1, 1), (3, 1), (11, 2)],
  term ((-1683 : Rat) / 16) [(1, 1), (3, 1), (12, 1)],
  term ((-193815 : Rat) / 8) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((33451 : Rat) / 8) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((14325 : Rat) / 2) [(1, 1), (3, 1), (12, 2), (15, 2)],
  term ((168981 : Rat) / 16) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((33015 : Rat) / 8) [(1, 1), (3, 1), (13, 2)],
  term (18 : Rat) [(1, 1), (3, 1), (14, 1)],
  term ((-38161 : Rat) / 8) [(1, 1), (3, 1), (15, 2)],
  term (-22920 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term (8535 : Rat) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((-57823 : Rat) / 4) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((15819 : Rat) / 4) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-26797 : Rat) / 8) [(1, 1), (6, 1), (15, 3)],
  term ((-42615 : Rat) / 2) [(1, 1), (6, 2), (11, 1), (15, 2)],
  term (22728 : Rat) [(1, 1), (6, 2), (13, 1), (15, 2)],
  term ((-2841 : Rat) / 2) [(1, 1), (6, 2), (15, 3)],
  term (-216 : Rat) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term (-54 : Rat) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term (5682 : Rat) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((14079 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term (-3470 : Rat) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term (27 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (12, 1), (15, 2)],
  term ((7149 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-87687 : Rat) / 8) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term (-27 : Rat) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term (702 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-36227 : Rat) / 4) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term (22920 : Rat) [(1, 1), (7, 1), (12, 2), (15, 2)],
  term (-891 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (2895 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (810 : Rat) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term (-864 : Rat) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term (-881 : Rat) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-881 : Rat) / 4) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term (5730 : Rat) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1971 : Rat) / 8) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term (-1052 : Rat) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((2865 : Rat) / 2) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-26989 : Rat) / 8) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1377 : Rat) / 4) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((881 : Rat) / 2) [(1, 1), (8, 1), (15, 1)],
  term (-5730 : Rat) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((1971 : Rat) / 8) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term (1052 : Rat) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((11453 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((1377 : Rat) / 4) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((35799 : Rat) / 8) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2865 : Rat) / 2) [(1, 1), (9, 1), (12, 2), (15, 2)],
  term ((-29073 : Rat) / 8) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((23609 : Rat) / 4) [(1, 1), (9, 1), (15, 2)],
  term (881 : Rat) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((881 : Rat) / 4) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 2) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((54789 : Rat) / 16) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-91895 : Rat) / 8) [(1, 1), (11, 1), (15, 2)],
  term (27 : Rat) [(1, 1), (11, 2), (15, 1)],
  term ((193815 : Rat) / 8) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((1683 : Rat) / 16) [(1, 1), (12, 1), (15, 1)],
  term ((-33451 : Rat) / 8) [(1, 1), (12, 1), (15, 3)],
  term ((-14325 : Rat) / 2) [(1, 1), (12, 2), (15, 3)],
  term ((-168981 : Rat) / 16) [(1, 1), (13, 1), (15, 2)],
  term ((-33015 : Rat) / 8) [(1, 1), (13, 2), (15, 1)],
  term (-18 : Rat) [(1, 1), (14, 1), (15, 1)],
  term ((38161 : Rat) / 8) [(1, 1), (15, 3)],
  term (-11460 : Rat) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((8535 : Rat) / 2) [(2, 2), (6, 1), (12, 1), (15, 2)],
  term ((-57823 : Rat) / 8) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((15819 : Rat) / 8) [(2, 2), (6, 1), (13, 2)],
  term ((-26797 : Rat) / 16) [(2, 2), (6, 1), (15, 2)],
  term ((-42615 : Rat) / 4) [(2, 2), (6, 2), (11, 1), (15, 1)],
  term (11364 : Rat) [(2, 2), (6, 2), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(2, 2), (6, 2), (15, 2)],
  term (-108 : Rat) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term (-27 : Rat) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term (2841 : Rat) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((14079 : Rat) / 8) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term (-1735 : Rat) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term ((27 : Rat) / 2) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-42975 : Rat) / 4) [(2, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((7149 : Rat) / 4) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-87687 : Rat) / 16) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term (351 : Rat) [(2, 2), (7, 1), (11, 1)],
  term ((-27 : Rat) / 2) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-15819 : Rat) / 8) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-36227 : Rat) / 8) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term (11460 : Rat) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((-891 : Rat) / 2) [(2, 2), (7, 1), (13, 1)],
  term ((2895 : Rat) / 2) [(2, 2), (7, 1), (15, 1)],
  term (405 : Rat) [(2, 2), (7, 2), (10, 1)],
  term (-432 : Rat) [(2, 2), (7, 2), (12, 1)],
  term ((881 : Rat) / 4) [(2, 2), (8, 1)],
  term ((-881 : Rat) / 2) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((-881 : Rat) / 8) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term (2865 : Rat) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term (-526 : Rat) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1377 : Rat) / 8) [(2, 2), (8, 1), (13, 2)],
  term (-2865 : Rat) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term (526 : Rat) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((11453 : Rat) / 8) [(2, 2), (9, 1), (11, 1)],
  term ((1377 : Rat) / 8) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((35799 : Rat) / 16) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((-29073 : Rat) / 16) [(2, 2), (9, 1), (13, 1)],
  term ((23609 : Rat) / 8) [(2, 2), (9, 1), (15, 1)],
  term ((881 : Rat) / 2) [(2, 2), (9, 2), (10, 1)],
  term ((881 : Rat) / 8) [(2, 2), (9, 2), (12, 1)],
  term ((-37245 : Rat) / 4) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((54789 : Rat) / 32) [(2, 2), (11, 1), (13, 1)],
  term ((-91895 : Rat) / 16) [(2, 2), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(2, 2), (11, 2)],
  term ((1683 : Rat) / 32) [(2, 2), (12, 1)],
  term ((193815 : Rat) / 16) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-33451 : Rat) / 16) [(2, 2), (12, 1), (15, 2)],
  term ((-14325 : Rat) / 4) [(2, 2), (12, 2), (15, 2)],
  term ((-168981 : Rat) / 32) [(2, 2), (13, 1), (15, 1)],
  term ((-33015 : Rat) / 16) [(2, 2), (13, 2)],
  term (-9 : Rat) [(2, 2), (14, 1)],
  term ((38161 : Rat) / 16) [(2, 2), (15, 2)],
  term (-11460 : Rat) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((8535 : Rat) / 2) [(3, 2), (6, 1), (12, 1), (15, 2)],
  term ((-57823 : Rat) / 8) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((15819 : Rat) / 8) [(3, 2), (6, 1), (13, 2)],
  term ((-26797 : Rat) / 16) [(3, 2), (6, 1), (15, 2)],
  term ((-42615 : Rat) / 4) [(3, 2), (6, 2), (11, 1), (15, 1)],
  term (11364 : Rat) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(3, 2), (6, 2), (15, 2)],
  term (-108 : Rat) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term (-27 : Rat) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term (2841 : Rat) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((14079 : Rat) / 8) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term (-1735 : Rat) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((27 : Rat) / 2) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((-42975 : Rat) / 4) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((7149 : Rat) / 4) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((-87687 : Rat) / 16) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term (351 : Rat) [(3, 2), (7, 1), (11, 1)],
  term ((-27 : Rat) / 2) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((-15819 : Rat) / 8) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-36227 : Rat) / 8) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term (11460 : Rat) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((-891 : Rat) / 2) [(3, 2), (7, 1), (13, 1)],
  term ((2895 : Rat) / 2) [(3, 2), (7, 1), (15, 1)],
  term (405 : Rat) [(3, 2), (7, 2), (10, 1)],
  term (-432 : Rat) [(3, 2), (7, 2), (12, 1)],
  term ((881 : Rat) / 4) [(3, 2), (8, 1)],
  term ((-881 : Rat) / 2) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-881 : Rat) / 8) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term (2865 : Rat) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term (-526 : Rat) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1377 : Rat) / 8) [(3, 2), (8, 1), (13, 2)],
  term (-2865 : Rat) [(3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term (526 : Rat) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((11453 : Rat) / 8) [(3, 2), (9, 1), (11, 1)],
  term ((1377 : Rat) / 8) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((35799 : Rat) / 16) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-29073 : Rat) / 16) [(3, 2), (9, 1), (13, 1)],
  term ((23609 : Rat) / 8) [(3, 2), (9, 1), (15, 1)],
  term ((881 : Rat) / 2) [(3, 2), (9, 2), (10, 1)],
  term ((881 : Rat) / 8) [(3, 2), (9, 2), (12, 1)],
  term ((-37245 : Rat) / 4) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((54789 : Rat) / 32) [(3, 2), (11, 1), (13, 1)],
  term ((-91895 : Rat) / 16) [(3, 2), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(3, 2), (11, 2)],
  term ((1683 : Rat) / 32) [(3, 2), (12, 1)],
  term ((193815 : Rat) / 16) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-33451 : Rat) / 16) [(3, 2), (12, 1), (15, 2)],
  term ((-14325 : Rat) / 4) [(3, 2), (12, 2), (15, 2)],
  term ((-168981 : Rat) / 32) [(3, 2), (13, 1), (15, 1)],
  term ((-33015 : Rat) / 16) [(3, 2), (13, 2)],
  term (-9 : Rat) [(3, 2), (14, 1)],
  term ((38161 : Rat) / 16) [(3, 2), (15, 2)],
  term (11460 : Rat) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term (11460 : Rat) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-8535 : Rat) / 2) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-8535 : Rat) / 2) [(6, 1), (12, 1), (15, 4)],
  term ((57823 : Rat) / 8) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((57823 : Rat) / 8) [(6, 1), (13, 1), (15, 3)],
  term ((-15819 : Rat) / 8) [(6, 1), (13, 2), (14, 2)],
  term ((-15819 : Rat) / 8) [(6, 1), (13, 2), (15, 2)],
  term ((26797 : Rat) / 16) [(6, 1), (14, 2), (15, 2)],
  term ((26797 : Rat) / 16) [(6, 1), (15, 4)],
  term ((42615 : Rat) / 4) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 2), (11, 1), (15, 3)],
  term (-11364 : Rat) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term (-11364 : Rat) [(6, 2), (13, 1), (15, 3)],
  term ((2841 : Rat) / 4) [(6, 2), (14, 2), (15, 2)],
  term ((2841 : Rat) / 4) [(6, 2), (15, 4)],
  term (108 : Rat) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term (108 : Rat) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term (27 : Rat) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term (27 : Rat) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term (-2841 : Rat) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term (-2841 : Rat) [(7, 1), (8, 1), (15, 3)],
  term ((-14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((-14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term (1735 : Rat) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term (1735 : Rat) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((-7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((87687 : Rat) / 16) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((87687 : Rat) / 16) [(7, 1), (10, 1), (15, 3)],
  term ((27 : Rat) / 2) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((27 : Rat) / 2) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term (-351 : Rat) [(7, 1), (11, 1), (14, 2)],
  term (-351 : Rat) [(7, 1), (11, 1), (15, 2)],
  term ((15819 : Rat) / 8) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((15819 : Rat) / 8) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((36227 : Rat) / 8) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((36227 : Rat) / 8) [(7, 1), (12, 1), (15, 3)],
  term (-11460 : Rat) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term (-11460 : Rat) [(7, 1), (12, 2), (15, 3)],
  term ((891 : Rat) / 2) [(7, 1), (13, 1), (14, 2)],
  term ((891 : Rat) / 2) [(7, 1), (13, 1), (15, 2)],
  term ((-2895 : Rat) / 2) [(7, 1), (14, 2), (15, 1)],
  term ((-2895 : Rat) / 2) [(7, 1), (15, 3)],
  term (-405 : Rat) [(7, 2), (10, 1), (14, 2)],
  term (-405 : Rat) [(7, 2), (10, 1), (15, 2)],
  term (432 : Rat) [(7, 2), (12, 1), (14, 2)],
  term (432 : Rat) [(7, 2), (12, 1), (15, 2)],
  term ((881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term (-2865 : Rat) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term (-2865 : Rat) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term (526 : Rat) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term (526 : Rat) [(8, 1), (11, 1), (15, 3)],
  term ((-2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((26989 : Rat) / 16) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((26989 : Rat) / 16) [(8, 1), (13, 1), (15, 3)],
  term ((1377 : Rat) / 8) [(8, 1), (13, 2), (14, 2)],
  term ((1377 : Rat) / 8) [(8, 1), (13, 2), (15, 2)],
  term ((-881 : Rat) / 4) [(8, 1), (14, 2)],
  term ((-881 : Rat) / 4) [(8, 1), (15, 2)],
  term (2865 : Rat) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term (2865 : Rat) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term (-526 : Rat) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term (-526 : Rat) [(9, 1), (10, 1), (15, 3)],
  term ((-11453 : Rat) / 8) [(9, 1), (11, 1), (14, 2)],
  term ((-11453 : Rat) / 8) [(9, 1), (11, 1), (15, 2)],
  term ((-1377 : Rat) / 8) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1377 : Rat) / 8) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-35799 : Rat) / 16) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-35799 : Rat) / 16) [(9, 1), (12, 1), (15, 3)],
  term ((2865 : Rat) / 4) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((2865 : Rat) / 4) [(9, 1), (12, 2), (15, 3)],
  term ((29073 : Rat) / 16) [(9, 1), (13, 1), (14, 2)],
  term ((29073 : Rat) / 16) [(9, 1), (13, 1), (15, 2)],
  term ((-23609 : Rat) / 8) [(9, 1), (14, 2), (15, 1)],
  term ((-23609 : Rat) / 8) [(9, 1), (15, 3)],
  term ((-881 : Rat) / 2) [(9, 2), (10, 1), (14, 2)],
  term ((-881 : Rat) / 2) [(9, 2), (10, 1), (15, 2)],
  term ((-881 : Rat) / 8) [(9, 2), (12, 1), (14, 2)],
  term ((-881 : Rat) / 8) [(9, 2), (12, 1), (15, 2)],
  term ((37245 : Rat) / 4) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((37245 : Rat) / 4) [(11, 1), (12, 1), (15, 3)],
  term ((-54789 : Rat) / 32) [(11, 1), (13, 1), (14, 2)],
  term ((-54789 : Rat) / 32) [(11, 1), (13, 1), (15, 2)],
  term ((91895 : Rat) / 16) [(11, 1), (14, 2), (15, 1)],
  term ((91895 : Rat) / 16) [(11, 1), (15, 3)],
  term ((-27 : Rat) / 2) [(11, 2), (14, 2)],
  term ((-27 : Rat) / 2) [(11, 2), (15, 2)],
  term ((-193815 : Rat) / 16) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-193815 : Rat) / 16) [(12, 1), (13, 1), (15, 3)],
  term ((-1683 : Rat) / 32) [(12, 1), (14, 2)],
  term ((33451 : Rat) / 16) [(12, 1), (14, 2), (15, 2)],
  term ((-1683 : Rat) / 32) [(12, 1), (15, 2)],
  term ((33451 : Rat) / 16) [(12, 1), (15, 4)],
  term ((14325 : Rat) / 4) [(12, 2), (14, 2), (15, 2)],
  term ((14325 : Rat) / 4) [(12, 2), (15, 4)],
  term ((168981 : Rat) / 32) [(13, 1), (14, 2), (15, 1)],
  term ((168981 : Rat) / 32) [(13, 1), (15, 3)],
  term ((33015 : Rat) / 16) [(13, 2), (14, 2)],
  term ((33015 : Rat) / 16) [(13, 2), (15, 2)],
  term (9 : Rat) [(14, 1), (15, 2)],
  term ((-38161 : Rat) / 16) [(14, 2), (15, 2)],
  term (9 : Rat) [(14, 3)],
  term ((-38161 : Rat) / 16) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 200 through 257. -/
theorem ep_Q2_064_block_02_0200_0257_valid :
    checkProductSumEq ep_Q2_064_partials_02_0200_0257
      ep_Q2_064_block_02_0200_0257 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
