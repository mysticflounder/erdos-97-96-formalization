/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0300 : Poly :=
[
  term ((-2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1)]
]

/-- Partial product 300 for generator 27. -/
def ep_Q2_054_partial_27_0300 : Poly :=
[
  term ((2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((-4104607639050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 27. -/
theorem ep_Q2_054_partial_27_0300_valid :
    mulPoly ep_Q2_054_coefficient_27_0300
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0301 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 301 for generator 27. -/
def ep_Q2_054_partial_27_0301 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 27. -/
theorem ep_Q2_054_partial_27_0301_valid :
    mulPoly ep_Q2_054_coefficient_27_0301
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0302 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 302 for generator 27. -/
def ep_Q2_054_partial_27_0302 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 27. -/
theorem ep_Q2_054_partial_27_0302_valid :
    mulPoly ep_Q2_054_coefficient_27_0302
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0303 : Poly :=
[
  term ((4990586825187 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 303 for generator 27. -/
def ep_Q2_054_partial_27_0303 : Poly :=
[
  term ((-4990586825187 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)],
  term ((4990586825187 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 27. -/
theorem ep_Q2_054_partial_27_0303_valid :
    mulPoly ep_Q2_054_coefficient_27_0303
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0304 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 304 for generator 27. -/
def ep_Q2_054_partial_27_0304 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 27. -/
theorem ep_Q2_054_partial_27_0304_valid :
    mulPoly ep_Q2_054_coefficient_27_0304
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0305 : Poly :=
[
  term ((-3770354682945 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 2)]
]

/-- Partial product 305 for generator 27. -/
def ep_Q2_054_partial_27_0305 : Poly :=
[
  term ((3770354682945 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 2)],
  term ((-3770354682945 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 27. -/
theorem ep_Q2_054_partial_27_0305_valid :
    mulPoly ep_Q2_054_coefficient_27_0305
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0306 : Poly :=
[
  term ((1372407601149 : Rat) / 45033486517) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 306 for generator 27. -/
def ep_Q2_054_partial_27_0306 : Poly :=
[
  term ((-1372407601149 : Rat) / 45033486517) [(1, 1), (7, 1), (14, 1)],
  term ((2744815202298 : Rat) / 45033486517) [(1, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 27. -/
theorem ep_Q2_054_partial_27_0306_valid :
    mulPoly ep_Q2_054_coefficient_27_0306
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0307 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 307 for generator 27. -/
def ep_Q2_054_partial_27_0307 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 27. -/
theorem ep_Q2_054_partial_27_0307_valid :
    mulPoly ep_Q2_054_coefficient_27_0307
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0308 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 308 for generator 27. -/
def ep_Q2_054_partial_27_0308 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 27. -/
theorem ep_Q2_054_partial_27_0308_valid :
    mulPoly ep_Q2_054_coefficient_27_0308
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0309 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 309 for generator 27. -/
def ep_Q2_054_partial_27_0309 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 27. -/
theorem ep_Q2_054_partial_27_0309_valid :
    mulPoly ep_Q2_054_coefficient_27_0309
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0310 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 310 for generator 27. -/
def ep_Q2_054_partial_27_0310 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 27. -/
theorem ep_Q2_054_partial_27_0310_valid :
    mulPoly ep_Q2_054_coefficient_27_0310
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0311 : Poly :=
[
  term ((-7132195738584 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 311 for generator 27. -/
def ep_Q2_054_partial_27_0311 : Poly :=
[
  term ((7132195738584 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-14264391477168 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 27. -/
theorem ep_Q2_054_partial_27_0311_valid :
    mulPoly ep_Q2_054_coefficient_27_0311
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0312 : Poly :=
[
  term ((11511512794176 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 312 for generator 27. -/
def ep_Q2_054_partial_27_0312 : Poly :=
[
  term ((23023025588352 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11511512794176 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 27. -/
theorem ep_Q2_054_partial_27_0312_valid :
    mulPoly ep_Q2_054_coefficient_27_0312
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0313 : Poly :=
[
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 313 for generator 27. -/
def ep_Q2_054_partial_27_0313 : Poly :=
[
  term ((-2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 27. -/
theorem ep_Q2_054_partial_27_0313_valid :
    mulPoly ep_Q2_054_coefficient_27_0313
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0314 : Poly :=
[
  term ((3292530515316 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 314 for generator 27. -/
def ep_Q2_054_partial_27_0314 : Poly :=
[
  term ((-3292530515316 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((6585061030632 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 27. -/
theorem ep_Q2_054_partial_27_0314_valid :
    mulPoly ep_Q2_054_coefficient_27_0314
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0315 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 315 for generator 27. -/
def ep_Q2_054_partial_27_0315 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 27. -/
theorem ep_Q2_054_partial_27_0315_valid :
    mulPoly ep_Q2_054_coefficient_27_0315
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0316 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 316 for generator 27. -/
def ep_Q2_054_partial_27_0316 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 27. -/
theorem ep_Q2_054_partial_27_0316_valid :
    mulPoly ep_Q2_054_coefficient_27_0316
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0317 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 317 for generator 27. -/
def ep_Q2_054_partial_27_0317 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 27. -/
theorem ep_Q2_054_partial_27_0317_valid :
    mulPoly ep_Q2_054_coefficient_27_0317
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0318 : Poly :=
[
  term ((-1805017033782 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 318 for generator 27. -/
def ep_Q2_054_partial_27_0318 : Poly :=
[
  term ((1805017033782 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-3610034067564 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 27. -/
theorem ep_Q2_054_partial_27_0318_valid :
    mulPoly ep_Q2_054_coefficient_27_0318
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0319 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 319 for generator 27. -/
def ep_Q2_054_partial_27_0319 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 27. -/
theorem ep_Q2_054_partial_27_0319_valid :
    mulPoly ep_Q2_054_coefficient_27_0319
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0320 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 320 for generator 27. -/
def ep_Q2_054_partial_27_0320 : Poly :=
[
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 27. -/
theorem ep_Q2_054_partial_27_0320_valid :
    mulPoly ep_Q2_054_coefficient_27_0320
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0321 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 321 for generator 27. -/
def ep_Q2_054_partial_27_0321 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 27. -/
theorem ep_Q2_054_partial_27_0321_valid :
    mulPoly ep_Q2_054_coefficient_27_0321
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0322 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 322 for generator 27. -/
def ep_Q2_054_partial_27_0322 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 27. -/
theorem ep_Q2_054_partial_27_0322_valid :
    mulPoly ep_Q2_054_coefficient_27_0322
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0323 : Poly :=
[
  term ((2990032425936 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 323 for generator 27. -/
def ep_Q2_054_partial_27_0323 : Poly :=
[
  term ((5980064851872 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2990032425936 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 27. -/
theorem ep_Q2_054_partial_27_0323_valid :
    mulPoly ep_Q2_054_coefficient_27_0323
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0324 : Poly :=
[
  term ((3749975139384 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 324 for generator 27. -/
def ep_Q2_054_partial_27_0324 : Poly :=
[
  term ((-3749975139384 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)],
  term ((7499950278768 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 27. -/
theorem ep_Q2_054_partial_27_0324_valid :
    mulPoly ep_Q2_054_coefficient_27_0324
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0325 : Poly :=
[
  term ((1090634041224 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 325 for generator 27. -/
def ep_Q2_054_partial_27_0325 : Poly :=
[
  term ((-1090634041224 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((2181268082448 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 27. -/
theorem ep_Q2_054_partial_27_0325_valid :
    mulPoly ep_Q2_054_coefficient_27_0325
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0326 : Poly :=
[
  term ((-4380020623680 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 326 for generator 27. -/
def ep_Q2_054_partial_27_0326 : Poly :=
[
  term ((-8760041247360 : Rat) / 45033486517) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((4380020623680 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 27. -/
theorem ep_Q2_054_partial_27_0326_valid :
    mulPoly ep_Q2_054_coefficient_27_0326
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0327 : Poly :=
[
  term ((-1130730349338 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 327 for generator 27. -/
def ep_Q2_054_partial_27_0327 : Poly :=
[
  term ((1130730349338 : Rat) / 45033486517) [(1, 1), (9, 1)],
  term ((-2261460698676 : Rat) / 45033486517) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 27. -/
theorem ep_Q2_054_partial_27_0327_valid :
    mulPoly ep_Q2_054_coefficient_27_0327
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0328 : Poly :=
[
  term ((309155584698 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 328 for generator 27. -/
def ep_Q2_054_partial_27_0328 : Poly :=
[
  term ((-309155584698 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)],
  term ((618311169396 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 27. -/
theorem ep_Q2_054_partial_27_0328_valid :
    mulPoly ep_Q2_054_coefficient_27_0328
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0329 : Poly :=
[
  term ((-9521555090040 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 329 for generator 27. -/
def ep_Q2_054_partial_27_0329 : Poly :=
[
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9521555090040 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 27. -/
theorem ep_Q2_054_partial_27_0329_valid :
    mulPoly ep_Q2_054_coefficient_27_0329
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0330 : Poly :=
[
  term ((1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 330 for generator 27. -/
def ep_Q2_054_partial_27_0330 : Poly :=
[
  term ((-1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((2222524865736 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 27. -/
theorem ep_Q2_054_partial_27_0330_valid :
    mulPoly ep_Q2_054_coefficient_27_0330
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0331 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 331 for generator 27. -/
def ep_Q2_054_partial_27_0331 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 27. -/
theorem ep_Q2_054_partial_27_0331_valid :
    mulPoly ep_Q2_054_coefficient_27_0331
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0332 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 332 for generator 27. -/
def ep_Q2_054_partial_27_0332 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 27. -/
theorem ep_Q2_054_partial_27_0332_valid :
    mulPoly ep_Q2_054_coefficient_27_0332
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0333 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 333 for generator 27. -/
def ep_Q2_054_partial_27_0333 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 27. -/
theorem ep_Q2_054_partial_27_0333_valid :
    mulPoly ep_Q2_054_coefficient_27_0333
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0334 : Poly :=
[
  term ((-1129320384561 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 334 for generator 27. -/
def ep_Q2_054_partial_27_0334 : Poly :=
[
  term ((1129320384561 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)],
  term ((-2258640769122 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 27. -/
theorem ep_Q2_054_partial_27_0334_valid :
    mulPoly ep_Q2_054_coefficient_27_0334
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0335 : Poly :=
[
  term ((-717202922112 : Rat) / 45033486517) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 335 for generator 27. -/
def ep_Q2_054_partial_27_0335 : Poly :=
[
  term ((717202922112 : Rat) / 45033486517) [(1, 1), (9, 1), (14, 1)],
  term ((-1434405844224 : Rat) / 45033486517) [(1, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 27. -/
theorem ep_Q2_054_partial_27_0335_valid :
    mulPoly ep_Q2_054_coefficient_27_0335
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0336 : Poly :=
[
  term ((1685108414472 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 336 for generator 27. -/
def ep_Q2_054_partial_27_0336 : Poly :=
[
  term ((-1685108414472 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1)],
  term ((3370216828944 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 27. -/
theorem ep_Q2_054_partial_27_0336_valid :
    mulPoly ep_Q2_054_coefficient_27_0336
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0337 : Poly :=
[
  term ((515943272403 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 337 for generator 27. -/
def ep_Q2_054_partial_27_0337 : Poly :=
[
  term ((-515943272403 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((1031886544806 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 27. -/
theorem ep_Q2_054_partial_27_0337_valid :
    mulPoly ep_Q2_054_coefficient_27_0337
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0338 : Poly :=
[
  term ((28798086109188 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 338 for generator 27. -/
def ep_Q2_054_partial_27_0338 : Poly :=
[
  term ((57596172218376 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28798086109188 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 27. -/
theorem ep_Q2_054_partial_27_0338_valid :
    mulPoly ep_Q2_054_coefficient_27_0338
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0339 : Poly :=
[
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 339 for generator 27. -/
def ep_Q2_054_partial_27_0339 : Poly :=
[
  term ((-30158308264908 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((15079154132454 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 27. -/
theorem ep_Q2_054_partial_27_0339_valid :
    mulPoly ep_Q2_054_coefficient_27_0339
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0340 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 27. -/
def ep_Q2_054_partial_27_0340 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 27. -/
theorem ep_Q2_054_partial_27_0340_valid :
    mulPoly ep_Q2_054_coefficient_27_0340
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0341 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 341 for generator 27. -/
def ep_Q2_054_partial_27_0341 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 27. -/
theorem ep_Q2_054_partial_27_0341_valid :
    mulPoly ep_Q2_054_coefficient_27_0341
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0342 : Poly :=
[
  term ((53027957271753 : Rat) / 90066973034) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 342 for generator 27. -/
def ep_Q2_054_partial_27_0342 : Poly :=
[
  term ((53027957271753 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-53027957271753 : Rat) / 90066973034) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 27. -/
theorem ep_Q2_054_partial_27_0342_valid :
    mulPoly ep_Q2_054_coefficient_27_0342
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0343 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 27. -/
def ep_Q2_054_partial_27_0343 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 27. -/
theorem ep_Q2_054_partial_27_0343_valid :
    mulPoly ep_Q2_054_coefficient_27_0343
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0344 : Poly :=
[
  term ((30507482344587 : Rat) / 180133946068) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 344 for generator 27. -/
def ep_Q2_054_partial_27_0344 : Poly :=
[
  term ((-30507482344587 : Rat) / 180133946068) [(1, 1), (10, 1), (13, 1)],
  term ((30507482344587 : Rat) / 90066973034) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 27. -/
theorem ep_Q2_054_partial_27_0344_valid :
    mulPoly ep_Q2_054_coefficient_27_0344
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0345 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 345 for generator 27. -/
def ep_Q2_054_partial_27_0345 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 27. -/
theorem ep_Q2_054_partial_27_0345_valid :
    mulPoly ep_Q2_054_coefficient_27_0345
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0346 : Poly :=
[
  term ((-87158084834973 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 346 for generator 27. -/
def ep_Q2_054_partial_27_0346 : Poly :=
[
  term ((-87158084834973 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((87158084834973 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 27. -/
theorem ep_Q2_054_partial_27_0346_valid :
    mulPoly ep_Q2_054_coefficient_27_0346
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0347 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 27. -/
def ep_Q2_054_partial_27_0347 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 27. -/
theorem ep_Q2_054_partial_27_0347_valid :
    mulPoly ep_Q2_054_coefficient_27_0347
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0348 : Poly :=
[
  term ((-8047937005311 : Rat) / 90066973034) [(1, 1), (11, 1)]
]

/-- Partial product 348 for generator 27. -/
def ep_Q2_054_partial_27_0348 : Poly :=
[
  term ((8047937005311 : Rat) / 90066973034) [(1, 1), (11, 1)],
  term ((-8047937005311 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 27. -/
theorem ep_Q2_054_partial_27_0348_valid :
    mulPoly ep_Q2_054_coefficient_27_0348
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0349 : Poly :=
[
  term ((-15511712808495 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 349 for generator 27. -/
def ep_Q2_054_partial_27_0349 : Poly :=
[
  term ((15511712808495 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)],
  term ((-15511712808495 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 27. -/
theorem ep_Q2_054_partial_27_0349_valid :
    mulPoly ep_Q2_054_coefficient_27_0349
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0350 : Poly :=
[
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 350 for generator 27. -/
def ep_Q2_054_partial_27_0350 : Poly :=
[
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 27. -/
theorem ep_Q2_054_partial_27_0350_valid :
    mulPoly ep_Q2_054_coefficient_27_0350
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0351 : Poly :=
[
  term ((15079154132454 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 351 for generator 27. -/
def ep_Q2_054_partial_27_0351 : Poly :=
[
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 27. -/
theorem ep_Q2_054_partial_27_0351_valid :
    mulPoly ep_Q2_054_coefficient_27_0351
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0352 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 27. -/
def ep_Q2_054_partial_27_0352 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 27. -/
theorem ep_Q2_054_partial_27_0352_valid :
    mulPoly ep_Q2_054_coefficient_27_0352
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0353 : Poly :=
[
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 353 for generator 27. -/
def ep_Q2_054_partial_27_0353 : Poly :=
[
  term ((15079154132454 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-30158308264908 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 27. -/
theorem ep_Q2_054_partial_27_0353_valid :
    mulPoly ep_Q2_054_coefficient_27_0353
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0354 : Poly :=
[
  term ((-7539577066227 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 354 for generator 27. -/
def ep_Q2_054_partial_27_0354 : Poly :=
[
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7539577066227 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 27. -/
theorem ep_Q2_054_partial_27_0354_valid :
    mulPoly ep_Q2_054_coefficient_27_0354
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0355 : Poly :=
[
  term ((3258422575155 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 355 for generator 27. -/
def ep_Q2_054_partial_27_0355 : Poly :=
[
  term ((-3258422575155 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1)],
  term ((6516845150310 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 27. -/
theorem ep_Q2_054_partial_27_0355_valid :
    mulPoly ep_Q2_054_coefficient_27_0355
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0356 : Poly :=
[
  term ((13718931976734 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 356 for generator 27. -/
def ep_Q2_054_partial_27_0356 : Poly :=
[
  term ((27437863953468 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 27. -/
theorem ep_Q2_054_partial_27_0356_valid :
    mulPoly ep_Q2_054_coefficient_27_0356
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0357 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 27. -/
def ep_Q2_054_partial_27_0357 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 27. -/
theorem ep_Q2_054_partial_27_0357_valid :
    mulPoly ep_Q2_054_coefficient_27_0357
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0358 : Poly :=
[
  term ((-32878752576348 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 358 for generator 27. -/
def ep_Q2_054_partial_27_0358 : Poly :=
[
  term ((-65757505152696 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((32878752576348 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 27. -/
theorem ep_Q2_054_partial_27_0358_valid :
    mulPoly ep_Q2_054_coefficient_27_0358
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0359 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 27. -/
def ep_Q2_054_partial_27_0359 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 27. -/
theorem ep_Q2_054_partial_27_0359_valid :
    mulPoly ep_Q2_054_coefficient_27_0359
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0360 : Poly :=
[
  term ((15079154132454 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 360 for generator 27. -/
def ep_Q2_054_partial_27_0360 : Poly :=
[
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 27. -/
theorem ep_Q2_054_partial_27_0360_valid :
    mulPoly ep_Q2_054_coefficient_27_0360
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0361 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 27. -/
def ep_Q2_054_partial_27_0361 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 27. -/
theorem ep_Q2_054_partial_27_0361_valid :
    mulPoly ep_Q2_054_coefficient_27_0361
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0362 : Poly :=
[
  term ((-22618731198681 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 362 for generator 27. -/
def ep_Q2_054_partial_27_0362 : Poly :=
[
  term ((-45237462397362 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((22618731198681 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 27. -/
theorem ep_Q2_054_partial_27_0362_valid :
    mulPoly ep_Q2_054_coefficient_27_0362
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0363 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 27. -/
def ep_Q2_054_partial_27_0363 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 27. -/
theorem ep_Q2_054_partial_27_0363_valid :
    mulPoly ep_Q2_054_coefficient_27_0363
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0364 : Poly :=
[
  term ((-3770354682945 : Rat) / 90066973034) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 364 for generator 27. -/
def ep_Q2_054_partial_27_0364 : Poly :=
[
  term ((3770354682945 : Rat) / 90066973034) [(1, 1), (12, 1), (13, 1)],
  term ((-3770354682945 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 27. -/
theorem ep_Q2_054_partial_27_0364_valid :
    mulPoly ep_Q2_054_coefficient_27_0364
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0365 : Poly :=
[
  term ((81139037699613 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 365 for generator 27. -/
def ep_Q2_054_partial_27_0365 : Poly :=
[
  term ((81139037699613 : Rat) / 90066973034) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-81139037699613 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 27. -/
theorem ep_Q2_054_partial_27_0365_valid :
    mulPoly ep_Q2_054_coefficient_27_0365
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0366 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 27. -/
def ep_Q2_054_partial_27_0366 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 27. -/
theorem ep_Q2_054_partial_27_0366_valid :
    mulPoly ep_Q2_054_coefficient_27_0366
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0367 : Poly :=
[
  term ((-18092998009767 : Rat) / 360267892136) [(1, 1), (13, 1)]
]

/-- Partial product 367 for generator 27. -/
def ep_Q2_054_partial_27_0367 : Poly :=
[
  term ((18092998009767 : Rat) / 360267892136) [(1, 1), (13, 1)],
  term ((-18092998009767 : Rat) / 180133946068) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 27. -/
theorem ep_Q2_054_partial_27_0367_valid :
    mulPoly ep_Q2_054_coefficient_27_0367
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0368 : Poly :=
[
  term ((-8012260225893 : Rat) / 180133946068) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 368 for generator 27. -/
def ep_Q2_054_partial_27_0368 : Poly :=
[
  term ((8012260225893 : Rat) / 180133946068) [(1, 1), (13, 1), (14, 1)],
  term ((-8012260225893 : Rat) / 90066973034) [(1, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 27. -/
theorem ep_Q2_054_partial_27_0368_valid :
    mulPoly ep_Q2_054_coefficient_27_0368
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0369 : Poly :=
[
  term ((24006138396993 : Rat) / 90066973034) [(1, 1), (15, 1)]
]

/-- Partial product 369 for generator 27. -/
def ep_Q2_054_partial_27_0369 : Poly :=
[
  term ((24006138396993 : Rat) / 45033486517) [(1, 1), (14, 1), (15, 1)],
  term ((-24006138396993 : Rat) / 90066973034) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 27. -/
theorem ep_Q2_054_partial_27_0369_valid :
    mulPoly ep_Q2_054_coefficient_27_0369
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0370 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 27. -/
def ep_Q2_054_partial_27_0370 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 27. -/
theorem ep_Q2_054_partial_27_0370_valid :
    mulPoly ep_Q2_054_coefficient_27_0370
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0371 : Poly :=
[
  term ((79375888062 : Rat) / 45033486517) [(1, 2)]
]

/-- Partial product 371 for generator 27. -/
def ep_Q2_054_partial_27_0371 : Poly :=
[
  term ((-79375888062 : Rat) / 45033486517) [(1, 2)],
  term ((158751776124 : Rat) / 45033486517) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 27. -/
theorem ep_Q2_054_partial_27_0371_valid :
    mulPoly ep_Q2_054_coefficient_27_0371
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0372 : Poly :=
[
  term ((158751776124 : Rat) / 45033486517) [(1, 2), (14, 1)]
]

/-- Partial product 372 for generator 27. -/
def ep_Q2_054_partial_27_0372 : Poly :=
[
  term ((-158751776124 : Rat) / 45033486517) [(1, 2), (14, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 27. -/
theorem ep_Q2_054_partial_27_0372_valid :
    mulPoly ep_Q2_054_coefficient_27_0372
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0373 : Poly :=
[
  term ((3966325853409 : Rat) / 180133946068) [(2, 1)]
]

/-- Partial product 373 for generator 27. -/
def ep_Q2_054_partial_27_0373 : Poly :=
[
  term ((-3966325853409 : Rat) / 180133946068) [(2, 1)],
  term ((3966325853409 : Rat) / 90066973034) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 27. -/
theorem ep_Q2_054_partial_27_0373_valid :
    mulPoly ep_Q2_054_coefficient_27_0373
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0374 : Poly :=
[
  term ((2879748917451 : Rat) / 45033486517) [(2, 1), (6, 1)]
]

/-- Partial product 374 for generator 27. -/
def ep_Q2_054_partial_27_0374 : Poly :=
[
  term ((-2879748917451 : Rat) / 45033486517) [(2, 1), (6, 1)],
  term ((5759497834902 : Rat) / 45033486517) [(2, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 27. -/
theorem ep_Q2_054_partial_27_0374_valid :
    mulPoly ep_Q2_054_coefficient_27_0374
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0375 : Poly :=
[
  term ((639944203878 : Rat) / 45033486517) [(2, 1), (6, 1), (14, 1)]
]

/-- Partial product 375 for generator 27. -/
def ep_Q2_054_partial_27_0375 : Poly :=
[
  term ((-639944203878 : Rat) / 45033486517) [(2, 1), (6, 1), (14, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 27. -/
theorem ep_Q2_054_partial_27_0375_valid :
    mulPoly ep_Q2_054_coefficient_27_0375
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0376 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 376 for generator 27. -/
def ep_Q2_054_partial_27_0376 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 27. -/
theorem ep_Q2_054_partial_27_0376_valid :
    mulPoly ep_Q2_054_coefficient_27_0376
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0377 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 377 for generator 27. -/
def ep_Q2_054_partial_27_0377 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 27. -/
theorem ep_Q2_054_partial_27_0377_valid :
    mulPoly ep_Q2_054_coefficient_27_0377
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0378 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 378 for generator 27. -/
def ep_Q2_054_partial_27_0378 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 27. -/
theorem ep_Q2_054_partial_27_0378_valid :
    mulPoly ep_Q2_054_coefficient_27_0378
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0379 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 379 for generator 27. -/
def ep_Q2_054_partial_27_0379 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 27. -/
theorem ep_Q2_054_partial_27_0379_valid :
    mulPoly ep_Q2_054_coefficient_27_0379
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0380 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 380 for generator 27. -/
def ep_Q2_054_partial_27_0380 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 27. -/
theorem ep_Q2_054_partial_27_0380_valid :
    mulPoly ep_Q2_054_coefficient_27_0380
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0381 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 381 for generator 27. -/
def ep_Q2_054_partial_27_0381 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 27. -/
theorem ep_Q2_054_partial_27_0381_valid :
    mulPoly ep_Q2_054_coefficient_27_0381
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0382 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 382 for generator 27. -/
def ep_Q2_054_partial_27_0382 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 27. -/
theorem ep_Q2_054_partial_27_0382_valid :
    mulPoly ep_Q2_054_coefficient_27_0382
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0383 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 383 for generator 27. -/
def ep_Q2_054_partial_27_0383 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 27. -/
theorem ep_Q2_054_partial_27_0383_valid :
    mulPoly ep_Q2_054_coefficient_27_0383
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0384 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 384 for generator 27. -/
def ep_Q2_054_partial_27_0384 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 27. -/
theorem ep_Q2_054_partial_27_0384_valid :
    mulPoly ep_Q2_054_coefficient_27_0384
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0385 : Poly :=
[
  term ((-5630666053158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 385 for generator 27. -/
def ep_Q2_054_partial_27_0385 : Poly :=
[
  term ((5630666053158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)],
  term ((-11261332106316 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 27. -/
theorem ep_Q2_054_partial_27_0385_valid :
    mulPoly ep_Q2_054_coefficient_27_0385
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0386 : Poly :=
[
  term ((3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 386 for generator 27. -/
def ep_Q2_054_partial_27_0386 : Poly :=
[
  term ((-3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1)],
  term ((6783816478158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 27. -/
theorem ep_Q2_054_partial_27_0386_valid :
    mulPoly ep_Q2_054_coefficient_27_0386
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0387 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 387 for generator 27. -/
def ep_Q2_054_partial_27_0387 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 27. -/
theorem ep_Q2_054_partial_27_0387_valid :
    mulPoly ep_Q2_054_coefficient_27_0387
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0388 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 388 for generator 27. -/
def ep_Q2_054_partial_27_0388 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 27. -/
theorem ep_Q2_054_partial_27_0388_valid :
    mulPoly ep_Q2_054_coefficient_27_0388
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0389 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 389 for generator 27. -/
def ep_Q2_054_partial_27_0389 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 27. -/
theorem ep_Q2_054_partial_27_0389_valid :
    mulPoly ep_Q2_054_coefficient_27_0389
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0390 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 390 for generator 27. -/
def ep_Q2_054_partial_27_0390 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 27. -/
theorem ep_Q2_054_partial_27_0390_valid :
    mulPoly ep_Q2_054_coefficient_27_0390
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0391 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 391 for generator 27. -/
def ep_Q2_054_partial_27_0391 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 27. -/
theorem ep_Q2_054_partial_27_0391_valid :
    mulPoly ep_Q2_054_coefficient_27_0391
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0392 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 392 for generator 27. -/
def ep_Q2_054_partial_27_0392 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 27. -/
theorem ep_Q2_054_partial_27_0392_valid :
    mulPoly ep_Q2_054_coefficient_27_0392
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0393 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 393 for generator 27. -/
def ep_Q2_054_partial_27_0393 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 27. -/
theorem ep_Q2_054_partial_27_0393_valid :
    mulPoly ep_Q2_054_coefficient_27_0393
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0394 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 394 for generator 27. -/
def ep_Q2_054_partial_27_0394 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 27. -/
theorem ep_Q2_054_partial_27_0394_valid :
    mulPoly ep_Q2_054_coefficient_27_0394
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0395 : Poly :=
[
  term ((329471550000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2)]
]

/-- Partial product 395 for generator 27. -/
def ep_Q2_054_partial_27_0395 : Poly :=
[
  term ((-329471550000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((658943100000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 27. -/
theorem ep_Q2_054_partial_27_0395_valid :
    mulPoly ep_Q2_054_coefficient_27_0395
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0396 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1)]
]

/-- Partial product 396 for generator 27. -/
def ep_Q2_054_partial_27_0396 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 27. -/
theorem ep_Q2_054_partial_27_0396_valid :
    mulPoly ep_Q2_054_coefficient_27_0396
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0397 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 397 for generator 27. -/
def ep_Q2_054_partial_27_0397 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 27. -/
theorem ep_Q2_054_partial_27_0397_valid :
    mulPoly ep_Q2_054_coefficient_27_0397
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0398 : Poly :=
[
  term ((-274559625000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 398 for generator 27. -/
def ep_Q2_054_partial_27_0398 : Poly :=
[
  term ((274559625000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 27. -/
theorem ep_Q2_054_partial_27_0398_valid :
    mulPoly ep_Q2_054_coefficient_27_0398
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0399 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 399 for generator 27. -/
def ep_Q2_054_partial_27_0399 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 27. -/
theorem ep_Q2_054_partial_27_0399_valid :
    mulPoly ep_Q2_054_coefficient_27_0399
        ep_Q2_054_generator_27_0300_0399 =
      ep_Q2_054_partial_27_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0300_0399 : List Poly :=
[
  ep_Q2_054_partial_27_0300,
  ep_Q2_054_partial_27_0301,
  ep_Q2_054_partial_27_0302,
  ep_Q2_054_partial_27_0303,
  ep_Q2_054_partial_27_0304,
  ep_Q2_054_partial_27_0305,
  ep_Q2_054_partial_27_0306,
  ep_Q2_054_partial_27_0307,
  ep_Q2_054_partial_27_0308,
  ep_Q2_054_partial_27_0309,
  ep_Q2_054_partial_27_0310,
  ep_Q2_054_partial_27_0311,
  ep_Q2_054_partial_27_0312,
  ep_Q2_054_partial_27_0313,
  ep_Q2_054_partial_27_0314,
  ep_Q2_054_partial_27_0315,
  ep_Q2_054_partial_27_0316,
  ep_Q2_054_partial_27_0317,
  ep_Q2_054_partial_27_0318,
  ep_Q2_054_partial_27_0319,
  ep_Q2_054_partial_27_0320,
  ep_Q2_054_partial_27_0321,
  ep_Q2_054_partial_27_0322,
  ep_Q2_054_partial_27_0323,
  ep_Q2_054_partial_27_0324,
  ep_Q2_054_partial_27_0325,
  ep_Q2_054_partial_27_0326,
  ep_Q2_054_partial_27_0327,
  ep_Q2_054_partial_27_0328,
  ep_Q2_054_partial_27_0329,
  ep_Q2_054_partial_27_0330,
  ep_Q2_054_partial_27_0331,
  ep_Q2_054_partial_27_0332,
  ep_Q2_054_partial_27_0333,
  ep_Q2_054_partial_27_0334,
  ep_Q2_054_partial_27_0335,
  ep_Q2_054_partial_27_0336,
  ep_Q2_054_partial_27_0337,
  ep_Q2_054_partial_27_0338,
  ep_Q2_054_partial_27_0339,
  ep_Q2_054_partial_27_0340,
  ep_Q2_054_partial_27_0341,
  ep_Q2_054_partial_27_0342,
  ep_Q2_054_partial_27_0343,
  ep_Q2_054_partial_27_0344,
  ep_Q2_054_partial_27_0345,
  ep_Q2_054_partial_27_0346,
  ep_Q2_054_partial_27_0347,
  ep_Q2_054_partial_27_0348,
  ep_Q2_054_partial_27_0349,
  ep_Q2_054_partial_27_0350,
  ep_Q2_054_partial_27_0351,
  ep_Q2_054_partial_27_0352,
  ep_Q2_054_partial_27_0353,
  ep_Q2_054_partial_27_0354,
  ep_Q2_054_partial_27_0355,
  ep_Q2_054_partial_27_0356,
  ep_Q2_054_partial_27_0357,
  ep_Q2_054_partial_27_0358,
  ep_Q2_054_partial_27_0359,
  ep_Q2_054_partial_27_0360,
  ep_Q2_054_partial_27_0361,
  ep_Q2_054_partial_27_0362,
  ep_Q2_054_partial_27_0363,
  ep_Q2_054_partial_27_0364,
  ep_Q2_054_partial_27_0365,
  ep_Q2_054_partial_27_0366,
  ep_Q2_054_partial_27_0367,
  ep_Q2_054_partial_27_0368,
  ep_Q2_054_partial_27_0369,
  ep_Q2_054_partial_27_0370,
  ep_Q2_054_partial_27_0371,
  ep_Q2_054_partial_27_0372,
  ep_Q2_054_partial_27_0373,
  ep_Q2_054_partial_27_0374,
  ep_Q2_054_partial_27_0375,
  ep_Q2_054_partial_27_0376,
  ep_Q2_054_partial_27_0377,
  ep_Q2_054_partial_27_0378,
  ep_Q2_054_partial_27_0379,
  ep_Q2_054_partial_27_0380,
  ep_Q2_054_partial_27_0381,
  ep_Q2_054_partial_27_0382,
  ep_Q2_054_partial_27_0383,
  ep_Q2_054_partial_27_0384,
  ep_Q2_054_partial_27_0385,
  ep_Q2_054_partial_27_0386,
  ep_Q2_054_partial_27_0387,
  ep_Q2_054_partial_27_0388,
  ep_Q2_054_partial_27_0389,
  ep_Q2_054_partial_27_0390,
  ep_Q2_054_partial_27_0391,
  ep_Q2_054_partial_27_0392,
  ep_Q2_054_partial_27_0393,
  ep_Q2_054_partial_27_0394,
  ep_Q2_054_partial_27_0395,
  ep_Q2_054_partial_27_0396,
  ep_Q2_054_partial_27_0397,
  ep_Q2_054_partial_27_0398,
  ep_Q2_054_partial_27_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0300_0399 : Poly :=
[
  term ((2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-4104607639050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 2)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (14, 2), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-4990586825187 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)],
  term ((4990586825187 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((3770354682945 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 2)],
  term ((-3770354682945 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (14, 1)],
  term ((-1372407601149 : Rat) / 45033486517) [(1, 1), (7, 1), (14, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((2744815202298 : Rat) / 45033486517) [(1, 1), (7, 1), (14, 2)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((7132195738584 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-14264391477168 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((23023025588352 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11511512794176 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((-3292530515316 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((6585061030632 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((6585061030632 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3610034067564 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((5980064851872 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2990032425936 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-3749975139384 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)],
  term ((6409316237544 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((2181268082448 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((-8760041247360 : Rat) / 45033486517) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((4380020623680 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)],
  term ((1130730349338 : Rat) / 45033486517) [(1, 1), (9, 1)],
  term ((-309155584698 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9521555090040 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((2222524865736 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((618311169396 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((1129320384561 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)],
  term ((-2258640769122 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1544257776564 : Rat) / 45033486517) [(1, 1), (9, 1), (14, 1)],
  term ((-1434405844224 : Rat) / 45033486517) [(1, 1), (9, 1), (14, 2)],
  term ((-1685108414472 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((1031886544806 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((57596172218376 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28798086109188 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((3370216828944 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-30158308264908 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((15079154132454 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((53027957271753 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53027957271753 : Rat) / 90066973034) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30507482344587 : Rat) / 180133946068) [(1, 1), (10, 1), (13, 1)],
  term ((30507482344587 : Rat) / 90066973034) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87158084834973 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((87158084834973 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((8047937005311 : Rat) / 90066973034) [(1, 1), (11, 1)],
  term ((15511712808495 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)],
  term ((-30507482344587 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-30158308264908 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((7539577066227 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11306359580466 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((6516845150310 : Rat) / 45033486517) [(1, 1), (11, 1), (14, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-65757505152696 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32878752576348 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60316616529816 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((22618731198681 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((3770354682945 : Rat) / 90066973034) [(1, 1), (12, 1), (13, 1)],
  term ((-3770354682945 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((81139037699613 : Rat) / 90066973034) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81139037699613 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((18092998009767 : Rat) / 360267892136) [(1, 1), (13, 1)],
  term ((-5040368891937 : Rat) / 90066973034) [(1, 1), (13, 1), (14, 1)],
  term ((-8012260225893 : Rat) / 90066973034) [(1, 1), (13, 1), (14, 2)],
  term ((24006138396993 : Rat) / 45033486517) [(1, 1), (14, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24006138396993 : Rat) / 90066973034) [(1, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (14, 2)],
  term ((-3966325853409 : Rat) / 180133946068) [(2, 1)],
  term ((-2879748917451 : Rat) / 45033486517) [(2, 1), (6, 1)],
  term ((5119553631024 : Rat) / 45033486517) [(2, 1), (6, 1), (14, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (6, 1), (14, 2)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((5630666053158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)],
  term ((-3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1)],
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((6783816478158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (14, 2)],
  term ((274559625000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-11261332106316 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((3966325853409 : Rat) / 90066973034) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 300 through 399. -/
theorem ep_Q2_054_block_27_0300_0399_valid :
    checkProductSumEq ep_Q2_054_partials_27_0300_0399
      ep_Q2_054_block_27_0300_0399 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
