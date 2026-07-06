/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 23:200-273

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_23_0200_0273 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0200 : Poly :=
[
  term (-432 : Rat) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 200 for generator 23. -/
def ep_Q2_064_partial_23_0200 : Poly :=
[
  term (864 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term (-432 : Rat) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term (864 : Rat) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term (-432 : Rat) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term (-864 : Rat) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term (432 : Rat) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term (-864 : Rat) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term (432 : Rat) [(6, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 23. -/
theorem ep_Q2_064_partial_23_0200_valid :
    mulPoly ep_Q2_064_coefficient_23_0200
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0201 : Poly :=
[
  term ((42723 : Rat) / 4) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 201 for generator 23. -/
def ep_Q2_064_partial_23_0201 : Poly :=
[
  term ((-42723 : Rat) / 2) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((42723 : Rat) / 4) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-42723 : Rat) / 2) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((42723 : Rat) / 4) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((42723 : Rat) / 2) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-42723 : Rat) / 4) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((42723 : Rat) / 2) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-42723 : Rat) / 4) [(6, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 23. -/
theorem ep_Q2_064_partial_23_0201_valid :
    mulPoly ep_Q2_064_coefficient_23_0201
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0202 : Poly :=
[
  term (2841 : Rat) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 202 for generator 23. -/
def ep_Q2_064_partial_23_0202 : Poly :=
[
  term (-5682 : Rat) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term (2841 : Rat) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term (-5682 : Rat) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term (2841 : Rat) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term (5682 : Rat) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term (-2841 : Rat) [(6, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term (5682 : Rat) [(6, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term (-2841 : Rat) [(6, 1), (8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 23. -/
theorem ep_Q2_064_partial_23_0202_valid :
    mulPoly ep_Q2_064_coefficient_23_0202
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0203 : Poly :=
[
  term ((2841 : Rat) / 4) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 203 for generator 23. -/
def ep_Q2_064_partial_23_0203 : Poly :=
[
  term ((-2841 : Rat) / 2) [(0, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 23. -/
theorem ep_Q2_064_partial_23_0203_valid :
    mulPoly ep_Q2_064_coefficient_23_0203
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0204 : Poly :=
[
  term (-2841 : Rat) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 204 for generator 23. -/
def ep_Q2_064_partial_23_0204 : Poly :=
[
  term (5682 : Rat) [(0, 1), (6, 1), (9, 1), (10, 2), (15, 1)],
  term (-2841 : Rat) [(0, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term (5682 : Rat) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term (-2841 : Rat) [(1, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term (-5682 : Rat) [(6, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term (2841 : Rat) [(6, 1), (8, 2), (9, 1), (10, 1), (15, 1)],
  term (-5682 : Rat) [(6, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term (2841 : Rat) [(6, 1), (9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 23. -/
theorem ep_Q2_064_partial_23_0204_valid :
    mulPoly ep_Q2_064_coefficient_23_0204
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0205 : Poly :=
[
  term ((13215 : Rat) / 8) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 205 for generator 23. -/
def ep_Q2_064_partial_23_0205 : Poly :=
[
  term ((-13215 : Rat) / 4) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((13215 : Rat) / 8) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-13215 : Rat) / 4) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((13215 : Rat) / 8) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((13215 : Rat) / 4) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-13215 : Rat) / 8) [(6, 1), (8, 2), (9, 1), (11, 1)],
  term ((13215 : Rat) / 4) [(6, 1), (9, 2), (11, 2)],
  term ((-13215 : Rat) / 8) [(6, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 23. -/
theorem ep_Q2_064_partial_23_0205_valid :
    mulPoly ep_Q2_064_coefficient_23_0205
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0206 : Poly :=
[
  term ((-2841 : Rat) / 4) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 206 for generator 23. -/
def ep_Q2_064_partial_23_0206 : Poly :=
[
  term ((2841 : Rat) / 2) [(0, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(6, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 23. -/
theorem ep_Q2_064_partial_23_0206_valid :
    mulPoly ep_Q2_064_coefficient_23_0206
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0207 : Poly :=
[
  term (-1762 : Rat) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 207 for generator 23. -/
def ep_Q2_064_partial_23_0207 : Poly :=
[
  term (3524 : Rat) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term (-1762 : Rat) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term (3524 : Rat) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term (-1762 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term (-3524 : Rat) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term (1762 : Rat) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term (-3524 : Rat) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term (1762 : Rat) [(6, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 23. -/
theorem ep_Q2_064_partial_23_0207_valid :
    mulPoly ep_Q2_064_coefficient_23_0207
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0208 : Poly :=
[
  term ((46337 : Rat) / 8) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 208 for generator 23. -/
def ep_Q2_064_partial_23_0208 : Poly :=
[
  term ((-46337 : Rat) / 4) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((46337 : Rat) / 8) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-46337 : Rat) / 4) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((46337 : Rat) / 8) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((46337 : Rat) / 4) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-46337 : Rat) / 8) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((46337 : Rat) / 4) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-46337 : Rat) / 8) [(6, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 23. -/
theorem ep_Q2_064_partial_23_0208_valid :
    mulPoly ep_Q2_064_coefficient_23_0208
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0209 : Poly :=
[
  term ((-42975 : Rat) / 4) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 209 for generator 23. -/
def ep_Q2_064_partial_23_0209 : Poly :=
[
  term ((42975 : Rat) / 2) [(0, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 2) [(1, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(6, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(6, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 23. -/
theorem ep_Q2_064_partial_23_0209_valid :
    mulPoly ep_Q2_064_coefficient_23_0209
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0210 : Poly :=
[
  term ((7095 : Rat) / 4) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 210 for generator 23. -/
def ep_Q2_064_partial_23_0210 : Poly :=
[
  term ((-7095 : Rat) / 2) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((7095 : Rat) / 4) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-7095 : Rat) / 2) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((7095 : Rat) / 4) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((7095 : Rat) / 2) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-7095 : Rat) / 4) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((7095 : Rat) / 2) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-7095 : Rat) / 4) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 23. -/
theorem ep_Q2_064_partial_23_0210_valid :
    mulPoly ep_Q2_064_coefficient_23_0210
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0211 : Poly :=
[
  term ((-235419 : Rat) / 16) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 211 for generator 23. -/
def ep_Q2_064_partial_23_0211 : Poly :=
[
  term ((235419 : Rat) / 8) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-235419 : Rat) / 16) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((235419 : Rat) / 8) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((-235419 : Rat) / 16) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-235419 : Rat) / 8) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((235419 : Rat) / 16) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((-235419 : Rat) / 8) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((235419 : Rat) / 16) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 23. -/
theorem ep_Q2_064_partial_23_0211_valid :
    mulPoly ep_Q2_064_coefficient_23_0211
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0212 : Poly :=
[
  term ((27 : Rat) / 2) [(6, 1), (11, 2)]
]

/-- Partial product 212 for generator 23. -/
def ep_Q2_064_partial_23_0212 : Poly :=
[
  term (-27 : Rat) [(0, 1), (6, 1), (10, 1), (11, 2)],
  term ((27 : Rat) / 2) [(0, 2), (6, 1), (11, 2)],
  term (-27 : Rat) [(1, 1), (6, 1), (11, 3)],
  term ((27 : Rat) / 2) [(1, 2), (6, 1), (11, 2)],
  term (27 : Rat) [(6, 1), (8, 1), (10, 1), (11, 2)],
  term ((-27 : Rat) / 2) [(6, 1), (8, 2), (11, 2)],
  term (27 : Rat) [(6, 1), (9, 1), (11, 3)],
  term ((-27 : Rat) / 2) [(6, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 23. -/
theorem ep_Q2_064_partial_23_0212_valid :
    mulPoly ep_Q2_064_coefficient_23_0212
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0213 : Poly :=
[
  term (11460 : Rat) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 213 for generator 23. -/
def ep_Q2_064_partial_23_0213 : Poly :=
[
  term (-22920 : Rat) [(0, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (11460 : Rat) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-22920 : Rat) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term (11460 : Rat) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (22920 : Rat) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (-11460 : Rat) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term (22920 : Rat) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term (-11460 : Rat) [(6, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 23. -/
theorem ep_Q2_064_partial_23_0213_valid :
    mulPoly ep_Q2_064_coefficient_23_0213
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0214 : Poly :=
[
  term ((-8535 : Rat) / 2) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 214 for generator 23. -/
def ep_Q2_064_partial_23_0214 : Poly :=
[
  term (8535 : Rat) [(0, 1), (6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-8535 : Rat) / 2) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term (8535 : Rat) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8535 : Rat) / 2) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term (-8535 : Rat) [(6, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((8535 : Rat) / 2) [(6, 1), (8, 2), (12, 1), (15, 2)],
  term (-8535 : Rat) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((8535 : Rat) / 2) [(6, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 23. -/
theorem ep_Q2_064_partial_23_0214_valid :
    mulPoly ep_Q2_064_coefficient_23_0214
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0215 : Poly :=
[
  term ((57823 : Rat) / 8) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 215 for generator 23. -/
def ep_Q2_064_partial_23_0215 : Poly :=
[
  term ((-57823 : Rat) / 4) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((57823 : Rat) / 8) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-57823 : Rat) / 4) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((57823 : Rat) / 8) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((57823 : Rat) / 4) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-57823 : Rat) / 8) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((57823 : Rat) / 4) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-57823 : Rat) / 8) [(6, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 23. -/
theorem ep_Q2_064_partial_23_0215_valid :
    mulPoly ep_Q2_064_coefficient_23_0215
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0216 : Poly :=
[
  term ((-15819 : Rat) / 8) [(6, 1), (13, 2)]
]

/-- Partial product 216 for generator 23. -/
def ep_Q2_064_partial_23_0216 : Poly :=
[
  term ((15819 : Rat) / 4) [(0, 1), (6, 1), (10, 1), (13, 2)],
  term ((-15819 : Rat) / 8) [(0, 2), (6, 1), (13, 2)],
  term ((15819 : Rat) / 4) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-15819 : Rat) / 8) [(1, 2), (6, 1), (13, 2)],
  term ((-15819 : Rat) / 4) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((15819 : Rat) / 8) [(6, 1), (8, 2), (13, 2)],
  term ((-15819 : Rat) / 4) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((15819 : Rat) / 8) [(6, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 23. -/
theorem ep_Q2_064_partial_23_0216_valid :
    mulPoly ep_Q2_064_coefficient_23_0216
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0217 : Poly :=
[
  term ((26797 : Rat) / 16) [(6, 1), (15, 2)]
]

/-- Partial product 217 for generator 23. -/
def ep_Q2_064_partial_23_0217 : Poly :=
[
  term ((-26797 : Rat) / 8) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((26797 : Rat) / 16) [(0, 2), (6, 1), (15, 2)],
  term ((-26797 : Rat) / 8) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((26797 : Rat) / 16) [(1, 2), (6, 1), (15, 2)],
  term ((26797 : Rat) / 8) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-26797 : Rat) / 16) [(6, 1), (8, 2), (15, 2)],
  term ((26797 : Rat) / 8) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-26797 : Rat) / 16) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 23. -/
theorem ep_Q2_064_partial_23_0217_valid :
    mulPoly ep_Q2_064_coefficient_23_0217
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0218 : Poly :=
[
  term ((42615 : Rat) / 4) [(6, 2), (11, 1), (15, 1)]
]

/-- Partial product 218 for generator 23. -/
def ep_Q2_064_partial_23_0218 : Poly :=
[
  term ((-42615 : Rat) / 2) [(0, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(0, 2), (6, 2), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 2) [(1, 1), (6, 2), (11, 2), (15, 1)],
  term ((42615 : Rat) / 4) [(1, 2), (6, 2), (11, 1), (15, 1)],
  term ((42615 : Rat) / 2) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 4) [(6, 2), (8, 2), (11, 1), (15, 1)],
  term ((42615 : Rat) / 2) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-42615 : Rat) / 4) [(6, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 23. -/
theorem ep_Q2_064_partial_23_0218_valid :
    mulPoly ep_Q2_064_coefficient_23_0218
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0219 : Poly :=
[
  term (-11364 : Rat) [(6, 2), (13, 1), (15, 1)]
]

/-- Partial product 219 for generator 23. -/
def ep_Q2_064_partial_23_0219 : Poly :=
[
  term (22728 : Rat) [(0, 1), (6, 2), (10, 1), (13, 1), (15, 1)],
  term (-11364 : Rat) [(0, 2), (6, 2), (13, 1), (15, 1)],
  term (22728 : Rat) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term (-11364 : Rat) [(1, 2), (6, 2), (13, 1), (15, 1)],
  term (-22728 : Rat) [(6, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term (11364 : Rat) [(6, 2), (8, 2), (13, 1), (15, 1)],
  term (-22728 : Rat) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term (11364 : Rat) [(6, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 23. -/
theorem ep_Q2_064_partial_23_0219_valid :
    mulPoly ep_Q2_064_coefficient_23_0219
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0220 : Poly :=
[
  term ((2841 : Rat) / 4) [(6, 2), (15, 2)]
]

/-- Partial product 220 for generator 23. -/
def ep_Q2_064_partial_23_0220 : Poly :=
[
  term ((-2841 : Rat) / 2) [(0, 1), (6, 2), (10, 1), (15, 2)],
  term ((2841 : Rat) / 4) [(0, 2), (6, 2), (15, 2)],
  term ((-2841 : Rat) / 2) [(1, 1), (6, 2), (11, 1), (15, 2)],
  term ((2841 : Rat) / 4) [(1, 2), (6, 2), (15, 2)],
  term ((2841 : Rat) / 2) [(6, 2), (8, 1), (10, 1), (15, 2)],
  term ((-2841 : Rat) / 4) [(6, 2), (8, 2), (15, 2)],
  term ((2841 : Rat) / 2) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2841 : Rat) / 4) [(6, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 23. -/
theorem ep_Q2_064_partial_23_0220_valid :
    mulPoly ep_Q2_064_coefficient_23_0220
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0221 : Poly :=
[
  term (108 : Rat) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 221 for generator 23. -/
def ep_Q2_064_partial_23_0221 : Poly :=
[
  term (-216 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term (108 : Rat) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term (-216 : Rat) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term (108 : Rat) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term (216 : Rat) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term (-108 : Rat) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term (216 : Rat) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term (-108 : Rat) [(7, 1), (8, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 23. -/
theorem ep_Q2_064_partial_23_0221_valid :
    mulPoly ep_Q2_064_coefficient_23_0221
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0222 : Poly :=
[
  term (27 : Rat) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 222 for generator 23. -/
def ep_Q2_064_partial_23_0222 : Poly :=
[
  term (-54 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term (27 : Rat) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term (-54 : Rat) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term (27 : Rat) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term (54 : Rat) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term (-27 : Rat) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term (54 : Rat) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term (-27 : Rat) [(7, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 23. -/
theorem ep_Q2_064_partial_23_0222_valid :
    mulPoly ep_Q2_064_coefficient_23_0222
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0223 : Poly :=
[
  term (-2841 : Rat) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 223 for generator 23. -/
def ep_Q2_064_partial_23_0223 : Poly :=
[
  term (5682 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (-2841 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term (5682 : Rat) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term (-2841 : Rat) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term (-5682 : Rat) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term (2841 : Rat) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term (-5682 : Rat) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term (2841 : Rat) [(7, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 23. -/
theorem ep_Q2_064_partial_23_0223_valid :
    mulPoly ep_Q2_064_coefficient_23_0223
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0224 : Poly :=
[
  term ((14079 : Rat) / 8) [(7, 1), (9, 1)]
]

/-- Partial product 224 for generator 23. -/
def ep_Q2_064_partial_23_0224 : Poly :=
[
  term ((-14079 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((14079 : Rat) / 8) [(0, 2), (7, 1), (9, 1)],
  term ((-14079 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((14079 : Rat) / 8) [(1, 2), (7, 1), (9, 1)],
  term ((14079 : Rat) / 4) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-14079 : Rat) / 8) [(7, 1), (8, 2), (9, 1)],
  term ((14079 : Rat) / 4) [(7, 1), (9, 2), (11, 1)],
  term ((-14079 : Rat) / 8) [(7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 23. -/
theorem ep_Q2_064_partial_23_0224_valid :
    mulPoly ep_Q2_064_coefficient_23_0224
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0225 : Poly :=
[
  term ((-14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 225 for generator 23. -/
def ep_Q2_064_partial_23_0225 : Poly :=
[
  term ((14079 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-14079 : Rat) / 8) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((14079 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-14079 : Rat) / 8) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((-14079 : Rat) / 4) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((14079 : Rat) / 8) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((-14079 : Rat) / 4) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((14079 : Rat) / 8) [(7, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 23. -/
theorem ep_Q2_064_partial_23_0225_valid :
    mulPoly ep_Q2_064_coefficient_23_0225
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0226 : Poly :=
[
  term (1735 : Rat) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 226 for generator 23. -/
def ep_Q2_064_partial_23_0226 : Poly :=
[
  term (-3470 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term (1735 : Rat) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term (-3470 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term (1735 : Rat) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term (3470 : Rat) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term (-1735 : Rat) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term (3470 : Rat) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term (-1735 : Rat) [(7, 1), (9, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 23. -/
theorem ep_Q2_064_partial_23_0226_valid :
    mulPoly ep_Q2_064_coefficient_23_0226
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0227 : Poly :=
[
  term ((-27 : Rat) / 2) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 227 for generator 23. -/
def ep_Q2_064_partial_23_0227 : Poly :=
[
  term (27 : Rat) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((-27 : Rat) / 2) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term (27 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-27 : Rat) / 2) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term (-27 : Rat) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((27 : Rat) / 2) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term (-27 : Rat) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((27 : Rat) / 2) [(7, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 23. -/
theorem ep_Q2_064_partial_23_0227_valid :
    mulPoly ep_Q2_064_coefficient_23_0227
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0228 : Poly :=
[
  term ((42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 228 for generator 23. -/
def ep_Q2_064_partial_23_0228 : Poly :=
[
  term ((-42975 : Rat) / 2) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 2) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 2) [(7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (9, 2), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 23. -/
theorem ep_Q2_064_partial_23_0228_valid :
    mulPoly ep_Q2_064_coefficient_23_0228
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0229 : Poly :=
[
  term ((-7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 229 for generator 23. -/
def ep_Q2_064_partial_23_0229 : Poly :=
[
  term ((7149 : Rat) / 2) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-7149 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((7149 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-7149 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-7149 : Rat) / 2) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((7149 : Rat) / 4) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-7149 : Rat) / 2) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((7149 : Rat) / 4) [(7, 1), (9, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 23. -/
theorem ep_Q2_064_partial_23_0229_valid :
    mulPoly ep_Q2_064_coefficient_23_0229
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0230 : Poly :=
[
  term ((87687 : Rat) / 16) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 230 for generator 23. -/
def ep_Q2_064_partial_23_0230 : Poly :=
[
  term ((-87687 : Rat) / 8) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((87687 : Rat) / 16) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-87687 : Rat) / 8) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((87687 : Rat) / 16) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((87687 : Rat) / 8) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-87687 : Rat) / 16) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((87687 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-87687 : Rat) / 16) [(7, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 23. -/
theorem ep_Q2_064_partial_23_0230_valid :
    mulPoly ep_Q2_064_coefficient_23_0230
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0231 : Poly :=
[
  term ((-675 : Rat) / 2) [(7, 1), (11, 1)]
]

/-- Partial product 231 for generator 23. -/
def ep_Q2_064_partial_23_0231 : Poly :=
[
  term (675 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-675 : Rat) / 2) [(0, 2), (7, 1), (11, 1)],
  term (675 : Rat) [(1, 1), (7, 1), (11, 2)],
  term ((-675 : Rat) / 2) [(1, 2), (7, 1), (11, 1)],
  term (-675 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((675 : Rat) / 2) [(7, 1), (8, 2), (11, 1)],
  term (-675 : Rat) [(7, 1), (9, 1), (11, 2)],
  term ((675 : Rat) / 2) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 23. -/
theorem ep_Q2_064_partial_23_0231_valid :
    mulPoly ep_Q2_064_coefficient_23_0231
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0232 : Poly :=
[
  term ((27 : Rat) / 2) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 232 for generator 23. -/
def ep_Q2_064_partial_23_0232 : Poly :=
[
  term (-27 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((27 : Rat) / 2) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term (-27 : Rat) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((27 : Rat) / 2) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term (27 : Rat) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 23. -/
theorem ep_Q2_064_partial_23_0232_valid :
    mulPoly ep_Q2_064_coefficient_23_0232
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0233 : Poly :=
[
  term ((15819 : Rat) / 8) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 233 for generator 23. -/
def ep_Q2_064_partial_23_0233 : Poly :=
[
  term ((-15819 : Rat) / 4) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((15819 : Rat) / 8) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-15819 : Rat) / 4) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((15819 : Rat) / 8) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((15819 : Rat) / 4) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-15819 : Rat) / 8) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((15819 : Rat) / 4) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-15819 : Rat) / 8) [(7, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 23. -/
theorem ep_Q2_064_partial_23_0233_valid :
    mulPoly ep_Q2_064_coefficient_23_0233
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0234 : Poly :=
[
  term ((-49723 : Rat) / 8) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 234 for generator 23. -/
def ep_Q2_064_partial_23_0234 : Poly :=
[
  term ((49723 : Rat) / 4) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-49723 : Rat) / 8) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((49723 : Rat) / 4) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-49723 : Rat) / 8) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-49723 : Rat) / 4) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((49723 : Rat) / 8) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-49723 : Rat) / 4) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((49723 : Rat) / 8) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 23. -/
theorem ep_Q2_064_partial_23_0234_valid :
    mulPoly ep_Q2_064_coefficient_23_0234
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0235 : Poly :=
[
  term (-11460 : Rat) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 235 for generator 23. -/
def ep_Q2_064_partial_23_0235 : Poly :=
[
  term (22920 : Rat) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term (-11460 : Rat) [(0, 2), (7, 1), (12, 2), (15, 1)],
  term (22920 : Rat) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term (-11460 : Rat) [(1, 2), (7, 1), (12, 2), (15, 1)],
  term (-22920 : Rat) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term (11460 : Rat) [(7, 1), (8, 2), (12, 2), (15, 1)],
  term (-22920 : Rat) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term (11460 : Rat) [(7, 1), (9, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 23. -/
theorem ep_Q2_064_partial_23_0235_valid :
    mulPoly ep_Q2_064_coefficient_23_0235
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0236 : Poly :=
[
  term ((9003 : Rat) / 4) [(7, 1), (13, 1)]
]

/-- Partial product 236 for generator 23. -/
def ep_Q2_064_partial_23_0236 : Poly :=
[
  term ((-9003 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((9003 : Rat) / 4) [(0, 2), (7, 1), (13, 1)],
  term ((-9003 : Rat) / 2) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((9003 : Rat) / 4) [(1, 2), (7, 1), (13, 1)],
  term ((9003 : Rat) / 2) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-9003 : Rat) / 4) [(7, 1), (8, 2), (13, 1)],
  term ((9003 : Rat) / 2) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-9003 : Rat) / 4) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 23. -/
theorem ep_Q2_064_partial_23_0236_valid :
    mulPoly ep_Q2_064_coefficient_23_0236
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0237 : Poly :=
[
  term ((-110847 : Rat) / 16) [(7, 1), (15, 1)]
]

/-- Partial product 237 for generator 23. -/
def ep_Q2_064_partial_23_0237 : Poly :=
[
  term ((110847 : Rat) / 8) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-110847 : Rat) / 16) [(0, 2), (7, 1), (15, 1)],
  term ((110847 : Rat) / 8) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-110847 : Rat) / 16) [(1, 2), (7, 1), (15, 1)],
  term ((-110847 : Rat) / 8) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((110847 : Rat) / 16) [(7, 1), (8, 2), (15, 1)],
  term ((-110847 : Rat) / 8) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((110847 : Rat) / 16) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 23. -/
theorem ep_Q2_064_partial_23_0237_valid :
    mulPoly ep_Q2_064_coefficient_23_0237
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0238 : Poly :=
[
  term (405 : Rat) [(7, 2)]
]

/-- Partial product 238 for generator 23. -/
def ep_Q2_064_partial_23_0238 : Poly :=
[
  term (-810 : Rat) [(0, 1), (7, 2), (10, 1)],
  term (405 : Rat) [(0, 2), (7, 2)],
  term (-810 : Rat) [(1, 1), (7, 2), (11, 1)],
  term (405 : Rat) [(1, 2), (7, 2)],
  term (810 : Rat) [(7, 2), (8, 1), (10, 1)],
  term (-405 : Rat) [(7, 2), (8, 2)],
  term (810 : Rat) [(7, 2), (9, 1), (11, 1)],
  term (-405 : Rat) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 23. -/
theorem ep_Q2_064_partial_23_0238_valid :
    mulPoly ep_Q2_064_coefficient_23_0238
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0239 : Poly :=
[
  term (-405 : Rat) [(7, 2), (10, 1)]
]

/-- Partial product 239 for generator 23. -/
def ep_Q2_064_partial_23_0239 : Poly :=
[
  term (810 : Rat) [(0, 1), (7, 2), (10, 2)],
  term (-405 : Rat) [(0, 2), (7, 2), (10, 1)],
  term (810 : Rat) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term (-405 : Rat) [(1, 2), (7, 2), (10, 1)],
  term (-810 : Rat) [(7, 2), (8, 1), (10, 2)],
  term (405 : Rat) [(7, 2), (8, 2), (10, 1)],
  term (-810 : Rat) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term (405 : Rat) [(7, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 23. -/
theorem ep_Q2_064_partial_23_0239_valid :
    mulPoly ep_Q2_064_coefficient_23_0239
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0240 : Poly :=
[
  term (432 : Rat) [(7, 2), (12, 1)]
]

/-- Partial product 240 for generator 23. -/
def ep_Q2_064_partial_23_0240 : Poly :=
[
  term (-864 : Rat) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term (432 : Rat) [(0, 2), (7, 2), (12, 1)],
  term (-864 : Rat) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term (432 : Rat) [(1, 2), (7, 2), (12, 1)],
  term (864 : Rat) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term (-432 : Rat) [(7, 2), (8, 2), (12, 1)],
  term (864 : Rat) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term (-432 : Rat) [(7, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 23. -/
theorem ep_Q2_064_partial_23_0240_valid :
    mulPoly ep_Q2_064_coefficient_23_0240
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0241 : Poly :=
[
  term ((-881 : Rat) / 4) [(8, 1)]
]

/-- Partial product 241 for generator 23. -/
def ep_Q2_064_partial_23_0241 : Poly :=
[
  term ((881 : Rat) / 2) [(0, 1), (8, 1), (10, 1)],
  term ((-881 : Rat) / 4) [(0, 2), (8, 1)],
  term ((881 : Rat) / 2) [(1, 1), (8, 1), (11, 1)],
  term ((-881 : Rat) / 4) [(1, 2), (8, 1)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 4) [(8, 1), (9, 2)],
  term ((-881 : Rat) / 2) [(8, 2), (10, 1)],
  term ((881 : Rat) / 4) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 23. -/
theorem ep_Q2_064_partial_23_0241_valid :
    mulPoly ep_Q2_064_coefficient_23_0241
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0242 : Poly :=
[
  term ((881 : Rat) / 2) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 242 for generator 23. -/
def ep_Q2_064_partial_23_0242 : Poly :=
[
  term (-881 : Rat) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((881 : Rat) / 2) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term (-881 : Rat) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((881 : Rat) / 2) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term (881 : Rat) [(8, 1), (9, 2), (11, 2)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 3), (11, 1)],
  term (881 : Rat) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-881 : Rat) / 2) [(8, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 23. -/
theorem ep_Q2_064_partial_23_0242_valid :
    mulPoly ep_Q2_064_coefficient_23_0242
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0243 : Poly :=
[
  term ((881 : Rat) / 8) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 243 for generator 23. -/
def ep_Q2_064_partial_23_0243 : Poly :=
[
  term ((-881 : Rat) / 4) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((881 : Rat) / 8) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((-881 : Rat) / 4) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((881 : Rat) / 8) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((881 : Rat) / 4) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-881 : Rat) / 8) [(8, 1), (9, 3), (13, 1)],
  term ((881 : Rat) / 4) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-881 : Rat) / 8) [(8, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 23. -/
theorem ep_Q2_064_partial_23_0243_valid :
    mulPoly ep_Q2_064_coefficient_23_0243
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0244 : Poly :=
[
  term (-2865 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 244 for generator 23. -/
def ep_Q2_064_partial_23_0244 : Poly :=
[
  term (5730 : Rat) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (-2865 : Rat) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term (-2865 : Rat) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term (2865 : Rat) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (2865 : Rat) [(8, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 23. -/
theorem ep_Q2_064_partial_23_0244_valid :
    mulPoly ep_Q2_064_coefficient_23_0244
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0245 : Poly :=
[
  term ((1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 245 for generator 23. -/
def ep_Q2_064_partial_23_0245 : Poly :=
[
  term ((-1971 : Rat) / 8) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1971 : Rat) / 8) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((1971 : Rat) / 16) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((1971 : Rat) / 8) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-1971 : Rat) / 16) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((1971 : Rat) / 8) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 23. -/
theorem ep_Q2_064_partial_23_0245_valid :
    mulPoly ep_Q2_064_coefficient_23_0245
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0246 : Poly :=
[
  term (526 : Rat) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 246 for generator 23. -/
def ep_Q2_064_partial_23_0246 : Poly :=
[
  term (-1052 : Rat) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term (526 : Rat) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term (-1052 : Rat) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term (526 : Rat) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term (1052 : Rat) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term (-526 : Rat) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term (1052 : Rat) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term (-526 : Rat) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 23. -/
theorem ep_Q2_064_partial_23_0246_valid :
    mulPoly ep_Q2_064_coefficient_23_0246
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0247 : Poly :=
[
  term ((-2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 247 for generator 23. -/
def ep_Q2_064_partial_23_0247 : Poly :=
[
  term ((2865 : Rat) / 2) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(0, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(8, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 23. -/
theorem ep_Q2_064_partial_23_0247_valid :
    mulPoly ep_Q2_064_coefficient_23_0247
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0248 : Poly :=
[
  term ((26989 : Rat) / 16) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 248 for generator 23. -/
def ep_Q2_064_partial_23_0248 : Poly :=
[
  term ((-26989 : Rat) / 8) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 8) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 8) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((26989 : Rat) / 8) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 23. -/
theorem ep_Q2_064_partial_23_0248_valid :
    mulPoly ep_Q2_064_coefficient_23_0248
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0249 : Poly :=
[
  term ((1377 : Rat) / 8) [(8, 1), (13, 2)]
]

/-- Partial product 249 for generator 23. -/
def ep_Q2_064_partial_23_0249 : Poly :=
[
  term ((-1377 : Rat) / 4) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((1377 : Rat) / 8) [(0, 2), (8, 1), (13, 2)],
  term ((-1377 : Rat) / 4) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((1377 : Rat) / 8) [(1, 2), (8, 1), (13, 2)],
  term ((1377 : Rat) / 4) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-1377 : Rat) / 8) [(8, 1), (9, 2), (13, 2)],
  term ((1377 : Rat) / 4) [(8, 2), (10, 1), (13, 2)],
  term ((-1377 : Rat) / 8) [(8, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 23. -/
theorem ep_Q2_064_partial_23_0249_valid :
    mulPoly ep_Q2_064_coefficient_23_0249
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0250 : Poly :=
[
  term (2865 : Rat) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 250 for generator 23. -/
def ep_Q2_064_partial_23_0250 : Poly :=
[
  term (-5730 : Rat) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term (2865 : Rat) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (2865 : Rat) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term (-2865 : Rat) [(8, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (-2865 : Rat) [(9, 3), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 23. -/
theorem ep_Q2_064_partial_23_0250_valid :
    mulPoly ep_Q2_064_coefficient_23_0250
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0251 : Poly :=
[
  term ((-1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 251 for generator 23. -/
def ep_Q2_064_partial_23_0251 : Poly :=
[
  term ((1971 : Rat) / 8) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-1971 : Rat) / 16) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((1971 : Rat) / 8) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1971 : Rat) / 8) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((1971 : Rat) / 16) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1971 : Rat) / 8) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 23. -/
theorem ep_Q2_064_partial_23_0251_valid :
    mulPoly ep_Q2_064_coefficient_23_0251
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0252 : Poly :=
[
  term (-526 : Rat) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 252 for generator 23. -/
def ep_Q2_064_partial_23_0252 : Poly :=
[
  term (1052 : Rat) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term (-526 : Rat) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term (1052 : Rat) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term (-526 : Rat) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term (-1052 : Rat) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term (526 : Rat) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term (-1052 : Rat) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term (526 : Rat) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 23. -/
theorem ep_Q2_064_partial_23_0252_valid :
    mulPoly ep_Q2_064_coefficient_23_0252
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0253 : Poly :=
[
  term ((-11453 : Rat) / 8) [(9, 1), (11, 1)]
]

/-- Partial product 253 for generator 23. -/
def ep_Q2_064_partial_23_0253 : Poly :=
[
  term ((11453 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-11453 : Rat) / 8) [(0, 2), (9, 1), (11, 1)],
  term ((11453 : Rat) / 4) [(1, 1), (9, 1), (11, 2)],
  term ((-11453 : Rat) / 8) [(1, 2), (9, 1), (11, 1)],
  term ((-11453 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((11453 : Rat) / 8) [(8, 2), (9, 1), (11, 1)],
  term ((-11453 : Rat) / 4) [(9, 2), (11, 2)],
  term ((11453 : Rat) / 8) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 23. -/
theorem ep_Q2_064_partial_23_0253_valid :
    mulPoly ep_Q2_064_coefficient_23_0253
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0254 : Poly :=
[
  term ((-1377 : Rat) / 8) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 254 for generator 23. -/
def ep_Q2_064_partial_23_0254 : Poly :=
[
  term ((1377 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1377 : Rat) / 8) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((1377 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1377 : Rat) / 8) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1377 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((1377 : Rat) / 8) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1377 : Rat) / 4) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((1377 : Rat) / 8) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 23. -/
theorem ep_Q2_064_partial_23_0254_valid :
    mulPoly ep_Q2_064_coefficient_23_0254
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0255 : Poly :=
[
  term ((-81639 : Rat) / 16) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 255 for generator 23. -/
def ep_Q2_064_partial_23_0255 : Poly :=
[
  term ((81639 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-81639 : Rat) / 16) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((81639 : Rat) / 8) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-81639 : Rat) / 16) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-81639 : Rat) / 8) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((81639 : Rat) / 16) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-81639 : Rat) / 8) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((81639 : Rat) / 16) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 23. -/
theorem ep_Q2_064_partial_23_0255_valid :
    mulPoly ep_Q2_064_coefficient_23_0255
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0256 : Poly :=
[
  term ((2865 : Rat) / 4) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 256 for generator 23. -/
def ep_Q2_064_partial_23_0256 : Poly :=
[
  term ((-2865 : Rat) / 2) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((2865 : Rat) / 4) [(0, 2), (9, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 2) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((2865 : Rat) / 4) [(1, 2), (9, 1), (12, 2), (15, 1)],
  term ((2865 : Rat) / 2) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(8, 2), (9, 1), (12, 2), (15, 1)],
  term ((2865 : Rat) / 2) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(9, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 23. -/
theorem ep_Q2_064_partial_23_0256_valid :
    mulPoly ep_Q2_064_coefficient_23_0256
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0257 : Poly :=
[
  term ((7761 : Rat) / 4) [(9, 1), (13, 1)]
]

/-- Partial product 257 for generator 23. -/
def ep_Q2_064_partial_23_0257 : Poly :=
[
  term ((-7761 : Rat) / 2) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((7761 : Rat) / 4) [(0, 2), (9, 1), (13, 1)],
  term ((-7761 : Rat) / 2) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((7761 : Rat) / 4) [(1, 2), (9, 1), (13, 1)],
  term ((7761 : Rat) / 2) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-7761 : Rat) / 4) [(8, 2), (9, 1), (13, 1)],
  term ((7761 : Rat) / 2) [(9, 2), (11, 1), (13, 1)],
  term ((-7761 : Rat) / 4) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 23. -/
theorem ep_Q2_064_partial_23_0257_valid :
    mulPoly ep_Q2_064_coefficient_23_0257
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0258 : Poly :=
[
  term ((-19401 : Rat) / 8) [(9, 1), (15, 1)]
]

/-- Partial product 258 for generator 23. -/
def ep_Q2_064_partial_23_0258 : Poly :=
[
  term ((19401 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-19401 : Rat) / 8) [(0, 2), (9, 1), (15, 1)],
  term ((19401 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-19401 : Rat) / 8) [(1, 2), (9, 1), (15, 1)],
  term ((-19401 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((19401 : Rat) / 8) [(8, 2), (9, 1), (15, 1)],
  term ((-19401 : Rat) / 4) [(9, 2), (11, 1), (15, 1)],
  term ((19401 : Rat) / 8) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 23. -/
theorem ep_Q2_064_partial_23_0258_valid :
    mulPoly ep_Q2_064_coefficient_23_0258
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0259 : Poly :=
[
  term ((881 : Rat) / 2) [(9, 2)]
]

/-- Partial product 259 for generator 23. -/
def ep_Q2_064_partial_23_0259 : Poly :=
[
  term (-881 : Rat) [(0, 1), (9, 2), (10, 1)],
  term ((881 : Rat) / 2) [(0, 2), (9, 2)],
  term (-881 : Rat) [(1, 1), (9, 2), (11, 1)],
  term ((881 : Rat) / 2) [(1, 2), (9, 2)],
  term (881 : Rat) [(8, 1), (9, 2), (10, 1)],
  term ((-881 : Rat) / 2) [(8, 2), (9, 2)],
  term (881 : Rat) [(9, 3), (11, 1)],
  term ((-881 : Rat) / 2) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 23. -/
theorem ep_Q2_064_partial_23_0259_valid :
    mulPoly ep_Q2_064_coefficient_23_0259
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0260 : Poly :=
[
  term ((-881 : Rat) / 2) [(9, 2), (10, 1)]
]

/-- Partial product 260 for generator 23. -/
def ep_Q2_064_partial_23_0260 : Poly :=
[
  term (881 : Rat) [(0, 1), (9, 2), (10, 2)],
  term ((-881 : Rat) / 2) [(0, 2), (9, 2), (10, 1)],
  term (881 : Rat) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((-881 : Rat) / 2) [(1, 2), (9, 2), (10, 1)],
  term (-881 : Rat) [(8, 1), (9, 2), (10, 2)],
  term ((881 : Rat) / 2) [(8, 2), (9, 2), (10, 1)],
  term (-881 : Rat) [(9, 3), (10, 1), (11, 1)],
  term ((881 : Rat) / 2) [(9, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 23. -/
theorem ep_Q2_064_partial_23_0260_valid :
    mulPoly ep_Q2_064_coefficient_23_0260
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0261 : Poly :=
[
  term ((-881 : Rat) / 8) [(9, 2), (12, 1)]
]

/-- Partial product 261 for generator 23. -/
def ep_Q2_064_partial_23_0261 : Poly :=
[
  term ((881 : Rat) / 4) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-881 : Rat) / 8) [(0, 2), (9, 2), (12, 1)],
  term ((881 : Rat) / 4) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((-881 : Rat) / 8) [(1, 2), (9, 2), (12, 1)],
  term ((-881 : Rat) / 4) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((881 : Rat) / 8) [(8, 2), (9, 2), (12, 1)],
  term ((-881 : Rat) / 4) [(9, 3), (11, 1), (12, 1)],
  term ((881 : Rat) / 8) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 23. -/
theorem ep_Q2_064_partial_23_0261_valid :
    mulPoly ep_Q2_064_coefficient_23_0261
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0262 : Poly :=
[
  term ((37245 : Rat) / 4) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 262 for generator 23. -/
def ep_Q2_064_partial_23_0262 : Poly :=
[
  term ((-37245 : Rat) / 2) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((37245 : Rat) / 4) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 2) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((37245 : Rat) / 4) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((37245 : Rat) / 2) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 4) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((37245 : Rat) / 2) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 4) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 23. -/
theorem ep_Q2_064_partial_23_0262_valid :
    mulPoly ep_Q2_064_coefficient_23_0262
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0263 : Poly :=
[
  term ((-54645 : Rat) / 32) [(11, 1), (13, 1)]
]

/-- Partial product 263 for generator 23. -/
def ep_Q2_064_partial_23_0263 : Poly :=
[
  term ((54645 : Rat) / 16) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-54645 : Rat) / 32) [(0, 2), (11, 1), (13, 1)],
  term ((54645 : Rat) / 16) [(1, 1), (11, 2), (13, 1)],
  term ((-54645 : Rat) / 32) [(1, 2), (11, 1), (13, 1)],
  term ((-54645 : Rat) / 16) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((54645 : Rat) / 32) [(8, 2), (11, 1), (13, 1)],
  term ((-54645 : Rat) / 16) [(9, 1), (11, 2), (13, 1)],
  term ((54645 : Rat) / 32) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 23. -/
theorem ep_Q2_064_partial_23_0263_valid :
    mulPoly ep_Q2_064_coefficient_23_0263
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0264 : Poly :=
[
  term ((92183 : Rat) / 16) [(11, 1), (15, 1)]
]

/-- Partial product 264 for generator 23. -/
def ep_Q2_064_partial_23_0264 : Poly :=
[
  term ((-92183 : Rat) / 8) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((92183 : Rat) / 16) [(0, 2), (11, 1), (15, 1)],
  term ((-92183 : Rat) / 8) [(1, 1), (11, 2), (15, 1)],
  term ((92183 : Rat) / 16) [(1, 2), (11, 1), (15, 1)],
  term ((92183 : Rat) / 8) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-92183 : Rat) / 16) [(8, 2), (11, 1), (15, 1)],
  term ((92183 : Rat) / 8) [(9, 1), (11, 2), (15, 1)],
  term ((-92183 : Rat) / 16) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 23. -/
theorem ep_Q2_064_partial_23_0264_valid :
    mulPoly ep_Q2_064_coefficient_23_0264
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0265 : Poly :=
[
  term ((-27 : Rat) / 2) [(11, 2)]
]

/-- Partial product 265 for generator 23. -/
def ep_Q2_064_partial_23_0265 : Poly :=
[
  term (27 : Rat) [(0, 1), (10, 1), (11, 2)],
  term ((-27 : Rat) / 2) [(0, 2), (11, 2)],
  term (27 : Rat) [(1, 1), (11, 3)],
  term ((-27 : Rat) / 2) [(1, 2), (11, 2)],
  term (-27 : Rat) [(8, 1), (10, 1), (11, 2)],
  term ((27 : Rat) / 2) [(8, 2), (11, 2)],
  term (-27 : Rat) [(9, 1), (11, 3)],
  term ((27 : Rat) / 2) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 23. -/
theorem ep_Q2_064_partial_23_0265_valid :
    mulPoly ep_Q2_064_coefficient_23_0265
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0266 : Poly :=
[
  term ((-1683 : Rat) / 32) [(12, 1)]
]

/-- Partial product 266 for generator 23. -/
def ep_Q2_064_partial_23_0266 : Poly :=
[
  term ((1683 : Rat) / 16) [(0, 1), (10, 1), (12, 1)],
  term ((-1683 : Rat) / 32) [(0, 2), (12, 1)],
  term ((1683 : Rat) / 16) [(1, 1), (11, 1), (12, 1)],
  term ((-1683 : Rat) / 32) [(1, 2), (12, 1)],
  term ((-1683 : Rat) / 16) [(8, 1), (10, 1), (12, 1)],
  term ((1683 : Rat) / 32) [(8, 2), (12, 1)],
  term ((-1683 : Rat) / 16) [(9, 1), (11, 1), (12, 1)],
  term ((1683 : Rat) / 32) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 23. -/
theorem ep_Q2_064_partial_23_0266_valid :
    mulPoly ep_Q2_064_coefficient_23_0266
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0267 : Poly :=
[
  term ((-193815 : Rat) / 16) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 267 for generator 23. -/
def ep_Q2_064_partial_23_0267 : Poly :=
[
  term ((193815 : Rat) / 8) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-193815 : Rat) / 16) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((193815 : Rat) / 8) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-193815 : Rat) / 16) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-193815 : Rat) / 8) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((193815 : Rat) / 16) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-193815 : Rat) / 8) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((193815 : Rat) / 16) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 23. -/
theorem ep_Q2_064_partial_23_0267_valid :
    mulPoly ep_Q2_064_coefficient_23_0267
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0268 : Poly :=
[
  term ((33451 : Rat) / 16) [(12, 1), (15, 2)]
]

/-- Partial product 268 for generator 23. -/
def ep_Q2_064_partial_23_0268 : Poly :=
[
  term ((-33451 : Rat) / 8) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((33451 : Rat) / 16) [(0, 2), (12, 1), (15, 2)],
  term ((-33451 : Rat) / 8) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((33451 : Rat) / 16) [(1, 2), (12, 1), (15, 2)],
  term ((33451 : Rat) / 8) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-33451 : Rat) / 16) [(8, 2), (12, 1), (15, 2)],
  term ((33451 : Rat) / 8) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-33451 : Rat) / 16) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 23. -/
theorem ep_Q2_064_partial_23_0268_valid :
    mulPoly ep_Q2_064_coefficient_23_0268
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0269 : Poly :=
[
  term ((14325 : Rat) / 4) [(12, 2), (15, 2)]
]

/-- Partial product 269 for generator 23. -/
def ep_Q2_064_partial_23_0269 : Poly :=
[
  term ((-14325 : Rat) / 2) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((14325 : Rat) / 4) [(0, 2), (12, 2), (15, 2)],
  term ((-14325 : Rat) / 2) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((14325 : Rat) / 4) [(1, 2), (12, 2), (15, 2)],
  term ((14325 : Rat) / 2) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-14325 : Rat) / 4) [(8, 2), (12, 2), (15, 2)],
  term ((14325 : Rat) / 2) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-14325 : Rat) / 4) [(9, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 23. -/
theorem ep_Q2_064_partial_23_0269_valid :
    mulPoly ep_Q2_064_coefficient_23_0269
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0270 : Poly :=
[
  term ((169341 : Rat) / 32) [(13, 1), (15, 1)]
]

/-- Partial product 270 for generator 23. -/
def ep_Q2_064_partial_23_0270 : Poly :=
[
  term ((-169341 : Rat) / 16) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((169341 : Rat) / 32) [(0, 2), (13, 1), (15, 1)],
  term ((-169341 : Rat) / 16) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((169341 : Rat) / 32) [(1, 2), (13, 1), (15, 1)],
  term ((169341 : Rat) / 16) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-169341 : Rat) / 32) [(8, 2), (13, 1), (15, 1)],
  term ((169341 : Rat) / 16) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-169341 : Rat) / 32) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 23. -/
theorem ep_Q2_064_partial_23_0270_valid :
    mulPoly ep_Q2_064_coefficient_23_0270
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0271 : Poly :=
[
  term ((33015 : Rat) / 16) [(13, 2)]
]

/-- Partial product 271 for generator 23. -/
def ep_Q2_064_partial_23_0271 : Poly :=
[
  term ((-33015 : Rat) / 8) [(0, 1), (10, 1), (13, 2)],
  term ((33015 : Rat) / 16) [(0, 2), (13, 2)],
  term ((-33015 : Rat) / 8) [(1, 1), (11, 1), (13, 2)],
  term ((33015 : Rat) / 16) [(1, 2), (13, 2)],
  term ((33015 : Rat) / 8) [(8, 1), (10, 1), (13, 2)],
  term ((-33015 : Rat) / 16) [(8, 2), (13, 2)],
  term ((33015 : Rat) / 8) [(9, 1), (11, 1), (13, 2)],
  term ((-33015 : Rat) / 16) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 23. -/
theorem ep_Q2_064_partial_23_0271_valid :
    mulPoly ep_Q2_064_coefficient_23_0271
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0272 : Poly :=
[
  term (27 : Rat) [(14, 1)]
]

/-- Partial product 272 for generator 23. -/
def ep_Q2_064_partial_23_0272 : Poly :=
[
  term (-54 : Rat) [(0, 1), (10, 1), (14, 1)],
  term (27 : Rat) [(0, 2), (14, 1)],
  term (-54 : Rat) [(1, 1), (11, 1), (14, 1)],
  term (27 : Rat) [(1, 2), (14, 1)],
  term (54 : Rat) [(8, 1), (10, 1), (14, 1)],
  term (-27 : Rat) [(8, 2), (14, 1)],
  term (54 : Rat) [(9, 1), (11, 1), (14, 1)],
  term (-27 : Rat) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 23. -/
theorem ep_Q2_064_partial_23_0272_valid :
    mulPoly ep_Q2_064_coefficient_23_0272
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 23. -/
def ep_Q2_064_coefficient_23_0273 : Poly :=
[
  term ((-38161 : Rat) / 16) [(15, 2)]
]

/-- Partial product 273 for generator 23. -/
def ep_Q2_064_partial_23_0273 : Poly :=
[
  term ((38161 : Rat) / 8) [(0, 1), (10, 1), (15, 2)],
  term ((-38161 : Rat) / 16) [(0, 2), (15, 2)],
  term ((38161 : Rat) / 8) [(1, 1), (11, 1), (15, 2)],
  term ((-38161 : Rat) / 16) [(1, 2), (15, 2)],
  term ((-38161 : Rat) / 8) [(8, 1), (10, 1), (15, 2)],
  term ((38161 : Rat) / 16) [(8, 2), (15, 2)],
  term ((-38161 : Rat) / 8) [(9, 1), (11, 1), (15, 2)],
  term ((38161 : Rat) / 16) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 23. -/
theorem ep_Q2_064_partial_23_0273_valid :
    mulPoly ep_Q2_064_coefficient_23_0273
        ep_Q2_064_generator_23_0200_0273 =
      ep_Q2_064_partial_23_0273 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_23_0200_0273 : List Poly :=
[
  ep_Q2_064_partial_23_0200,
  ep_Q2_064_partial_23_0201,
  ep_Q2_064_partial_23_0202,
  ep_Q2_064_partial_23_0203,
  ep_Q2_064_partial_23_0204,
  ep_Q2_064_partial_23_0205,
  ep_Q2_064_partial_23_0206,
  ep_Q2_064_partial_23_0207,
  ep_Q2_064_partial_23_0208,
  ep_Q2_064_partial_23_0209,
  ep_Q2_064_partial_23_0210,
  ep_Q2_064_partial_23_0211,
  ep_Q2_064_partial_23_0212,
  ep_Q2_064_partial_23_0213,
  ep_Q2_064_partial_23_0214,
  ep_Q2_064_partial_23_0215,
  ep_Q2_064_partial_23_0216,
  ep_Q2_064_partial_23_0217,
  ep_Q2_064_partial_23_0218,
  ep_Q2_064_partial_23_0219,
  ep_Q2_064_partial_23_0220,
  ep_Q2_064_partial_23_0221,
  ep_Q2_064_partial_23_0222,
  ep_Q2_064_partial_23_0223,
  ep_Q2_064_partial_23_0224,
  ep_Q2_064_partial_23_0225,
  ep_Q2_064_partial_23_0226,
  ep_Q2_064_partial_23_0227,
  ep_Q2_064_partial_23_0228,
  ep_Q2_064_partial_23_0229,
  ep_Q2_064_partial_23_0230,
  ep_Q2_064_partial_23_0231,
  ep_Q2_064_partial_23_0232,
  ep_Q2_064_partial_23_0233,
  ep_Q2_064_partial_23_0234,
  ep_Q2_064_partial_23_0235,
  ep_Q2_064_partial_23_0236,
  ep_Q2_064_partial_23_0237,
  ep_Q2_064_partial_23_0238,
  ep_Q2_064_partial_23_0239,
  ep_Q2_064_partial_23_0240,
  ep_Q2_064_partial_23_0241,
  ep_Q2_064_partial_23_0242,
  ep_Q2_064_partial_23_0243,
  ep_Q2_064_partial_23_0244,
  ep_Q2_064_partial_23_0245,
  ep_Q2_064_partial_23_0246,
  ep_Q2_064_partial_23_0247,
  ep_Q2_064_partial_23_0248,
  ep_Q2_064_partial_23_0249,
  ep_Q2_064_partial_23_0250,
  ep_Q2_064_partial_23_0251,
  ep_Q2_064_partial_23_0252,
  ep_Q2_064_partial_23_0253,
  ep_Q2_064_partial_23_0254,
  ep_Q2_064_partial_23_0255,
  ep_Q2_064_partial_23_0256,
  ep_Q2_064_partial_23_0257,
  ep_Q2_064_partial_23_0258,
  ep_Q2_064_partial_23_0259,
  ep_Q2_064_partial_23_0260,
  ep_Q2_064_partial_23_0261,
  ep_Q2_064_partial_23_0262,
  ep_Q2_064_partial_23_0263,
  ep_Q2_064_partial_23_0264,
  ep_Q2_064_partial_23_0265,
  ep_Q2_064_partial_23_0266,
  ep_Q2_064_partial_23_0267,
  ep_Q2_064_partial_23_0268,
  ep_Q2_064_partial_23_0269,
  ep_Q2_064_partial_23_0270,
  ep_Q2_064_partial_23_0271,
  ep_Q2_064_partial_23_0272,
  ep_Q2_064_partial_23_0273
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_23_0200_0273 : Poly :=
[
  term (864 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-42723 : Rat) / 2) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term (-5682 : Rat) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(0, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-13215 : Rat) / 4) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((2841 : Rat) / 2) [(0, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (3524 : Rat) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-46337 : Rat) / 4) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term (5682 : Rat) [(0, 1), (6, 1), (9, 1), (10, 2), (15, 1)],
  term ((42975 : Rat) / 2) [(0, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7095 : Rat) / 2) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((235419 : Rat) / 8) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term (-27 : Rat) [(0, 1), (6, 1), (10, 1), (11, 2)],
  term (-22920 : Rat) [(0, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (8535 : Rat) [(0, 1), (6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-57823 : Rat) / 4) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((15819 : Rat) / 4) [(0, 1), (6, 1), (10, 1), (13, 2)],
  term ((-26797 : Rat) / 8) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((-42615 : Rat) / 2) [(0, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term (22728 : Rat) [(0, 1), (6, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(0, 1), (6, 2), (10, 1), (15, 2)],
  term (-216 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term (-54 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term (5682 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-14079 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term (-3470 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((14079 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term (675 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term (-27 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-15819 : Rat) / 4) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((49723 : Rat) / 4) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term (22920 : Rat) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-9003 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((110847 : Rat) / 8) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term (27 : Rat) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((-42975 : Rat) / 2) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((7149 : Rat) / 2) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-87687 : Rat) / 8) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term (-810 : Rat) [(0, 1), (7, 2), (10, 1)],
  term (-864 : Rat) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term (810 : Rat) [(0, 1), (7, 2), (10, 2)],
  term (-881 : Rat) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-881 : Rat) / 4) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((881 : Rat) / 2) [(0, 1), (8, 1), (10, 1)],
  term (5730 : Rat) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term (-1052 : Rat) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 8) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1377 : Rat) / 4) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((11453 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((1377 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((81639 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-7761 : Rat) / 2) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((19401 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term (-5730 : Rat) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term (1052 : Rat) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term (-881 : Rat) [(0, 1), (9, 2), (10, 1)],
  term ((881 : Rat) / 4) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term (881 : Rat) [(0, 1), (9, 2), (10, 2)],
  term ((-37245 : Rat) / 2) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((54645 : Rat) / 16) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-92183 : Rat) / 8) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term (27 : Rat) [(0, 1), (10, 1), (11, 2)],
  term ((1683 : Rat) / 16) [(0, 1), (10, 1), (12, 1)],
  term ((193815 : Rat) / 8) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33451 : Rat) / 8) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-14325 : Rat) / 2) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((-169341 : Rat) / 16) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-33015 : Rat) / 8) [(0, 1), (10, 1), (13, 2)],
  term (-54 : Rat) [(0, 1), (10, 1), (14, 1)],
  term ((38161 : Rat) / 8) [(0, 1), (10, 1), (15, 2)],
  term (-432 : Rat) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((42723 : Rat) / 4) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term (2841 : Rat) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term (-2841 : Rat) [(0, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((13215 : Rat) / 8) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-2841 : Rat) / 4) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term (-1762 : Rat) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((46337 : Rat) / 8) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((7095 : Rat) / 4) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-235419 : Rat) / 16) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(0, 2), (6, 1), (11, 2)],
  term (11460 : Rat) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8535 : Rat) / 2) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((57823 : Rat) / 8) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 8) [(0, 2), (6, 1), (13, 2)],
  term ((26797 : Rat) / 16) [(0, 2), (6, 1), (15, 2)],
  term ((42615 : Rat) / 4) [(0, 2), (6, 2), (11, 1), (15, 1)],
  term (-11364 : Rat) [(0, 2), (6, 2), (13, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(0, 2), (6, 2), (15, 2)],
  term (108 : Rat) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term (27 : Rat) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term (-2841 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((14079 : Rat) / 8) [(0, 2), (7, 1), (9, 1)],
  term ((-14079 : Rat) / 8) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term (1735 : Rat) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-27 : Rat) / 2) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((42975 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((87687 : Rat) / 16) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-675 : Rat) / 2) [(0, 2), (7, 1), (11, 1)],
  term ((27 : Rat) / 2) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 8) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-49723 : Rat) / 8) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term (-11460 : Rat) [(0, 2), (7, 1), (12, 2), (15, 1)],
  term ((9003 : Rat) / 4) [(0, 2), (7, 1), (13, 1)],
  term ((-110847 : Rat) / 16) [(0, 2), (7, 1), (15, 1)],
  term (405 : Rat) [(0, 2), (7, 2)],
  term (-405 : Rat) [(0, 2), (7, 2), (10, 1)],
  term (432 : Rat) [(0, 2), (7, 2), (12, 1)],
  term ((-881 : Rat) / 4) [(0, 2), (8, 1)],
  term ((881 : Rat) / 2) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 8) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term (-2865 : Rat) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term (526 : Rat) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(0, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 8) [(0, 2), (8, 1), (13, 2)],
  term (2865 : Rat) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term (-526 : Rat) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-11453 : Rat) / 8) [(0, 2), (9, 1), (11, 1)],
  term ((-1377 : Rat) / 8) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-81639 : Rat) / 16) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(0, 2), (9, 1), (12, 2), (15, 1)],
  term ((7761 : Rat) / 4) [(0, 2), (9, 1), (13, 1)],
  term ((-19401 : Rat) / 8) [(0, 2), (9, 1), (15, 1)],
  term ((881 : Rat) / 2) [(0, 2), (9, 2)],
  term ((-881 : Rat) / 2) [(0, 2), (9, 2), (10, 1)],
  term ((-881 : Rat) / 8) [(0, 2), (9, 2), (12, 1)],
  term ((37245 : Rat) / 4) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-54645 : Rat) / 32) [(0, 2), (11, 1), (13, 1)],
  term ((92183 : Rat) / 16) [(0, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(0, 2), (11, 2)],
  term ((-1683 : Rat) / 32) [(0, 2), (12, 1)],
  term ((-193815 : Rat) / 16) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((33451 : Rat) / 16) [(0, 2), (12, 1), (15, 2)],
  term ((14325 : Rat) / 4) [(0, 2), (12, 2), (15, 2)],
  term ((169341 : Rat) / 32) [(0, 2), (13, 1), (15, 1)],
  term ((33015 : Rat) / 16) [(0, 2), (13, 2)],
  term (27 : Rat) [(0, 2), (14, 1)],
  term ((-38161 : Rat) / 16) [(0, 2), (15, 2)],
  term (864 : Rat) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-42723 : Rat) / 2) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term (-5682 : Rat) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term (5682 : Rat) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term (3524 : Rat) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-46337 : Rat) / 4) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-13215 : Rat) / 4) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term (-22920 : Rat) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term (8535 : Rat) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-57823 : Rat) / 4) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((15819 : Rat) / 4) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-26797 : Rat) / 8) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((42975 : Rat) / 2) [(1, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7095 : Rat) / 2) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((235419 : Rat) / 8) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term (-27 : Rat) [(1, 1), (6, 1), (11, 3)],
  term (22728 : Rat) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(1, 1), (6, 2), (11, 1), (15, 2)],
  term ((-42615 : Rat) / 2) [(1, 1), (6, 2), (11, 2), (15, 1)],
  term (-54 : Rat) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term (5682 : Rat) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term (-216 : Rat) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((14079 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-14079 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term (-3470 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-42975 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((7149 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-87687 : Rat) / 8) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term (27 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-15819 : Rat) / 4) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((49723 : Rat) / 4) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term (22920 : Rat) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9003 : Rat) / 2) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((110847 : Rat) / 8) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (675 : Rat) [(1, 1), (7, 1), (11, 2)],
  term (-27 : Rat) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term (810 : Rat) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term (-810 : Rat) [(1, 1), (7, 2), (11, 1)],
  term (-864 : Rat) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((-881 : Rat) / 4) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term (-881 : Rat) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((881 : Rat) / 2) [(1, 1), (8, 1), (11, 1)],
  term ((2865 : Rat) / 2) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 8) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1377 : Rat) / 4) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term (5730 : Rat) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term (-1052 : Rat) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term (-5730 : Rat) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term (1052 : Rat) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1377 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((81639 : Rat) / 8) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7761 : Rat) / 2) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((19401 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((11453 : Rat) / 4) [(1, 1), (9, 1), (11, 2)],
  term (881 : Rat) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term (-881 : Rat) [(1, 1), (9, 2), (11, 1)],
  term ((881 : Rat) / 4) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((1683 : Rat) / 16) [(1, 1), (11, 1), (12, 1)],
  term ((193815 : Rat) / 8) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33451 : Rat) / 8) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-14325 : Rat) / 2) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((-169341 : Rat) / 16) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-33015 : Rat) / 8) [(1, 1), (11, 1), (13, 2)],
  term (-54 : Rat) [(1, 1), (11, 1), (14, 1)],
  term ((38161 : Rat) / 8) [(1, 1), (11, 1), (15, 2)],
  term ((-37245 : Rat) / 2) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((54645 : Rat) / 16) [(1, 1), (11, 2), (13, 1)],
  term ((-92183 : Rat) / 8) [(1, 1), (11, 2), (15, 1)],
  term (27 : Rat) [(1, 1), (11, 3)],
  term (-432 : Rat) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((42723 : Rat) / 4) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term (2841 : Rat) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term (-2841 : Rat) [(1, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((13215 : Rat) / 8) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-2841 : Rat) / 4) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term (-1762 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((46337 : Rat) / 8) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((7095 : Rat) / 4) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-235419 : Rat) / 16) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(1, 2), (6, 1), (11, 2)],
  term (11460 : Rat) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8535 : Rat) / 2) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((57823 : Rat) / 8) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 8) [(1, 2), (6, 1), (13, 2)],
  term ((26797 : Rat) / 16) [(1, 2), (6, 1), (15, 2)],
  term ((42615 : Rat) / 4) [(1, 2), (6, 2), (11, 1), (15, 1)],
  term (-11364 : Rat) [(1, 2), (6, 2), (13, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(1, 2), (6, 2), (15, 2)],
  term (108 : Rat) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term (27 : Rat) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term (-2841 : Rat) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((14079 : Rat) / 8) [(1, 2), (7, 1), (9, 1)],
  term ((-14079 : Rat) / 8) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term (1735 : Rat) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-27 : Rat) / 2) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((42975 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((87687 : Rat) / 16) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-675 : Rat) / 2) [(1, 2), (7, 1), (11, 1)],
  term ((27 : Rat) / 2) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 8) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-49723 : Rat) / 8) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term (-11460 : Rat) [(1, 2), (7, 1), (12, 2), (15, 1)],
  term ((9003 : Rat) / 4) [(1, 2), (7, 1), (13, 1)],
  term ((-110847 : Rat) / 16) [(1, 2), (7, 1), (15, 1)],
  term (405 : Rat) [(1, 2), (7, 2)],
  term (-405 : Rat) [(1, 2), (7, 2), (10, 1)],
  term (432 : Rat) [(1, 2), (7, 2), (12, 1)],
  term ((-881 : Rat) / 4) [(1, 2), (8, 1)],
  term ((881 : Rat) / 2) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 8) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term (-2865 : Rat) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term (526 : Rat) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 8) [(1, 2), (8, 1), (13, 2)],
  term (2865 : Rat) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term (-526 : Rat) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-11453 : Rat) / 8) [(1, 2), (9, 1), (11, 1)],
  term ((-1377 : Rat) / 8) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-81639 : Rat) / 16) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(1, 2), (9, 1), (12, 2), (15, 1)],
  term ((7761 : Rat) / 4) [(1, 2), (9, 1), (13, 1)],
  term ((-19401 : Rat) / 8) [(1, 2), (9, 1), (15, 1)],
  term ((881 : Rat) / 2) [(1, 2), (9, 2)],
  term ((-881 : Rat) / 2) [(1, 2), (9, 2), (10, 1)],
  term ((-881 : Rat) / 8) [(1, 2), (9, 2), (12, 1)],
  term ((37245 : Rat) / 4) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-54645 : Rat) / 32) [(1, 2), (11, 1), (13, 1)],
  term ((92183 : Rat) / 16) [(1, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(1, 2), (11, 2)],
  term ((-1683 : Rat) / 32) [(1, 2), (12, 1)],
  term ((-193815 : Rat) / 16) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((33451 : Rat) / 16) [(1, 2), (12, 1), (15, 2)],
  term ((14325 : Rat) / 4) [(1, 2), (12, 2), (15, 2)],
  term ((169341 : Rat) / 32) [(1, 2), (13, 1), (15, 1)],
  term ((33015 : Rat) / 16) [(1, 2), (13, 2)],
  term (27 : Rat) [(1, 2), (14, 1)],
  term ((-38161 : Rat) / 16) [(1, 2), (15, 2)],
  term (-864 : Rat) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((42723 : Rat) / 2) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (432 : Rat) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-42723 : Rat) / 4) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term (-864 : Rat) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((42723 : Rat) / 2) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term (432 : Rat) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((-42723 : Rat) / 4) [(6, 1), (7, 1), (9, 2), (15, 1)],
  term ((13215 : Rat) / 4) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2841 : Rat) / 2) [(6, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (-3524 : Rat) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((46337 : Rat) / 4) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term (-5682 : Rat) [(6, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((2841 : Rat) / 2) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term (5682 : Rat) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term (-2841 : Rat) [(6, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(6, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((7095 : Rat) / 2) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-235419 : Rat) / 8) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term (27 : Rat) [(6, 1), (8, 1), (10, 1), (11, 2)],
  term (22920 : Rat) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (-8535 : Rat) [(6, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((57823 : Rat) / 4) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((26797 : Rat) / 8) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term (2841 : Rat) [(6, 1), (8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-13215 : Rat) / 8) [(6, 1), (8, 2), (9, 1), (11, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term (1762 : Rat) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((-46337 : Rat) / 8) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term (5682 : Rat) [(6, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(6, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7095 : Rat) / 4) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((235419 : Rat) / 16) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(6, 1), (8, 2), (11, 2)],
  term (-11460 : Rat) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((8535 : Rat) / 2) [(6, 1), (8, 2), (12, 1), (15, 2)],
  term ((-57823 : Rat) / 8) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((15819 : Rat) / 8) [(6, 1), (8, 2), (13, 2)],
  term ((-26797 : Rat) / 16) [(6, 1), (8, 2), (15, 2)],
  term (-2841 : Rat) [(6, 1), (8, 3), (11, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 3), (13, 1), (15, 1)],
  term (22920 : Rat) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term (-8535 : Rat) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((57823 : Rat) / 4) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((26797 : Rat) / 8) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-42975 : Rat) / 2) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((7095 : Rat) / 2) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-235419 : Rat) / 8) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term (27 : Rat) [(6, 1), (9, 1), (11, 3)],
  term (-5682 : Rat) [(6, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((37293 : Rat) / 4) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-21191 : Rat) / 4) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((420767 : Rat) / 16) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((13161 : Rat) / 4) [(6, 1), (9, 2), (11, 2)],
  term (-11460 : Rat) [(6, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((8535 : Rat) / 2) [(6, 1), (9, 2), (12, 1), (15, 2)],
  term ((-57823 : Rat) / 8) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((15819 : Rat) / 8) [(6, 1), (9, 2), (13, 2)],
  term ((-26797 : Rat) / 16) [(6, 1), (9, 2), (15, 2)],
  term (2841 : Rat) [(6, 1), (9, 3), (10, 1), (15, 1)],
  term ((-13215 : Rat) / 8) [(6, 1), (9, 3), (11, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (9, 3), (12, 1), (15, 1)],
  term (1762 : Rat) [(6, 1), (9, 3), (13, 1)],
  term ((-46337 : Rat) / 8) [(6, 1), (9, 3), (15, 1)],
  term ((42615 : Rat) / 2) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term (-22728 : Rat) [(6, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(6, 2), (8, 1), (10, 1), (15, 2)],
  term ((-42615 : Rat) / 4) [(6, 2), (8, 2), (11, 1), (15, 1)],
  term (11364 : Rat) [(6, 2), (8, 2), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 2), (8, 2), (15, 2)],
  term (-22728 : Rat) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((42615 : Rat) / 2) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-42615 : Rat) / 4) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term (11364 : Rat) [(6, 2), (9, 2), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 2), (9, 2), (15, 2)],
  term ((14079 : Rat) / 4) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term (3470 : Rat) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-14079 : Rat) / 4) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term (54 : Rat) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term (-5682 : Rat) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term (216 : Rat) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term (-108 : Rat) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term (-27 : Rat) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term (2841 : Rat) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term (-675 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 4) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-49723 : Rat) / 4) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term (-22920 : Rat) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((9003 : Rat) / 2) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-110847 : Rat) / 8) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term (-27 : Rat) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((42975 : Rat) / 2) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 2) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((87687 : Rat) / 8) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-14079 : Rat) / 8) [(7, 1), (8, 2), (9, 1)],
  term ((14079 : Rat) / 8) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term (-1735 : Rat) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((459 : Rat) / 2) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((7365 : Rat) / 4) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-178599 : Rat) / 16) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((675 : Rat) / 2) [(7, 1), (8, 2), (11, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-15819 : Rat) / 8) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((49723 : Rat) / 8) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term (11460 : Rat) [(7, 1), (8, 2), (12, 2), (15, 1)],
  term ((-9003 : Rat) / 4) [(7, 1), (8, 2), (13, 1)],
  term ((110847 : Rat) / 16) [(7, 1), (8, 2), (15, 1)],
  term (-108 : Rat) [(7, 1), (8, 3), (11, 1)],
  term (-27 : Rat) [(7, 1), (8, 3), (13, 1)],
  term (2841 : Rat) [(7, 1), (8, 3), (15, 1)],
  term ((42975 : Rat) / 2) [(7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 2) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((87687 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term (-27 : Rat) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((15819 : Rat) / 4) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-49723 : Rat) / 4) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term (-22920 : Rat) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((9003 : Rat) / 2) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-110847 : Rat) / 8) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term (-675 : Rat) [(7, 1), (9, 1), (11, 2)],
  term (27 : Rat) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-14025 : Rat) / 4) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (9, 2), (10, 1), (12, 1), (15, 1)],
  term ((7149 : Rat) / 4) [(7, 1), (9, 2), (10, 1), (13, 1)],
  term ((-87687 : Rat) / 16) [(7, 1), (9, 2), (10, 1), (15, 1)],
  term ((15429 : Rat) / 4) [(7, 1), (9, 2), (11, 1)],
  term ((6913 : Rat) / 2) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((-15819 : Rat) / 8) [(7, 1), (9, 2), (12, 1), (13, 1)],
  term ((49723 : Rat) / 8) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term (11460 : Rat) [(7, 1), (9, 2), (12, 2), (15, 1)],
  term ((-9003 : Rat) / 4) [(7, 1), (9, 2), (13, 1)],
  term ((110847 : Rat) / 16) [(7, 1), (9, 2), (15, 1)],
  term ((-14079 : Rat) / 8) [(7, 1), (9, 3)],
  term ((14079 : Rat) / 8) [(7, 1), (9, 3), (10, 1)],
  term (-1735 : Rat) [(7, 1), (9, 3), (12, 1)],
  term (810 : Rat) [(7, 2), (8, 1), (10, 1)],
  term (864 : Rat) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term (-810 : Rat) [(7, 2), (8, 1), (10, 2)],
  term (-405 : Rat) [(7, 2), (8, 2)],
  term (405 : Rat) [(7, 2), (8, 2), (10, 1)],
  term (-432 : Rat) [(7, 2), (8, 2), (12, 1)],
  term (-810 : Rat) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term (810 : Rat) [(7, 2), (9, 1), (11, 1)],
  term (864 : Rat) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term (-405 : Rat) [(7, 2), (9, 2)],
  term (405 : Rat) [(7, 2), (9, 2), (10, 1)],
  term (-432 : Rat) [(7, 2), (9, 2), (12, 1)],
  term ((-11453 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1377 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-81639 : Rat) / 8) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((7761 : Rat) / 2) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-19401 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term (5730 : Rat) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term (-1052 : Rat) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 1), (11, 1)],
  term ((-2865 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 8) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 4) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term (-5730 : Rat) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term (1052 : Rat) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((881 : Rat) / 4) [(8, 1), (9, 2)],
  term (881 : Rat) [(8, 1), (9, 2), (10, 1)],
  term ((-881 : Rat) / 4) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term (-881 : Rat) [(8, 1), (9, 2), (10, 2)],
  term (2865 : Rat) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1553 : Rat) / 16) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term (-526 : Rat) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term (881 : Rat) [(8, 1), (9, 2), (11, 2)],
  term ((2865 : Rat) / 4) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1377 : Rat) / 8) [(8, 1), (9, 2), (13, 2)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 3), (11, 1)],
  term ((-881 : Rat) / 8) [(8, 1), (9, 3), (13, 1)],
  term ((37245 : Rat) / 2) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-54645 : Rat) / 16) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((92183 : Rat) / 8) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term (-27 : Rat) [(8, 1), (10, 1), (11, 2)],
  term ((-1683 : Rat) / 16) [(8, 1), (10, 1), (12, 1)],
  term ((-193815 : Rat) / 8) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((33451 : Rat) / 8) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((14325 : Rat) / 2) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((169341 : Rat) / 16) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((33015 : Rat) / 8) [(8, 1), (10, 1), (13, 2)],
  term (54 : Rat) [(8, 1), (10, 1), (14, 1)],
  term ((-38161 : Rat) / 8) [(8, 1), (10, 1), (15, 2)],
  term (881 : Rat) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term (-2865 : Rat) [(8, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((5495 : Rat) / 16) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term (526 : Rat) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((11453 : Rat) / 8) [(8, 2), (9, 1), (11, 1)],
  term ((1377 : Rat) / 8) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((81639 : Rat) / 16) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(8, 2), (9, 1), (12, 2), (15, 1)],
  term ((-7761 : Rat) / 4) [(8, 2), (9, 1), (13, 1)],
  term ((19401 : Rat) / 8) [(8, 2), (9, 1), (15, 1)],
  term ((-881 : Rat) / 2) [(8, 2), (9, 2)],
  term ((881 : Rat) / 2) [(8, 2), (9, 2), (10, 1)],
  term ((881 : Rat) / 8) [(8, 2), (9, 2), (12, 1)],
  term ((-881 : Rat) / 2) [(8, 2), (10, 1)],
  term (-5730 : Rat) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term (1052 : Rat) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 8) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 4) [(8, 2), (10, 1), (13, 2)],
  term ((-37245 : Rat) / 4) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((54645 : Rat) / 32) [(8, 2), (11, 1), (13, 1)],
  term ((-92183 : Rat) / 16) [(8, 2), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(8, 2), (11, 2)],
  term ((1683 : Rat) / 32) [(8, 2), (12, 1)],
  term ((193815 : Rat) / 16) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-33451 : Rat) / 16) [(8, 2), (12, 1), (15, 2)],
  term ((-14325 : Rat) / 4) [(8, 2), (12, 2), (15, 2)],
  term ((-169341 : Rat) / 32) [(8, 2), (13, 1), (15, 1)],
  term ((-33015 : Rat) / 16) [(8, 2), (13, 2)],
  term (-27 : Rat) [(8, 2), (14, 1)],
  term ((38161 : Rat) / 16) [(8, 2), (15, 2)],
  term ((881 : Rat) / 4) [(8, 3)],
  term ((-881 : Rat) / 2) [(8, 3), (9, 1), (11, 1)],
  term ((-881 : Rat) / 8) [(8, 3), (9, 1), (13, 1)],
  term (2865 : Rat) [(8, 3), (11, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(8, 3), (11, 1), (13, 1)],
  term (-526 : Rat) [(8, 3), (11, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(8, 3), (12, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(8, 3), (13, 1), (15, 1)],
  term ((-1377 : Rat) / 8) [(8, 3), (13, 2)],
  term ((-1683 : Rat) / 16) [(9, 1), (11, 1), (12, 1)],
  term ((-193815 : Rat) / 8) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((33451 : Rat) / 8) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((14325 : Rat) / 2) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((169341 : Rat) / 16) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((33015 : Rat) / 8) [(9, 1), (11, 1), (13, 2)],
  term (54 : Rat) [(9, 1), (11, 1), (14, 1)],
  term ((-38161 : Rat) / 8) [(9, 1), (11, 1), (15, 2)],
  term ((37245 : Rat) / 2) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-54645 : Rat) / 16) [(9, 1), (11, 2), (13, 1)],
  term ((92183 : Rat) / 8) [(9, 1), (11, 2), (15, 1)],
  term (-27 : Rat) [(9, 1), (11, 3)],
  term (5730 : Rat) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term (-1052 : Rat) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1377 : Rat) / 4) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-156129 : Rat) / 8) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((178821 : Rat) / 32) [(9, 2), (11, 1), (13, 1)],
  term ((-169787 : Rat) / 16) [(9, 2), (11, 1), (15, 1)],
  term ((-11399 : Rat) / 4) [(9, 2), (11, 2)],
  term ((1683 : Rat) / 32) [(9, 2), (12, 1)],
  term ((193815 : Rat) / 16) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-33451 : Rat) / 16) [(9, 2), (12, 1), (15, 2)],
  term ((-14325 : Rat) / 4) [(9, 2), (12, 2), (15, 2)],
  term ((-169341 : Rat) / 32) [(9, 2), (13, 1), (15, 1)],
  term ((-33015 : Rat) / 16) [(9, 2), (13, 2)],
  term (-27 : Rat) [(9, 2), (14, 1)],
  term ((38161 : Rat) / 16) [(9, 2), (15, 2)],
  term (-881 : Rat) [(9, 3), (10, 1), (11, 1)],
  term (-2865 : Rat) [(9, 3), (10, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(9, 3), (10, 1), (13, 1)],
  term (526 : Rat) [(9, 3), (10, 1), (15, 1)],
  term ((18501 : Rat) / 8) [(9, 3), (11, 1)],
  term ((-881 : Rat) / 4) [(9, 3), (11, 1), (12, 1)],
  term ((1377 : Rat) / 8) [(9, 3), (12, 1), (13, 1)],
  term ((81639 : Rat) / 16) [(9, 3), (12, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(9, 3), (12, 2), (15, 1)],
  term ((-7761 : Rat) / 4) [(9, 3), (13, 1)],
  term ((19401 : Rat) / 8) [(9, 3), (15, 1)],
  term ((-881 : Rat) / 2) [(9, 4)],
  term ((881 : Rat) / 2) [(9, 4), (10, 1)],
  term ((881 : Rat) / 8) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 200 through 273. -/
theorem ep_Q2_064_block_23_0200_0273_valid :
    checkProductSumEq ep_Q2_064_partials_23_0200_0273
      ep_Q2_064_block_23_0200_0273 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
