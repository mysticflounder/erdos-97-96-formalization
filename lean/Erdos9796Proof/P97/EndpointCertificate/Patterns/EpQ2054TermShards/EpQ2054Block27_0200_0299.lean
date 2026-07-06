/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0200 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 200 for generator 27. -/
def ep_Q2_054_partial_27_0200 : Poly :=
[
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 27. -/
theorem ep_Q2_054_partial_27_0200_valid :
    mulPoly ep_Q2_054_coefficient_27_0200
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0201 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 201 for generator 27. -/
def ep_Q2_054_partial_27_0201 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 27. -/
theorem ep_Q2_054_partial_27_0201_valid :
    mulPoly ep_Q2_054_coefficient_27_0201
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0202 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 202 for generator 27. -/
def ep_Q2_054_partial_27_0202 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 27. -/
theorem ep_Q2_054_partial_27_0202_valid :
    mulPoly ep_Q2_054_coefficient_27_0202
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0203 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 203 for generator 27. -/
def ep_Q2_054_partial_27_0203 : Poly :=
[
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 27. -/
theorem ep_Q2_054_partial_27_0203_valid :
    mulPoly ep_Q2_054_coefficient_27_0203
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0204 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 204 for generator 27. -/
def ep_Q2_054_partial_27_0204 : Poly :=
[
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 27. -/
theorem ep_Q2_054_partial_27_0204_valid :
    mulPoly ep_Q2_054_coefficient_27_0204
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0205 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 205 for generator 27. -/
def ep_Q2_054_partial_27_0205 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 27. -/
theorem ep_Q2_054_partial_27_0205_valid :
    mulPoly ep_Q2_054_coefficient_27_0205
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0206 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 206 for generator 27. -/
def ep_Q2_054_partial_27_0206 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 27. -/
theorem ep_Q2_054_partial_27_0206_valid :
    mulPoly ep_Q2_054_coefficient_27_0206
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0207 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 207 for generator 27. -/
def ep_Q2_054_partial_27_0207 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 27. -/
theorem ep_Q2_054_partial_27_0207_valid :
    mulPoly ep_Q2_054_coefficient_27_0207
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0208 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 208 for generator 27. -/
def ep_Q2_054_partial_27_0208 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 27. -/
theorem ep_Q2_054_partial_27_0208_valid :
    mulPoly ep_Q2_054_coefficient_27_0208
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0209 : Poly :=
[
  term ((19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 209 for generator 27. -/
def ep_Q2_054_partial_27_0209 : Poly :=
[
  term ((38086220360160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 27. -/
theorem ep_Q2_054_partial_27_0209_valid :
    mulPoly ep_Q2_054_coefficient_27_0209
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0210 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 210 for generator 27. -/
def ep_Q2_054_partial_27_0210 : Poly :=
[
  term ((-32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 27. -/
theorem ep_Q2_054_partial_27_0210_valid :
    mulPoly ep_Q2_054_coefficient_27_0210
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0211 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 211 for generator 27. -/
def ep_Q2_054_partial_27_0211 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 27. -/
theorem ep_Q2_054_partial_27_0211_valid :
    mulPoly ep_Q2_054_coefficient_27_0211
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0212 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 212 for generator 27. -/
def ep_Q2_054_partial_27_0212 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 27. -/
theorem ep_Q2_054_partial_27_0212_valid :
    mulPoly ep_Q2_054_coefficient_27_0212
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0213 : Poly :=
[
  term ((-9974962475280 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 213 for generator 27. -/
def ep_Q2_054_partial_27_0213 : Poly :=
[
  term ((-19949924950560 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((9974962475280 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 27. -/
theorem ep_Q2_054_partial_27_0213_valid :
    mulPoly ep_Q2_054_coefficient_27_0213
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0214 : Poly :=
[
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 214 for generator 27. -/
def ep_Q2_054_partial_27_0214 : Poly :=
[
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 27. -/
theorem ep_Q2_054_partial_27_0214_valid :
    mulPoly ep_Q2_054_coefficient_27_0214
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0215 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 27. -/
def ep_Q2_054_partial_27_0215 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 27. -/
theorem ep_Q2_054_partial_27_0215_valid :
    mulPoly ep_Q2_054_coefficient_27_0215
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0216 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 216 for generator 27. -/
def ep_Q2_054_partial_27_0216 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 27. -/
theorem ep_Q2_054_partial_27_0216_valid :
    mulPoly ep_Q2_054_coefficient_27_0216
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0217 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 217 for generator 27. -/
def ep_Q2_054_partial_27_0217 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 27. -/
theorem ep_Q2_054_partial_27_0217_valid :
    mulPoly ep_Q2_054_coefficient_27_0217
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0218 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 27. -/
def ep_Q2_054_partial_27_0218 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 27. -/
theorem ep_Q2_054_partial_27_0218_valid :
    mulPoly ep_Q2_054_coefficient_27_0218
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0219 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1)]
]

/-- Partial product 219 for generator 27. -/
def ep_Q2_054_partial_27_0219 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 27. -/
theorem ep_Q2_054_partial_27_0219_valid :
    mulPoly ep_Q2_054_coefficient_27_0219
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0220 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 27. -/
def ep_Q2_054_partial_27_0220 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 27. -/
theorem ep_Q2_054_partial_27_0220_valid :
    mulPoly ep_Q2_054_coefficient_27_0220
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0221 : Poly :=
[
  term ((-7567084616706 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 221 for generator 27. -/
def ep_Q2_054_partial_27_0221 : Poly :=
[
  term ((-15134169233412 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((7567084616706 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 27. -/
theorem ep_Q2_054_partial_27_0221_valid :
    mulPoly ep_Q2_054_coefficient_27_0221
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0222 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 27. -/
def ep_Q2_054_partial_27_0222 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 27. -/
theorem ep_Q2_054_partial_27_0222_valid :
    mulPoly ep_Q2_054_coefficient_27_0222
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0223 : Poly :=
[
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 223 for generator 27. -/
def ep_Q2_054_partial_27_0223 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 27. -/
theorem ep_Q2_054_partial_27_0223_valid :
    mulPoly ep_Q2_054_coefficient_27_0223
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0224 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 27. -/
def ep_Q2_054_partial_27_0224 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 27. -/
theorem ep_Q2_054_partial_27_0224_valid :
    mulPoly ep_Q2_054_coefficient_27_0224
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0225 : Poly :=
[
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 225 for generator 27. -/
def ep_Q2_054_partial_27_0225 : Poly :=
[
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 27. -/
theorem ep_Q2_054_partial_27_0225_valid :
    mulPoly ep_Q2_054_coefficient_27_0225
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0226 : Poly :=
[
  term ((3173851696680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 226 for generator 27. -/
def ep_Q2_054_partial_27_0226 : Poly :=
[
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3173851696680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 27. -/
theorem ep_Q2_054_partial_27_0226_valid :
    mulPoly ep_Q2_054_coefficient_27_0226
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0227 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

/-- Partial product 227 for generator 27. -/
def ep_Q2_054_partial_27_0227 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 27. -/
theorem ep_Q2_054_partial_27_0227_valid :
    mulPoly ep_Q2_054_coefficient_27_0227
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0228 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 228 for generator 27. -/
def ep_Q2_054_partial_27_0228 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 27. -/
theorem ep_Q2_054_partial_27_0228_valid :
    mulPoly ep_Q2_054_coefficient_27_0228
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0229 : Poly :=
[
  term ((18136295409600 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 229 for generator 27. -/
def ep_Q2_054_partial_27_0229 : Poly :=
[
  term ((36272590819200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-18136295409600 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 27. -/
theorem ep_Q2_054_partial_27_0229_valid :
    mulPoly ep_Q2_054_coefficient_27_0229
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0230 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 27. -/
def ep_Q2_054_partial_27_0230 : Poly :=
[
  term ((-14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 27. -/
theorem ep_Q2_054_partial_27_0230_valid :
    mulPoly ep_Q2_054_coefficient_27_0230
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0231 : Poly :=
[
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 231 for generator 27. -/
def ep_Q2_054_partial_27_0231 : Poly :=
[
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 27. -/
theorem ep_Q2_054_partial_27_0231_valid :
    mulPoly ep_Q2_054_coefficient_27_0231
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0232 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 27. -/
def ep_Q2_054_partial_27_0232 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 27. -/
theorem ep_Q2_054_partial_27_0232_valid :
    mulPoly ep_Q2_054_coefficient_27_0232
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0233 : Poly :=
[
  term ((9521555090040 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 233 for generator 27. -/
def ep_Q2_054_partial_27_0233 : Poly :=
[
  term ((19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((-9521555090040 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 27. -/
theorem ep_Q2_054_partial_27_0233_valid :
    mulPoly ep_Q2_054_coefficient_27_0233
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0234 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 27. -/
def ep_Q2_054_partial_27_0234 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 27. -/
theorem ep_Q2_054_partial_27_0234_valid :
    mulPoly ep_Q2_054_coefficient_27_0234
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0235 : Poly :=
[
  term ((8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 235 for generator 27. -/
def ep_Q2_054_partial_27_0235 : Poly :=
[
  term ((16776073253880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 27. -/
theorem ep_Q2_054_partial_27_0235_valid :
    mulPoly ep_Q2_054_coefficient_27_0235
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0236 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 27. -/
def ep_Q2_054_partial_27_0236 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 27. -/
theorem ep_Q2_054_partial_27_0236_valid :
    mulPoly ep_Q2_054_coefficient_27_0236
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0237 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 237 for generator 27. -/
def ep_Q2_054_partial_27_0237 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 27. -/
theorem ep_Q2_054_partial_27_0237_valid :
    mulPoly ep_Q2_054_coefficient_27_0237
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0238 : Poly :=
[
  term ((7113677231466 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 238 for generator 27. -/
def ep_Q2_054_partial_27_0238 : Poly :=
[
  term ((14227354462932 : Rat) / 45033486517) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-7113677231466 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 27. -/
theorem ep_Q2_054_partial_27_0238_valid :
    mulPoly ep_Q2_054_coefficient_27_0238
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0239 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 27. -/
def ep_Q2_054_partial_27_0239 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 27. -/
theorem ep_Q2_054_partial_27_0239_valid :
    mulPoly ep_Q2_054_coefficient_27_0239
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0240 : Poly :=
[
  term ((-156283226433 : Rat) / 90066973034) [(1, 1), (3, 1)]
]

/-- Partial product 240 for generator 27. -/
def ep_Q2_054_partial_27_0240 : Poly :=
[
  term ((156283226433 : Rat) / 90066973034) [(1, 1), (3, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 27. -/
theorem ep_Q2_054_partial_27_0240_valid :
    mulPoly ep_Q2_054_coefficient_27_0240
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0241 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 241 for generator 27. -/
def ep_Q2_054_partial_27_0241 : Poly :=
[
  term ((-312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1)],
  term ((625132905732 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 27. -/
theorem ep_Q2_054_partial_27_0241_valid :
    mulPoly ep_Q2_054_coefficient_27_0241
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0242 : Poly :=
[
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 242 for generator 27. -/
def ep_Q2_054_partial_27_0242 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (14, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 27. -/
theorem ep_Q2_054_partial_27_0242_valid :
    mulPoly ep_Q2_054_coefficient_27_0242
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0243 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 243 for generator 27. -/
def ep_Q2_054_partial_27_0243 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 27. -/
theorem ep_Q2_054_partial_27_0243_valid :
    mulPoly ep_Q2_054_coefficient_27_0243
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0244 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 244 for generator 27. -/
def ep_Q2_054_partial_27_0244 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 27. -/
theorem ep_Q2_054_partial_27_0244_valid :
    mulPoly ep_Q2_054_coefficient_27_0244
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0245 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 245 for generator 27. -/
def ep_Q2_054_partial_27_0245 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 27. -/
theorem ep_Q2_054_partial_27_0245_valid :
    mulPoly ep_Q2_054_coefficient_27_0245
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0246 : Poly :=
[
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 246 for generator 27. -/
def ep_Q2_054_partial_27_0246 : Poly :=
[
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 27. -/
theorem ep_Q2_054_partial_27_0246_valid :
    mulPoly ep_Q2_054_coefficient_27_0246
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0247 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 247 for generator 27. -/
def ep_Q2_054_partial_27_0247 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 27. -/
theorem ep_Q2_054_partial_27_0247_valid :
    mulPoly ep_Q2_054_coefficient_27_0247
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0248 : Poly :=
[
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 248 for generator 27. -/
def ep_Q2_054_partial_27_0248 : Poly :=
[
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 27. -/
theorem ep_Q2_054_partial_27_0248_valid :
    mulPoly ep_Q2_054_coefficient_27_0248
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0249 : Poly :=
[
  term ((-1153150425000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

/-- Partial product 249 for generator 27. -/
def ep_Q2_054_partial_27_0249 : Poly :=
[
  term ((1153150425000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-2306300850000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 27. -/
theorem ep_Q2_054_partial_27_0249_valid :
    mulPoly ep_Q2_054_coefficient_27_0249
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0250 : Poly :=
[
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1)]
]

/-- Partial product 250 for generator 27. -/
def ep_Q2_054_partial_27_0250 : Poly :=
[
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 27. -/
theorem ep_Q2_054_partial_27_0250_valid :
    mulPoly ep_Q2_054_coefficient_27_0250
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0251 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 251 for generator 27. -/
def ep_Q2_054_partial_27_0251 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 27. -/
theorem ep_Q2_054_partial_27_0251_valid :
    mulPoly ep_Q2_054_coefficient_27_0251
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0252 : Poly :=
[
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1)]
]

/-- Partial product 252 for generator 27. -/
def ep_Q2_054_partial_27_0252 : Poly :=
[
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 27. -/
theorem ep_Q2_054_partial_27_0252_valid :
    mulPoly ep_Q2_054_coefficient_27_0252
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0253 : Poly :=
[
  term ((-3929106459069 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (11, 1)]
]

/-- Partial product 253 for generator 27. -/
def ep_Q2_054_partial_27_0253 : Poly :=
[
  term ((3929106459069 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-3929106459069 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 27. -/
theorem ep_Q2_054_partial_27_0253_valid :
    mulPoly ep_Q2_054_coefficient_27_0253
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0254 : Poly :=
[
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 1)]
]

/-- Partial product 254 for generator 27. -/
def ep_Q2_054_partial_27_0254 : Poly :=
[
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-1309702153023 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 27. -/
theorem ep_Q2_054_partial_27_0254_valid :
    mulPoly ep_Q2_054_coefficient_27_0254
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0255 : Poly :=
[
  term ((73593197888625 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 255 for generator 27. -/
def ep_Q2_054_partial_27_0255 : Poly :=
[
  term ((73593197888625 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-73593197888625 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 27. -/
theorem ep_Q2_054_partial_27_0255_valid :
    mulPoly ep_Q2_054_coefficient_27_0255
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0256 : Poly :=
[
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 256 for generator 27. -/
def ep_Q2_054_partial_27_0256 : Poly :=
[
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 27. -/
theorem ep_Q2_054_partial_27_0256_valid :
    mulPoly ep_Q2_054_coefficient_27_0256
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0257 : Poly :=
[
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 257 for generator 27. -/
def ep_Q2_054_partial_27_0257 : Poly :=
[
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((1309702153023 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 27. -/
theorem ep_Q2_054_partial_27_0257_valid :
    mulPoly ep_Q2_054_coefficient_27_0257
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0258 : Poly :=
[
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 258 for generator 27. -/
def ep_Q2_054_partial_27_0258 : Poly :=
[
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((1309702153023 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 27. -/
theorem ep_Q2_054_partial_27_0258_valid :
    mulPoly ep_Q2_054_coefficient_27_0258
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0259 : Poly :=
[
  term ((3770354682945 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 259 for generator 27. -/
def ep_Q2_054_partial_27_0259 : Poly :=
[
  term ((-3770354682945 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((3770354682945 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 27. -/
theorem ep_Q2_054_partial_27_0259_valid :
    mulPoly ep_Q2_054_coefficient_27_0259
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0260 : Poly :=
[
  term ((-36466867401093 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 260 for generator 27. -/
def ep_Q2_054_partial_27_0260 : Poly :=
[
  term ((-36466867401093 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((36466867401093 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 27. -/
theorem ep_Q2_054_partial_27_0260_valid :
    mulPoly ep_Q2_054_coefficient_27_0260
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0261 : Poly :=
[
  term ((9247290959223 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 261 for generator 27. -/
def ep_Q2_054_partial_27_0261 : Poly :=
[
  term ((-9247290959223 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)],
  term ((9247290959223 : Rat) / 90066973034) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 27. -/
theorem ep_Q2_054_partial_27_0261_valid :
    mulPoly ep_Q2_054_coefficient_27_0261
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0262 : Poly :=
[
  term ((-833446824651 : Rat) / 90066973034) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 262 for generator 27. -/
def ep_Q2_054_partial_27_0262 : Poly :=
[
  term ((833446824651 : Rat) / 90066973034) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-833446824651 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 27. -/
theorem ep_Q2_054_partial_27_0262_valid :
    mulPoly ep_Q2_054_coefficient_27_0262
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0263 : Poly :=
[
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 263 for generator 27. -/
def ep_Q2_054_partial_27_0263 : Poly :=
[
  term ((-20110995060975 : Rat) / 45033486517) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 27. -/
theorem ep_Q2_054_partial_27_0263_valid :
    mulPoly ep_Q2_054_coefficient_27_0263
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0264 : Poly :=
[
  term ((8552862251361 : Rat) / 180133946068) [(1, 1), (7, 1)]
]

/-- Partial product 264 for generator 27. -/
def ep_Q2_054_partial_27_0264 : Poly :=
[
  term ((-8552862251361 : Rat) / 180133946068) [(1, 1), (7, 1)],
  term ((8552862251361 : Rat) / 90066973034) [(1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 27. -/
theorem ep_Q2_054_partial_27_0264_valid :
    mulPoly ep_Q2_054_coefficient_27_0264
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0265 : Poly :=
[
  term ((-4810267975095 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 265 for generator 27. -/
def ep_Q2_054_partial_27_0265 : Poly :=
[
  term ((4810267975095 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)],
  term ((-9620535950190 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 27. -/
theorem ep_Q2_054_partial_27_0265_valid :
    mulPoly ep_Q2_054_coefficient_27_0265
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0266 : Poly :=
[
  term ((4951067754591 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1)]
]

/-- Partial product 266 for generator 27. -/
def ep_Q2_054_partial_27_0266 : Poly :=
[
  term ((-4951067754591 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((9902135509182 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 27. -/
theorem ep_Q2_054_partial_27_0266_valid :
    mulPoly ep_Q2_054_coefficient_27_0266
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0267 : Poly :=
[
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 267 for generator 27. -/
def ep_Q2_054_partial_27_0267 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 27. -/
theorem ep_Q2_054_partial_27_0267_valid :
    mulPoly ep_Q2_054_coefficient_27_0267
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0268 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 268 for generator 27. -/
def ep_Q2_054_partial_27_0268 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 27. -/
theorem ep_Q2_054_partial_27_0268_valid :
    mulPoly ep_Q2_054_coefficient_27_0268
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0269 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 269 for generator 27. -/
def ep_Q2_054_partial_27_0269 : Poly :=
[
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 27. -/
theorem ep_Q2_054_partial_27_0269_valid :
    mulPoly ep_Q2_054_coefficient_27_0269
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0270 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 270 for generator 27. -/
def ep_Q2_054_partial_27_0270 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 27. -/
theorem ep_Q2_054_partial_27_0270_valid :
    mulPoly ep_Q2_054_coefficient_27_0270
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0271 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 271 for generator 27. -/
def ep_Q2_054_partial_27_0271 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 27. -/
theorem ep_Q2_054_partial_27_0271_valid :
    mulPoly ep_Q2_054_coefficient_27_0271
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0272 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 272 for generator 27. -/
def ep_Q2_054_partial_27_0272 : Poly :=
[
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 27. -/
theorem ep_Q2_054_partial_27_0272_valid :
    mulPoly ep_Q2_054_coefficient_27_0272
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0273 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 273 for generator 27. -/
def ep_Q2_054_partial_27_0273 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 27. -/
theorem ep_Q2_054_partial_27_0273_valid :
    mulPoly ep_Q2_054_coefficient_27_0273
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0274 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1)]
]

/-- Partial product 274 for generator 27. -/
def ep_Q2_054_partial_27_0274 : Poly :=
[
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 27. -/
theorem ep_Q2_054_partial_27_0274_valid :
    mulPoly ep_Q2_054_coefficient_27_0274
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0275 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1)]
]

/-- Partial product 275 for generator 27. -/
def ep_Q2_054_partial_27_0275 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 27. -/
theorem ep_Q2_054_partial_27_0275_valid :
    mulPoly ep_Q2_054_coefficient_27_0275
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0276 : Poly :=
[
  term ((-359919511938 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 276 for generator 27. -/
def ep_Q2_054_partial_27_0276 : Poly :=
[
  term ((359919511938 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-719839023876 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 27. -/
theorem ep_Q2_054_partial_27_0276_valid :
    mulPoly ep_Q2_054_coefficient_27_0276
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0277 : Poly :=
[
  term ((1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 277 for generator 27. -/
def ep_Q2_054_partial_27_0277 : Poly :=
[
  term ((-1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((2050045200000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 27. -/
theorem ep_Q2_054_partial_27_0277_valid :
    mulPoly ep_Q2_054_coefficient_27_0277
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0278 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 278 for generator 27. -/
def ep_Q2_054_partial_27_0278 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 27. -/
theorem ep_Q2_054_partial_27_0278_valid :
    mulPoly ep_Q2_054_coefficient_27_0278
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0279 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 279 for generator 27. -/
def ep_Q2_054_partial_27_0279 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 27. -/
theorem ep_Q2_054_partial_27_0279_valid :
    mulPoly ep_Q2_054_coefficient_27_0279
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0280 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 280 for generator 27. -/
def ep_Q2_054_partial_27_0280 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 27. -/
theorem ep_Q2_054_partial_27_0280_valid :
    mulPoly ep_Q2_054_coefficient_27_0280
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0281 : Poly :=
[
  term ((-5432781875229 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 281 for generator 27. -/
def ep_Q2_054_partial_27_0281 : Poly :=
[
  term ((5432781875229 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)],
  term ((-5432781875229 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 27. -/
theorem ep_Q2_054_partial_27_0281_valid :
    mulPoly ep_Q2_054_coefficient_27_0281
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0282 : Poly :=
[
  term ((-3958175839050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 282 for generator 27. -/
def ep_Q2_054_partial_27_0282 : Poly :=
[
  term ((3958175839050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-7916351678100 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 27. -/
theorem ep_Q2_054_partial_27_0282_valid :
    mulPoly ep_Q2_054_coefficient_27_0282
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0283 : Poly :=
[
  term ((2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 283 for generator 27. -/
def ep_Q2_054_partial_27_0283 : Poly :=
[
  term ((4104607639050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 27. -/
theorem ep_Q2_054_partial_27_0283_valid :
    mulPoly ep_Q2_054_coefficient_27_0283
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0284 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 27. -/
def ep_Q2_054_partial_27_0284 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 27. -/
theorem ep_Q2_054_partial_27_0284_valid :
    mulPoly ep_Q2_054_coefficient_27_0284
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0285 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2)]
]

/-- Partial product 285 for generator 27. -/
def ep_Q2_054_partial_27_0285 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 27. -/
theorem ep_Q2_054_partial_27_0285_valid :
    mulPoly ep_Q2_054_coefficient_27_0285
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0286 : Poly :=
[
  term ((-4067266400775 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 286 for generator 27. -/
def ep_Q2_054_partial_27_0286 : Poly :=
[
  term ((4067266400775 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-4067266400775 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 27. -/
theorem ep_Q2_054_partial_27_0286_valid :
    mulPoly ep_Q2_054_coefficient_27_0286
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0287 : Poly :=
[
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 287 for generator 27. -/
def ep_Q2_054_partial_27_0287 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 27. -/
theorem ep_Q2_054_partial_27_0287_valid :
    mulPoly ep_Q2_054_coefficient_27_0287
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0288 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 288 for generator 27. -/
def ep_Q2_054_partial_27_0288 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 27. -/
theorem ep_Q2_054_partial_27_0288_valid :
    mulPoly ep_Q2_054_coefficient_27_0288
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0289 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 27. -/
def ep_Q2_054_partial_27_0289 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 27. -/
theorem ep_Q2_054_partial_27_0289_valid :
    mulPoly ep_Q2_054_coefficient_27_0289
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0290 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 290 for generator 27. -/
def ep_Q2_054_partial_27_0290 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 27. -/
theorem ep_Q2_054_partial_27_0290_valid :
    mulPoly ep_Q2_054_coefficient_27_0290
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0291 : Poly :=
[
  term ((-2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 291 for generator 27. -/
def ep_Q2_054_partial_27_0291 : Poly :=
[
  term ((-4104607639050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 27. -/
theorem ep_Q2_054_partial_27_0291_valid :
    mulPoly ep_Q2_054_coefficient_27_0291
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0292 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 27. -/
def ep_Q2_054_partial_27_0292 : Poly :=
[
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 27. -/
theorem ep_Q2_054_partial_27_0292_valid :
    mulPoly ep_Q2_054_coefficient_27_0292
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0293 : Poly :=
[
  term ((2369807371773 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 293 for generator 27. -/
def ep_Q2_054_partial_27_0293 : Poly :=
[
  term ((-2369807371773 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((2369807371773 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 27. -/
theorem ep_Q2_054_partial_27_0293_valid :
    mulPoly ep_Q2_054_coefficient_27_0293
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0294 : Poly :=
[
  term ((2369807371773 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 294 for generator 27. -/
def ep_Q2_054_partial_27_0294 : Poly :=
[
  term ((-2369807371773 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((4739614743546 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 27. -/
theorem ep_Q2_054_partial_27_0294_valid :
    mulPoly ep_Q2_054_coefficient_27_0294
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0295 : Poly :=
[
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 295 for generator 27. -/
def ep_Q2_054_partial_27_0295 : Poly :=
[
  term ((-3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 27. -/
theorem ep_Q2_054_partial_27_0295_valid :
    mulPoly ep_Q2_054_coefficient_27_0295
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0296 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 27. -/
def ep_Q2_054_partial_27_0296 : Poly :=
[
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 27. -/
theorem ep_Q2_054_partial_27_0296_valid :
    mulPoly ep_Q2_054_coefficient_27_0296
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0297 : Poly :=
[
  term ((6156911458575 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 2)]
]

/-- Partial product 297 for generator 27. -/
def ep_Q2_054_partial_27_0297 : Poly :=
[
  term ((-6156911458575 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 2)],
  term ((6156911458575 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 27. -/
theorem ep_Q2_054_partial_27_0297_valid :
    mulPoly ep_Q2_054_coefficient_27_0297
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0298 : Poly :=
[
  term ((4397471239050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1)]
]

/-- Partial product 298 for generator 27. -/
def ep_Q2_054_partial_27_0298 : Poly :=
[
  term ((-4397471239050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((8794942478100 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 27. -/
theorem ep_Q2_054_partial_27_0298_valid :
    mulPoly ep_Q2_054_coefficient_27_0298
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0299 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 299 for generator 27. -/
def ep_Q2_054_partial_27_0299 : Poly :=
[
  term ((-780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 27. -/
theorem ep_Q2_054_partial_27_0299_valid :
    mulPoly ep_Q2_054_coefficient_27_0299
        ep_Q2_054_generator_27_0200_0299 =
      ep_Q2_054_partial_27_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0200_0299 : List Poly :=
[
  ep_Q2_054_partial_27_0200,
  ep_Q2_054_partial_27_0201,
  ep_Q2_054_partial_27_0202,
  ep_Q2_054_partial_27_0203,
  ep_Q2_054_partial_27_0204,
  ep_Q2_054_partial_27_0205,
  ep_Q2_054_partial_27_0206,
  ep_Q2_054_partial_27_0207,
  ep_Q2_054_partial_27_0208,
  ep_Q2_054_partial_27_0209,
  ep_Q2_054_partial_27_0210,
  ep_Q2_054_partial_27_0211,
  ep_Q2_054_partial_27_0212,
  ep_Q2_054_partial_27_0213,
  ep_Q2_054_partial_27_0214,
  ep_Q2_054_partial_27_0215,
  ep_Q2_054_partial_27_0216,
  ep_Q2_054_partial_27_0217,
  ep_Q2_054_partial_27_0218,
  ep_Q2_054_partial_27_0219,
  ep_Q2_054_partial_27_0220,
  ep_Q2_054_partial_27_0221,
  ep_Q2_054_partial_27_0222,
  ep_Q2_054_partial_27_0223,
  ep_Q2_054_partial_27_0224,
  ep_Q2_054_partial_27_0225,
  ep_Q2_054_partial_27_0226,
  ep_Q2_054_partial_27_0227,
  ep_Q2_054_partial_27_0228,
  ep_Q2_054_partial_27_0229,
  ep_Q2_054_partial_27_0230,
  ep_Q2_054_partial_27_0231,
  ep_Q2_054_partial_27_0232,
  ep_Q2_054_partial_27_0233,
  ep_Q2_054_partial_27_0234,
  ep_Q2_054_partial_27_0235,
  ep_Q2_054_partial_27_0236,
  ep_Q2_054_partial_27_0237,
  ep_Q2_054_partial_27_0238,
  ep_Q2_054_partial_27_0239,
  ep_Q2_054_partial_27_0240,
  ep_Q2_054_partial_27_0241,
  ep_Q2_054_partial_27_0242,
  ep_Q2_054_partial_27_0243,
  ep_Q2_054_partial_27_0244,
  ep_Q2_054_partial_27_0245,
  ep_Q2_054_partial_27_0246,
  ep_Q2_054_partial_27_0247,
  ep_Q2_054_partial_27_0248,
  ep_Q2_054_partial_27_0249,
  ep_Q2_054_partial_27_0250,
  ep_Q2_054_partial_27_0251,
  ep_Q2_054_partial_27_0252,
  ep_Q2_054_partial_27_0253,
  ep_Q2_054_partial_27_0254,
  ep_Q2_054_partial_27_0255,
  ep_Q2_054_partial_27_0256,
  ep_Q2_054_partial_27_0257,
  ep_Q2_054_partial_27_0258,
  ep_Q2_054_partial_27_0259,
  ep_Q2_054_partial_27_0260,
  ep_Q2_054_partial_27_0261,
  ep_Q2_054_partial_27_0262,
  ep_Q2_054_partial_27_0263,
  ep_Q2_054_partial_27_0264,
  ep_Q2_054_partial_27_0265,
  ep_Q2_054_partial_27_0266,
  ep_Q2_054_partial_27_0267,
  ep_Q2_054_partial_27_0268,
  ep_Q2_054_partial_27_0269,
  ep_Q2_054_partial_27_0270,
  ep_Q2_054_partial_27_0271,
  ep_Q2_054_partial_27_0272,
  ep_Q2_054_partial_27_0273,
  ep_Q2_054_partial_27_0274,
  ep_Q2_054_partial_27_0275,
  ep_Q2_054_partial_27_0276,
  ep_Q2_054_partial_27_0277,
  ep_Q2_054_partial_27_0278,
  ep_Q2_054_partial_27_0279,
  ep_Q2_054_partial_27_0280,
  ep_Q2_054_partial_27_0281,
  ep_Q2_054_partial_27_0282,
  ep_Q2_054_partial_27_0283,
  ep_Q2_054_partial_27_0284,
  ep_Q2_054_partial_27_0285,
  ep_Q2_054_partial_27_0286,
  ep_Q2_054_partial_27_0287,
  ep_Q2_054_partial_27_0288,
  ep_Q2_054_partial_27_0289,
  ep_Q2_054_partial_27_0290,
  ep_Q2_054_partial_27_0291,
  ep_Q2_054_partial_27_0292,
  ep_Q2_054_partial_27_0293,
  ep_Q2_054_partial_27_0294,
  ep_Q2_054_partial_27_0295,
  ep_Q2_054_partial_27_0296,
  ep_Q2_054_partial_27_0297,
  ep_Q2_054_partial_27_0298,
  ep_Q2_054_partial_27_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0200_0299 : Poly :=
[
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((38086220360160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-19949924950560 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((9974962475280 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15134169233412 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7567084616706 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3173851696680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((36272590819200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18136295409600 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-9521555090040 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((14227354462932 : Rat) / 45033486517) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7113677231466 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((156283226433 : Rat) / 90066973034) [(1, 1), (3, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1)],
  term ((625132905732 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (14, 2)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)],
  term ((1153150425000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-2306300850000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (14, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-3929106459069 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-1309702153023 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((73593197888625 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-73593197888625 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((1309702153023 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((1309702153023 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((1309702153023 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((-3770354682945 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((3770354682945 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36466867401093 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((36466867401093 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-9247290959223 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)],
  term ((5040368891937 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-833446824651 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-20110995060975 : Rat) / 45033486517) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (15, 1)],
  term ((-8552862251361 : Rat) / 180133946068) [(1, 1), (7, 1)],
  term ((4810267975095 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)],
  term ((-4951067754591 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((9902135509182 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 2)],
  term ((359919511938 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-719839023876 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((-9620535950190 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((2050045200000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((5432781875229 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)],
  term ((3958175839050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-7916351678100 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((4104607639050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (14, 1)],
  term ((4067266400775 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-4067266400775 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5432781875229 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (14, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-4104607639050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2369807371773 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((4739614743546 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((-3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6156911458575 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 2)],
  term ((-4397471239050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((8794942478100 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((6156911458575 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((8552862251361 : Rat) / 90066973034) [(1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 200 through 299. -/
theorem ep_Q2_054_block_27_0200_0299_valid :
    checkProductSumEq ep_Q2_054_partials_27_0200_0299
      ep_Q2_054_block_27_0200_0299 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
