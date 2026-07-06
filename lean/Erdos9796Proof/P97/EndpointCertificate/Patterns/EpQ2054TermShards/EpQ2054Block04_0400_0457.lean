/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 4:400-457

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_04_0400_0457 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0400 : Poly :=
[
  term ((-9260117213880 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 400 for generator 4. -/
def ep_Q2_054_partial_04_0400 : Poly :=
[
  term ((-9260117213880 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (15, 2)],
  term ((-9260117213880 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (15, 2)],
  term ((9260117213880 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((9260117213880 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 4. -/
theorem ep_Q2_054_partial_04_0400_valid :
    mulPoly ep_Q2_054_coefficient_04_0400
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0401 : Poly :=
[
  term ((-319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 4. -/
def ep_Q2_054_partial_04_0401 : Poly :=
[
  term ((-319429694670 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-319429694670 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 4. -/
theorem ep_Q2_054_partial_04_0401_valid :
    mulPoly ep_Q2_054_coefficient_04_0401
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0402 : Poly :=
[
  term ((301737198393 : Rat) / 180133946068) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 402 for generator 4. -/
def ep_Q2_054_partial_04_0402 : Poly :=
[
  term ((301737198393 : Rat) / 180133946068) [(4, 2), (8, 1), (10, 1), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 4. -/
theorem ep_Q2_054_partial_04_0402_valid :
    mulPoly ep_Q2_054_coefficient_04_0402
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0403 : Poly :=
[
  term ((-10133655060114 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 403 for generator 4. -/
def ep_Q2_054_partial_04_0403 : Poly :=
[
  term ((-10133655060114 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(8, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 4. -/
theorem ep_Q2_054_partial_04_0403_valid :
    mulPoly ep_Q2_054_coefficient_04_0403
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0404 : Poly :=
[
  term ((6315633161721 : Rat) / 90066973034) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 404 for generator 4. -/
def ep_Q2_054_partial_04_0404 : Poly :=
[
  term ((6315633161721 : Rat) / 90066973034) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((6315633161721 : Rat) / 90066973034) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-6315633161721 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-6315633161721 : Rat) / 90066973034) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 4. -/
theorem ep_Q2_054_partial_04_0404_valid :
    mulPoly ep_Q2_054_coefficient_04_0404
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0405 : Poly :=
[
  term ((24792769529877 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 405 for generator 4. -/
def ep_Q2_054_partial_04_0405 : Poly :=
[
  term ((24792769529877 : Rat) / 90066973034) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((24792769529877 : Rat) / 90066973034) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-24792769529877 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-24792769529877 : Rat) / 90066973034) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 4. -/
theorem ep_Q2_054_partial_04_0405_valid :
    mulPoly ep_Q2_054_coefficient_04_0405
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0406 : Poly :=
[
  term ((-189282737937 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 4. -/
def ep_Q2_054_partial_04_0406 : Poly :=
[
  term ((-189282737937 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-189282737937 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((189282737937 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((189282737937 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 4. -/
theorem ep_Q2_054_partial_04_0406_valid :
    mulPoly ep_Q2_054_coefficient_04_0406
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0407 : Poly :=
[
  term ((-6315633161721 : Rat) / 90066973034) [(8, 1), (11, 2)]
]

/-- Partial product 407 for generator 4. -/
def ep_Q2_054_partial_04_0407 : Poly :=
[
  term ((-6315633161721 : Rat) / 90066973034) [(4, 2), (8, 1), (11, 2)],
  term ((-6315633161721 : Rat) / 90066973034) [(5, 2), (8, 1), (11, 2)],
  term ((6315633161721 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 2)],
  term ((6315633161721 : Rat) / 90066973034) [(8, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 4. -/
theorem ep_Q2_054_partial_04_0407_valid :
    mulPoly ep_Q2_054_coefficient_04_0407
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0408 : Poly :=
[
  term ((5347892785655 : Rat) / 180133946068) [(8, 1), (12, 1)]
]

/-- Partial product 408 for generator 4. -/
def ep_Q2_054_partial_04_0408 : Poly :=
[
  term ((5347892785655 : Rat) / 180133946068) [(4, 2), (8, 1), (12, 1)],
  term ((5347892785655 : Rat) / 180133946068) [(5, 2), (8, 1), (12, 1)],
  term ((-5347892785655 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1)],
  term ((-5347892785655 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 4. -/
theorem ep_Q2_054_partial_04_0408_valid :
    mulPoly ep_Q2_054_coefficient_04_0408
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0409 : Poly :=
[
  term ((5533560238413 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 409 for generator 4. -/
def ep_Q2_054_partial_04_0409 : Poly :=
[
  term ((5533560238413 : Rat) / 45033486517) [(4, 2), (8, 1), (12, 1), (15, 2)],
  term ((5533560238413 : Rat) / 45033486517) [(5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-5533560238413 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-5533560238413 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 4. -/
theorem ep_Q2_054_partial_04_0409_valid :
    mulPoly ep_Q2_054_coefficient_04_0409
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0410 : Poly :=
[
  term ((502895330655 : Rat) / 180133946068) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 410 for generator 4. -/
def ep_Q2_054_partial_04_0410 : Poly :=
[
  term ((502895330655 : Rat) / 180133946068) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((502895330655 : Rat) / 180133946068) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-502895330655 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-502895330655 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 4. -/
theorem ep_Q2_054_partial_04_0410_valid :
    mulPoly ep_Q2_054_coefficient_04_0410
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0411 : Poly :=
[
  term ((-55832432143884 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 411 for generator 4. -/
def ep_Q2_054_partial_04_0411 : Poly :=
[
  term ((-55832432143884 : Rat) / 45033486517) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((-55832432143884 : Rat) / 45033486517) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((55832432143884 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((55832432143884 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 4. -/
theorem ep_Q2_054_partial_04_0411_valid :
    mulPoly ep_Q2_054_coefficient_04_0411
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0412 : Poly :=
[
  term ((-502895330655 : Rat) / 90066973034) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 4. -/
def ep_Q2_054_partial_04_0412 : Poly :=
[
  term ((-502895330655 : Rat) / 90066973034) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((502895330655 : Rat) / 90066973034) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((502895330655 : Rat) / 90066973034) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 4. -/
theorem ep_Q2_054_partial_04_0412_valid :
    mulPoly ep_Q2_054_coefficient_04_0412
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0413 : Poly :=
[
  term ((-13849863349980 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 413 for generator 4. -/
def ep_Q2_054_partial_04_0413 : Poly :=
[
  term ((-13849863349980 : Rat) / 45033486517) [(4, 2), (8, 1), (15, 2)],
  term ((-13849863349980 : Rat) / 45033486517) [(5, 2), (8, 1), (15, 2)],
  term ((13849863349980 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((13849863349980 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 4. -/
theorem ep_Q2_054_partial_04_0413_valid :
    mulPoly ep_Q2_054_coefficient_04_0413
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0414 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (16, 1)]
]

/-- Partial product 414 for generator 4. -/
def ep_Q2_054_partial_04_0414 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(4, 2), (8, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(5, 2), (8, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 4. -/
theorem ep_Q2_054_partial_04_0414_valid :
    mulPoly ep_Q2_054_coefficient_04_0414
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0415 : Poly :=
[
  term ((178969991874 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 415 for generator 4. -/
def ep_Q2_054_partial_04_0415 : Poly :=
[
  term ((178969991874 : Rat) / 45033486517) [(4, 2), (8, 2)],
  term ((178969991874 : Rat) / 45033486517) [(5, 2), (8, 2)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 4. -/
theorem ep_Q2_054_partial_04_0415_valid :
    mulPoly ep_Q2_054_coefficient_04_0415
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0416 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 416 for generator 4. -/
def ep_Q2_054_partial_04_0416 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(4, 2), (8, 2), (11, 1), (13, 1)],
  term ((268454987811 : Rat) / 45033486517) [(5, 2), (8, 2), (11, 1), (13, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 4. -/
theorem ep_Q2_054_partial_04_0416_valid :
    mulPoly ep_Q2_054_coefficient_04_0416
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0417 : Poly :=
[
  term ((101135099808 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 417 for generator 4. -/
def ep_Q2_054_partial_04_0417 : Poly :=
[
  term ((101135099808 : Rat) / 45033486517) [(4, 2), (8, 2), (11, 1), (15, 1)],
  term ((101135099808 : Rat) / 45033486517) [(5, 2), (8, 2), (11, 1), (15, 1)],
  term ((-101135099808 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((-101135099808 : Rat) / 45033486517) [(8, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 4. -/
theorem ep_Q2_054_partial_04_0417_valid :
    mulPoly ep_Q2_054_coefficient_04_0417
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0418 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

/-- Partial product 418 for generator 4. -/
def ep_Q2_054_partial_04_0418 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(4, 2), (8, 2), (11, 2)],
  term ((-268454987811 : Rat) / 45033486517) [(5, 2), (8, 2), (11, 2)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 2)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 4. -/
theorem ep_Q2_054_partial_04_0418_valid :
    mulPoly ep_Q2_054_coefficient_04_0418
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0419 : Poly :=
[
  term ((89484995937 : Rat) / 90066973034) [(8, 2), (12, 1)]
]

/-- Partial product 419 for generator 4. -/
def ep_Q2_054_partial_04_0419 : Poly :=
[
  term ((89484995937 : Rat) / 90066973034) [(4, 2), (8, 2), (12, 1)],
  term ((89484995937 : Rat) / 90066973034) [(5, 2), (8, 2), (12, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 2), (10, 2), (12, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 4. -/
theorem ep_Q2_054_partial_04_0419_valid :
    mulPoly ep_Q2_054_coefficient_04_0419
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0420 : Poly :=
[
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 420 for generator 4. -/
def ep_Q2_054_partial_04_0420 : Poly :=
[
  term ((-536909975622 : Rat) / 45033486517) [(4, 2), (8, 2), (13, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(5, 2), (8, 2), (13, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 4. -/
theorem ep_Q2_054_partial_04_0420_valid :
    mulPoly ep_Q2_054_coefficient_04_0420
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0421 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 421 for generator 4. -/
def ep_Q2_054_partial_04_0421 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 3)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 4. -/
theorem ep_Q2_054_partial_04_0421_valid :
    mulPoly ep_Q2_054_coefficient_04_0421
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0422 : Poly :=
[
  term ((-3850645679331 : Rat) / 45033486517) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 422 for generator 4. -/
def ep_Q2_054_partial_04_0422 : Poly :=
[
  term ((-3850645679331 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3850645679331 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3850645679331 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3850645679331 : Rat) / 45033486517) [(9, 1), (10, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 4. -/
theorem ep_Q2_054_partial_04_0422_valid :
    mulPoly ep_Q2_054_coefficient_04_0422
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0423 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 423 for generator 4. -/
def ep_Q2_054_partial_04_0423 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 4. -/
theorem ep_Q2_054_partial_04_0423_valid :
    mulPoly ep_Q2_054_coefficient_04_0423
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0424 : Poly :=
[
  term ((-3703643234028 : Rat) / 45033486517) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 424 for generator 4. -/
def ep_Q2_054_partial_04_0424 : Poly :=
[
  term ((-3703643234028 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-3703643234028 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 4. -/
theorem ep_Q2_054_partial_04_0424_valid :
    mulPoly ep_Q2_054_coefficient_04_0424
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0425 : Poly :=
[
  term ((159714847335 : Rat) / 90066973034) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 425 for generator 4. -/
def ep_Q2_054_partial_04_0425 : Poly :=
[
  term ((159714847335 : Rat) / 90066973034) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 4. -/
theorem ep_Q2_054_partial_04_0425_valid :
    mulPoly ep_Q2_054_coefficient_04_0425
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0426 : Poly :=
[
  term ((148090245285 : Rat) / 45033486517) [(9, 1), (11, 1)]
]

/-- Partial product 426 for generator 4. -/
def ep_Q2_054_partial_04_0426 : Poly :=
[
  term ((148090245285 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1)],
  term ((148090245285 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1)],
  term ((-148090245285 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1)],
  term ((-148090245285 : Rat) / 45033486517) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 4. -/
theorem ep_Q2_054_partial_04_0426_valid :
    mulPoly ep_Q2_054_coefficient_04_0426
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0427 : Poly :=
[
  term ((-265368762711 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 427 for generator 4. -/
def ep_Q2_054_partial_04_0427 : Poly :=
[
  term ((-265368762711 : Rat) / 90066973034) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((-265368762711 : Rat) / 90066973034) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 4. -/
theorem ep_Q2_054_partial_04_0427_valid :
    mulPoly ep_Q2_054_coefficient_04_0427
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0428 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 428 for generator 4. -/
def ep_Q2_054_partial_04_0428 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 4. -/
theorem ep_Q2_054_partial_04_0428_valid :
    mulPoly ep_Q2_054_coefficient_04_0428
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0429 : Poly :=
[
  term ((6859465988367 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 429 for generator 4. -/
def ep_Q2_054_partial_04_0429 : Poly :=
[
  term ((6859465988367 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((6859465988367 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 4. -/
theorem ep_Q2_054_partial_04_0429_valid :
    mulPoly ep_Q2_054_coefficient_04_0429
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0430 : Poly :=
[
  term ((18346940563347 : Rat) / 180133946068) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 430 for generator 4. -/
def ep_Q2_054_partial_04_0430 : Poly :=
[
  term ((18346940563347 : Rat) / 180133946068) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((18346940563347 : Rat) / 180133946068) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-18346940563347 : Rat) / 180133946068) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-18346940563347 : Rat) / 180133946068) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 4. -/
theorem ep_Q2_054_partial_04_0430_valid :
    mulPoly ep_Q2_054_coefficient_04_0430
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0431 : Poly :=
[
  term ((-12145670056175 : Rat) / 360267892136) [(9, 1), (13, 1)]
]

/-- Partial product 431 for generator 4. -/
def ep_Q2_054_partial_04_0431 : Poly :=
[
  term ((-12145670056175 : Rat) / 360267892136) [(4, 2), (9, 1), (13, 1)],
  term ((-12145670056175 : Rat) / 360267892136) [(5, 2), (9, 1), (13, 1)],
  term ((12145670056175 : Rat) / 360267892136) [(9, 1), (10, 2), (13, 1)],
  term ((12145670056175 : Rat) / 360267892136) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 4. -/
theorem ep_Q2_054_partial_04_0431_valid :
    mulPoly ep_Q2_054_coefficient_04_0431
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0432 : Poly :=
[
  term ((9807006939624 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 432 for generator 4. -/
def ep_Q2_054_partial_04_0432 : Poly :=
[
  term ((9807006939624 : Rat) / 45033486517) [(4, 2), (9, 1), (15, 1)],
  term ((9807006939624 : Rat) / 45033486517) [(5, 2), (9, 1), (15, 1)],
  term ((-9807006939624 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1)],
  term ((-9807006939624 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 4. -/
theorem ep_Q2_054_partial_04_0432_valid :
    mulPoly ep_Q2_054_coefficient_04_0432
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0433 : Poly :=
[
  term ((159714847335 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 4. -/
def ep_Q2_054_partial_04_0433 : Poly :=
[
  term ((159714847335 : Rat) / 45033486517) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 45033486517) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 4. -/
theorem ep_Q2_054_partial_04_0433_valid :
    mulPoly ep_Q2_054_coefficient_04_0433
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0434 : Poly :=
[
  term ((-1438156426224 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 434 for generator 4. -/
def ep_Q2_054_partial_04_0434 : Poly :=
[
  term ((-1438156426224 : Rat) / 45033486517) [(4, 2), (9, 2)],
  term ((-1438156426224 : Rat) / 45033486517) [(5, 2), (9, 2)],
  term ((1438156426224 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((1438156426224 : Rat) / 45033486517) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 4. -/
theorem ep_Q2_054_partial_04_0434_valid :
    mulPoly ep_Q2_054_coefficient_04_0434
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0435 : Poly :=
[
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 1)]
]

/-- Partial product 435 for generator 4. -/
def ep_Q2_054_partial_04_0435 : Poly :=
[
  term ((408880257516 : Rat) / 45033486517) [(4, 2), (9, 2), (10, 1)],
  term ((408880257516 : Rat) / 45033486517) [(5, 2), (9, 2), (10, 1)],
  term ((-408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (11, 2)],
  term ((-408880257516 : Rat) / 45033486517) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 4. -/
theorem ep_Q2_054_partial_04_0435_valid :
    mulPoly ep_Q2_054_coefficient_04_0435
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0436 : Poly :=
[
  term ((-285781744458 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 436 for generator 4. -/
def ep_Q2_054_partial_04_0436 : Poly :=
[
  term ((-285781744458 : Rat) / 45033486517) [(4, 2), (9, 2), (12, 1)],
  term ((-285781744458 : Rat) / 45033486517) [(5, 2), (9, 2), (12, 1)],
  term ((285781744458 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((285781744458 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 4. -/
theorem ep_Q2_054_partial_04_0436_valid :
    mulPoly ep_Q2_054_coefficient_04_0436
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0437 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 437 for generator 4. -/
def ep_Q2_054_partial_04_0437 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 3), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 4. -/
theorem ep_Q2_054_partial_04_0437_valid :
    mulPoly ep_Q2_054_coefficient_04_0437
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0438 : Poly :=
[
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 438 for generator 4. -/
def ep_Q2_054_partial_04_0438 : Poly :=
[
  term ((-12351476306976 : Rat) / 45033486517) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((-12351476306976 : Rat) / 45033486517) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((12351476306976 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((12351476306976 : Rat) / 45033486517) [(10, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 4. -/
theorem ep_Q2_054_partial_04_0438_valid :
    mulPoly ep_Q2_054_coefficient_04_0438
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0439 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 439 for generator 4. -/
def ep_Q2_054_partial_04_0439 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(4, 2), (10, 1), (12, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 4. -/
theorem ep_Q2_054_partial_04_0439_valid :
    mulPoly ep_Q2_054_coefficient_04_0439
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0440 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 440 for generator 4. -/
def ep_Q2_054_partial_04_0440 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 4. -/
theorem ep_Q2_054_partial_04_0440_valid :
    mulPoly ep_Q2_054_coefficient_04_0440
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0441 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 4. -/
def ep_Q2_054_partial_04_0441 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 4. -/
theorem ep_Q2_054_partial_04_0441_valid :
    mulPoly ep_Q2_054_coefficient_04_0441
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0442 : Poly :=
[
  term ((23322085193004 : Rat) / 45033486517) [(10, 1), (15, 2)]
]

/-- Partial product 442 for generator 4. -/
def ep_Q2_054_partial_04_0442 : Poly :=
[
  term ((23322085193004 : Rat) / 45033486517) [(4, 2), (10, 1), (15, 2)],
  term ((23322085193004 : Rat) / 45033486517) [(5, 2), (10, 1), (15, 2)],
  term ((-23322085193004 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2)],
  term ((-23322085193004 : Rat) / 45033486517) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 4. -/
theorem ep_Q2_054_partial_04_0442_valid :
    mulPoly ep_Q2_054_coefficient_04_0442
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0443 : Poly :=
[
  term ((521418493026 : Rat) / 45033486517) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 443 for generator 4. -/
def ep_Q2_054_partial_04_0443 : Poly :=
[
  term ((521418493026 : Rat) / 45033486517) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-521418493026 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-521418493026 : Rat) / 45033486517) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 4. -/
theorem ep_Q2_054_partial_04_0443_valid :
    mulPoly ep_Q2_054_coefficient_04_0443
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0444 : Poly :=
[
  term ((45403677525 : Rat) / 90066973034) [(10, 1), (16, 1)]
]

/-- Partial product 444 for generator 4. -/
def ep_Q2_054_partial_04_0444 : Poly :=
[
  term ((45403677525 : Rat) / 90066973034) [(4, 2), (10, 1), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(5, 2), (10, 1), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(10, 1), (11, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 4. -/
theorem ep_Q2_054_partial_04_0444_valid :
    mulPoly ep_Q2_054_coefficient_04_0444
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0445 : Poly :=
[
  term ((3957916906626 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 445 for generator 4. -/
def ep_Q2_054_partial_04_0445 : Poly :=
[
  term ((3957916906626 : Rat) / 45033486517) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((3957916906626 : Rat) / 45033486517) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3957916906626 : Rat) / 45033486517) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3957916906626 : Rat) / 45033486517) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 4. -/
theorem ep_Q2_054_partial_04_0445_valid :
    mulPoly ep_Q2_054_coefficient_04_0445
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0446 : Poly :=
[
  term ((-1646022037383 : Rat) / 45033486517) [(11, 1), (13, 1)]
]

/-- Partial product 446 for generator 4. -/
def ep_Q2_054_partial_04_0446 : Poly :=
[
  term ((-1646022037383 : Rat) / 45033486517) [(4, 2), (11, 1), (13, 1)],
  term ((-1646022037383 : Rat) / 45033486517) [(5, 2), (11, 1), (13, 1)],
  term ((1646022037383 : Rat) / 45033486517) [(10, 2), (11, 1), (13, 1)],
  term ((1646022037383 : Rat) / 45033486517) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 4. -/
theorem ep_Q2_054_partial_04_0446_valid :
    mulPoly ep_Q2_054_coefficient_04_0446
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0447 : Poly :=
[
  term ((-10374011354319 : Rat) / 45033486517) [(11, 1), (15, 1)]
]

/-- Partial product 447 for generator 4. -/
def ep_Q2_054_partial_04_0447 : Poly :=
[
  term ((-10374011354319 : Rat) / 45033486517) [(4, 2), (11, 1), (15, 1)],
  term ((-10374011354319 : Rat) / 45033486517) [(5, 2), (11, 1), (15, 1)],
  term ((10374011354319 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((10374011354319 : Rat) / 45033486517) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 4. -/
theorem ep_Q2_054_partial_04_0447_valid :
    mulPoly ep_Q2_054_coefficient_04_0447
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0448 : Poly :=
[
  term ((275843805688 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 4. -/
def ep_Q2_054_partial_04_0448 : Poly :=
[
  term ((275843805688 : Rat) / 45033486517) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((275843805688 : Rat) / 45033486517) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-275843805688 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-275843805688 : Rat) / 45033486517) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 4. -/
theorem ep_Q2_054_partial_04_0448_valid :
    mulPoly ep_Q2_054_coefficient_04_0448
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0449 : Poly :=
[
  term ((1646022037383 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 449 for generator 4. -/
def ep_Q2_054_partial_04_0449 : Poly :=
[
  term ((1646022037383 : Rat) / 45033486517) [(4, 2), (11, 2)],
  term ((1646022037383 : Rat) / 45033486517) [(5, 2), (11, 2)],
  term ((-1646022037383 : Rat) / 45033486517) [(10, 2), (11, 2)],
  term ((-1646022037383 : Rat) / 45033486517) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 4. -/
theorem ep_Q2_054_partial_04_0449_valid :
    mulPoly ep_Q2_054_coefficient_04_0449
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0450 : Poly :=
[
  term ((-4101615183965 : Rat) / 90066973034) [(12, 1)]
]

/-- Partial product 450 for generator 4. -/
def ep_Q2_054_partial_04_0450 : Poly :=
[
  term ((-4101615183965 : Rat) / 90066973034) [(4, 2), (12, 1)],
  term ((-4101615183965 : Rat) / 90066973034) [(5, 2), (12, 1)],
  term ((4101615183965 : Rat) / 90066973034) [(10, 2), (12, 1)],
  term ((4101615183965 : Rat) / 90066973034) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 4. -/
theorem ep_Q2_054_partial_04_0450_valid :
    mulPoly ep_Q2_054_coefficient_04_0450
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0451 : Poly :=
[
  term ((-18340224924837 : Rat) / 90066973034) [(12, 1), (15, 2)]
]

/-- Partial product 451 for generator 4. -/
def ep_Q2_054_partial_04_0451 : Poly :=
[
  term ((-18340224924837 : Rat) / 90066973034) [(4, 2), (12, 1), (15, 2)],
  term ((-18340224924837 : Rat) / 90066973034) [(5, 2), (12, 1), (15, 2)],
  term ((18340224924837 : Rat) / 90066973034) [(10, 2), (12, 1), (15, 2)],
  term ((18340224924837 : Rat) / 90066973034) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 4. -/
theorem ep_Q2_054_partial_04_0451_valid :
    mulPoly ep_Q2_054_coefficient_04_0451
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0452 : Poly :=
[
  term ((75672795875 : Rat) / 90066973034) [(12, 1), (16, 1)]
]

/-- Partial product 452 for generator 4. -/
def ep_Q2_054_partial_04_0452 : Poly :=
[
  term ((75672795875 : Rat) / 90066973034) [(4, 2), (12, 1), (16, 1)],
  term ((75672795875 : Rat) / 90066973034) [(5, 2), (12, 1), (16, 1)],
  term ((-75672795875 : Rat) / 90066973034) [(10, 2), (12, 1), (16, 1)],
  term ((-75672795875 : Rat) / 90066973034) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 4. -/
theorem ep_Q2_054_partial_04_0452_valid :
    mulPoly ep_Q2_054_coefficient_04_0452
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0453 : Poly :=
[
  term ((84297123472197 : Rat) / 180133946068) [(13, 1), (15, 1)]
]

/-- Partial product 453 for generator 4. -/
def ep_Q2_054_partial_04_0453 : Poly :=
[
  term ((84297123472197 : Rat) / 180133946068) [(4, 2), (13, 1), (15, 1)],
  term ((84297123472197 : Rat) / 180133946068) [(5, 2), (13, 1), (15, 1)],
  term ((-84297123472197 : Rat) / 180133946068) [(10, 2), (13, 1), (15, 1)],
  term ((-84297123472197 : Rat) / 180133946068) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 4. -/
theorem ep_Q2_054_partial_04_0453_valid :
    mulPoly ep_Q2_054_coefficient_04_0453
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0454 : Poly :=
[
  term ((-75672795875 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 4. -/
def ep_Q2_054_partial_04_0454 : Poly :=
[
  term ((-75672795875 : Rat) / 45033486517) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 4. -/
theorem ep_Q2_054_partial_04_0454_valid :
    mulPoly ep_Q2_054_coefficient_04_0454
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0455 : Poly :=
[
  term ((16599914399980 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 455 for generator 4. -/
def ep_Q2_054_partial_04_0455 : Poly :=
[
  term ((16599914399980 : Rat) / 45033486517) [(4, 2), (15, 2)],
  term ((16599914399980 : Rat) / 45033486517) [(5, 2), (15, 2)],
  term ((-16599914399980 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((-16599914399980 : Rat) / 45033486517) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 4. -/
theorem ep_Q2_054_partial_04_0455_valid :
    mulPoly ep_Q2_054_coefficient_04_0455
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0456 : Poly :=
[
  term ((-521418493026 : Rat) / 45033486517) [(15, 2), (16, 1)]
]

/-- Partial product 456 for generator 4. -/
def ep_Q2_054_partial_04_0456 : Poly :=
[
  term ((-521418493026 : Rat) / 45033486517) [(4, 2), (15, 2), (16, 1)],
  term ((-521418493026 : Rat) / 45033486517) [(5, 2), (15, 2), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(10, 2), (15, 2), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 4. -/
theorem ep_Q2_054_partial_04_0456_valid :
    mulPoly ep_Q2_054_coefficient_04_0456
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0457 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(16, 1)]
]

/-- Partial product 457 for generator 4. -/
def ep_Q2_054_partial_04_0457 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(4, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(5, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 4. -/
theorem ep_Q2_054_partial_04_0457_valid :
    mulPoly ep_Q2_054_coefficient_04_0457
        ep_Q2_054_generator_04_0400_0457 =
      ep_Q2_054_partial_04_0457 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_04_0400_0457 : List Poly :=
[
  ep_Q2_054_partial_04_0400,
  ep_Q2_054_partial_04_0401,
  ep_Q2_054_partial_04_0402,
  ep_Q2_054_partial_04_0403,
  ep_Q2_054_partial_04_0404,
  ep_Q2_054_partial_04_0405,
  ep_Q2_054_partial_04_0406,
  ep_Q2_054_partial_04_0407,
  ep_Q2_054_partial_04_0408,
  ep_Q2_054_partial_04_0409,
  ep_Q2_054_partial_04_0410,
  ep_Q2_054_partial_04_0411,
  ep_Q2_054_partial_04_0412,
  ep_Q2_054_partial_04_0413,
  ep_Q2_054_partial_04_0414,
  ep_Q2_054_partial_04_0415,
  ep_Q2_054_partial_04_0416,
  ep_Q2_054_partial_04_0417,
  ep_Q2_054_partial_04_0418,
  ep_Q2_054_partial_04_0419,
  ep_Q2_054_partial_04_0420,
  ep_Q2_054_partial_04_0421,
  ep_Q2_054_partial_04_0422,
  ep_Q2_054_partial_04_0423,
  ep_Q2_054_partial_04_0424,
  ep_Q2_054_partial_04_0425,
  ep_Q2_054_partial_04_0426,
  ep_Q2_054_partial_04_0427,
  ep_Q2_054_partial_04_0428,
  ep_Q2_054_partial_04_0429,
  ep_Q2_054_partial_04_0430,
  ep_Q2_054_partial_04_0431,
  ep_Q2_054_partial_04_0432,
  ep_Q2_054_partial_04_0433,
  ep_Q2_054_partial_04_0434,
  ep_Q2_054_partial_04_0435,
  ep_Q2_054_partial_04_0436,
  ep_Q2_054_partial_04_0437,
  ep_Q2_054_partial_04_0438,
  ep_Q2_054_partial_04_0439,
  ep_Q2_054_partial_04_0440,
  ep_Q2_054_partial_04_0441,
  ep_Q2_054_partial_04_0442,
  ep_Q2_054_partial_04_0443,
  ep_Q2_054_partial_04_0444,
  ep_Q2_054_partial_04_0445,
  ep_Q2_054_partial_04_0446,
  ep_Q2_054_partial_04_0447,
  ep_Q2_054_partial_04_0448,
  ep_Q2_054_partial_04_0449,
  ep_Q2_054_partial_04_0450,
  ep_Q2_054_partial_04_0451,
  ep_Q2_054_partial_04_0452,
  ep_Q2_054_partial_04_0453,
  ep_Q2_054_partial_04_0454,
  ep_Q2_054_partial_04_0455,
  ep_Q2_054_partial_04_0456,
  ep_Q2_054_partial_04_0457
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_04_0400_0457 : Poly :=
[
  term ((-9260117213880 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (15, 2)],
  term ((-319429694670 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(4, 2), (8, 1), (10, 1), (16, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((6315633161721 : Rat) / 90066973034) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((24792769529877 : Rat) / 90066973034) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-189282737937 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6315633161721 : Rat) / 90066973034) [(4, 2), (8, 1), (11, 2)],
  term ((5347892785655 : Rat) / 180133946068) [(4, 2), (8, 1), (12, 1)],
  term ((5533560238413 : Rat) / 45033486517) [(4, 2), (8, 1), (12, 1), (15, 2)],
  term ((502895330655 : Rat) / 180133946068) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((-55832432143884 : Rat) / 45033486517) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13849863349980 : Rat) / 45033486517) [(4, 2), (8, 1), (15, 2)],
  term ((-100579066131 : Rat) / 45033486517) [(4, 2), (8, 1), (16, 1)],
  term ((178969991874 : Rat) / 45033486517) [(4, 2), (8, 2)],
  term ((268454987811 : Rat) / 45033486517) [(4, 2), (8, 2), (11, 1), (13, 1)],
  term ((101135099808 : Rat) / 45033486517) [(4, 2), (8, 2), (11, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(4, 2), (8, 2), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(4, 2), (8, 2), (12, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(4, 2), (8, 2), (13, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((-3850645679331 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-3703643234028 : Rat) / 45033486517) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((148090245285 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1)],
  term ((-265368762711 : Rat) / 90066973034) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6859465988367 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((18346940563347 : Rat) / 180133946068) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-12145670056175 : Rat) / 360267892136) [(4, 2), (9, 1), (13, 1)],
  term ((9807006939624 : Rat) / 45033486517) [(4, 2), (9, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1438156426224 : Rat) / 45033486517) [(4, 2), (9, 2)],
  term ((408880257516 : Rat) / 45033486517) [(4, 2), (9, 2), (10, 1)],
  term ((-285781744458 : Rat) / 45033486517) [(4, 2), (9, 2), (12, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((-30269118350 : Rat) / 45033486517) [(4, 2), (10, 1), (12, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((23322085193004 : Rat) / 45033486517) [(4, 2), (10, 1), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(4, 2), (10, 1), (16, 1)],
  term ((3957916906626 : Rat) / 45033486517) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1646022037383 : Rat) / 45033486517) [(4, 2), (11, 1), (13, 1)],
  term ((-10374011354319 : Rat) / 45033486517) [(4, 2), (11, 1), (15, 1)],
  term ((275843805688 : Rat) / 45033486517) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1646022037383 : Rat) / 45033486517) [(4, 2), (11, 2)],
  term ((-4101615183965 : Rat) / 90066973034) [(4, 2), (12, 1)],
  term ((-18340224924837 : Rat) / 90066973034) [(4, 2), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(4, 2), (12, 1), (16, 1)],
  term ((84297123472197 : Rat) / 180133946068) [(4, 2), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((16599914399980 : Rat) / 45033486517) [(4, 2), (15, 2)],
  term ((-521418493026 : Rat) / 45033486517) [(4, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(4, 2), (16, 1)],
  term ((-9260117213880 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (15, 2)],
  term ((-319429694670 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((6315633161721 : Rat) / 90066973034) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((24792769529877 : Rat) / 90066973034) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-189282737937 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6315633161721 : Rat) / 90066973034) [(5, 2), (8, 1), (11, 2)],
  term ((5347892785655 : Rat) / 180133946068) [(5, 2), (8, 1), (12, 1)],
  term ((5533560238413 : Rat) / 45033486517) [(5, 2), (8, 1), (12, 1), (15, 2)],
  term ((502895330655 : Rat) / 180133946068) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-55832432143884 : Rat) / 45033486517) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13849863349980 : Rat) / 45033486517) [(5, 2), (8, 1), (15, 2)],
  term ((-100579066131 : Rat) / 45033486517) [(5, 2), (8, 1), (16, 1)],
  term ((178969991874 : Rat) / 45033486517) [(5, 2), (8, 2)],
  term ((268454987811 : Rat) / 45033486517) [(5, 2), (8, 2), (11, 1), (13, 1)],
  term ((101135099808 : Rat) / 45033486517) [(5, 2), (8, 2), (11, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(5, 2), (8, 2), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(5, 2), (8, 2), (12, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(5, 2), (8, 2), (13, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((-3850645679331 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-3703643234028 : Rat) / 45033486517) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((148090245285 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1)],
  term ((-265368762711 : Rat) / 90066973034) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6859465988367 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((18346940563347 : Rat) / 180133946068) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-12145670056175 : Rat) / 360267892136) [(5, 2), (9, 1), (13, 1)],
  term ((9807006939624 : Rat) / 45033486517) [(5, 2), (9, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1438156426224 : Rat) / 45033486517) [(5, 2), (9, 2)],
  term ((408880257516 : Rat) / 45033486517) [(5, 2), (9, 2), (10, 1)],
  term ((-285781744458 : Rat) / 45033486517) [(5, 2), (9, 2), (12, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((-30269118350 : Rat) / 45033486517) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((23322085193004 : Rat) / 45033486517) [(5, 2), (10, 1), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(5, 2), (10, 1), (16, 1)],
  term ((3957916906626 : Rat) / 45033486517) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1646022037383 : Rat) / 45033486517) [(5, 2), (11, 1), (13, 1)],
  term ((-10374011354319 : Rat) / 45033486517) [(5, 2), (11, 1), (15, 1)],
  term ((275843805688 : Rat) / 45033486517) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1646022037383 : Rat) / 45033486517) [(5, 2), (11, 2)],
  term ((-4101615183965 : Rat) / 90066973034) [(5, 2), (12, 1)],
  term ((-18340224924837 : Rat) / 90066973034) [(5, 2), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(5, 2), (12, 1), (16, 1)],
  term ((84297123472197 : Rat) / 180133946068) [(5, 2), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((16599914399980 : Rat) / 45033486517) [(5, 2), (15, 2)],
  term ((-521418493026 : Rat) / 45033486517) [(5, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(5, 2), (16, 1)],
  term ((9260117213880 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6315633161721 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-24792769529877 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((189282737937 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((6315633161721 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 2)],
  term ((-5347892785655 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1)],
  term ((-5533560238413 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-502895330655 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((55832432143884 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((502895330655 : Rat) / 90066973034) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((13849863349980 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 2), (16, 1)],
  term ((9260117213880 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (10, 3), (16, 1)],
  term ((-5347892785655 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1)],
  term ((-5533560238413 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-502895330655 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((55832432143884 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((502895330655 : Rat) / 90066973034) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((13849863349980 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (16, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-6315633161721 : Rat) / 90066973034) [(8, 1), (11, 3), (13, 1)],
  term ((-24792769529877 : Rat) / 90066973034) [(8, 1), (11, 3), (15, 1)],
  term ((189282737937 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((6315633161721 : Rat) / 90066973034) [(8, 1), (11, 4)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-101135099808 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 2), (10, 2), (12, 1)],
  term ((536909975622 : Rat) / 45033486517) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 2), (11, 2), (12, 1)],
  term ((536909975622 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (11, 3), (13, 1)],
  term ((-101135099808 : Rat) / 45033486517) [(8, 2), (11, 3), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 4)],
  term ((3850645679331 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 3)],
  term ((-148090245285 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-18346940563347 : Rat) / 180133946068) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((12145670056175 : Rat) / 360267892136) [(9, 1), (10, 2), (13, 1)],
  term ((-9807006939624 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (11, 1)],
  term ((3850645679331 : Rat) / 45033486517) [(9, 1), (10, 3), (12, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (13, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(9, 1), (10, 3), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-18346940563347 : Rat) / 180133946068) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((12145670056175 : Rat) / 360267892136) [(9, 1), (11, 2), (13, 1)],
  term ((-9807006939624 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-148090245285 : Rat) / 45033486517) [(9, 1), (11, 3)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (11, 3), (12, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (11, 3), (15, 2)],
  term ((-408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (11, 2)],
  term ((1438156426224 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((285781744458 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((-408880257516 : Rat) / 45033486517) [(9, 2), (10, 3)],
  term ((1438156426224 : Rat) / 45033486517) [(9, 2), (11, 2)],
  term ((285781744458 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)],
  term ((12351476306976 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((30269118350 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23322085193004 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2)],
  term ((-521418493026 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(10, 1), (11, 2), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 3), (15, 1)],
  term ((-3957916906626 : Rat) / 45033486517) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((1646022037383 : Rat) / 45033486517) [(10, 2), (11, 1), (13, 1)],
  term ((10374011354319 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((-275843805688 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1646022037383 : Rat) / 45033486517) [(10, 2), (11, 2)],
  term ((4101615183965 : Rat) / 90066973034) [(10, 2), (12, 1)],
  term ((18340224924837 : Rat) / 90066973034) [(10, 2), (12, 1), (15, 2)],
  term ((-75672795875 : Rat) / 90066973034) [(10, 2), (12, 1), (16, 1)],
  term ((-84297123472197 : Rat) / 180133946068) [(10, 2), (13, 1), (15, 1)],
  term ((75672795875 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16599914399980 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(10, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 2), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 3), (11, 1), (15, 1)],
  term ((12351476306976 : Rat) / 45033486517) [(10, 3), (12, 1), (15, 2)],
  term ((30269118350 : Rat) / 45033486517) [(10, 3), (12, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-23322085193004 : Rat) / 45033486517) [(10, 3), (15, 2)],
  term ((-521418493026 : Rat) / 45033486517) [(10, 3), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(10, 3), (16, 1)],
  term ((4101615183965 : Rat) / 90066973034) [(11, 2), (12, 1)],
  term ((18340224924837 : Rat) / 90066973034) [(11, 2), (12, 1), (15, 2)],
  term ((-75672795875 : Rat) / 90066973034) [(11, 2), (12, 1), (16, 1)],
  term ((-84297123472197 : Rat) / 180133946068) [(11, 2), (13, 1), (15, 1)],
  term ((75672795875 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16599914399980 : Rat) / 45033486517) [(11, 2), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(11, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 2), (16, 1)],
  term ((-3957916906626 : Rat) / 45033486517) [(11, 3), (12, 1), (15, 1)],
  term ((1646022037383 : Rat) / 45033486517) [(11, 3), (13, 1)],
  term ((10374011354319 : Rat) / 45033486517) [(11, 3), (15, 1)],
  term ((-275843805688 : Rat) / 45033486517) [(11, 3), (15, 1), (16, 1)],
  term ((-1646022037383 : Rat) / 45033486517) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 400 through 457. -/
theorem ep_Q2_054_block_04_0400_0457_valid :
    checkProductSumEq ep_Q2_054_partials_04_0400_0457
      ep_Q2_054_block_04_0400_0457 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
