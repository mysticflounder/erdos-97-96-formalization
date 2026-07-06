/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 20:200-225

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 20 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_20_0200_0225 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0200 : Poly :=
[
  term ((-10923 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 200 for generator 20. -/
def ep_Q2_074_partial_20_0200 : Poly :=
[
  term ((-21846 : Rat) / 769) [(4, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-21846 : Rat) / 769) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((10923 : Rat) / 769) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((10923 : Rat) / 769) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 20. -/
theorem ep_Q2_074_partial_20_0200_valid :
    mulPoly ep_Q2_074_coefficient_20_0200
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0201 : Poly :=
[
  term ((-22464 : Rat) / 769) [(4, 1), (10, 2), (16, 1)]
]

/-- Partial product 201 for generator 20. -/
def ep_Q2_074_partial_20_0201 : Poly :=
[
  term ((-44928 : Rat) / 769) [(4, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-44928 : Rat) / 769) [(4, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(4, 1), (10, 2), (12, 2), (16, 1)],
  term ((22464 : Rat) / 769) [(4, 1), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 20. -/
theorem ep_Q2_074_partial_20_0201_valid :
    mulPoly ep_Q2_074_coefficient_20_0201
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0202 : Poly :=
[
  term ((-36333 : Rat) / 1538) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 202 for generator 20. -/
def ep_Q2_074_partial_20_0202 : Poly :=
[
  term ((-36333 : Rat) / 769) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((-36333 : Rat) / 769) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((36333 : Rat) / 1538) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((36333 : Rat) / 1538) [(4, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 20. -/
theorem ep_Q2_074_partial_20_0202_valid :
    mulPoly ep_Q2_074_coefficient_20_0202
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0203 : Poly :=
[
  term ((-36459 : Rat) / 769) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 20. -/
def ep_Q2_074_partial_20_0203 : Poly :=
[
  term ((-72918 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 20. -/
theorem ep_Q2_074_partial_20_0203_valid :
    mulPoly ep_Q2_074_coefficient_20_0203
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0204 : Poly :=
[
  term ((-5994 : Rat) / 769) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 204 for generator 20. -/
def ep_Q2_074_partial_20_0204 : Poly :=
[
  term ((-11988 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11988 : Rat) / 769) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 20. -/
theorem ep_Q2_074_partial_20_0204_valid :
    mulPoly ep_Q2_074_coefficient_20_0204
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0205 : Poly :=
[
  term ((-9762 : Rat) / 769) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 20. -/
def ep_Q2_074_partial_20_0205 : Poly :=
[
  term ((-19524 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19524 : Rat) / 769) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((9762 : Rat) / 769) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((9762 : Rat) / 769) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 20. -/
theorem ep_Q2_074_partial_20_0205_valid :
    mulPoly ep_Q2_074_coefficient_20_0205
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0206 : Poly :=
[
  term ((37656 : Rat) / 769) [(4, 1), (16, 1)]
]

/-- Partial product 206 for generator 20. -/
def ep_Q2_074_partial_20_0206 : Poly :=
[
  term ((75312 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((75312 : Rat) / 769) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-37656 : Rat) / 769) [(4, 1), (12, 2), (16, 1)],
  term ((-37656 : Rat) / 769) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 20. -/
theorem ep_Q2_074_partial_20_0206_valid :
    mulPoly ep_Q2_074_coefficient_20_0206
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0207 : Poly :=
[
  term ((32703 : Rat) / 769) [(4, 2), (10, 1), (16, 1)]
]

/-- Partial product 207 for generator 20. -/
def ep_Q2_074_partial_20_0207 : Poly :=
[
  term ((65406 : Rat) / 769) [(4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((65406 : Rat) / 769) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-32703 : Rat) / 769) [(4, 2), (10, 1), (12, 2), (16, 1)],
  term ((-32703 : Rat) / 769) [(4, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 20. -/
theorem ep_Q2_074_partial_20_0207_valid :
    mulPoly ep_Q2_074_coefficient_20_0207
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0208 : Poly :=
[
  term ((-21156 : Rat) / 769) [(4, 2), (16, 1)]
]

/-- Partial product 208 for generator 20. -/
def ep_Q2_074_partial_20_0208 : Poly :=
[
  term ((-42312 : Rat) / 769) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((-42312 : Rat) / 769) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((21156 : Rat) / 769) [(4, 2), (12, 2), (16, 1)],
  term ((21156 : Rat) / 769) [(4, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 20. -/
theorem ep_Q2_074_partial_20_0208_valid :
    mulPoly ep_Q2_074_coefficient_20_0208
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0209 : Poly :=
[
  term ((-12399 : Rat) / 1538) [(4, 3), (16, 1)]
]

/-- Partial product 209 for generator 20. -/
def ep_Q2_074_partial_20_0209 : Poly :=
[
  term ((-12399 : Rat) / 769) [(4, 3), (8, 1), (12, 1), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 3), (9, 1), (13, 1), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 3), (12, 2), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 20. -/
theorem ep_Q2_074_partial_20_0209_valid :
    mulPoly ep_Q2_074_coefficient_20_0209
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0210 : Poly :=
[
  term ((-5901 : Rat) / 769) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 210 for generator 20. -/
def ep_Q2_074_partial_20_0210 : Poly :=
[
  term ((-11802 : Rat) / 769) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-11802 : Rat) / 769) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 20. -/
theorem ep_Q2_074_partial_20_0210_valid :
    mulPoly ep_Q2_074_coefficient_20_0210
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0211 : Poly :=
[
  term ((-22464 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 211 for generator 20. -/
def ep_Q2_074_partial_20_0211 : Poly :=
[
  term ((-44928 : Rat) / 769) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-44928 : Rat) / 769) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 20. -/
theorem ep_Q2_074_partial_20_0211_valid :
    mulPoly ep_Q2_074_coefficient_20_0211
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0212 : Poly :=
[
  term ((46944 : Rat) / 769) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 212 for generator 20. -/
def ep_Q2_074_partial_20_0212 : Poly :=
[
  term ((93888 : Rat) / 769) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((93888 : Rat) / 769) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-46944 : Rat) / 769) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-46944 : Rat) / 769) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 20. -/
theorem ep_Q2_074_partial_20_0212_valid :
    mulPoly ep_Q2_074_coefficient_20_0212
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0213 : Poly :=
[
  term ((-6801 : Rat) / 769) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 20. -/
def ep_Q2_074_partial_20_0213 : Poly :=
[
  term ((-13602 : Rat) / 769) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13602 : Rat) / 769) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6801 : Rat) / 769) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((6801 : Rat) / 769) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 20. -/
theorem ep_Q2_074_partial_20_0213_valid :
    mulPoly ep_Q2_074_coefficient_20_0213
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0214 : Poly :=
[
  term ((11232 : Rat) / 769) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 214 for generator 20. -/
def ep_Q2_074_partial_20_0214 : Poly :=
[
  term ((22464 : Rat) / 769) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11232 : Rat) / 769) [(5, 2), (10, 1), (12, 2), (16, 1)],
  term ((-11232 : Rat) / 769) [(5, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 20. -/
theorem ep_Q2_074_partial_20_0214_valid :
    mulPoly ep_Q2_074_coefficient_20_0214
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0215 : Poly :=
[
  term ((-7590 : Rat) / 769) [(5, 2), (16, 1)]
]

/-- Partial product 215 for generator 20. -/
def ep_Q2_074_partial_20_0215 : Poly :=
[
  term ((-15180 : Rat) / 769) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-15180 : Rat) / 769) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((7590 : Rat) / 769) [(5, 2), (12, 2), (16, 1)],
  term ((7590 : Rat) / 769) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 20. -/
theorem ep_Q2_074_partial_20_0215_valid :
    mulPoly ep_Q2_074_coefficient_20_0215
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0216 : Poly :=
[
  term ((-27179 : Rat) / 1538) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 20. -/
def ep_Q2_074_partial_20_0216 : Poly :=
[
  term ((-27179 : Rat) / 769) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27179 : Rat) / 769) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27179 : Rat) / 1538) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((27179 : Rat) / 1538) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 20. -/
theorem ep_Q2_074_partial_20_0216_valid :
    mulPoly ep_Q2_074_coefficient_20_0216
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0217 : Poly :=
[
  term ((27288 : Rat) / 769) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 217 for generator 20. -/
def ep_Q2_074_partial_20_0217 : Poly :=
[
  term ((54576 : Rat) / 769) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((54576 : Rat) / 769) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-27288 : Rat) / 769) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 20. -/
theorem ep_Q2_074_partial_20_0217_valid :
    mulPoly ep_Q2_074_coefficient_20_0217
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0218 : Poly :=
[
  term ((54576 : Rat) / 769) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 20. -/
def ep_Q2_074_partial_20_0218 : Poly :=
[
  term ((109152 : Rat) / 769) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 20. -/
theorem ep_Q2_074_partial_20_0218_valid :
    mulPoly ep_Q2_074_coefficient_20_0218
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0219 : Poly :=
[
  term ((-164229 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 219 for generator 20. -/
def ep_Q2_074_partial_20_0219 : Poly :=
[
  term ((-328458 : Rat) / 769) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-328458 : Rat) / 769) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((164229 : Rat) / 769) [(10, 1), (12, 2), (16, 1)],
  term ((164229 : Rat) / 769) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 20. -/
theorem ep_Q2_074_partial_20_0219_valid :
    mulPoly ep_Q2_074_coefficient_20_0219
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0220 : Poly :=
[
  term ((77040 : Rat) / 769) [(10, 2), (16, 1)]
]

/-- Partial product 220 for generator 20. -/
def ep_Q2_074_partial_20_0220 : Poly :=
[
  term ((154080 : Rat) / 769) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((154080 : Rat) / 769) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-77040 : Rat) / 769) [(10, 2), (12, 2), (16, 1)],
  term ((-77040 : Rat) / 769) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 20. -/
theorem ep_Q2_074_partial_20_0220_valid :
    mulPoly ep_Q2_074_coefficient_20_0220
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0221 : Poly :=
[
  term ((-137211 : Rat) / 1538) [(12, 1), (16, 1)]
]

/-- Partial product 221 for generator 20. -/
def ep_Q2_074_partial_20_0221 : Poly :=
[
  term ((-137211 : Rat) / 769) [(8, 1), (12, 2), (16, 1)],
  term ((-137211 : Rat) / 769) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((137211 : Rat) / 1538) [(12, 1), (13, 2), (16, 1)],
  term ((137211 : Rat) / 1538) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 20. -/
theorem ep_Q2_074_partial_20_0221_valid :
    mulPoly ep_Q2_074_coefficient_20_0221
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0222 : Poly :=
[
  term ((-74004 : Rat) / 769) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 20. -/
def ep_Q2_074_partial_20_0222 : Poly :=
[
  term ((-148008 : Rat) / 769) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148008 : Rat) / 769) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((74004 : Rat) / 769) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((74004 : Rat) / 769) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 20. -/
theorem ep_Q2_074_partial_20_0222_valid :
    mulPoly ep_Q2_074_coefficient_20_0222
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0223 : Poly :=
[
  term ((7695 : Rat) / 769) [(14, 1), (16, 1)]
]

/-- Partial product 223 for generator 20. -/
def ep_Q2_074_partial_20_0223 : Poly :=
[
  term ((15390 : Rat) / 769) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((15390 : Rat) / 769) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(12, 2), (14, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 20. -/
theorem ep_Q2_074_partial_20_0223_valid :
    mulPoly ep_Q2_074_coefficient_20_0223
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0224 : Poly :=
[
  term ((-105859 : Rat) / 3076) [(15, 2), (16, 1)]
]

/-- Partial product 224 for generator 20. -/
def ep_Q2_074_partial_20_0224 : Poly :=
[
  term ((-105859 : Rat) / 1538) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-105859 : Rat) / 1538) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((105859 : Rat) / 3076) [(12, 2), (15, 2), (16, 1)],
  term ((105859 : Rat) / 3076) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 20. -/
theorem ep_Q2_074_partial_20_0224_valid :
    mulPoly ep_Q2_074_coefficient_20_0224
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 20. -/
def ep_Q2_074_coefficient_20_0225 : Poly :=
[
  term ((1336119 : Rat) / 12304) [(16, 1)]
]

/-- Partial product 225 for generator 20. -/
def ep_Q2_074_partial_20_0225 : Poly :=
[
  term ((1336119 : Rat) / 6152) [(8, 1), (12, 1), (16, 1)],
  term ((1336119 : Rat) / 6152) [(9, 1), (13, 1), (16, 1)],
  term ((-1336119 : Rat) / 12304) [(12, 2), (16, 1)],
  term ((-1336119 : Rat) / 12304) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 20. -/
theorem ep_Q2_074_partial_20_0225_valid :
    mulPoly ep_Q2_074_coefficient_20_0225
        ep_Q2_074_generator_20_0200_0225 =
      ep_Q2_074_partial_20_0225 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_20_0200_0225 : List Poly :=
[
  ep_Q2_074_partial_20_0200,
  ep_Q2_074_partial_20_0201,
  ep_Q2_074_partial_20_0202,
  ep_Q2_074_partial_20_0203,
  ep_Q2_074_partial_20_0204,
  ep_Q2_074_partial_20_0205,
  ep_Q2_074_partial_20_0206,
  ep_Q2_074_partial_20_0207,
  ep_Q2_074_partial_20_0208,
  ep_Q2_074_partial_20_0209,
  ep_Q2_074_partial_20_0210,
  ep_Q2_074_partial_20_0211,
  ep_Q2_074_partial_20_0212,
  ep_Q2_074_partial_20_0213,
  ep_Q2_074_partial_20_0214,
  ep_Q2_074_partial_20_0215,
  ep_Q2_074_partial_20_0216,
  ep_Q2_074_partial_20_0217,
  ep_Q2_074_partial_20_0218,
  ep_Q2_074_partial_20_0219,
  ep_Q2_074_partial_20_0220,
  ep_Q2_074_partial_20_0221,
  ep_Q2_074_partial_20_0222,
  ep_Q2_074_partial_20_0223,
  ep_Q2_074_partial_20_0224,
  ep_Q2_074_partial_20_0225
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_20_0200_0225 : Poly :=
[
  term ((-21846 : Rat) / 769) [(4, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-44928 : Rat) / 769) [(4, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11988 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19524 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((75312 : Rat) / 769) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36333 : Rat) / 769) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((-21846 : Rat) / 769) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-44928 : Rat) / 769) [(4, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-36333 : Rat) / 769) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11988 : Rat) / 769) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19524 : Rat) / 769) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((75312 : Rat) / 769) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((10923 : Rat) / 769) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((10923 : Rat) / 769) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((22464 : Rat) / 769) [(4, 1), (10, 2), (12, 2), (16, 1)],
  term ((22464 : Rat) / 769) [(4, 1), (10, 2), (13, 2), (16, 1)],
  term ((36333 : Rat) / 1538) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((9762 : Rat) / 769) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-37656 : Rat) / 769) [(4, 1), (12, 2), (16, 1)],
  term ((36333 : Rat) / 1538) [(4, 1), (12, 3), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((9762 : Rat) / 769) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-37656 : Rat) / 769) [(4, 1), (13, 2), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((65406 : Rat) / 769) [(4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-42312 : Rat) / 769) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((65406 : Rat) / 769) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-42312 : Rat) / 769) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-32703 : Rat) / 769) [(4, 2), (10, 1), (12, 2), (16, 1)],
  term ((-32703 : Rat) / 769) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((21156 : Rat) / 769) [(4, 2), (12, 2), (16, 1)],
  term ((21156 : Rat) / 769) [(4, 2), (13, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 3), (8, 1), (12, 1), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 3), (9, 1), (13, 1), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 3), (12, 2), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 3), (13, 2), (16, 1)],
  term ((-11802 : Rat) / 769) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-11802 : Rat) / 769) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-44928 : Rat) / 769) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((93888 : Rat) / 769) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-13602 : Rat) / 769) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-44928 : Rat) / 769) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((93888 : Rat) / 769) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13602 : Rat) / 769) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-46944 : Rat) / 769) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-46944 : Rat) / 769) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((6801 : Rat) / 769) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((6801 : Rat) / 769) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-15180 : Rat) / 769) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-15180 : Rat) / 769) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-11232 : Rat) / 769) [(5, 2), (10, 1), (12, 2), (16, 1)],
  term ((-11232 : Rat) / 769) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((7590 : Rat) / 769) [(5, 2), (12, 2), (16, 1)],
  term ((7590 : Rat) / 769) [(5, 2), (13, 2), (16, 1)],
  term ((-27179 : Rat) / 769) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27179 : Rat) / 769) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27179 : Rat) / 1538) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((27179 : Rat) / 1538) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-328458 : Rat) / 769) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((154080 : Rat) / 769) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-148008 : Rat) / 769) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15390 : Rat) / 769) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-105859 : Rat) / 1538) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1336119 : Rat) / 6152) [(8, 1), (12, 1), (16, 1)],
  term ((-137211 : Rat) / 769) [(8, 1), (12, 2), (16, 1)],
  term ((54576 : Rat) / 769) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-328458 : Rat) / 769) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((154080 : Rat) / 769) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-137211 : Rat) / 769) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((15390 : Rat) / 769) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-105859 : Rat) / 1538) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1336119 : Rat) / 6152) [(9, 1), (13, 1), (16, 1)],
  term ((-148008 : Rat) / 769) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((164229 : Rat) / 769) [(10, 1), (12, 2), (16, 1)],
  term ((-27288 : Rat) / 769) [(10, 1), (12, 3), (16, 1)],
  term ((164229 : Rat) / 769) [(10, 1), (13, 2), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-77040 : Rat) / 769) [(10, 2), (12, 2), (16, 1)],
  term ((-77040 : Rat) / 769) [(10, 2), (13, 2), (16, 1)],
  term ((137211 : Rat) / 1538) [(12, 1), (13, 2), (16, 1)],
  term ((74004 : Rat) / 769) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(12, 2), (14, 1), (16, 1)],
  term ((105859 : Rat) / 3076) [(12, 2), (15, 2), (16, 1)],
  term ((-1336119 : Rat) / 12304) [(12, 2), (16, 1)],
  term ((137211 : Rat) / 1538) [(12, 3), (16, 1)],
  term ((-7695 : Rat) / 769) [(13, 2), (14, 1), (16, 1)],
  term ((105859 : Rat) / 3076) [(13, 2), (15, 2), (16, 1)],
  term ((-1336119 : Rat) / 12304) [(13, 2), (16, 1)],
  term ((74004 : Rat) / 769) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 200 through 225. -/
theorem ep_Q2_074_block_20_0200_0225_valid :
    checkProductSumEq ep_Q2_074_partials_20_0200_0225
      ep_Q2_074_block_20_0200_0225 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
