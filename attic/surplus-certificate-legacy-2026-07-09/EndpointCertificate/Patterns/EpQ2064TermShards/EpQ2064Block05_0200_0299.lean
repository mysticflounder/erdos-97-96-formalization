/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 5:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_05_0200_0299 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0200 : Poly :=
[
  term ((18501 : Rat) / 8) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 200 for generator 5. -/
def ep_Q2_064_partial_05_0200 : Poly :=
[
  term ((18501 : Rat) / 8) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-18501 : Rat) / 8) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-18501 : Rat) / 8) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((18501 : Rat) / 8) [(4, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem ep_Q2_064_partial_05_0200_valid :
    mulPoly ep_Q2_064_coefficient_05_0200
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0201 : Poly :=
[
  term ((-2595 : Rat) / 2) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 201 for generator 5. -/
def ep_Q2_064_partial_05_0201 : Poly :=
[
  term ((-2595 : Rat) / 2) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((2595 : Rat) / 2) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((2595 : Rat) / 2) [(4, 1), (9, 1), (15, 3)],
  term ((-2595 : Rat) / 2) [(4, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem ep_Q2_064_partial_05_0201_valid :
    mulPoly ep_Q2_064_coefficient_05_0201
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0202 : Poly :=
[
  term (5730 : Rat) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 202 for generator 5. -/
def ep_Q2_064_partial_05_0202 : Poly :=
[
  term (5730 : Rat) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term (-5730 : Rat) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term (5730 : Rat) [(4, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem ep_Q2_064_partial_05_0202_valid :
    mulPoly ep_Q2_064_coefficient_05_0202
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0203 : Poly :=
[
  term ((-1827 : Rat) / 8) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 203 for generator 5. -/
def ep_Q2_064_partial_05_0203 : Poly :=
[
  term ((-1827 : Rat) / 8) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term ((1827 : Rat) / 8) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((1827 : Rat) / 8) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1827 : Rat) / 8) [(4, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem ep_Q2_064_partial_05_0203_valid :
    mulPoly ep_Q2_064_coefficient_05_0203
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0204 : Poly :=
[
  term (-1034 : Rat) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 204 for generator 5. -/
def ep_Q2_064_partial_05_0204 : Poly :=
[
  term (-1034 : Rat) [(4, 1), (5, 2), (11, 1), (15, 1)],
  term (1034 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term (1034 : Rat) [(4, 1), (11, 1), (15, 3)],
  term (-1034 : Rat) [(4, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem ep_Q2_064_partial_05_0204_valid :
    mulPoly ep_Q2_064_coefficient_05_0204
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0205 : Poly :=
[
  term ((-60165 : Rat) / 4) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 205 for generator 5. -/
def ep_Q2_064_partial_05_0205 : Poly :=
[
  term ((-60165 : Rat) / 4) [(4, 1), (5, 2), (12, 1), (13, 1), (15, 1)],
  term ((60165 : Rat) / 4) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((60165 : Rat) / 4) [(4, 1), (12, 1), (13, 1), (15, 3)],
  term ((-60165 : Rat) / 4) [(4, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem ep_Q2_064_partial_05_0205_valid :
    mulPoly ep_Q2_064_coefficient_05_0205
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0206 : Poly :=
[
  term (8595 : Rat) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 206 for generator 5. -/
def ep_Q2_064_partial_05_0206 : Poly :=
[
  term (8595 : Rat) [(4, 1), (5, 2), (12, 1), (15, 2)],
  term (-8595 : Rat) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term (-8595 : Rat) [(4, 1), (12, 1), (15, 4)],
  term (8595 : Rat) [(4, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem ep_Q2_064_partial_05_0206_valid :
    mulPoly ep_Q2_064_coefficient_05_0206
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0207 : Poly :=
[
  term ((-33927 : Rat) / 16) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 207 for generator 5. -/
def ep_Q2_064_partial_05_0207 : Poly :=
[
  term ((-33927 : Rat) / 16) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((33927 : Rat) / 16) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((33927 : Rat) / 16) [(4, 1), (13, 1), (15, 3)],
  term ((-33927 : Rat) / 16) [(4, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem ep_Q2_064_partial_05_0207_valid :
    mulPoly ep_Q2_064_coefficient_05_0207
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0208 : Poly :=
[
  term ((45645 : Rat) / 16) [(4, 1), (13, 2)]
]

/-- Partial product 208 for generator 5. -/
def ep_Q2_064_partial_05_0208 : Poly :=
[
  term ((45645 : Rat) / 16) [(4, 1), (5, 2), (13, 2)],
  term ((-45645 : Rat) / 16) [(4, 1), (13, 2), (14, 2)],
  term ((-45645 : Rat) / 16) [(4, 1), (13, 2), (15, 2)],
  term ((45645 : Rat) / 16) [(4, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem ep_Q2_064_partial_05_0208_valid :
    mulPoly ep_Q2_064_coefficient_05_0208
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0209 : Poly :=
[
  term ((-2883 : Rat) / 4) [(4, 1), (15, 2)]
]

/-- Partial product 209 for generator 5. -/
def ep_Q2_064_partial_05_0209 : Poly :=
[
  term ((-2883 : Rat) / 4) [(4, 1), (5, 2), (15, 2)],
  term ((2883 : Rat) / 4) [(4, 1), (14, 2), (15, 2)],
  term ((2883 : Rat) / 4) [(4, 1), (15, 4)],
  term ((-2883 : Rat) / 4) [(4, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem ep_Q2_064_partial_05_0209_valid :
    mulPoly ep_Q2_064_coefficient_05_0209
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0210 : Poly :=
[
  term (16 : Rat) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 210 for generator 5. -/
def ep_Q2_064_partial_05_0210 : Poly :=
[
  term (16 : Rat) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(4, 1), (15, 4), (16, 1)],
  term (16 : Rat) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem ep_Q2_064_partial_05_0210_valid :
    mulPoly ep_Q2_064_coefficient_05_0210
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0211 : Poly :=
[
  term (405 : Rat) [(5, 1), (6, 1), (7, 1)]
]

/-- Partial product 211 for generator 5. -/
def ep_Q2_064_partial_05_0211 : Poly :=
[
  term (405 : Rat) [(4, 2), (5, 1), (6, 1), (7, 1)],
  term (-405 : Rat) [(5, 1), (6, 1), (7, 1), (14, 2)],
  term (-405 : Rat) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term (405 : Rat) [(5, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem ep_Q2_064_partial_05_0211_valid :
    mulPoly ep_Q2_064_coefficient_05_0211
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0212 : Poly :=
[
  term (-5682 : Rat) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 212 for generator 5. -/
def ep_Q2_064_partial_05_0212 : Poly :=
[
  term (-5682 : Rat) [(4, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term (5682 : Rat) [(5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term (5682 : Rat) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term (-5682 : Rat) [(5, 3), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem ep_Q2_064_partial_05_0212_valid :
    mulPoly ep_Q2_064_coefficient_05_0212
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0213 : Poly :=
[
  term ((18267 : Rat) / 16) [(5, 1), (6, 1), (9, 1)]
]

/-- Partial product 213 for generator 5. -/
def ep_Q2_064_partial_05_0213 : Poly :=
[
  term ((18267 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (9, 1)],
  term ((-18267 : Rat) / 16) [(5, 1), (6, 1), (9, 1), (14, 2)],
  term ((-18267 : Rat) / 16) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((18267 : Rat) / 16) [(5, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem ep_Q2_064_partial_05_0213_valid :
    mulPoly ep_Q2_064_coefficient_05_0213
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0214 : Poly :=
[
  term (5682 : Rat) [(5, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 214 for generator 5. -/
def ep_Q2_064_partial_05_0214 : Poly :=
[
  term (5682 : Rat) [(4, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term (-5682 : Rat) [(5, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term (-5682 : Rat) [(5, 1), (6, 1), (10, 1), (15, 3)],
  term (5682 : Rat) [(5, 3), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem ep_Q2_064_partial_05_0214_valid :
    mulPoly ep_Q2_064_coefficient_05_0214
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0215 : Poly :=
[
  term ((-122445 : Rat) / 16) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 215 for generator 5. -/
def ep_Q2_064_partial_05_0215 : Poly :=
[
  term ((-122445 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (11, 1)],
  term ((122445 : Rat) / 16) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((122445 : Rat) / 16) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-122445 : Rat) / 16) [(5, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem ep_Q2_064_partial_05_0215_valid :
    mulPoly ep_Q2_064_coefficient_05_0215
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0216 : Poly :=
[
  term ((-88431 : Rat) / 4) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 216 for generator 5. -/
def ep_Q2_064_partial_05_0216 : Poly :=
[
  term ((-88431 : Rat) / 4) [(4, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((88431 : Rat) / 4) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((88431 : Rat) / 4) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((-88431 : Rat) / 4) [(5, 3), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem ep_Q2_064_partial_05_0216_valid :
    mulPoly ep_Q2_064_coefficient_05_0216
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0217 : Poly :=
[
  term ((288291 : Rat) / 16) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 217 for generator 5. -/
def ep_Q2_064_partial_05_0217 : Poly :=
[
  term ((288291 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (13, 1)],
  term ((-288291 : Rat) / 16) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((-288291 : Rat) / 16) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((288291 : Rat) / 16) [(5, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem ep_Q2_064_partial_05_0217_valid :
    mulPoly ep_Q2_064_coefficient_05_0217
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0218 : Poly :=
[
  term (2841 : Rat) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 218 for generator 5. -/
def ep_Q2_064_partial_05_0218 : Poly :=
[
  term (2841 : Rat) [(4, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term (-2841 : Rat) [(5, 1), (6, 1), (14, 1), (15, 3)],
  term (-2841 : Rat) [(5, 1), (6, 1), (14, 3), (15, 1)],
  term (2841 : Rat) [(5, 3), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem ep_Q2_064_partial_05_0218_valid :
    mulPoly ep_Q2_064_coefficient_05_0218
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0219 : Poly :=
[
  term ((-177729 : Rat) / 16) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 219 for generator 5. -/
def ep_Q2_064_partial_05_0219 : Poly :=
[
  term ((-177729 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (15, 1)],
  term ((177729 : Rat) / 16) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((177729 : Rat) / 16) [(5, 1), (6, 1), (15, 3)],
  term ((-177729 : Rat) / 16) [(5, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem ep_Q2_064_partial_05_0219_valid :
    mulPoly ep_Q2_064_coefficient_05_0219
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0220 : Poly :=
[
  term (-16 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 5. -/
def ep_Q2_064_partial_05_0220 : Poly :=
[
  term (-16 : Rat) [(4, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term (-16 : Rat) [(5, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem ep_Q2_064_partial_05_0220_valid :
    mulPoly ep_Q2_064_coefficient_05_0220
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0221 : Poly :=
[
  term ((42615 : Rat) / 4) [(5, 1), (6, 2), (15, 1)]
]

/-- Partial product 221 for generator 5. -/
def ep_Q2_064_partial_05_0221 : Poly :=
[
  term ((42615 : Rat) / 4) [(4, 2), (5, 1), (6, 2), (15, 1)],
  term ((-42615 : Rat) / 4) [(5, 1), (6, 2), (14, 2), (15, 1)],
  term ((-42615 : Rat) / 4) [(5, 1), (6, 2), (15, 3)],
  term ((42615 : Rat) / 4) [(5, 3), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem ep_Q2_064_partial_05_0221_valid :
    mulPoly ep_Q2_064_coefficient_05_0221
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0222 : Poly :=
[
  term ((-14103 : Rat) / 2) [(5, 1), (7, 1)]
]

/-- Partial product 222 for generator 5. -/
def ep_Q2_064_partial_05_0222 : Poly :=
[
  term ((-14103 : Rat) / 2) [(4, 2), (5, 1), (7, 1)],
  term ((14103 : Rat) / 2) [(5, 1), (7, 1), (14, 2)],
  term ((14103 : Rat) / 2) [(5, 1), (7, 1), (15, 2)],
  term ((-14103 : Rat) / 2) [(5, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem ep_Q2_064_partial_05_0222_valid :
    mulPoly ep_Q2_064_coefficient_05_0222
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0223 : Poly :=
[
  term (-216 : Rat) [(5, 1), (7, 1), (8, 1)]
]

/-- Partial product 223 for generator 5. -/
def ep_Q2_064_partial_05_0223 : Poly :=
[
  term (-216 : Rat) [(4, 2), (5, 1), (7, 1), (8, 1)],
  term (216 : Rat) [(5, 1), (7, 1), (8, 1), (14, 2)],
  term (216 : Rat) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term (-216 : Rat) [(5, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem ep_Q2_064_partial_05_0223_valid :
    mulPoly ep_Q2_064_coefficient_05_0223
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0224 : Poly :=
[
  term ((125901 : Rat) / 16) [(5, 1), (7, 1), (10, 1)]
]

/-- Partial product 224 for generator 5. -/
def ep_Q2_064_partial_05_0224 : Poly :=
[
  term ((125901 : Rat) / 16) [(4, 2), (5, 1), (7, 1), (10, 1)],
  term ((-125901 : Rat) / 16) [(5, 1), (7, 1), (10, 1), (14, 2)],
  term ((-125901 : Rat) / 16) [(5, 1), (7, 1), (10, 1), (15, 2)],
  term ((125901 : Rat) / 16) [(5, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem ep_Q2_064_partial_05_0224_valid :
    mulPoly ep_Q2_064_coefficient_05_0224
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0225 : Poly :=
[
  term (-16758 : Rat) [(5, 1), (7, 1), (12, 1)]
]

/-- Partial product 225 for generator 5. -/
def ep_Q2_064_partial_05_0225 : Poly :=
[
  term (-16758 : Rat) [(4, 2), (5, 1), (7, 1), (12, 1)],
  term (16758 : Rat) [(5, 1), (7, 1), (12, 1), (14, 2)],
  term (16758 : Rat) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term (-16758 : Rat) [(5, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem ep_Q2_064_partial_05_0225_valid :
    mulPoly ep_Q2_064_coefficient_05_0225
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0226 : Poly :=
[
  term ((120555 : Rat) / 16) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 226 for generator 5. -/
def ep_Q2_064_partial_05_0226 : Poly :=
[
  term ((120555 : Rat) / 16) [(4, 2), (5, 1), (7, 1), (14, 1)],
  term ((-120555 : Rat) / 16) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-120555 : Rat) / 16) [(5, 1), (7, 1), (14, 3)],
  term ((120555 : Rat) / 16) [(5, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem ep_Q2_064_partial_05_0226_valid :
    mulPoly ep_Q2_064_coefficient_05_0226
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0227 : Poly :=
[
  term (-881 : Rat) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 227 for generator 5. -/
def ep_Q2_064_partial_05_0227 : Poly :=
[
  term (-881 : Rat) [(4, 2), (5, 1), (8, 1), (9, 1)],
  term (881 : Rat) [(5, 1), (8, 1), (9, 1), (14, 2)],
  term (881 : Rat) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term (-881 : Rat) [(5, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem ep_Q2_064_partial_05_0227_valid :
    mulPoly ep_Q2_064_coefficient_05_0227
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0228 : Poly :=
[
  term ((-8163 : Rat) / 4) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 228 for generator 5. -/
def ep_Q2_064_partial_05_0228 : Poly :=
[
  term ((-8163 : Rat) / 4) [(4, 2), (5, 1), (8, 1), (11, 1)],
  term ((8163 : Rat) / 4) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((8163 : Rat) / 4) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-8163 : Rat) / 4) [(5, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem ep_Q2_064_partial_05_0228_valid :
    mulPoly ep_Q2_064_coefficient_05_0228
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0229 : Poly :=
[
  term (5730 : Rat) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 229 for generator 5. -/
def ep_Q2_064_partial_05_0229 : Poly :=
[
  term (5730 : Rat) [(4, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term (-5730 : Rat) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term (5730 : Rat) [(5, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem ep_Q2_064_partial_05_0229_valid :
    mulPoly ep_Q2_064_coefficient_05_0229
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0230 : Poly :=
[
  term ((-12105 : Rat) / 16) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 230 for generator 5. -/
def ep_Q2_064_partial_05_0230 : Poly :=
[
  term ((-12105 : Rat) / 16) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term ((12105 : Rat) / 16) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((12105 : Rat) / 16) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-12105 : Rat) / 16) [(5, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem ep_Q2_064_partial_05_0230_valid :
    mulPoly ep_Q2_064_coefficient_05_0230
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0231 : Poly :=
[
  term ((785 : Rat) / 2) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 231 for generator 5. -/
def ep_Q2_064_partial_05_0231 : Poly :=
[
  term ((785 : Rat) / 2) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((-785 : Rat) / 2) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-785 : Rat) / 2) [(5, 1), (8, 1), (15, 3)],
  term ((785 : Rat) / 2) [(5, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem ep_Q2_064_partial_05_0231_valid :
    mulPoly ep_Q2_064_coefficient_05_0231
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0232 : Poly :=
[
  term ((-49625 : Rat) / 16) [(5, 1), (9, 1)]
]

/-- Partial product 232 for generator 5. -/
def ep_Q2_064_partial_05_0232 : Poly :=
[
  term ((-49625 : Rat) / 16) [(4, 2), (5, 1), (9, 1)],
  term ((49625 : Rat) / 16) [(5, 1), (9, 1), (14, 2)],
  term ((49625 : Rat) / 16) [(5, 1), (9, 1), (15, 2)],
  term ((-49625 : Rat) / 16) [(5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem ep_Q2_064_partial_05_0232_valid :
    mulPoly ep_Q2_064_coefficient_05_0232
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0233 : Poly :=
[
  term ((11687 : Rat) / 4) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 233 for generator 5. -/
def ep_Q2_064_partial_05_0233 : Poly :=
[
  term ((11687 : Rat) / 4) [(4, 2), (5, 1), (9, 1), (10, 1)],
  term ((-11687 : Rat) / 4) [(5, 1), (9, 1), (10, 1), (14, 2)],
  term ((-11687 : Rat) / 4) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((11687 : Rat) / 4) [(5, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 5. -/
theorem ep_Q2_064_partial_05_0233_valid :
    mulPoly ep_Q2_064_coefficient_05_0233
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0234 : Poly :=
[
  term ((10393 : Rat) / 8) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 234 for generator 5. -/
def ep_Q2_064_partial_05_0234 : Poly :=
[
  term ((10393 : Rat) / 8) [(4, 2), (5, 1), (9, 1), (12, 1)],
  term ((-10393 : Rat) / 8) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((-10393 : Rat) / 8) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((10393 : Rat) / 8) [(5, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 5. -/
theorem ep_Q2_064_partial_05_0234_valid :
    mulPoly ep_Q2_064_coefficient_05_0234
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0235 : Poly :=
[
  term ((881 : Rat) / 2) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 235 for generator 5. -/
def ep_Q2_064_partial_05_0235 : Poly :=
[
  term ((881 : Rat) / 2) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((-881 : Rat) / 2) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-881 : Rat) / 2) [(5, 1), (9, 1), (14, 3)],
  term ((881 : Rat) / 2) [(5, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 5. -/
theorem ep_Q2_064_partial_05_0235_valid :
    mulPoly ep_Q2_064_coefficient_05_0235
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0236 : Poly :=
[
  term (-5730 : Rat) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 236 for generator 5. -/
def ep_Q2_064_partial_05_0236 : Poly :=
[
  term (-5730 : Rat) [(4, 2), (5, 1), (10, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term (5730 : Rat) [(5, 1), (10, 1), (12, 1), (15, 3)],
  term (-5730 : Rat) [(5, 3), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 5. -/
theorem ep_Q2_064_partial_05_0236_valid :
    mulPoly ep_Q2_064_coefficient_05_0236
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0237 : Poly :=
[
  term ((1827 : Rat) / 8) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 237 for generator 5. -/
def ep_Q2_064_partial_05_0237 : Poly :=
[
  term ((1827 : Rat) / 8) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((-1827 : Rat) / 8) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1827 : Rat) / 8) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((1827 : Rat) / 8) [(5, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 5. -/
theorem ep_Q2_064_partial_05_0237_valid :
    mulPoly ep_Q2_064_coefficient_05_0237
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0238 : Poly :=
[
  term (1034 : Rat) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 238 for generator 5. -/
def ep_Q2_064_partial_05_0238 : Poly :=
[
  term (1034 : Rat) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term (-1034 : Rat) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term (-1034 : Rat) [(5, 1), (10, 1), (15, 3)],
  term (1034 : Rat) [(5, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 5. -/
theorem ep_Q2_064_partial_05_0238_valid :
    mulPoly ep_Q2_064_coefficient_05_0238
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0239 : Poly :=
[
  term ((106119 : Rat) / 16) [(5, 1), (11, 1)]
]

/-- Partial product 239 for generator 5. -/
def ep_Q2_064_partial_05_0239 : Poly :=
[
  term ((106119 : Rat) / 16) [(4, 2), (5, 1), (11, 1)],
  term ((-106119 : Rat) / 16) [(5, 1), (11, 1), (14, 2)],
  term ((-106119 : Rat) / 16) [(5, 1), (11, 1), (15, 2)],
  term ((106119 : Rat) / 16) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 5. -/
theorem ep_Q2_064_partial_05_0239_valid :
    mulPoly ep_Q2_064_coefficient_05_0239
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0240 : Poly :=
[
  term ((-5115 : Rat) / 2) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 240 for generator 5. -/
def ep_Q2_064_partial_05_0240 : Poly :=
[
  term ((-5115 : Rat) / 2) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((5115 : Rat) / 2) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((5115 : Rat) / 2) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5115 : Rat) / 2) [(5, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 5. -/
theorem ep_Q2_064_partial_05_0240_valid :
    mulPoly ep_Q2_064_coefficient_05_0240
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0241 : Poly :=
[
  term (-2865 : Rat) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 241 for generator 5. -/
def ep_Q2_064_partial_05_0241 : Poly :=
[
  term (-2865 : Rat) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term (2865 : Rat) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term (2865 : Rat) [(5, 1), (12, 1), (14, 3), (15, 1)],
  term (-2865 : Rat) [(5, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 5. -/
theorem ep_Q2_064_partial_05_0241_valid :
    mulPoly ep_Q2_064_coefficient_05_0241
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0242 : Poly :=
[
  term ((38891 : Rat) / 4) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 242 for generator 5. -/
def ep_Q2_064_partial_05_0242 : Poly :=
[
  term ((38891 : Rat) / 4) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((-38891 : Rat) / 4) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-38891 : Rat) / 4) [(5, 1), (12, 1), (15, 3)],
  term ((38891 : Rat) / 4) [(5, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 5. -/
theorem ep_Q2_064_partial_05_0242_valid :
    mulPoly ep_Q2_064_coefficient_05_0242
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0243 : Poly :=
[
  term (11460 : Rat) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 243 for generator 5. -/
def ep_Q2_064_partial_05_0243 : Poly :=
[
  term (11460 : Rat) [(4, 2), (5, 1), (12, 2), (15, 1)],
  term (-11460 : Rat) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term (-11460 : Rat) [(5, 1), (12, 2), (15, 3)],
  term (11460 : Rat) [(5, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 5. -/
theorem ep_Q2_064_partial_05_0243_valid :
    mulPoly ep_Q2_064_coefficient_05_0243
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0244 : Poly :=
[
  term ((-28659 : Rat) / 32) [(5, 1), (13, 1)]
]

/-- Partial product 244 for generator 5. -/
def ep_Q2_064_partial_05_0244 : Poly :=
[
  term ((-28659 : Rat) / 32) [(4, 2), (5, 1), (13, 1)],
  term ((28659 : Rat) / 32) [(5, 1), (13, 1), (14, 2)],
  term ((28659 : Rat) / 32) [(5, 1), (13, 1), (15, 2)],
  term ((-28659 : Rat) / 32) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 5. -/
theorem ep_Q2_064_partial_05_0244_valid :
    mulPoly ep_Q2_064_coefficient_05_0244
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0245 : Poly :=
[
  term ((-49455 : Rat) / 16) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 245 for generator 5. -/
def ep_Q2_064_partial_05_0245 : Poly :=
[
  term ((-49455 : Rat) / 16) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((49455 : Rat) / 16) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((49455 : Rat) / 16) [(5, 1), (13, 1), (14, 3)],
  term ((-49455 : Rat) / 16) [(5, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 5. -/
theorem ep_Q2_064_partial_05_0245_valid :
    mulPoly ep_Q2_064_coefficient_05_0245
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0246 : Poly :=
[
  term ((4549 : Rat) / 4) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 246 for generator 5. -/
def ep_Q2_064_partial_05_0246 : Poly :=
[
  term ((4549 : Rat) / 4) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-4549 : Rat) / 4) [(5, 1), (14, 1), (15, 3)],
  term ((-4549 : Rat) / 4) [(5, 1), (14, 3), (15, 1)],
  term ((4549 : Rat) / 4) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 5. -/
theorem ep_Q2_064_partial_05_0246_valid :
    mulPoly ep_Q2_064_coefficient_05_0246
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0247 : Poly :=
[
  term (-16 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 5. -/
def ep_Q2_064_partial_05_0247 : Poly :=
[
  term (-16 : Rat) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term (16 : Rat) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 5. -/
theorem ep_Q2_064_partial_05_0247_valid :
    mulPoly ep_Q2_064_coefficient_05_0247
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0248 : Poly :=
[
  term ((-87575 : Rat) / 16) [(5, 1), (15, 1)]
]

/-- Partial product 248 for generator 5. -/
def ep_Q2_064_partial_05_0248 : Poly :=
[
  term ((-87575 : Rat) / 16) [(4, 2), (5, 1), (15, 1)],
  term ((87575 : Rat) / 16) [(5, 1), (14, 2), (15, 1)],
  term ((87575 : Rat) / 16) [(5, 1), (15, 3)],
  term ((-87575 : Rat) / 16) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 5. -/
theorem ep_Q2_064_partial_05_0248_valid :
    mulPoly ep_Q2_064_coefficient_05_0248
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0249 : Poly :=
[
  term (32 : Rat) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 5. -/
def ep_Q2_064_partial_05_0249 : Poly :=
[
  term (32 : Rat) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term (-32 : Rat) [(5, 1), (15, 3), (16, 1)],
  term (32 : Rat) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 5. -/
theorem ep_Q2_064_partial_05_0249_valid :
    mulPoly ep_Q2_064_coefficient_05_0249
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0250 : Poly :=
[
  term ((40815 : Rat) / 16) [(5, 2)]
]

/-- Partial product 250 for generator 5. -/
def ep_Q2_064_partial_05_0250 : Poly :=
[
  term ((40815 : Rat) / 16) [(4, 2), (5, 2)],
  term ((-40815 : Rat) / 16) [(5, 2), (14, 2)],
  term ((-40815 : Rat) / 16) [(5, 2), (15, 2)],
  term ((40815 : Rat) / 16) [(5, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 5. -/
theorem ep_Q2_064_partial_05_0250_valid :
    mulPoly ep_Q2_064_coefficient_05_0250
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0251 : Poly :=
[
  term ((-122445 : Rat) / 16) [(5, 2), (6, 1)]
]

/-- Partial product 251 for generator 5. -/
def ep_Q2_064_partial_05_0251 : Poly :=
[
  term ((-122445 : Rat) / 16) [(4, 2), (5, 2), (6, 1)],
  term ((122445 : Rat) / 16) [(5, 2), (6, 1), (14, 2)],
  term ((122445 : Rat) / 16) [(5, 2), (6, 1), (15, 2)],
  term ((-122445 : Rat) / 16) [(5, 4), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 5. -/
theorem ep_Q2_064_partial_05_0251_valid :
    mulPoly ep_Q2_064_coefficient_05_0251
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0252 : Poly :=
[
  term ((8163 : Rat) / 2) [(5, 2), (8, 1)]
]

/-- Partial product 252 for generator 5. -/
def ep_Q2_064_partial_05_0252 : Poly :=
[
  term ((8163 : Rat) / 2) [(4, 2), (5, 2), (8, 1)],
  term ((-8163 : Rat) / 2) [(5, 2), (8, 1), (14, 2)],
  term ((-8163 : Rat) / 2) [(5, 2), (8, 1), (15, 2)],
  term ((8163 : Rat) / 2) [(5, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 5. -/
theorem ep_Q2_064_partial_05_0252_valid :
    mulPoly ep_Q2_064_coefficient_05_0252
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0253 : Poly :=
[
  term ((-8163 : Rat) / 2) [(5, 2), (10, 1)]
]

/-- Partial product 253 for generator 5. -/
def ep_Q2_064_partial_05_0253 : Poly :=
[
  term ((-8163 : Rat) / 2) [(4, 2), (5, 2), (10, 1)],
  term ((8163 : Rat) / 2) [(5, 2), (10, 1), (14, 2)],
  term ((8163 : Rat) / 2) [(5, 2), (10, 1), (15, 2)],
  term ((-8163 : Rat) / 2) [(5, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 5. -/
theorem ep_Q2_064_partial_05_0253_valid :
    mulPoly ep_Q2_064_coefficient_05_0253
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0254 : Poly :=
[
  term (8163 : Rat) [(5, 2), (12, 1)]
]

/-- Partial product 254 for generator 5. -/
def ep_Q2_064_partial_05_0254 : Poly :=
[
  term (8163 : Rat) [(4, 2), (5, 2), (12, 1)],
  term (-8163 : Rat) [(5, 2), (12, 1), (14, 2)],
  term (-8163 : Rat) [(5, 2), (12, 1), (15, 2)],
  term (8163 : Rat) [(5, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 5. -/
theorem ep_Q2_064_partial_05_0254_valid :
    mulPoly ep_Q2_064_coefficient_05_0254
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0255 : Poly :=
[
  term ((-8163 : Rat) / 4) [(5, 2), (14, 1)]
]

/-- Partial product 255 for generator 5. -/
def ep_Q2_064_partial_05_0255 : Poly :=
[
  term ((-8163 : Rat) / 4) [(4, 2), (5, 2), (14, 1)],
  term ((8163 : Rat) / 4) [(5, 2), (14, 1), (15, 2)],
  term ((8163 : Rat) / 4) [(5, 2), (14, 3)],
  term ((-8163 : Rat) / 4) [(5, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 5. -/
theorem ep_Q2_064_partial_05_0255_valid :
    mulPoly ep_Q2_064_coefficient_05_0255
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0256 : Poly :=
[
  term (-99 : Rat) [(6, 1)]
]

/-- Partial product 256 for generator 5. -/
def ep_Q2_064_partial_05_0256 : Poly :=
[
  term (-99 : Rat) [(4, 2), (6, 1)],
  term (-99 : Rat) [(5, 2), (6, 1)],
  term (99 : Rat) [(6, 1), (14, 2)],
  term (99 : Rat) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 5. -/
theorem ep_Q2_064_partial_05_0256_valid :
    mulPoly ep_Q2_064_coefficient_05_0256
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0257 : Poly :=
[
  term (27 : Rat) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 257 for generator 5. -/
def ep_Q2_064_partial_05_0257 : Poly :=
[
  term (27 : Rat) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term (27 : Rat) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term (-27 : Rat) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term (-27 : Rat) [(6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 5. -/
theorem ep_Q2_064_partial_05_0257_valid :
    mulPoly ep_Q2_064_coefficient_05_0257
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0258 : Poly :=
[
  term ((-42615 : Rat) / 4) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 258 for generator 5. -/
def ep_Q2_064_partial_05_0258 : Poly :=
[
  term ((-42615 : Rat) / 4) [(4, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-42615 : Rat) / 4) [(5, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 5. -/
theorem ep_Q2_064_partial_05_0258_valid :
    mulPoly ep_Q2_064_coefficient_05_0258
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0259 : Poly :=
[
  term (405 : Rat) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 259 for generator 5. -/
def ep_Q2_064_partial_05_0259 : Poly :=
[
  term (405 : Rat) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term (405 : Rat) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term (-405 : Rat) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term (-405 : Rat) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 5. -/
theorem ep_Q2_064_partial_05_0259_valid :
    mulPoly ep_Q2_064_coefficient_05_0259
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0260 : Poly :=
[
  term (22728 : Rat) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 260 for generator 5. -/
def ep_Q2_064_partial_05_0260 : Poly :=
[
  term (22728 : Rat) [(4, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term (22728 : Rat) [(5, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term (-22728 : Rat) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term (-22728 : Rat) [(6, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 5. -/
theorem ep_Q2_064_partial_05_0260_valid :
    mulPoly ep_Q2_064_coefficient_05_0260
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0261 : Poly :=
[
  term (-864 : Rat) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 261 for generator 5. -/
def ep_Q2_064_partial_05_0261 : Poly :=
[
  term (-864 : Rat) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term (-864 : Rat) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term (864 : Rat) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term (864 : Rat) [(6, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 5. -/
theorem ep_Q2_064_partial_05_0261_valid :
    mulPoly ep_Q2_064_coefficient_05_0261
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0262 : Poly :=
[
  term ((-42615 : Rat) / 4) [(6, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 262 for generator 5. -/
def ep_Q2_064_partial_05_0262 : Poly :=
[
  term ((-42615 : Rat) / 4) [(4, 2), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-42615 : Rat) / 4) [(5, 2), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (14, 1), (15, 3)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 5. -/
theorem ep_Q2_064_partial_05_0262_valid :
    mulPoly ep_Q2_064_coefficient_05_0262
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0263 : Poly :=
[
  term ((20751 : Rat) / 2) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 263 for generator 5. -/
def ep_Q2_064_partial_05_0263 : Poly :=
[
  term ((20751 : Rat) / 2) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((20751 : Rat) / 2) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-20751 : Rat) / 2) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-20751 : Rat) / 2) [(6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 5. -/
theorem ep_Q2_064_partial_05_0263_valid :
    mulPoly ep_Q2_064_coefficient_05_0263
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0264 : Poly :=
[
  term (2841 : Rat) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 264 for generator 5. -/
def ep_Q2_064_partial_05_0264 : Poly :=
[
  term (2841 : Rat) [(4, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term (2841 : Rat) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term (-2841 : Rat) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term (-2841 : Rat) [(6, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 5. -/
theorem ep_Q2_064_partial_05_0264_valid :
    mulPoly ep_Q2_064_coefficient_05_0264
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0265 : Poly :=
[
  term ((2841 : Rat) / 4) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 265 for generator 5. -/
def ep_Q2_064_partial_05_0265 : Poly :=
[
  term ((2841 : Rat) / 4) [(4, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 5. -/
theorem ep_Q2_064_partial_05_0265_valid :
    mulPoly ep_Q2_064_coefficient_05_0265
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0266 : Poly :=
[
  term (-2841 : Rat) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 266 for generator 5. -/
def ep_Q2_064_partial_05_0266 : Poly :=
[
  term (-2841 : Rat) [(4, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term (-2841 : Rat) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term (2841 : Rat) [(6, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term (2841 : Rat) [(6, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 5. -/
theorem ep_Q2_064_partial_05_0266_valid :
    mulPoly ep_Q2_064_coefficient_05_0266
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0267 : Poly :=
[
  term ((13215 : Rat) / 8) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 267 for generator 5. -/
def ep_Q2_064_partial_05_0267 : Poly :=
[
  term ((13215 : Rat) / 8) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((13215 : Rat) / 8) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((-13215 : Rat) / 8) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-13215 : Rat) / 8) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 5. -/
theorem ep_Q2_064_partial_05_0267_valid :
    mulPoly ep_Q2_064_coefficient_05_0267
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0268 : Poly :=
[
  term ((-19911 : Rat) / 4) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 268 for generator 5. -/
def ep_Q2_064_partial_05_0268 : Poly :=
[
  term ((-19911 : Rat) / 4) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-19911 : Rat) / 4) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((19911 : Rat) / 4) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((19911 : Rat) / 4) [(6, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 5. -/
theorem ep_Q2_064_partial_05_0268_valid :
    mulPoly ep_Q2_064_coefficient_05_0268
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0269 : Poly :=
[
  term ((-26815 : Rat) / 8) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 269 for generator 5. -/
def ep_Q2_064_partial_05_0269 : Poly :=
[
  term ((-26815 : Rat) / 8) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-26815 : Rat) / 8) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((26815 : Rat) / 8) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((26815 : Rat) / 8) [(6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 5. -/
theorem ep_Q2_064_partial_05_0269_valid :
    mulPoly ep_Q2_064_coefficient_05_0269
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0270 : Poly :=
[
  term ((168629 : Rat) / 16) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 270 for generator 5. -/
def ep_Q2_064_partial_05_0270 : Poly :=
[
  term ((168629 : Rat) / 16) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((168629 : Rat) / 16) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-168629 : Rat) / 16) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-168629 : Rat) / 16) [(6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 5. -/
theorem ep_Q2_064_partial_05_0270_valid :
    mulPoly ep_Q2_064_coefficient_05_0270
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0271 : Poly :=
[
  term ((881 : Rat) / 8) [(6, 1), (9, 2)]
]

/-- Partial product 271 for generator 5. -/
def ep_Q2_064_partial_05_0271 : Poly :=
[
  term ((881 : Rat) / 8) [(4, 2), (6, 1), (9, 2)],
  term ((881 : Rat) / 8) [(5, 2), (6, 1), (9, 2)],
  term ((-881 : Rat) / 8) [(6, 1), (9, 2), (14, 2)],
  term ((-881 : Rat) / 8) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 5. -/
theorem ep_Q2_064_partial_05_0271_valid :
    mulPoly ep_Q2_064_coefficient_05_0271
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0272 : Poly :=
[
  term ((-42975 : Rat) / 4) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 272 for generator 5. -/
def ep_Q2_064_partial_05_0272 : Poly :=
[
  term ((-42975 : Rat) / 4) [(4, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((42975 : Rat) / 4) [(6, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 5. -/
theorem ep_Q2_064_partial_05_0272_valid :
    mulPoly ep_Q2_064_coefficient_05_0272
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0273 : Poly :=
[
  term ((7041 : Rat) / 4) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 273 for generator 5. -/
def ep_Q2_064_partial_05_0273 : Poly :=
[
  term ((7041 : Rat) / 4) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((7041 : Rat) / 4) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((-7041 : Rat) / 4) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-7041 : Rat) / 4) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 5. -/
theorem ep_Q2_064_partial_05_0273_valid :
    mulPoly ep_Q2_064_coefficient_05_0273
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0274 : Poly :=
[
  term ((-235419 : Rat) / 16) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 274 for generator 5. -/
def ep_Q2_064_partial_05_0274 : Poly :=
[
  term ((-235419 : Rat) / 16) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-235419 : Rat) / 16) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((235419 : Rat) / 16) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((235419 : Rat) / 16) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 5. -/
theorem ep_Q2_064_partial_05_0274_valid :
    mulPoly ep_Q2_064_coefficient_05_0274
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0275 : Poly :=
[
  term ((27 : Rat) / 2) [(6, 1), (11, 2)]
]

/-- Partial product 275 for generator 5. -/
def ep_Q2_064_partial_05_0275 : Poly :=
[
  term ((27 : Rat) / 2) [(4, 2), (6, 1), (11, 2)],
  term ((27 : Rat) / 2) [(5, 2), (6, 1), (11, 2)],
  term ((-27 : Rat) / 2) [(6, 1), (11, 2), (14, 2)],
  term ((-27 : Rat) / 2) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 5. -/
theorem ep_Q2_064_partial_05_0275_valid :
    mulPoly ep_Q2_064_coefficient_05_0275
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0276 : Poly :=
[
  term ((-1809 : Rat) / 16) [(6, 1), (12, 1)]
]

/-- Partial product 276 for generator 5. -/
def ep_Q2_064_partial_05_0276 : Poly :=
[
  term ((-1809 : Rat) / 16) [(4, 2), (6, 1), (12, 1)],
  term ((-1809 : Rat) / 16) [(5, 2), (6, 1), (12, 1)],
  term ((1809 : Rat) / 16) [(6, 1), (12, 1), (14, 2)],
  term ((1809 : Rat) / 16) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 5. -/
theorem ep_Q2_064_partial_05_0276_valid :
    mulPoly ep_Q2_064_coefficient_05_0276
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0277 : Poly :=
[
  term (22920 : Rat) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 277 for generator 5. -/
def ep_Q2_064_partial_05_0277 : Poly :=
[
  term (22920 : Rat) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (22920 : Rat) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-22920 : Rat) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term (-22920 : Rat) [(6, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 5. -/
theorem ep_Q2_064_partial_05_0277_valid :
    mulPoly ep_Q2_064_coefficient_05_0277
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0278 : Poly :=
[
  term (-19983 : Rat) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 278 for generator 5. -/
def ep_Q2_064_partial_05_0278 : Poly :=
[
  term (-19983 : Rat) [(4, 2), (6, 1), (12, 1), (15, 2)],
  term (-19983 : Rat) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term (19983 : Rat) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term (19983 : Rat) [(6, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 5. -/
theorem ep_Q2_064_partial_05_0278_valid :
    mulPoly ep_Q2_064_coefficient_05_0278
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0279 : Poly :=
[
  term ((19887 : Rat) / 4) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 279 for generator 5. -/
def ep_Q2_064_partial_05_0279 : Poly :=
[
  term ((19887 : Rat) / 4) [(4, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((19887 : Rat) / 4) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19887 : Rat) / 4) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-19887 : Rat) / 4) [(6, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 5. -/
theorem ep_Q2_064_partial_05_0279_valid :
    mulPoly ep_Q2_064_coefficient_05_0279
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0280 : Poly :=
[
  term ((-103217 : Rat) / 16) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 280 for generator 5. -/
def ep_Q2_064_partial_05_0280 : Poly :=
[
  term ((-103217 : Rat) / 16) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-103217 : Rat) / 16) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((103217 : Rat) / 16) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((103217 : Rat) / 16) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 5. -/
theorem ep_Q2_064_partial_05_0280_valid :
    mulPoly ep_Q2_064_coefficient_05_0280
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0281 : Poly :=
[
  term ((-15819 : Rat) / 4) [(6, 1), (13, 2)]
]

/-- Partial product 281 for generator 5. -/
def ep_Q2_064_partial_05_0281 : Poly :=
[
  term ((-15819 : Rat) / 4) [(4, 2), (6, 1), (13, 2)],
  term ((-15819 : Rat) / 4) [(5, 2), (6, 1), (13, 2)],
  term ((15819 : Rat) / 4) [(6, 1), (13, 2), (14, 2)],
  term ((15819 : Rat) / 4) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 5. -/
theorem ep_Q2_064_partial_05_0281_valid :
    mulPoly ep_Q2_064_coefficient_05_0281
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0282 : Poly :=
[
  term ((2169 : Rat) / 8) [(6, 1), (14, 1)]
]

/-- Partial product 282 for generator 5. -/
def ep_Q2_064_partial_05_0282 : Poly :=
[
  term ((2169 : Rat) / 8) [(4, 2), (6, 1), (14, 1)],
  term ((2169 : Rat) / 8) [(5, 2), (6, 1), (14, 1)],
  term ((-2169 : Rat) / 8) [(6, 1), (14, 1), (15, 2)],
  term ((-2169 : Rat) / 8) [(6, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 5. -/
theorem ep_Q2_064_partial_05_0282_valid :
    mulPoly ep_Q2_064_coefficient_05_0282
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0283 : Poly :=
[
  term (5434 : Rat) [(6, 1), (15, 2)]
]

/-- Partial product 283 for generator 5. -/
def ep_Q2_064_partial_05_0283 : Poly :=
[
  term (5434 : Rat) [(4, 2), (6, 1), (15, 2)],
  term (5434 : Rat) [(5, 2), (6, 1), (15, 2)],
  term (-5434 : Rat) [(6, 1), (14, 2), (15, 2)],
  term (-5434 : Rat) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 5. -/
theorem ep_Q2_064_partial_05_0283_valid :
    mulPoly ep_Q2_064_coefficient_05_0283
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0284 : Poly :=
[
  term (-16 : Rat) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 284 for generator 5. -/
def ep_Q2_064_partial_05_0284 : Poly :=
[
  term (-16 : Rat) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 5. -/
theorem ep_Q2_064_partial_05_0284_valid :
    mulPoly ep_Q2_064_coefficient_05_0284
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0285 : Poly :=
[
  term ((2841 : Rat) / 4) [(6, 2), (9, 1), (15, 1)]
]

/-- Partial product 285 for generator 5. -/
def ep_Q2_064_partial_05_0285 : Poly :=
[
  term ((2841 : Rat) / 4) [(4, 2), (6, 2), (9, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(5, 2), (6, 2), (9, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 2), (9, 1), (14, 2), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 5. -/
theorem ep_Q2_064_partial_05_0285_valid :
    mulPoly ep_Q2_064_coefficient_05_0285
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0286 : Poly :=
[
  term ((42615 : Rat) / 4) [(6, 2), (11, 1), (15, 1)]
]

/-- Partial product 286 for generator 5. -/
def ep_Q2_064_partial_05_0286 : Poly :=
[
  term ((42615 : Rat) / 4) [(4, 2), (6, 2), (11, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(5, 2), (6, 2), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 4) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((-42615 : Rat) / 4) [(6, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 5. -/
theorem ep_Q2_064_partial_05_0286_valid :
    mulPoly ep_Q2_064_coefficient_05_0286
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0287 : Poly :=
[
  term (-22728 : Rat) [(6, 2), (13, 1), (15, 1)]
]

/-- Partial product 287 for generator 5. -/
def ep_Q2_064_partial_05_0287 : Poly :=
[
  term (-22728 : Rat) [(4, 2), (6, 2), (13, 1), (15, 1)],
  term (-22728 : Rat) [(5, 2), (6, 2), (13, 1), (15, 1)],
  term (22728 : Rat) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term (22728 : Rat) [(6, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 5. -/
theorem ep_Q2_064_partial_05_0287_valid :
    mulPoly ep_Q2_064_coefficient_05_0287
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0288 : Poly :=
[
  term (11364 : Rat) [(6, 2), (15, 2)]
]

/-- Partial product 288 for generator 5. -/
def ep_Q2_064_partial_05_0288 : Poly :=
[
  term (11364 : Rat) [(4, 2), (6, 2), (15, 2)],
  term (11364 : Rat) [(5, 2), (6, 2), (15, 2)],
  term (-11364 : Rat) [(6, 2), (14, 2), (15, 2)],
  term (-11364 : Rat) [(6, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 5. -/
theorem ep_Q2_064_partial_05_0288_valid :
    mulPoly ep_Q2_064_coefficient_05_0288
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0289 : Poly :=
[
  term (108 : Rat) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 289 for generator 5. -/
def ep_Q2_064_partial_05_0289 : Poly :=
[
  term (108 : Rat) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term (108 : Rat) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term (-108 : Rat) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term (-108 : Rat) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 5. -/
theorem ep_Q2_064_partial_05_0289_valid :
    mulPoly ep_Q2_064_coefficient_05_0289
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0290 : Poly :=
[
  term (27 : Rat) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 290 for generator 5. -/
def ep_Q2_064_partial_05_0290 : Poly :=
[
  term (27 : Rat) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term (27 : Rat) [(5, 2), (7, 1), (8, 1), (13, 1)],
  term (-27 : Rat) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term (-27 : Rat) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 5. -/
theorem ep_Q2_064_partial_05_0290_valid :
    mulPoly ep_Q2_064_coefficient_05_0290
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0291 : Poly :=
[
  term (-2841 : Rat) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 291 for generator 5. -/
def ep_Q2_064_partial_05_0291 : Poly :=
[
  term (-2841 : Rat) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term (-2841 : Rat) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term (2841 : Rat) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term (2841 : Rat) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 5. -/
theorem ep_Q2_064_partial_05_0291_valid :
    mulPoly ep_Q2_064_coefficient_05_0291
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0292 : Poly :=
[
  term ((6707 : Rat) / 4) [(7, 1), (9, 1)]
]

/-- Partial product 292 for generator 5. -/
def ep_Q2_064_partial_05_0292 : Poly :=
[
  term ((6707 : Rat) / 4) [(4, 2), (7, 1), (9, 1)],
  term ((6707 : Rat) / 4) [(5, 2), (7, 1), (9, 1)],
  term ((-6707 : Rat) / 4) [(7, 1), (9, 1), (14, 2)],
  term ((-6707 : Rat) / 4) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 5. -/
theorem ep_Q2_064_partial_05_0292_valid :
    mulPoly ep_Q2_064_coefficient_05_0292
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0293 : Poly :=
[
  term ((-14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 293 for generator 5. -/
def ep_Q2_064_partial_05_0293 : Poly :=
[
  term ((-14079 : Rat) / 8) [(4, 2), (7, 1), (9, 1), (10, 1)],
  term ((-14079 : Rat) / 8) [(5, 2), (7, 1), (9, 1), (10, 1)],
  term ((14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 5. -/
theorem ep_Q2_064_partial_05_0293_valid :
    mulPoly ep_Q2_064_coefficient_05_0293
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0294 : Poly :=
[
  term (3362 : Rat) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 294 for generator 5. -/
def ep_Q2_064_partial_05_0294 : Poly :=
[
  term (3362 : Rat) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term (3362 : Rat) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term (-3362 : Rat) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term (-3362 : Rat) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 5. -/
theorem ep_Q2_064_partial_05_0294_valid :
    mulPoly ep_Q2_064_coefficient_05_0294
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0295 : Poly :=
[
  term ((-13215 : Rat) / 8) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 295 for generator 5. -/
def ep_Q2_064_partial_05_0295 : Poly :=
[
  term ((-13215 : Rat) / 8) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-13215 : Rat) / 8) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((13215 : Rat) / 8) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((13215 : Rat) / 8) [(7, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 5. -/
theorem ep_Q2_064_partial_05_0295_valid :
    mulPoly ep_Q2_064_coefficient_05_0295
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0296 : Poly :=
[
  term ((-27 : Rat) / 2) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 296 for generator 5. -/
def ep_Q2_064_partial_05_0296 : Poly :=
[
  term ((-27 : Rat) / 2) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-27 : Rat) / 2) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 5. -/
theorem ep_Q2_064_partial_05_0296_valid :
    mulPoly ep_Q2_064_coefficient_05_0296
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0297 : Poly :=
[
  term ((42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 297 for generator 5. -/
def ep_Q2_064_partial_05_0297 : Poly :=
[
  term ((42975 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 5. -/
theorem ep_Q2_064_partial_05_0297_valid :
    mulPoly ep_Q2_064_coefficient_05_0297
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0298 : Poly :=
[
  term ((-7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 298 for generator 5. -/
def ep_Q2_064_partial_05_0298 : Poly :=
[
  term ((-7149 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((-7149 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 5. -/
theorem ep_Q2_064_partial_05_0298_valid :
    mulPoly ep_Q2_064_coefficient_05_0298
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0299 : Poly :=
[
  term ((87687 : Rat) / 16) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 299 for generator 5. -/
def ep_Q2_064_partial_05_0299 : Poly :=
[
  term ((87687 : Rat) / 16) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((87687 : Rat) / 16) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-87687 : Rat) / 16) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-87687 : Rat) / 16) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 5. -/
theorem ep_Q2_064_partial_05_0299_valid :
    mulPoly ep_Q2_064_coefficient_05_0299
        ep_Q2_064_generator_05_0200_0299 =
      ep_Q2_064_partial_05_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_05_0200_0299 : List Poly :=
[
  ep_Q2_064_partial_05_0200,
  ep_Q2_064_partial_05_0201,
  ep_Q2_064_partial_05_0202,
  ep_Q2_064_partial_05_0203,
  ep_Q2_064_partial_05_0204,
  ep_Q2_064_partial_05_0205,
  ep_Q2_064_partial_05_0206,
  ep_Q2_064_partial_05_0207,
  ep_Q2_064_partial_05_0208,
  ep_Q2_064_partial_05_0209,
  ep_Q2_064_partial_05_0210,
  ep_Q2_064_partial_05_0211,
  ep_Q2_064_partial_05_0212,
  ep_Q2_064_partial_05_0213,
  ep_Q2_064_partial_05_0214,
  ep_Q2_064_partial_05_0215,
  ep_Q2_064_partial_05_0216,
  ep_Q2_064_partial_05_0217,
  ep_Q2_064_partial_05_0218,
  ep_Q2_064_partial_05_0219,
  ep_Q2_064_partial_05_0220,
  ep_Q2_064_partial_05_0221,
  ep_Q2_064_partial_05_0222,
  ep_Q2_064_partial_05_0223,
  ep_Q2_064_partial_05_0224,
  ep_Q2_064_partial_05_0225,
  ep_Q2_064_partial_05_0226,
  ep_Q2_064_partial_05_0227,
  ep_Q2_064_partial_05_0228,
  ep_Q2_064_partial_05_0229,
  ep_Q2_064_partial_05_0230,
  ep_Q2_064_partial_05_0231,
  ep_Q2_064_partial_05_0232,
  ep_Q2_064_partial_05_0233,
  ep_Q2_064_partial_05_0234,
  ep_Q2_064_partial_05_0235,
  ep_Q2_064_partial_05_0236,
  ep_Q2_064_partial_05_0237,
  ep_Q2_064_partial_05_0238,
  ep_Q2_064_partial_05_0239,
  ep_Q2_064_partial_05_0240,
  ep_Q2_064_partial_05_0241,
  ep_Q2_064_partial_05_0242,
  ep_Q2_064_partial_05_0243,
  ep_Q2_064_partial_05_0244,
  ep_Q2_064_partial_05_0245,
  ep_Q2_064_partial_05_0246,
  ep_Q2_064_partial_05_0247,
  ep_Q2_064_partial_05_0248,
  ep_Q2_064_partial_05_0249,
  ep_Q2_064_partial_05_0250,
  ep_Q2_064_partial_05_0251,
  ep_Q2_064_partial_05_0252,
  ep_Q2_064_partial_05_0253,
  ep_Q2_064_partial_05_0254,
  ep_Q2_064_partial_05_0255,
  ep_Q2_064_partial_05_0256,
  ep_Q2_064_partial_05_0257,
  ep_Q2_064_partial_05_0258,
  ep_Q2_064_partial_05_0259,
  ep_Q2_064_partial_05_0260,
  ep_Q2_064_partial_05_0261,
  ep_Q2_064_partial_05_0262,
  ep_Q2_064_partial_05_0263,
  ep_Q2_064_partial_05_0264,
  ep_Q2_064_partial_05_0265,
  ep_Q2_064_partial_05_0266,
  ep_Q2_064_partial_05_0267,
  ep_Q2_064_partial_05_0268,
  ep_Q2_064_partial_05_0269,
  ep_Q2_064_partial_05_0270,
  ep_Q2_064_partial_05_0271,
  ep_Q2_064_partial_05_0272,
  ep_Q2_064_partial_05_0273,
  ep_Q2_064_partial_05_0274,
  ep_Q2_064_partial_05_0275,
  ep_Q2_064_partial_05_0276,
  ep_Q2_064_partial_05_0277,
  ep_Q2_064_partial_05_0278,
  ep_Q2_064_partial_05_0279,
  ep_Q2_064_partial_05_0280,
  ep_Q2_064_partial_05_0281,
  ep_Q2_064_partial_05_0282,
  ep_Q2_064_partial_05_0283,
  ep_Q2_064_partial_05_0284,
  ep_Q2_064_partial_05_0285,
  ep_Q2_064_partial_05_0286,
  ep_Q2_064_partial_05_0287,
  ep_Q2_064_partial_05_0288,
  ep_Q2_064_partial_05_0289,
  ep_Q2_064_partial_05_0290,
  ep_Q2_064_partial_05_0291,
  ep_Q2_064_partial_05_0292,
  ep_Q2_064_partial_05_0293,
  ep_Q2_064_partial_05_0294,
  ep_Q2_064_partial_05_0295,
  ep_Q2_064_partial_05_0296,
  ep_Q2_064_partial_05_0297,
  ep_Q2_064_partial_05_0298,
  ep_Q2_064_partial_05_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_05_0200_0299 : Poly :=
[
  term ((18501 : Rat) / 8) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-2595 : Rat) / 2) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term (5730 : Rat) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1827 : Rat) / 8) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term (-1034 : Rat) [(4, 1), (5, 2), (11, 1), (15, 1)],
  term ((-60165 : Rat) / 4) [(4, 1), (5, 2), (12, 1), (13, 1), (15, 1)],
  term (8595 : Rat) [(4, 1), (5, 2), (12, 1), (15, 2)],
  term ((-33927 : Rat) / 16) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((45645 : Rat) / 16) [(4, 1), (5, 2), (13, 2)],
  term ((-2883 : Rat) / 4) [(4, 1), (5, 2), (15, 2)],
  term (16 : Rat) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((-18501 : Rat) / 8) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-18501 : Rat) / 8) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((2595 : Rat) / 2) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((2595 : Rat) / 2) [(4, 1), (9, 1), (15, 3)],
  term (-5730 : Rat) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term (-5730 : Rat) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((1827 : Rat) / 8) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((1827 : Rat) / 8) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term (1034 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term (1034 : Rat) [(4, 1), (11, 1), (15, 3)],
  term ((60165 : Rat) / 4) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((60165 : Rat) / 4) [(4, 1), (12, 1), (13, 1), (15, 3)],
  term (-8595 : Rat) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term (-8595 : Rat) [(4, 1), (12, 1), (15, 4)],
  term ((33927 : Rat) / 16) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((33927 : Rat) / 16) [(4, 1), (13, 1), (15, 3)],
  term ((-45645 : Rat) / 16) [(4, 1), (13, 2), (14, 2)],
  term ((-45645 : Rat) / 16) [(4, 1), (13, 2), (15, 2)],
  term ((2883 : Rat) / 4) [(4, 1), (14, 2), (15, 2)],
  term (-16 : Rat) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((2883 : Rat) / 4) [(4, 1), (15, 4)],
  term (-16 : Rat) [(4, 1), (15, 4), (16, 1)],
  term (405 : Rat) [(4, 2), (5, 1), (6, 1), (7, 1)],
  term (-5682 : Rat) [(4, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((18267 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (9, 1)],
  term (5682 : Rat) [(4, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-122445 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (11, 1)],
  term ((-88431 : Rat) / 4) [(4, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((288291 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (13, 1)],
  term (2841 : Rat) [(4, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-177729 : Rat) / 16) [(4, 2), (5, 1), (6, 1), (15, 1)],
  term (-16 : Rat) [(4, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((42615 : Rat) / 4) [(4, 2), (5, 1), (6, 2), (15, 1)],
  term ((-14103 : Rat) / 2) [(4, 2), (5, 1), (7, 1)],
  term (-216 : Rat) [(4, 2), (5, 1), (7, 1), (8, 1)],
  term ((125901 : Rat) / 16) [(4, 2), (5, 1), (7, 1), (10, 1)],
  term (-16758 : Rat) [(4, 2), (5, 1), (7, 1), (12, 1)],
  term ((120555 : Rat) / 16) [(4, 2), (5, 1), (7, 1), (14, 1)],
  term (-881 : Rat) [(4, 2), (5, 1), (8, 1), (9, 1)],
  term ((-8163 : Rat) / 4) [(4, 2), (5, 1), (8, 1), (11, 1)],
  term (5730 : Rat) [(4, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-12105 : Rat) / 16) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term ((785 : Rat) / 2) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((-49625 : Rat) / 16) [(4, 2), (5, 1), (9, 1)],
  term ((11687 : Rat) / 4) [(4, 2), (5, 1), (9, 1), (10, 1)],
  term ((10393 : Rat) / 8) [(4, 2), (5, 1), (9, 1), (12, 1)],
  term ((881 : Rat) / 2) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term (-5730 : Rat) [(4, 2), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((1827 : Rat) / 8) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term (1034 : Rat) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((106119 : Rat) / 16) [(4, 2), (5, 1), (11, 1)],
  term ((-5115 : Rat) / 2) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term (-2865 : Rat) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((38891 : Rat) / 4) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term (11460 : Rat) [(4, 2), (5, 1), (12, 2), (15, 1)],
  term ((-28659 : Rat) / 32) [(4, 2), (5, 1), (13, 1)],
  term ((-49455 : Rat) / 16) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((4549 : Rat) / 4) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87575 : Rat) / 16) [(4, 2), (5, 1), (15, 1)],
  term (32 : Rat) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((40815 : Rat) / 16) [(4, 2), (5, 2)],
  term ((-122445 : Rat) / 16) [(4, 2), (5, 2), (6, 1)],
  term ((8163 : Rat) / 2) [(4, 2), (5, 2), (8, 1)],
  term ((-8163 : Rat) / 2) [(4, 2), (5, 2), (10, 1)],
  term (8163 : Rat) [(4, 2), (5, 2), (12, 1)],
  term ((-8163 : Rat) / 4) [(4, 2), (5, 2), (14, 1)],
  term (-99 : Rat) [(4, 2), (6, 1)],
  term (27 : Rat) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((-42615 : Rat) / 4) [(4, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term (405 : Rat) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term (22728 : Rat) [(4, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term (-864 : Rat) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((-42615 : Rat) / 4) [(4, 2), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((20751 : Rat) / 2) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term (2841 : Rat) [(4, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(4, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term (-2841 : Rat) [(4, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((13215 : Rat) / 8) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((-19911 : Rat) / 4) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-26815 : Rat) / 8) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((168629 : Rat) / 16) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((881 : Rat) / 8) [(4, 2), (6, 1), (9, 2)],
  term ((-42975 : Rat) / 4) [(4, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((7041 : Rat) / 4) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((-235419 : Rat) / 16) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(4, 2), (6, 1), (11, 2)],
  term ((-1809 : Rat) / 16) [(4, 2), (6, 1), (12, 1)],
  term (22920 : Rat) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-19983 : Rat) [(4, 2), (6, 1), (12, 1), (15, 2)],
  term ((19887 : Rat) / 4) [(4, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-103217 : Rat) / 16) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(4, 2), (6, 1), (13, 2)],
  term ((2169 : Rat) / 8) [(4, 2), (6, 1), (14, 1)],
  term (5434 : Rat) [(4, 2), (6, 1), (15, 2)],
  term (-16 : Rat) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((2841 : Rat) / 4) [(4, 2), (6, 2), (9, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(4, 2), (6, 2), (11, 1), (15, 1)],
  term (-22728 : Rat) [(4, 2), (6, 2), (13, 1), (15, 1)],
  term (11364 : Rat) [(4, 2), (6, 2), (15, 2)],
  term (108 : Rat) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term (27 : Rat) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term (-2841 : Rat) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((6707 : Rat) / 4) [(4, 2), (7, 1), (9, 1)],
  term ((-14079 : Rat) / 8) [(4, 2), (7, 1), (9, 1), (10, 1)],
  term (3362 : Rat) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((-13215 : Rat) / 8) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-27 : Rat) / 2) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((42975 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((87687 : Rat) / 16) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((18501 : Rat) / 8) [(4, 3), (9, 1), (13, 1)],
  term ((-2595 : Rat) / 2) [(4, 3), (9, 1), (15, 1)],
  term (5730 : Rat) [(4, 3), (11, 1), (12, 1), (15, 1)],
  term ((-1827 : Rat) / 8) [(4, 3), (11, 1), (13, 1)],
  term (-1034 : Rat) [(4, 3), (11, 1), (15, 1)],
  term ((-60165 : Rat) / 4) [(4, 3), (12, 1), (13, 1), (15, 1)],
  term (8595 : Rat) [(4, 3), (12, 1), (15, 2)],
  term ((-33927 : Rat) / 16) [(4, 3), (13, 1), (15, 1)],
  term ((45645 : Rat) / 16) [(4, 3), (13, 2)],
  term ((-2883 : Rat) / 4) [(4, 3), (15, 2)],
  term (16 : Rat) [(4, 3), (15, 2), (16, 1)],
  term (-405 : Rat) [(5, 1), (6, 1), (7, 1), (14, 2)],
  term (-405 : Rat) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term (5682 : Rat) [(5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term (5682 : Rat) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-18267 : Rat) / 16) [(5, 1), (6, 1), (9, 1), (14, 2)],
  term ((-18267 : Rat) / 16) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term (-5682 : Rat) [(5, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term (-5682 : Rat) [(5, 1), (6, 1), (10, 1), (15, 3)],
  term ((122445 : Rat) / 16) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((122445 : Rat) / 16) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((88431 : Rat) / 4) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((88431 : Rat) / 4) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((-288291 : Rat) / 16) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((-288291 : Rat) / 16) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term (-2841 : Rat) [(5, 1), (6, 1), (14, 1), (15, 3)],
  term ((177729 : Rat) / 16) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term (16 : Rat) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term (-2841 : Rat) [(5, 1), (6, 1), (14, 3), (15, 1)],
  term ((177729 : Rat) / 16) [(5, 1), (6, 1), (15, 3)],
  term (16 : Rat) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-42615 : Rat) / 4) [(5, 1), (6, 2), (14, 2), (15, 1)],
  term ((-42615 : Rat) / 4) [(5, 1), (6, 2), (15, 3)],
  term (216 : Rat) [(5, 1), (7, 1), (8, 1), (14, 2)],
  term (216 : Rat) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-125901 : Rat) / 16) [(5, 1), (7, 1), (10, 1), (14, 2)],
  term ((-125901 : Rat) / 16) [(5, 1), (7, 1), (10, 1), (15, 2)],
  term (16758 : Rat) [(5, 1), (7, 1), (12, 1), (14, 2)],
  term (16758 : Rat) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((-120555 : Rat) / 16) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((14103 : Rat) / 2) [(5, 1), (7, 1), (14, 2)],
  term ((-120555 : Rat) / 16) [(5, 1), (7, 1), (14, 3)],
  term ((14103 : Rat) / 2) [(5, 1), (7, 1), (15, 2)],
  term (881 : Rat) [(5, 1), (8, 1), (9, 1), (14, 2)],
  term (881 : Rat) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((8163 : Rat) / 4) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((8163 : Rat) / 4) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term (-5730 : Rat) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term (-5730 : Rat) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((12105 : Rat) / 16) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((12105 : Rat) / 16) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-785 : Rat) / 2) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-785 : Rat) / 2) [(5, 1), (8, 1), (15, 3)],
  term ((-11687 : Rat) / 4) [(5, 1), (9, 1), (10, 1), (14, 2)],
  term ((-11687 : Rat) / 4) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-10393 : Rat) / 8) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((-10393 : Rat) / 8) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-881 : Rat) / 2) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((49625 : Rat) / 16) [(5, 1), (9, 1), (14, 2)],
  term ((-881 : Rat) / 2) [(5, 1), (9, 1), (14, 3)],
  term ((49625 : Rat) / 16) [(5, 1), (9, 1), (15, 2)],
  term (5730 : Rat) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term (5730 : Rat) [(5, 1), (10, 1), (12, 1), (15, 3)],
  term ((-1827 : Rat) / 8) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1827 : Rat) / 8) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term (-1034 : Rat) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term (-1034 : Rat) [(5, 1), (10, 1), (15, 3)],
  term ((-106119 : Rat) / 16) [(5, 1), (11, 1), (14, 2)],
  term ((-106119 : Rat) / 16) [(5, 1), (11, 1), (15, 2)],
  term ((5115 : Rat) / 2) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((5115 : Rat) / 2) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term (2865 : Rat) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-38891 : Rat) / 4) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term (2865 : Rat) [(5, 1), (12, 1), (14, 3), (15, 1)],
  term ((-38891 : Rat) / 4) [(5, 1), (12, 1), (15, 3)],
  term (-11460 : Rat) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term (-11460 : Rat) [(5, 1), (12, 2), (15, 3)],
  term ((49455 : Rat) / 16) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((28659 : Rat) / 32) [(5, 1), (13, 1), (14, 2)],
  term ((49455 : Rat) / 16) [(5, 1), (13, 1), (14, 3)],
  term ((28659 : Rat) / 32) [(5, 1), (13, 1), (15, 2)],
  term ((-4549 : Rat) / 4) [(5, 1), (14, 1), (15, 3)],
  term (16 : Rat) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((87575 : Rat) / 16) [(5, 1), (14, 2), (15, 1)],
  term (-32 : Rat) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4549 : Rat) / 4) [(5, 1), (14, 3), (15, 1)],
  term (16 : Rat) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((87575 : Rat) / 16) [(5, 1), (15, 3)],
  term (-32 : Rat) [(5, 1), (15, 3), (16, 1)],
  term (-99 : Rat) [(5, 2), (6, 1)],
  term (27 : Rat) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term ((-42615 : Rat) / 4) [(5, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term (405 : Rat) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term (22728 : Rat) [(5, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term (-864 : Rat) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((-42615 : Rat) / 4) [(5, 2), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((20751 : Rat) / 2) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term (2841 : Rat) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term (-2841 : Rat) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((13215 : Rat) / 8) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((-19911 : Rat) / 4) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-26815 : Rat) / 8) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((168629 : Rat) / 16) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((881 : Rat) / 8) [(5, 2), (6, 1), (9, 2)],
  term ((-42975 : Rat) / 4) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((7041 : Rat) / 4) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((-235419 : Rat) / 16) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(5, 2), (6, 1), (11, 2)],
  term ((-1809 : Rat) / 16) [(5, 2), (6, 1), (12, 1)],
  term (22920 : Rat) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-19983 : Rat) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term ((19887 : Rat) / 4) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-103217 : Rat) / 16) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(5, 2), (6, 1), (13, 2)],
  term ((2169 : Rat) / 8) [(5, 2), (6, 1), (14, 1)],
  term ((122445 : Rat) / 16) [(5, 2), (6, 1), (14, 2)],
  term ((209389 : Rat) / 16) [(5, 2), (6, 1), (15, 2)],
  term (-16 : Rat) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((2841 : Rat) / 4) [(5, 2), (6, 2), (9, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(5, 2), (6, 2), (11, 1), (15, 1)],
  term (-22728 : Rat) [(5, 2), (6, 2), (13, 1), (15, 1)],
  term (11364 : Rat) [(5, 2), (6, 2), (15, 2)],
  term (108 : Rat) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term (27 : Rat) [(5, 2), (7, 1), (8, 1), (13, 1)],
  term (-2841 : Rat) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((6707 : Rat) / 4) [(5, 2), (7, 1), (9, 1)],
  term ((-14079 : Rat) / 8) [(5, 2), (7, 1), (9, 1), (10, 1)],
  term (3362 : Rat) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((-13215 : Rat) / 8) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-27 : Rat) / 2) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((42975 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7149 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((87687 : Rat) / 16) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-8163 : Rat) / 2) [(5, 2), (8, 1), (14, 2)],
  term ((-8163 : Rat) / 2) [(5, 2), (8, 1), (15, 2)],
  term ((8163 : Rat) / 2) [(5, 2), (10, 1), (14, 2)],
  term ((8163 : Rat) / 2) [(5, 2), (10, 1), (15, 2)],
  term (-8163 : Rat) [(5, 2), (12, 1), (14, 2)],
  term (-8163 : Rat) [(5, 2), (12, 1), (15, 2)],
  term ((8163 : Rat) / 4) [(5, 2), (14, 1), (15, 2)],
  term ((-40815 : Rat) / 16) [(5, 2), (14, 2)],
  term ((8163 : Rat) / 4) [(5, 2), (14, 3)],
  term ((-40815 : Rat) / 16) [(5, 2), (15, 2)],
  term (405 : Rat) [(5, 3), (6, 1), (7, 1)],
  term (-5682 : Rat) [(5, 3), (6, 1), (8, 1), (15, 1)],
  term ((18267 : Rat) / 16) [(5, 3), (6, 1), (9, 1)],
  term (5682 : Rat) [(5, 3), (6, 1), (10, 1), (15, 1)],
  term ((-122445 : Rat) / 16) [(5, 3), (6, 1), (11, 1)],
  term ((-88431 : Rat) / 4) [(5, 3), (6, 1), (12, 1), (15, 1)],
  term ((288291 : Rat) / 16) [(5, 3), (6, 1), (13, 1)],
  term (2841 : Rat) [(5, 3), (6, 1), (14, 1), (15, 1)],
  term ((-177729 : Rat) / 16) [(5, 3), (6, 1), (15, 1)],
  term (-16 : Rat) [(5, 3), (6, 1), (15, 1), (16, 1)],
  term ((42615 : Rat) / 4) [(5, 3), (6, 2), (15, 1)],
  term ((-14103 : Rat) / 2) [(5, 3), (7, 1)],
  term (-216 : Rat) [(5, 3), (7, 1), (8, 1)],
  term ((125901 : Rat) / 16) [(5, 3), (7, 1), (10, 1)],
  term (-16758 : Rat) [(5, 3), (7, 1), (12, 1)],
  term ((120555 : Rat) / 16) [(5, 3), (7, 1), (14, 1)],
  term (-881 : Rat) [(5, 3), (8, 1), (9, 1)],
  term ((-8163 : Rat) / 4) [(5, 3), (8, 1), (11, 1)],
  term (5730 : Rat) [(5, 3), (8, 1), (12, 1), (15, 1)],
  term ((-12105 : Rat) / 16) [(5, 3), (8, 1), (13, 1)],
  term ((785 : Rat) / 2) [(5, 3), (8, 1), (15, 1)],
  term ((-49625 : Rat) / 16) [(5, 3), (9, 1)],
  term ((11687 : Rat) / 4) [(5, 3), (9, 1), (10, 1)],
  term ((10393 : Rat) / 8) [(5, 3), (9, 1), (12, 1)],
  term ((881 : Rat) / 2) [(5, 3), (9, 1), (14, 1)],
  term (-5730 : Rat) [(5, 3), (10, 1), (12, 1), (15, 1)],
  term ((1827 : Rat) / 8) [(5, 3), (10, 1), (13, 1)],
  term (1034 : Rat) [(5, 3), (10, 1), (15, 1)],
  term ((106119 : Rat) / 16) [(5, 3), (11, 1)],
  term ((-5115 : Rat) / 2) [(5, 3), (12, 1), (13, 1)],
  term (-2865 : Rat) [(5, 3), (12, 1), (14, 1), (15, 1)],
  term ((38891 : Rat) / 4) [(5, 3), (12, 1), (15, 1)],
  term (11460 : Rat) [(5, 3), (12, 2), (15, 1)],
  term ((-28659 : Rat) / 32) [(5, 3), (13, 1)],
  term ((-49455 : Rat) / 16) [(5, 3), (13, 1), (14, 1)],
  term ((4549 : Rat) / 4) [(5, 3), (14, 1), (15, 1)],
  term (-16 : Rat) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((-87575 : Rat) / 16) [(5, 3), (15, 1)],
  term (32 : Rat) [(5, 3), (15, 1), (16, 1)],
  term ((40815 : Rat) / 16) [(5, 4)],
  term ((-122445 : Rat) / 16) [(5, 4), (6, 1)],
  term ((8163 : Rat) / 2) [(5, 4), (8, 1)],
  term ((-8163 : Rat) / 2) [(5, 4), (10, 1)],
  term (8163 : Rat) [(5, 4), (12, 1)],
  term ((-8163 : Rat) / 4) [(5, 4), (14, 1)],
  term (-27 : Rat) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term (-27 : Rat) [(6, 1), (7, 1), (9, 1), (15, 2)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (10, 1), (15, 3)],
  term (-405 : Rat) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term (-405 : Rat) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term (-22728 : Rat) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term (-22728 : Rat) [(6, 1), (7, 1), (12, 1), (15, 3)],
  term (864 : Rat) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term (864 : Rat) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (14, 1), (15, 3)],
  term ((-20751 : Rat) / 2) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 1), (7, 1), (14, 3), (15, 1)],
  term ((-20751 : Rat) / 2) [(6, 1), (7, 1), (15, 3)],
  term (-2841 : Rat) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term (-2841 : Rat) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term (2841 : Rat) [(6, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term (2841 : Rat) [(6, 1), (9, 1), (10, 1), (15, 3)],
  term ((-13215 : Rat) / 8) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-13215 : Rat) / 8) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((19911 : Rat) / 4) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((19911 : Rat) / 4) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((26815 : Rat) / 8) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((26815 : Rat) / 8) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-168629 : Rat) / 16) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-168629 : Rat) / 16) [(6, 1), (9, 1), (15, 3)],
  term ((-881 : Rat) / 8) [(6, 1), (9, 2), (14, 2)],
  term ((-881 : Rat) / 8) [(6, 1), (9, 2), (15, 2)],
  term ((42975 : Rat) / 4) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((42975 : Rat) / 4) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((-7041 : Rat) / 4) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-7041 : Rat) / 4) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((235419 : Rat) / 16) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((235419 : Rat) / 16) [(6, 1), (11, 1), (15, 3)],
  term ((-27 : Rat) / 2) [(6, 1), (11, 2), (14, 2)],
  term ((-27 : Rat) / 2) [(6, 1), (11, 2), (15, 2)],
  term (-22920 : Rat) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term (-22920 : Rat) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((1809 : Rat) / 16) [(6, 1), (12, 1), (14, 2)],
  term (19983 : Rat) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((1809 : Rat) / 16) [(6, 1), (12, 1), (15, 2)],
  term (19983 : Rat) [(6, 1), (12, 1), (15, 4)],
  term ((-19887 : Rat) / 4) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((103217 : Rat) / 16) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-19887 : Rat) / 4) [(6, 1), (13, 1), (14, 3), (15, 1)],
  term ((103217 : Rat) / 16) [(6, 1), (13, 1), (15, 3)],
  term ((15819 : Rat) / 4) [(6, 1), (13, 2), (14, 2)],
  term ((15819 : Rat) / 4) [(6, 1), (13, 2), (15, 2)],
  term ((-2169 : Rat) / 8) [(6, 1), (14, 1), (15, 2)],
  term (99 : Rat) [(6, 1), (14, 2)],
  term (-5434 : Rat) [(6, 1), (14, 2), (15, 2)],
  term (16 : Rat) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2169 : Rat) / 8) [(6, 1), (14, 3)],
  term (99 : Rat) [(6, 1), (15, 2)],
  term (-5434 : Rat) [(6, 1), (15, 4)],
  term (16 : Rat) [(6, 1), (15, 4), (16, 1)],
  term ((-2841 : Rat) / 4) [(6, 2), (9, 1), (14, 2), (15, 1)],
  term ((-2841 : Rat) / 4) [(6, 2), (9, 1), (15, 3)],
  term ((-42615 : Rat) / 4) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((-42615 : Rat) / 4) [(6, 2), (11, 1), (15, 3)],
  term (22728 : Rat) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term (22728 : Rat) [(6, 2), (13, 1), (15, 3)],
  term (-11364 : Rat) [(6, 2), (14, 2), (15, 2)],
  term (-11364 : Rat) [(6, 2), (15, 4)],
  term (-108 : Rat) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term (-108 : Rat) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term (-27 : Rat) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term (-27 : Rat) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term (2841 : Rat) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term (2841 : Rat) [(7, 1), (8, 1), (15, 3)],
  term ((14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((14079 : Rat) / 8) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term (-3362 : Rat) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term (-3362 : Rat) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((13215 : Rat) / 8) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-6707 : Rat) / 4) [(7, 1), (9, 1), (14, 2)],
  term ((13215 : Rat) / 8) [(7, 1), (9, 1), (14, 3)],
  term ((-6707 : Rat) / 4) [(7, 1), (9, 1), (15, 2)],
  term ((27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((27 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((7149 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-87687 : Rat) / 16) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-87687 : Rat) / 16) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 299. -/
theorem ep_Q2_064_block_05_0200_0299_valid :
    checkProductSumEq ep_Q2_064_partials_05_0200_0299
      ep_Q2_064_block_05_0200_0299 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
