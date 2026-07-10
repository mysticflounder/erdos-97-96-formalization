/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 18:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_18_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0200 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 18. -/
def ep_Q1_028_partial_18_0200 : Poly :=
[
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 18. -/
theorem ep_Q1_028_partial_18_0200_valid :
    mulPoly ep_Q1_028_coefficient_18_0200
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0201 : Poly :=
[
  term (-448 : Rat) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 18. -/
def ep_Q1_028_partial_18_0201 : Poly :=
[
  term (-896 : Rat) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (448 : Rat) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 18. -/
theorem ep_Q1_028_partial_18_0201_valid :
    mulPoly ep_Q1_028_coefficient_18_0201
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0202 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 18. -/
def ep_Q1_028_partial_18_0202 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 18. -/
theorem ep_Q1_028_partial_18_0202_valid :
    mulPoly ep_Q1_028_coefficient_18_0202
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0203 : Poly :=
[
  term ((-112 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 203 for generator 18. -/
def ep_Q1_028_partial_18_0203 : Poly :=
[
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 18. -/
theorem ep_Q1_028_partial_18_0203_valid :
    mulPoly ep_Q1_028_coefficient_18_0203
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0204 : Poly :=
[
  term (-896 : Rat) [(5, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 18. -/
def ep_Q1_028_partial_18_0204 : Poly :=
[
  term (-1792 : Rat) [(5, 2), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (896 : Rat) [(5, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 18. -/
theorem ep_Q1_028_partial_18_0204_valid :
    mulPoly ep_Q1_028_coefficient_18_0204
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0205 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 18. -/
def ep_Q1_028_partial_18_0205 : Poly :=
[
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 18. -/
theorem ep_Q1_028_partial_18_0205_valid :
    mulPoly ep_Q1_028_coefficient_18_0205
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0206 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 206 for generator 18. -/
def ep_Q1_028_partial_18_0206 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 18. -/
theorem ep_Q1_028_partial_18_0206_valid :
    mulPoly ep_Q1_028_coefficient_18_0206
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0207 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 18. -/
def ep_Q1_028_partial_18_0207 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 18. -/
theorem ep_Q1_028_partial_18_0207_valid :
    mulPoly ep_Q1_028_coefficient_18_0207
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0208 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 208 for generator 18. -/
def ep_Q1_028_partial_18_0208 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 18. -/
theorem ep_Q1_028_partial_18_0208_valid :
    mulPoly ep_Q1_028_coefficient_18_0208
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0209 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 18. -/
def ep_Q1_028_partial_18_0209 : Poly :=
[
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 18. -/
theorem ep_Q1_028_partial_18_0209_valid :
    mulPoly ep_Q1_028_coefficient_18_0209
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0210 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 210 for generator 18. -/
def ep_Q1_028_partial_18_0210 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 18. -/
theorem ep_Q1_028_partial_18_0210_valid :
    mulPoly ep_Q1_028_coefficient_18_0210
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0211 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 18. -/
def ep_Q1_028_partial_18_0211 : Poly :=
[
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 18. -/
theorem ep_Q1_028_partial_18_0211_valid :
    mulPoly ep_Q1_028_coefficient_18_0211
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0212 : Poly :=
[
  term (224 : Rat) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 18. -/
def ep_Q1_028_partial_18_0212 : Poly :=
[
  term (448 : Rat) [(5, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-224 : Rat) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 18. -/
theorem ep_Q1_028_partial_18_0212_valid :
    mulPoly ep_Q1_028_coefficient_18_0212
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0213 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 18. -/
def ep_Q1_028_partial_18_0213 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 18. -/
theorem ep_Q1_028_partial_18_0213_valid :
    mulPoly ep_Q1_028_coefficient_18_0213
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0214 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 214 for generator 18. -/
def ep_Q1_028_partial_18_0214 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 18. -/
theorem ep_Q1_028_partial_18_0214_valid :
    mulPoly ep_Q1_028_coefficient_18_0214
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0215 : Poly :=
[
  term ((-112 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 18. -/
def ep_Q1_028_partial_18_0215 : Poly :=
[
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 18. -/
theorem ep_Q1_028_partial_18_0215_valid :
    mulPoly ep_Q1_028_coefficient_18_0215
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0216 : Poly :=
[
  term (896 : Rat) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 18. -/
def ep_Q1_028_partial_18_0216 : Poly :=
[
  term (1792 : Rat) [(5, 2), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term (-896 : Rat) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 18. -/
theorem ep_Q1_028_partial_18_0216_valid :
    mulPoly ep_Q1_028_coefficient_18_0216
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0217 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 18. -/
def ep_Q1_028_partial_18_0217 : Poly :=
[
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 18. -/
theorem ep_Q1_028_partial_18_0217_valid :
    mulPoly ep_Q1_028_coefficient_18_0217
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0218 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 18. -/
def ep_Q1_028_partial_18_0218 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 18. -/
theorem ep_Q1_028_partial_18_0218_valid :
    mulPoly ep_Q1_028_coefficient_18_0218
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0219 : Poly :=
[
  term ((-1120 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 18. -/
def ep_Q1_028_partial_18_0219 : Poly :=
[
  term ((-2240 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 18. -/
theorem ep_Q1_028_partial_18_0219_valid :
    mulPoly ep_Q1_028_coefficient_18_0219
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0220 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 220 for generator 18. -/
def ep_Q1_028_partial_18_0220 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 18. -/
theorem ep_Q1_028_partial_18_0220_valid :
    mulPoly ep_Q1_028_coefficient_18_0220
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0221 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 18. -/
def ep_Q1_028_partial_18_0221 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 18. -/
theorem ep_Q1_028_partial_18_0221_valid :
    mulPoly ep_Q1_028_coefficient_18_0221
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0222 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 18. -/
def ep_Q1_028_partial_18_0222 : Poly :=
[
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 18. -/
theorem ep_Q1_028_partial_18_0222_valid :
    mulPoly ep_Q1_028_coefficient_18_0222
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0223 : Poly :=
[
  term ((56 : Rat) / 3) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 18. -/
def ep_Q1_028_partial_18_0223 : Poly :=
[
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 18. -/
theorem ep_Q1_028_partial_18_0223_valid :
    mulPoly ep_Q1_028_coefficient_18_0223
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0224 : Poly :=
[
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 224 for generator 18. -/
def ep_Q1_028_partial_18_0224 : Poly :=
[
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((12544 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 18. -/
theorem ep_Q1_028_partial_18_0224_valid :
    mulPoly ep_Q1_028_coefficient_18_0224
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0225 : Poly :=
[
  term (-3136 : Rat) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 18. -/
def ep_Q1_028_partial_18_0225 : Poly :=
[
  term (3136 : Rat) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term (-6272 : Rat) [(5, 2), (7, 2), (8, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 18. -/
theorem ep_Q1_028_partial_18_0225_valid :
    mulPoly ep_Q1_028_coefficient_18_0225
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0226 : Poly :=
[
  term ((1568 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 18. -/
def ep_Q1_028_partial_18_0226 : Poly :=
[
  term ((-1568 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 18. -/
theorem ep_Q1_028_partial_18_0226_valid :
    mulPoly ep_Q1_028_coefficient_18_0226
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0227 : Poly :=
[
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 227 for generator 18. -/
def ep_Q1_028_partial_18_0227 : Poly :=
[
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 18. -/
theorem ep_Q1_028_partial_18_0227_valid :
    mulPoly ep_Q1_028_coefficient_18_0227
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0228 : Poly :=
[
  term ((-560 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 18. -/
def ep_Q1_028_partial_18_0228 : Poly :=
[
  term ((560 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 18. -/
theorem ep_Q1_028_partial_18_0228_valid :
    mulPoly ep_Q1_028_coefficient_18_0228
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0229 : Poly :=
[
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 229 for generator 18. -/
def ep_Q1_028_partial_18_0229 : Poly :=
[
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 18. -/
theorem ep_Q1_028_partial_18_0229_valid :
    mulPoly ep_Q1_028_coefficient_18_0229
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0230 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 18. -/
def ep_Q1_028_partial_18_0230 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 18. -/
theorem ep_Q1_028_partial_18_0230_valid :
    mulPoly ep_Q1_028_coefficient_18_0230
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0231 : Poly :=
[
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 231 for generator 18. -/
def ep_Q1_028_partial_18_0231 : Poly :=
[
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 2), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 18. -/
theorem ep_Q1_028_partial_18_0231_valid :
    mulPoly ep_Q1_028_coefficient_18_0231
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0232 : Poly :=
[
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 232 for generator 18. -/
def ep_Q1_028_partial_18_0232 : Poly :=
[
  term ((4480 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 18. -/
theorem ep_Q1_028_partial_18_0232_valid :
    mulPoly ep_Q1_028_coefficient_18_0232
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0233 : Poly :=
[
  term ((21056 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 233 for generator 18. -/
def ep_Q1_028_partial_18_0233 : Poly :=
[
  term ((42112 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-21056 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 18. -/
theorem ep_Q1_028_partial_18_0233_valid :
    mulPoly ep_Q1_028_coefficient_18_0233
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0234 : Poly :=
[
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 18. -/
def ep_Q1_028_partial_18_0234 : Poly :=
[
  term ((-12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 18. -/
theorem ep_Q1_028_partial_18_0234_valid :
    mulPoly ep_Q1_028_coefficient_18_0234
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0235 : Poly :=
[
  term (-7392 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 235 for generator 18. -/
def ep_Q1_028_partial_18_0235 : Poly :=
[
  term (-14784 : Rat) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term (7392 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 18. -/
theorem ep_Q1_028_partial_18_0235_valid :
    mulPoly ep_Q1_028_coefficient_18_0235
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0236 : Poly :=
[
  term ((6832 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 236 for generator 18. -/
def ep_Q1_028_partial_18_0236 : Poly :=
[
  term ((13664 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6832 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 18. -/
theorem ep_Q1_028_partial_18_0236_valid :
    mulPoly ep_Q1_028_coefficient_18_0236
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0237 : Poly :=
[
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 237 for generator 18. -/
def ep_Q1_028_partial_18_0237 : Poly :=
[
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 18. -/
theorem ep_Q1_028_partial_18_0237_valid :
    mulPoly ep_Q1_028_coefficient_18_0237
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0238 : Poly :=
[
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 18. -/
def ep_Q1_028_partial_18_0238 : Poly :=
[
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 18. -/
theorem ep_Q1_028_partial_18_0238_valid :
    mulPoly ep_Q1_028_coefficient_18_0238
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0239 : Poly :=
[
  term ((4928 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 18. -/
def ep_Q1_028_partial_18_0239 : Poly :=
[
  term ((9856 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 18. -/
theorem ep_Q1_028_partial_18_0239_valid :
    mulPoly ep_Q1_028_coefficient_18_0239
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0240 : Poly :=
[
  term ((-5824 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 240 for generator 18. -/
def ep_Q1_028_partial_18_0240 : Poly :=
[
  term ((-11648 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((5824 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 18. -/
theorem ep_Q1_028_partial_18_0240_valid :
    mulPoly ep_Q1_028_coefficient_18_0240
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0241 : Poly :=
[
  term (-1568 : Rat) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 241 for generator 18. -/
def ep_Q1_028_partial_18_0241 : Poly :=
[
  term (-3136 : Rat) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term (1568 : Rat) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 18. -/
theorem ep_Q1_028_partial_18_0241_valid :
    mulPoly ep_Q1_028_coefficient_18_0241
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0242 : Poly :=
[
  term ((784 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 18. -/
def ep_Q1_028_partial_18_0242 : Poly :=
[
  term ((1568 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-784 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 18. -/
theorem ep_Q1_028_partial_18_0242_valid :
    mulPoly ep_Q1_028_coefficient_18_0242
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0243 : Poly :=
[
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 243 for generator 18. -/
def ep_Q1_028_partial_18_0243 : Poly :=
[
  term ((-12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 18. -/
theorem ep_Q1_028_partial_18_0243_valid :
    mulPoly ep_Q1_028_coefficient_18_0243
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0244 : Poly :=
[
  term (3136 : Rat) [(5, 2), (7, 2), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 244 for generator 18. -/
def ep_Q1_028_partial_18_0244 : Poly :=
[
  term (6272 : Rat) [(5, 2), (7, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term (-3136 : Rat) [(5, 2), (7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 18. -/
theorem ep_Q1_028_partial_18_0244_valid :
    mulPoly ep_Q1_028_coefficient_18_0244
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0245 : Poly :=
[
  term ((-1568 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 245 for generator 18. -/
def ep_Q1_028_partial_18_0245 : Poly :=
[
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((1568 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 18. -/
theorem ep_Q1_028_partial_18_0245_valid :
    mulPoly ep_Q1_028_coefficient_18_0245
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0246 : Poly :=
[
  term (-2240 : Rat) [(5, 2), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 246 for generator 18. -/
def ep_Q1_028_partial_18_0246 : Poly :=
[
  term (-4480 : Rat) [(5, 2), (7, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (2240 : Rat) [(5, 2), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 18. -/
theorem ep_Q1_028_partial_18_0246_valid :
    mulPoly ep_Q1_028_coefficient_18_0246
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0247 : Poly :=
[
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 18. -/
def ep_Q1_028_partial_18_0247 : Poly :=
[
  term ((4480 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 18. -/
theorem ep_Q1_028_partial_18_0247_valid :
    mulPoly ep_Q1_028_coefficient_18_0247
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0248 : Poly :=
[
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 248 for generator 18. -/
def ep_Q1_028_partial_18_0248 : Poly :=
[
  term ((-12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 18. -/
theorem ep_Q1_028_partial_18_0248_valid :
    mulPoly ep_Q1_028_coefficient_18_0248
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0249 : Poly :=
[
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 249 for generator 18. -/
def ep_Q1_028_partial_18_0249 : Poly :=
[
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 18. -/
theorem ep_Q1_028_partial_18_0249_valid :
    mulPoly ep_Q1_028_coefficient_18_0249
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0250 : Poly :=
[
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (16, 1)]
]

/-- Partial product 250 for generator 18. -/
def ep_Q1_028_partial_18_0250 : Poly :=
[
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 18. -/
theorem ep_Q1_028_partial_18_0250_valid :
    mulPoly ep_Q1_028_coefficient_18_0250
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0251 : Poly :=
[
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 251 for generator 18. -/
def ep_Q1_028_partial_18_0251 : Poly :=
[
  term ((12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 18. -/
theorem ep_Q1_028_partial_18_0251_valid :
    mulPoly ep_Q1_028_coefficient_18_0251
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0252 : Poly :=
[
  term ((560 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 18. -/
def ep_Q1_028_partial_18_0252 : Poly :=
[
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-560 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 18. -/
theorem ep_Q1_028_partial_18_0252_valid :
    mulPoly ep_Q1_028_coefficient_18_0252
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0253 : Poly :=
[
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 18. -/
def ep_Q1_028_partial_18_0253 : Poly :=
[
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 18. -/
theorem ep_Q1_028_partial_18_0253_valid :
    mulPoly ep_Q1_028_coefficient_18_0253
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0254 : Poly :=
[
  term ((-280 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 18. -/
def ep_Q1_028_partial_18_0254 : Poly :=
[
  term ((-560 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((280 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 18. -/
theorem ep_Q1_028_partial_18_0254_valid :
    mulPoly ep_Q1_028_coefficient_18_0254
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0255 : Poly :=
[
  term (2240 : Rat) [(5, 2), (7, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 255 for generator 18. -/
def ep_Q1_028_partial_18_0255 : Poly :=
[
  term (4480 : Rat) [(5, 2), (7, 2), (8, 1), (11, 2), (12, 1), (16, 1)],
  term (-2240 : Rat) [(5, 2), (7, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 18. -/
theorem ep_Q1_028_partial_18_0255_valid :
    mulPoly ep_Q1_028_coefficient_18_0255
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0256 : Poly :=
[
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 256 for generator 18. -/
def ep_Q1_028_partial_18_0256 : Poly :=
[
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 18. -/
theorem ep_Q1_028_partial_18_0256_valid :
    mulPoly ep_Q1_028_coefficient_18_0256
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0257 : Poly :=
[
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (16, 1)]
]

/-- Partial product 257 for generator 18. -/
def ep_Q1_028_partial_18_0257 : Poly :=
[
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 2), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 18. -/
theorem ep_Q1_028_partial_18_0257_valid :
    mulPoly ep_Q1_028_coefficient_18_0257
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0258 : Poly :=
[
  term ((-3584 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 18. -/
def ep_Q1_028_partial_18_0258 : Poly :=
[
  term ((-7168 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 18. -/
theorem ep_Q1_028_partial_18_0258_valid :
    mulPoly ep_Q1_028_coefficient_18_0258
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0259 : Poly :=
[
  term (1568 : Rat) [(5, 2), (7, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 259 for generator 18. -/
def ep_Q1_028_partial_18_0259 : Poly :=
[
  term (3136 : Rat) [(5, 2), (7, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term (-1568 : Rat) [(5, 2), (7, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 18. -/
theorem ep_Q1_028_partial_18_0259_valid :
    mulPoly ep_Q1_028_coefficient_18_0259
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0260 : Poly :=
[
  term (-672 : Rat) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 260 for generator 18. -/
def ep_Q1_028_partial_18_0260 : Poly :=
[
  term (-1344 : Rat) [(5, 2), (7, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term (672 : Rat) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 18. -/
theorem ep_Q1_028_partial_18_0260_valid :
    mulPoly ep_Q1_028_coefficient_18_0260
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0261 : Poly :=
[
  term ((-1568 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (16, 1)]
]

/-- Partial product 261 for generator 18. -/
def ep_Q1_028_partial_18_0261 : Poly :=
[
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (12, 1), (16, 1)],
  term ((1568 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 18. -/
theorem ep_Q1_028_partial_18_0261_valid :
    mulPoly ep_Q1_028_coefficient_18_0261
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0262 : Poly :=
[
  term (672 : Rat) [(5, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 18. -/
def ep_Q1_028_partial_18_0262 : Poly :=
[
  term (1344 : Rat) [(5, 2), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-672 : Rat) [(5, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 18. -/
theorem ep_Q1_028_partial_18_0262_valid :
    mulPoly ep_Q1_028_coefficient_18_0262
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0263 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 18. -/
def ep_Q1_028_partial_18_0263 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 18. -/
theorem ep_Q1_028_partial_18_0263_valid :
    mulPoly ep_Q1_028_coefficient_18_0263
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0264 : Poly :=
[
  term ((3584 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 264 for generator 18. -/
def ep_Q1_028_partial_18_0264 : Poly :=
[
  term ((7168 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3584 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 18. -/
theorem ep_Q1_028_partial_18_0264_valid :
    mulPoly ep_Q1_028_coefficient_18_0264
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0265 : Poly :=
[
  term ((1568 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 265 for generator 18. -/
def ep_Q1_028_partial_18_0265 : Poly :=
[
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 2), (16, 1)],
  term ((-1568 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 18. -/
theorem ep_Q1_028_partial_18_0265_valid :
    mulPoly ep_Q1_028_coefficient_18_0265
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0266 : Poly :=
[
  term ((280 : Rat) / 3) [(5, 2), (7, 2), (14, 1), (16, 1)]
]

/-- Partial product 266 for generator 18. -/
def ep_Q1_028_partial_18_0266 : Poly :=
[
  term ((560 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-280 : Rat) / 3) [(5, 2), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 18. -/
theorem ep_Q1_028_partial_18_0266_valid :
    mulPoly ep_Q1_028_coefficient_18_0266
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0267 : Poly :=
[
  term ((-1232 : Rat) / 3) [(5, 2), (7, 2), (14, 2), (16, 1)]
]

/-- Partial product 267 for generator 18. -/
def ep_Q1_028_partial_18_0267 : Poly :=
[
  term ((-2464 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (14, 2), (16, 1)],
  term ((1232 : Rat) / 3) [(5, 2), (7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 18. -/
theorem ep_Q1_028_partial_18_0267_valid :
    mulPoly ep_Q1_028_coefficient_18_0267
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0268 : Poly :=
[
  term ((-256 : Rat) / 15) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 18. -/
def ep_Q1_028_partial_18_0268 : Poly :=
[
  term ((-512 : Rat) / 15) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 18. -/
theorem ep_Q1_028_partial_18_0268_valid :
    mulPoly ep_Q1_028_coefficient_18_0268
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0269 : Poly :=
[
  term ((2816 : Rat) / 15) [(6, 1), (7, 2), (14, 1), (16, 1)]
]

/-- Partial product 269 for generator 18. -/
def ep_Q1_028_partial_18_0269 : Poly :=
[
  term ((5632 : Rat) / 15) [(6, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(6, 1), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 18. -/
theorem ep_Q1_028_partial_18_0269_valid :
    mulPoly ep_Q1_028_coefficient_18_0269
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0270 : Poly :=
[
  term (-24 : Rat) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 270 for generator 18. -/
def ep_Q1_028_partial_18_0270 : Poly :=
[
  term (-48 : Rat) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 18. -/
theorem ep_Q1_028_partial_18_0270_valid :
    mulPoly ep_Q1_028_coefficient_18_0270
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0271 : Poly :=
[
  term ((448 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 18. -/
def ep_Q1_028_partial_18_0271 : Poly :=
[
  term ((-448 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 15) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 18. -/
theorem ep_Q1_028_partial_18_0271_valid :
    mulPoly ep_Q1_028_coefficient_18_0271
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0272 : Poly :=
[
  term ((-224 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 18. -/
def ep_Q1_028_partial_18_0272 : Poly :=
[
  term ((224 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 5) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 18. -/
theorem ep_Q1_028_partial_18_0272_valid :
    mulPoly ep_Q1_028_coefficient_18_0272
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0273 : Poly :=
[
  term ((112 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 273 for generator 18. -/
def ep_Q1_028_partial_18_0273 : Poly :=
[
  term ((-112 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 15) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 18. -/
theorem ep_Q1_028_partial_18_0273_valid :
    mulPoly ep_Q1_028_coefficient_18_0273
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0274 : Poly :=
[
  term ((584 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 18. -/
def ep_Q1_028_partial_18_0274 : Poly :=
[
  term ((-584 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1168 : Rat) / 15) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 18. -/
theorem ep_Q1_028_partial_18_0274_valid :
    mulPoly ep_Q1_028_coefficient_18_0274
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0275 : Poly :=
[
  term ((-16 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 275 for generator 18. -/
def ep_Q1_028_partial_18_0275 : Poly :=
[
  term ((16 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 18. -/
theorem ep_Q1_028_partial_18_0275_valid :
    mulPoly ep_Q1_028_coefficient_18_0275
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0276 : Poly :=
[
  term ((-124 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 276 for generator 18. -/
def ep_Q1_028_partial_18_0276 : Poly :=
[
  term ((124 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-248 : Rat) / 15) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 18. -/
theorem ep_Q1_028_partial_18_0276_valid :
    mulPoly ep_Q1_028_coefficient_18_0276
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0277 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 277 for generator 18. -/
def ep_Q1_028_partial_18_0277 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 18. -/
theorem ep_Q1_028_partial_18_0277_valid :
    mulPoly ep_Q1_028_coefficient_18_0277
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0278 : Poly :=
[
  term ((-496 : Rat) / 15) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 18. -/
def ep_Q1_028_partial_18_0278 : Poly :=
[
  term ((496 : Rat) / 15) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-992 : Rat) / 15) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 18. -/
theorem ep_Q1_028_partial_18_0278_valid :
    mulPoly ep_Q1_028_coefficient_18_0278
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0279 : Poly :=
[
  term ((16 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 279 for generator 18. -/
def ep_Q1_028_partial_18_0279 : Poly :=
[
  term ((-16 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 18. -/
theorem ep_Q1_028_partial_18_0279_valid :
    mulPoly ep_Q1_028_coefficient_18_0279
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0280 : Poly :=
[
  term ((64 : Rat) / 15) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 18. -/
def ep_Q1_028_partial_18_0280 : Poly :=
[
  term ((-64 : Rat) / 15) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 18. -/
theorem ep_Q1_028_partial_18_0280_valid :
    mulPoly ep_Q1_028_coefficient_18_0280
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0281 : Poly :=
[
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 281 for generator 18. -/
def ep_Q1_028_partial_18_0281 : Poly :=
[
  term ((-24 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 18. -/
theorem ep_Q1_028_partial_18_0281_valid :
    mulPoly ep_Q1_028_coefficient_18_0281
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0282 : Poly :=
[
  term ((224 : Rat) / 15) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 18. -/
def ep_Q1_028_partial_18_0282 : Poly :=
[
  term ((-224 : Rat) / 15) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 18. -/
theorem ep_Q1_028_partial_18_0282_valid :
    mulPoly ep_Q1_028_coefficient_18_0282
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0283 : Poly :=
[
  term ((-8 : Rat) / 5) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 18. -/
def ep_Q1_028_partial_18_0283 : Poly :=
[
  term ((8 : Rat) / 5) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 18. -/
theorem ep_Q1_028_partial_18_0283_valid :
    mulPoly ep_Q1_028_coefficient_18_0283
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0284 : Poly :=
[
  term ((96 : Rat) / 5) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 18. -/
def ep_Q1_028_partial_18_0284 : Poly :=
[
  term ((-96 : Rat) / 5) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 18. -/
theorem ep_Q1_028_partial_18_0284_valid :
    mulPoly ep_Q1_028_coefficient_18_0284
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0285 : Poly :=
[
  term ((496 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 18. -/
def ep_Q1_028_partial_18_0285 : Poly :=
[
  term ((992 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 18. -/
theorem ep_Q1_028_partial_18_0285_valid :
    mulPoly ep_Q1_028_coefficient_18_0285
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0286 : Poly :=
[
  term ((1504 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 18. -/
def ep_Q1_028_partial_18_0286 : Poly :=
[
  term ((3008 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1504 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 18. -/
theorem ep_Q1_028_partial_18_0286_valid :
    mulPoly ep_Q1_028_coefficient_18_0286
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0287 : Poly :=
[
  term ((16 : Rat) / 5) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 287 for generator 18. -/
def ep_Q1_028_partial_18_0287 : Poly :=
[
  term ((32 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 18. -/
theorem ep_Q1_028_partial_18_0287_valid :
    mulPoly ep_Q1_028_coefficient_18_0287
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0288 : Poly :=
[
  term ((-448 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 18. -/
def ep_Q1_028_partial_18_0288 : Poly :=
[
  term ((-896 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 18. -/
theorem ep_Q1_028_partial_18_0288_valid :
    mulPoly ep_Q1_028_coefficient_18_0288
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0289 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 289 for generator 18. -/
def ep_Q1_028_partial_18_0289 : Poly :=
[
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 18. -/
theorem ep_Q1_028_partial_18_0289_valid :
    mulPoly ep_Q1_028_coefficient_18_0289
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0290 : Poly :=
[
  term ((-696 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 18. -/
def ep_Q1_028_partial_18_0290 : Poly :=
[
  term ((-1392 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((696 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 18. -/
theorem ep_Q1_028_partial_18_0290_valid :
    mulPoly ep_Q1_028_coefficient_18_0290
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0291 : Poly :=
[
  term ((572 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 18. -/
def ep_Q1_028_partial_18_0291 : Poly :=
[
  term ((1144 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-572 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 18. -/
theorem ep_Q1_028_partial_18_0291_valid :
    mulPoly ep_Q1_028_coefficient_18_0291
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0292 : Poly :=
[
  term ((224 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 18. -/
def ep_Q1_028_partial_18_0292 : Poly :=
[
  term ((448 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 18. -/
theorem ep_Q1_028_partial_18_0292_valid :
    mulPoly ep_Q1_028_coefficient_18_0292
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0293 : Poly :=
[
  term ((-224 : Rat) / 15) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 18. -/
def ep_Q1_028_partial_18_0293 : Poly :=
[
  term ((-448 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 18. -/
theorem ep_Q1_028_partial_18_0293_valid :
    mulPoly ep_Q1_028_coefficient_18_0293
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0294 : Poly :=
[
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 294 for generator 18. -/
def ep_Q1_028_partial_18_0294 : Poly :=
[
  term ((-32 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 18. -/
theorem ep_Q1_028_partial_18_0294_valid :
    mulPoly ep_Q1_028_coefficient_18_0294
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0295 : Poly :=
[
  term ((352 : Rat) / 15) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 295 for generator 18. -/
def ep_Q1_028_partial_18_0295 : Poly :=
[
  term ((704 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 18. -/
theorem ep_Q1_028_partial_18_0295_valid :
    mulPoly ep_Q1_028_coefficient_18_0295
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0296 : Poly :=
[
  term ((-24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 296 for generator 18. -/
def ep_Q1_028_partial_18_0296 : Poly :=
[
  term ((-48 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 18. -/
theorem ep_Q1_028_partial_18_0296_valid :
    mulPoly ep_Q1_028_coefficient_18_0296
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0297 : Poly :=
[
  term ((-416 : Rat) / 15) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 18. -/
def ep_Q1_028_partial_18_0297 : Poly :=
[
  term ((-832 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416 : Rat) / 15) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 18. -/
theorem ep_Q1_028_partial_18_0297_valid :
    mulPoly ep_Q1_028_coefficient_18_0297
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0298 : Poly :=
[
  term ((-112 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 18. -/
def ep_Q1_028_partial_18_0298 : Poly :=
[
  term ((-224 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 18. -/
theorem ep_Q1_028_partial_18_0298_valid :
    mulPoly ep_Q1_028_coefficient_18_0298
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0299 : Poly :=
[
  term ((-96 : Rat) / 5) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 299 for generator 18. -/
def ep_Q1_028_partial_18_0299 : Poly :=
[
  term ((-192 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 18. -/
theorem ep_Q1_028_partial_18_0299_valid :
    mulPoly ep_Q1_028_coefficient_18_0299
        ep_Q1_028_generator_18_0200_0299 =
      ep_Q1_028_partial_18_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_18_0200_0299 : List Poly :=
[
  ep_Q1_028_partial_18_0200,
  ep_Q1_028_partial_18_0201,
  ep_Q1_028_partial_18_0202,
  ep_Q1_028_partial_18_0203,
  ep_Q1_028_partial_18_0204,
  ep_Q1_028_partial_18_0205,
  ep_Q1_028_partial_18_0206,
  ep_Q1_028_partial_18_0207,
  ep_Q1_028_partial_18_0208,
  ep_Q1_028_partial_18_0209,
  ep_Q1_028_partial_18_0210,
  ep_Q1_028_partial_18_0211,
  ep_Q1_028_partial_18_0212,
  ep_Q1_028_partial_18_0213,
  ep_Q1_028_partial_18_0214,
  ep_Q1_028_partial_18_0215,
  ep_Q1_028_partial_18_0216,
  ep_Q1_028_partial_18_0217,
  ep_Q1_028_partial_18_0218,
  ep_Q1_028_partial_18_0219,
  ep_Q1_028_partial_18_0220,
  ep_Q1_028_partial_18_0221,
  ep_Q1_028_partial_18_0222,
  ep_Q1_028_partial_18_0223,
  ep_Q1_028_partial_18_0224,
  ep_Q1_028_partial_18_0225,
  ep_Q1_028_partial_18_0226,
  ep_Q1_028_partial_18_0227,
  ep_Q1_028_partial_18_0228,
  ep_Q1_028_partial_18_0229,
  ep_Q1_028_partial_18_0230,
  ep_Q1_028_partial_18_0231,
  ep_Q1_028_partial_18_0232,
  ep_Q1_028_partial_18_0233,
  ep_Q1_028_partial_18_0234,
  ep_Q1_028_partial_18_0235,
  ep_Q1_028_partial_18_0236,
  ep_Q1_028_partial_18_0237,
  ep_Q1_028_partial_18_0238,
  ep_Q1_028_partial_18_0239,
  ep_Q1_028_partial_18_0240,
  ep_Q1_028_partial_18_0241,
  ep_Q1_028_partial_18_0242,
  ep_Q1_028_partial_18_0243,
  ep_Q1_028_partial_18_0244,
  ep_Q1_028_partial_18_0245,
  ep_Q1_028_partial_18_0246,
  ep_Q1_028_partial_18_0247,
  ep_Q1_028_partial_18_0248,
  ep_Q1_028_partial_18_0249,
  ep_Q1_028_partial_18_0250,
  ep_Q1_028_partial_18_0251,
  ep_Q1_028_partial_18_0252,
  ep_Q1_028_partial_18_0253,
  ep_Q1_028_partial_18_0254,
  ep_Q1_028_partial_18_0255,
  ep_Q1_028_partial_18_0256,
  ep_Q1_028_partial_18_0257,
  ep_Q1_028_partial_18_0258,
  ep_Q1_028_partial_18_0259,
  ep_Q1_028_partial_18_0260,
  ep_Q1_028_partial_18_0261,
  ep_Q1_028_partial_18_0262,
  ep_Q1_028_partial_18_0263,
  ep_Q1_028_partial_18_0264,
  ep_Q1_028_partial_18_0265,
  ep_Q1_028_partial_18_0266,
  ep_Q1_028_partial_18_0267,
  ep_Q1_028_partial_18_0268,
  ep_Q1_028_partial_18_0269,
  ep_Q1_028_partial_18_0270,
  ep_Q1_028_partial_18_0271,
  ep_Q1_028_partial_18_0272,
  ep_Q1_028_partial_18_0273,
  ep_Q1_028_partial_18_0274,
  ep_Q1_028_partial_18_0275,
  ep_Q1_028_partial_18_0276,
  ep_Q1_028_partial_18_0277,
  ep_Q1_028_partial_18_0278,
  ep_Q1_028_partial_18_0279,
  ep_Q1_028_partial_18_0280,
  ep_Q1_028_partial_18_0281,
  ep_Q1_028_partial_18_0282,
  ep_Q1_028_partial_18_0283,
  ep_Q1_028_partial_18_0284,
  ep_Q1_028_partial_18_0285,
  ep_Q1_028_partial_18_0286,
  ep_Q1_028_partial_18_0287,
  ep_Q1_028_partial_18_0288,
  ep_Q1_028_partial_18_0289,
  ep_Q1_028_partial_18_0290,
  ep_Q1_028_partial_18_0291,
  ep_Q1_028_partial_18_0292,
  ep_Q1_028_partial_18_0293,
  ep_Q1_028_partial_18_0294,
  ep_Q1_028_partial_18_0295,
  ep_Q1_028_partial_18_0296,
  ep_Q1_028_partial_18_0297,
  ep_Q1_028_partial_18_0298,
  ep_Q1_028_partial_18_0299
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_18_0200_0299 : Poly :=
[
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-896 : Rat) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term (-1792 : Rat) [(5, 2), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (448 : Rat) [(5, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term (1792 : Rat) [(5, 2), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (448 : Rat) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term (896 : Rat) [(5, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-224 : Rat) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-896 : Rat) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((4480 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((42112 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-14784 : Rat) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((13664 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((9856 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11648 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term (6272 : Rat) [(5, 2), (7, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term (-4480 : Rat) [(5, 2), (7, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4480 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((12544 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (4480 : Rat) [(5, 2), (7, 2), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-7168 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (3136 : Rat) [(5, 2), (7, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term (-1344 : Rat) [(5, 2), (7, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (12, 1), (16, 1)],
  term (1344 : Rat) [(5, 2), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((560 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-2464 : Rat) / 3) [(5, 2), (7, 2), (8, 1), (14, 2), (16, 1)],
  term ((12544 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term (-6272 : Rat) [(5, 2), (7, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (11, 2), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (8, 2), (13, 2), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-21056 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (7392 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6832 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4928 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5824 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (1568 : Rat) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-784 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term (-3136 : Rat) [(5, 2), (7, 2), (9, 2), (12, 1), (16, 1)],
  term ((1568 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (14, 1), (16, 1)],
  term (2240 : Rat) [(5, 2), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (10, 1), (16, 1)],
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-560 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((280 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (-2240 : Rat) [(5, 2), (7, 2), (11, 2), (12, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-1568 : Rat) [(5, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term (672 : Rat) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1568 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (16, 1)],
  term (-672 : Rat) [(5, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1568 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (16, 1)],
  term ((-280 : Rat) / 3) [(5, 2), (7, 2), (14, 1), (16, 1)],
  term ((1232 : Rat) / 3) [(5, 2), (7, 2), (14, 2), (16, 1)],
  term ((-512 : Rat) / 15) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5632 : Rat) / 15) [(6, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term (-48 : Rat) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (14, 1), (16, 1)],
  term ((992 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3008 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-896 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1392 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1144 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((704 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-832 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-112 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-584 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((124 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((496 : Rat) / 15) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 15) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 5) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((1168 : Rat) / 15) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-992 : Rat) / 15) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1504 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((696 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-572 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-352 : Rat) / 15) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((416 : Rat) / 15) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 200 through 299. -/
theorem ep_Q1_028_block_18_0200_0299_valid :
    checkProductSumEq ep_Q1_028_partials_18_0200_0299
      ep_Q1_028_block_18_0200_0299 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
