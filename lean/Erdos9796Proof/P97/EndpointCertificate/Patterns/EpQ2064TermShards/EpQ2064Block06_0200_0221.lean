/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 6:200-221

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 6 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_06_0200_0221 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0200 : Poly :=
[
  term ((-4725 : Rat) / 16) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 200 for generator 6. -/
def ep_Q2_064_partial_06_0200 : Poly :=
[
  term ((4725 : Rat) / 8) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-4725 : Rat) / 16) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-4725 : Rat) / 16) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-4725 : Rat) / 8) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((4725 : Rat) / 16) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((4725 : Rat) / 16) [(5, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 6. -/
theorem ep_Q2_064_partial_06_0200_valid :
    mulPoly ep_Q2_064_coefficient_06_0200
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0201 : Poly :=
[
  term ((-36183 : Rat) / 16) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 201 for generator 6. -/
def ep_Q2_064_partial_06_0201 : Poly :=
[
  term ((36183 : Rat) / 8) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-36183 : Rat) / 16) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-36183 : Rat) / 16) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-36183 : Rat) / 8) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((36183 : Rat) / 16) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((36183 : Rat) / 16) [(5, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 6. -/
theorem ep_Q2_064_partial_06_0201_valid :
    mulPoly ep_Q2_064_coefficient_06_0201
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0202 : Poly :=
[
  term ((14325 : Rat) / 4) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 202 for generator 6. -/
def ep_Q2_064_partial_06_0202 : Poly :=
[
  term ((-14325 : Rat) / 2) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((14325 : Rat) / 4) [(0, 2), (9, 1), (12, 2), (15, 1)],
  term ((14325 : Rat) / 4) [(1, 2), (9, 1), (12, 2), (15, 1)],
  term ((14325 : Rat) / 2) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((-14325 : Rat) / 4) [(4, 2), (9, 1), (12, 2), (15, 1)],
  term ((-14325 : Rat) / 4) [(5, 2), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 6. -/
theorem ep_Q2_064_partial_06_0202_valid :
    mulPoly ep_Q2_064_coefficient_06_0202
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0203 : Poly :=
[
  term ((1971 : Rat) / 16) [(9, 1), (13, 1)]
]

/-- Partial product 203 for generator 6. -/
def ep_Q2_064_partial_06_0203 : Poly :=
[
  term ((-1971 : Rat) / 8) [(0, 1), (9, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(0, 2), (9, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(1, 2), (9, 1), (13, 1)],
  term ((1971 : Rat) / 8) [(4, 1), (9, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(4, 2), (9, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 6. -/
theorem ep_Q2_064_partial_06_0203_valid :
    mulPoly ep_Q2_064_coefficient_06_0203
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0204 : Poly :=
[
  term ((6167 : Rat) / 8) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 204 for generator 6. -/
def ep_Q2_064_partial_06_0204 : Poly :=
[
  term ((-6167 : Rat) / 4) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((6167 : Rat) / 8) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((6167 : Rat) / 8) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((6167 : Rat) / 4) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-6167 : Rat) / 8) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-6167 : Rat) / 8) [(5, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 6. -/
theorem ep_Q2_064_partial_06_0204_valid :
    mulPoly ep_Q2_064_coefficient_06_0204
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0205 : Poly :=
[
  term (24 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 205 for generator 6. -/
def ep_Q2_064_partial_06_0205 : Poly :=
[
  term (-48 : Rat) [(0, 1), (9, 1), (15, 1)],
  term (24 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (24 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (48 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (-24 : Rat) [(4, 2), (9, 1), (15, 1)],
  term (-24 : Rat) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 6. -/
theorem ep_Q2_064_partial_06_0205_valid :
    mulPoly ep_Q2_064_coefficient_06_0205
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0206 : Poly :=
[
  term ((881 : Rat) / 2) [(9, 2)]
]

/-- Partial product 206 for generator 6. -/
def ep_Q2_064_partial_06_0206 : Poly :=
[
  term (-881 : Rat) [(0, 1), (9, 2)],
  term ((881 : Rat) / 2) [(0, 2), (9, 2)],
  term ((881 : Rat) / 2) [(1, 2), (9, 2)],
  term (881 : Rat) [(4, 1), (9, 2)],
  term ((-881 : Rat) / 2) [(4, 2), (9, 2)],
  term ((-881 : Rat) / 2) [(5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 6. -/
theorem ep_Q2_064_partial_06_0206_valid :
    mulPoly ep_Q2_064_coefficient_06_0206
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0207 : Poly :=
[
  term ((-4405 : Rat) / 8) [(9, 2), (12, 1)]
]

/-- Partial product 207 for generator 6. -/
def ep_Q2_064_partial_06_0207 : Poly :=
[
  term ((4405 : Rat) / 4) [(0, 1), (9, 2), (12, 1)],
  term ((-4405 : Rat) / 8) [(0, 2), (9, 2), (12, 1)],
  term ((-4405 : Rat) / 8) [(1, 2), (9, 2), (12, 1)],
  term ((-4405 : Rat) / 4) [(4, 1), (9, 2), (12, 1)],
  term ((4405 : Rat) / 8) [(4, 2), (9, 2), (12, 1)],
  term ((4405 : Rat) / 8) [(5, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 6. -/
theorem ep_Q2_064_partial_06_0207_valid :
    mulPoly ep_Q2_064_coefficient_06_0207
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0208 : Poly :=
[
  term (-18 : Rat) [(12, 1)]
]

/-- Partial product 208 for generator 6. -/
def ep_Q2_064_partial_06_0208 : Poly :=
[
  term (36 : Rat) [(0, 1), (12, 1)],
  term (-18 : Rat) [(0, 2), (12, 1)],
  term (-18 : Rat) [(1, 2), (12, 1)],
  term (-36 : Rat) [(4, 1), (12, 1)],
  term (18 : Rat) [(4, 2), (12, 1)],
  term (18 : Rat) [(5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 6. -/
theorem ep_Q2_064_partial_06_0208_valid :
    mulPoly ep_Q2_064_coefficient_06_0208
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0209 : Poly :=
[
  term ((-20055 : Rat) / 4) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 209 for generator 6. -/
def ep_Q2_064_partial_06_0209 : Poly :=
[
  term ((20055 : Rat) / 2) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20055 : Rat) / 4) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20055 : Rat) / 4) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20055 : Rat) / 2) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((20055 : Rat) / 4) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((20055 : Rat) / 4) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 6. -/
theorem ep_Q2_064_partial_06_0209_valid :
    mulPoly ep_Q2_064_coefficient_06_0209
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0210 : Poly :=
[
  term ((-19227 : Rat) / 16) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 210 for generator 6. -/
def ep_Q2_064_partial_06_0210 : Poly :=
[
  term ((19227 : Rat) / 8) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-19227 : Rat) / 16) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-19227 : Rat) / 16) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-19227 : Rat) / 8) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((19227 : Rat) / 16) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((19227 : Rat) / 16) [(5, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 6. -/
theorem ep_Q2_064_partial_06_0210_valid :
    mulPoly ep_Q2_064_coefficient_06_0210
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0211 : Poly :=
[
  term ((-2169 : Rat) / 8) [(12, 1), (14, 1)]
]

/-- Partial product 211 for generator 6. -/
def ep_Q2_064_partial_06_0211 : Poly :=
[
  term ((2169 : Rat) / 4) [(0, 1), (12, 1), (14, 1)],
  term ((-2169 : Rat) / 8) [(0, 2), (12, 1), (14, 1)],
  term ((-2169 : Rat) / 8) [(1, 2), (12, 1), (14, 1)],
  term ((-2169 : Rat) / 4) [(4, 1), (12, 1), (14, 1)],
  term ((2169 : Rat) / 8) [(4, 2), (12, 1), (14, 1)],
  term ((2169 : Rat) / 8) [(5, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 6. -/
theorem ep_Q2_064_partial_06_0211_valid :
    mulPoly ep_Q2_064_coefficient_06_0211
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0212 : Poly :=
[
  term ((12257 : Rat) / 16) [(12, 1), (15, 2)]
]

/-- Partial product 212 for generator 6. -/
def ep_Q2_064_partial_06_0212 : Poly :=
[
  term ((-12257 : Rat) / 8) [(0, 1), (12, 1), (15, 2)],
  term ((12257 : Rat) / 16) [(0, 2), (12, 1), (15, 2)],
  term ((12257 : Rat) / 16) [(1, 2), (12, 1), (15, 2)],
  term ((12257 : Rat) / 8) [(4, 1), (12, 1), (15, 2)],
  term ((-12257 : Rat) / 16) [(4, 2), (12, 1), (15, 2)],
  term ((-12257 : Rat) / 16) [(5, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 6. -/
theorem ep_Q2_064_partial_06_0212_valid :
    mulPoly ep_Q2_064_coefficient_06_0212
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0213 : Poly :=
[
  term ((1953 : Rat) / 16) [(12, 2)]
]

/-- Partial product 213 for generator 6. -/
def ep_Q2_064_partial_06_0213 : Poly :=
[
  term ((-1953 : Rat) / 8) [(0, 1), (12, 2)],
  term ((1953 : Rat) / 16) [(0, 2), (12, 2)],
  term ((1953 : Rat) / 16) [(1, 2), (12, 2)],
  term ((1953 : Rat) / 8) [(4, 1), (12, 2)],
  term ((-1953 : Rat) / 16) [(4, 2), (12, 2)],
  term ((-1953 : Rat) / 16) [(5, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 6. -/
theorem ep_Q2_064_partial_06_0213_valid :
    mulPoly ep_Q2_064_coefficient_06_0213
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0214 : Poly :=
[
  term ((20055 : Rat) / 4) [(12, 2), (15, 2)]
]

/-- Partial product 214 for generator 6. -/
def ep_Q2_064_partial_06_0214 : Poly :=
[
  term ((-20055 : Rat) / 2) [(0, 1), (12, 2), (15, 2)],
  term ((20055 : Rat) / 4) [(0, 2), (12, 2), (15, 2)],
  term ((20055 : Rat) / 4) [(1, 2), (12, 2), (15, 2)],
  term ((20055 : Rat) / 2) [(4, 1), (12, 2), (15, 2)],
  term ((-20055 : Rat) / 4) [(4, 2), (12, 2), (15, 2)],
  term ((-20055 : Rat) / 4) [(5, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 6. -/
theorem ep_Q2_064_partial_06_0214_valid :
    mulPoly ep_Q2_064_coefficient_06_0214
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0215 : Poly :=
[
  term ((-35177 : Rat) / 16) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 215 for generator 6. -/
def ep_Q2_064_partial_06_0215 : Poly :=
[
  term ((35177 : Rat) / 8) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-35177 : Rat) / 16) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-35177 : Rat) / 16) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-35177 : Rat) / 8) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((35177 : Rat) / 16) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((35177 : Rat) / 16) [(5, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 6. -/
theorem ep_Q2_064_partial_06_0215_valid :
    mulPoly ep_Q2_064_coefficient_06_0215
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0216 : Poly :=
[
  term ((6963 : Rat) / 8) [(13, 1), (15, 1)]
]

/-- Partial product 216 for generator 6. -/
def ep_Q2_064_partial_06_0216 : Poly :=
[
  term ((-6963 : Rat) / 4) [(0, 1), (13, 1), (15, 1)],
  term ((6963 : Rat) / 8) [(0, 2), (13, 1), (15, 1)],
  term ((6963 : Rat) / 8) [(1, 2), (13, 1), (15, 1)],
  term ((6963 : Rat) / 4) [(4, 1), (13, 1), (15, 1)],
  term ((-6963 : Rat) / 8) [(4, 2), (13, 1), (15, 1)],
  term ((-6963 : Rat) / 8) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 6. -/
theorem ep_Q2_064_partial_06_0216_valid :
    mulPoly ep_Q2_064_coefficient_06_0216
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0217 : Poly :=
[
  term (-9 : Rat) [(13, 2)]
]

/-- Partial product 217 for generator 6. -/
def ep_Q2_064_partial_06_0217 : Poly :=
[
  term (18 : Rat) [(0, 1), (13, 2)],
  term (-9 : Rat) [(0, 2), (13, 2)],
  term (-9 : Rat) [(1, 2), (13, 2)],
  term (-18 : Rat) [(4, 1), (13, 2)],
  term (9 : Rat) [(4, 2), (13, 2)],
  term (9 : Rat) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 6. -/
theorem ep_Q2_064_partial_06_0217_valid :
    mulPoly ep_Q2_064_coefficient_06_0217
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0218 : Poly :=
[
  term ((19227 : Rat) / 16) [(13, 2), (14, 1)]
]

/-- Partial product 218 for generator 6. -/
def ep_Q2_064_partial_06_0218 : Poly :=
[
  term ((-19227 : Rat) / 8) [(0, 1), (13, 2), (14, 1)],
  term ((19227 : Rat) / 16) [(0, 2), (13, 2), (14, 1)],
  term ((19227 : Rat) / 16) [(1, 2), (13, 2), (14, 1)],
  term ((19227 : Rat) / 8) [(4, 1), (13, 2), (14, 1)],
  term ((-19227 : Rat) / 16) [(4, 2), (13, 2), (14, 1)],
  term ((-19227 : Rat) / 16) [(5, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 6. -/
theorem ep_Q2_064_partial_06_0218_valid :
    mulPoly ep_Q2_064_coefficient_06_0218
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0219 : Poly :=
[
  term ((8225 : Rat) / 16) [(14, 1)]
]

/-- Partial product 219 for generator 6. -/
def ep_Q2_064_partial_06_0219 : Poly :=
[
  term ((-8225 : Rat) / 8) [(0, 1), (14, 1)],
  term ((8225 : Rat) / 16) [(0, 2), (14, 1)],
  term ((8225 : Rat) / 16) [(1, 2), (14, 1)],
  term ((8225 : Rat) / 8) [(4, 1), (14, 1)],
  term ((-8225 : Rat) / 16) [(4, 2), (14, 1)],
  term ((-8225 : Rat) / 16) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 6. -/
theorem ep_Q2_064_partial_06_0219_valid :
    mulPoly ep_Q2_064_coefficient_06_0219
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0220 : Poly :=
[
  term ((-27 : Rat) / 4) [(14, 2)]
]

/-- Partial product 220 for generator 6. -/
def ep_Q2_064_partial_06_0220 : Poly :=
[
  term ((27 : Rat) / 2) [(0, 1), (14, 2)],
  term ((-27 : Rat) / 4) [(0, 2), (14, 2)],
  term ((-27 : Rat) / 4) [(1, 2), (14, 2)],
  term ((-27 : Rat) / 2) [(4, 1), (14, 2)],
  term ((27 : Rat) / 4) [(4, 2), (14, 2)],
  term ((27 : Rat) / 4) [(5, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 6. -/
theorem ep_Q2_064_partial_06_0220_valid :
    mulPoly ep_Q2_064_coefficient_06_0220
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 6. -/
def ep_Q2_064_coefficient_06_0221 : Poly :=
[
  term ((4381 : Rat) / 8) [(15, 2)]
]

/-- Partial product 221 for generator 6. -/
def ep_Q2_064_partial_06_0221 : Poly :=
[
  term ((-4381 : Rat) / 4) [(0, 1), (15, 2)],
  term ((4381 : Rat) / 8) [(0, 2), (15, 2)],
  term ((4381 : Rat) / 8) [(1, 2), (15, 2)],
  term ((4381 : Rat) / 4) [(4, 1), (15, 2)],
  term ((-4381 : Rat) / 8) [(4, 2), (15, 2)],
  term ((-4381 : Rat) / 8) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 6. -/
theorem ep_Q2_064_partial_06_0221_valid :
    mulPoly ep_Q2_064_coefficient_06_0221
        ep_Q2_064_generator_06_0200_0221 =
      ep_Q2_064_partial_06_0221 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_06_0200_0221 : List Poly :=
[
  ep_Q2_064_partial_06_0200,
  ep_Q2_064_partial_06_0201,
  ep_Q2_064_partial_06_0202,
  ep_Q2_064_partial_06_0203,
  ep_Q2_064_partial_06_0204,
  ep_Q2_064_partial_06_0205,
  ep_Q2_064_partial_06_0206,
  ep_Q2_064_partial_06_0207,
  ep_Q2_064_partial_06_0208,
  ep_Q2_064_partial_06_0209,
  ep_Q2_064_partial_06_0210,
  ep_Q2_064_partial_06_0211,
  ep_Q2_064_partial_06_0212,
  ep_Q2_064_partial_06_0213,
  ep_Q2_064_partial_06_0214,
  ep_Q2_064_partial_06_0215,
  ep_Q2_064_partial_06_0216,
  ep_Q2_064_partial_06_0217,
  ep_Q2_064_partial_06_0218,
  ep_Q2_064_partial_06_0219,
  ep_Q2_064_partial_06_0220,
  ep_Q2_064_partial_06_0221
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_06_0200_0221 : Poly :=
[
  term ((4725 : Rat) / 8) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((36183 : Rat) / 8) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-14325 : Rat) / 2) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1971 : Rat) / 8) [(0, 1), (9, 1), (13, 1)],
  term ((-6167 : Rat) / 4) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term (-48 : Rat) [(0, 1), (9, 1), (15, 1)],
  term (-881 : Rat) [(0, 1), (9, 2)],
  term ((4405 : Rat) / 4) [(0, 1), (9, 2), (12, 1)],
  term (36 : Rat) [(0, 1), (12, 1)],
  term ((20055 : Rat) / 2) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((19227 : Rat) / 8) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((2169 : Rat) / 4) [(0, 1), (12, 1), (14, 1)],
  term ((-12257 : Rat) / 8) [(0, 1), (12, 1), (15, 2)],
  term ((-1953 : Rat) / 8) [(0, 1), (12, 2)],
  term ((-20055 : Rat) / 2) [(0, 1), (12, 2), (15, 2)],
  term ((35177 : Rat) / 8) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6963 : Rat) / 4) [(0, 1), (13, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (13, 2)],
  term ((-19227 : Rat) / 8) [(0, 1), (13, 2), (14, 1)],
  term ((-8225 : Rat) / 8) [(0, 1), (14, 1)],
  term ((27 : Rat) / 2) [(0, 1), (14, 2)],
  term ((-4381 : Rat) / 4) [(0, 1), (15, 2)],
  term ((-4725 : Rat) / 16) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-36183 : Rat) / 16) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((14325 : Rat) / 4) [(0, 2), (9, 1), (12, 2), (15, 1)],
  term ((1971 : Rat) / 16) [(0, 2), (9, 1), (13, 1)],
  term ((6167 : Rat) / 8) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term (24 : Rat) [(0, 2), (9, 1), (15, 1)],
  term ((881 : Rat) / 2) [(0, 2), (9, 2)],
  term ((-4405 : Rat) / 8) [(0, 2), (9, 2), (12, 1)],
  term (-18 : Rat) [(0, 2), (12, 1)],
  term ((-20055 : Rat) / 4) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19227 : Rat) / 16) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2169 : Rat) / 8) [(0, 2), (12, 1), (14, 1)],
  term ((12257 : Rat) / 16) [(0, 2), (12, 1), (15, 2)],
  term ((1953 : Rat) / 16) [(0, 2), (12, 2)],
  term ((20055 : Rat) / 4) [(0, 2), (12, 2), (15, 2)],
  term ((-35177 : Rat) / 16) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((6963 : Rat) / 8) [(0, 2), (13, 1), (15, 1)],
  term (-9 : Rat) [(0, 2), (13, 2)],
  term ((19227 : Rat) / 16) [(0, 2), (13, 2), (14, 1)],
  term ((8225 : Rat) / 16) [(0, 2), (14, 1)],
  term ((-27 : Rat) / 4) [(0, 2), (14, 2)],
  term ((4381 : Rat) / 8) [(0, 2), (15, 2)],
  term ((-4725 : Rat) / 16) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-36183 : Rat) / 16) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((14325 : Rat) / 4) [(1, 2), (9, 1), (12, 2), (15, 1)],
  term ((1971 : Rat) / 16) [(1, 2), (9, 1), (13, 1)],
  term ((6167 : Rat) / 8) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term (24 : Rat) [(1, 2), (9, 1), (15, 1)],
  term ((881 : Rat) / 2) [(1, 2), (9, 2)],
  term ((-4405 : Rat) / 8) [(1, 2), (9, 2), (12, 1)],
  term (-18 : Rat) [(1, 2), (12, 1)],
  term ((-20055 : Rat) / 4) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19227 : Rat) / 16) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2169 : Rat) / 8) [(1, 2), (12, 1), (14, 1)],
  term ((12257 : Rat) / 16) [(1, 2), (12, 1), (15, 2)],
  term ((1953 : Rat) / 16) [(1, 2), (12, 2)],
  term ((20055 : Rat) / 4) [(1, 2), (12, 2), (15, 2)],
  term ((-35177 : Rat) / 16) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((6963 : Rat) / 8) [(1, 2), (13, 1), (15, 1)],
  term (-9 : Rat) [(1, 2), (13, 2)],
  term ((19227 : Rat) / 16) [(1, 2), (13, 2), (14, 1)],
  term ((8225 : Rat) / 16) [(1, 2), (14, 1)],
  term ((-27 : Rat) / 4) [(1, 2), (14, 2)],
  term ((4381 : Rat) / 8) [(1, 2), (15, 2)],
  term ((-4725 : Rat) / 8) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-36183 : Rat) / 8) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((14325 : Rat) / 2) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((1971 : Rat) / 8) [(4, 1), (9, 1), (13, 1)],
  term ((6167 : Rat) / 4) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term (48 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (881 : Rat) [(4, 1), (9, 2)],
  term ((-4405 : Rat) / 4) [(4, 1), (9, 2), (12, 1)],
  term (-36 : Rat) [(4, 1), (12, 1)],
  term ((-20055 : Rat) / 2) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19227 : Rat) / 8) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2169 : Rat) / 4) [(4, 1), (12, 1), (14, 1)],
  term ((12257 : Rat) / 8) [(4, 1), (12, 1), (15, 2)],
  term ((1953 : Rat) / 8) [(4, 1), (12, 2)],
  term ((20055 : Rat) / 2) [(4, 1), (12, 2), (15, 2)],
  term ((-35177 : Rat) / 8) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((6963 : Rat) / 4) [(4, 1), (13, 1), (15, 1)],
  term (-18 : Rat) [(4, 1), (13, 2)],
  term ((19227 : Rat) / 8) [(4, 1), (13, 2), (14, 1)],
  term ((8225 : Rat) / 8) [(4, 1), (14, 1)],
  term ((-27 : Rat) / 2) [(4, 1), (14, 2)],
  term ((4381 : Rat) / 4) [(4, 1), (15, 2)],
  term ((4725 : Rat) / 16) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((36183 : Rat) / 16) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-14325 : Rat) / 4) [(4, 2), (9, 1), (12, 2), (15, 1)],
  term ((-1971 : Rat) / 16) [(4, 2), (9, 1), (13, 1)],
  term ((-6167 : Rat) / 8) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term (-24 : Rat) [(4, 2), (9, 1), (15, 1)],
  term ((-881 : Rat) / 2) [(4, 2), (9, 2)],
  term ((4405 : Rat) / 8) [(4, 2), (9, 2), (12, 1)],
  term (18 : Rat) [(4, 2), (12, 1)],
  term ((20055 : Rat) / 4) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((19227 : Rat) / 16) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((2169 : Rat) / 8) [(4, 2), (12, 1), (14, 1)],
  term ((-12257 : Rat) / 16) [(4, 2), (12, 1), (15, 2)],
  term ((-1953 : Rat) / 16) [(4, 2), (12, 2)],
  term ((-20055 : Rat) / 4) [(4, 2), (12, 2), (15, 2)],
  term ((35177 : Rat) / 16) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6963 : Rat) / 8) [(4, 2), (13, 1), (15, 1)],
  term (9 : Rat) [(4, 2), (13, 2)],
  term ((-19227 : Rat) / 16) [(4, 2), (13, 2), (14, 1)],
  term ((-8225 : Rat) / 16) [(4, 2), (14, 1)],
  term ((27 : Rat) / 4) [(4, 2), (14, 2)],
  term ((-4381 : Rat) / 8) [(4, 2), (15, 2)],
  term ((4725 : Rat) / 16) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((36183 : Rat) / 16) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-14325 : Rat) / 4) [(5, 2), (9, 1), (12, 2), (15, 1)],
  term ((-1971 : Rat) / 16) [(5, 2), (9, 1), (13, 1)],
  term ((-6167 : Rat) / 8) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term (-24 : Rat) [(5, 2), (9, 1), (15, 1)],
  term ((-881 : Rat) / 2) [(5, 2), (9, 2)],
  term ((4405 : Rat) / 8) [(5, 2), (9, 2), (12, 1)],
  term (18 : Rat) [(5, 2), (12, 1)],
  term ((20055 : Rat) / 4) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((19227 : Rat) / 16) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((2169 : Rat) / 8) [(5, 2), (12, 1), (14, 1)],
  term ((-12257 : Rat) / 16) [(5, 2), (12, 1), (15, 2)],
  term ((-1953 : Rat) / 16) [(5, 2), (12, 2)],
  term ((-20055 : Rat) / 4) [(5, 2), (12, 2), (15, 2)],
  term ((35177 : Rat) / 16) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6963 : Rat) / 8) [(5, 2), (13, 1), (15, 1)],
  term (9 : Rat) [(5, 2), (13, 2)],
  term ((-19227 : Rat) / 16) [(5, 2), (13, 2), (14, 1)],
  term ((-8225 : Rat) / 16) [(5, 2), (14, 1)],
  term ((27 : Rat) / 4) [(5, 2), (14, 2)],
  term ((-4381 : Rat) / 8) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 200 through 221. -/
theorem ep_Q2_064_block_06_0200_0221_valid :
    checkProductSumEq ep_Q2_064_partials_06_0200_0221
      ep_Q2_064_block_06_0200_0221 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
