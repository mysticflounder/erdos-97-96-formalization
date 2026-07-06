/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0400 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (7, 1)]
]

/-- Partial product 400 for generator 9. -/
def ep_Q2_002_partial_09_0400 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (7, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 9. -/
theorem ep_Q2_002_partial_09_0400_valid :
    mulPoly ep_Q2_002_coefficient_09_0400
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0401 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (15, 1)]
]

/-- Partial product 401 for generator 9. -/
def ep_Q2_002_partial_09_0401 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 9. -/
theorem ep_Q2_002_partial_09_0401_valid :
    mulPoly ep_Q2_002_coefficient_09_0401
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0402 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (7, 1), (15, 1)]
]

/-- Partial product 402 for generator 9. -/
def ep_Q2_002_partial_09_0402 : Poly :=
[
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 9. -/
theorem ep_Q2_002_partial_09_0402_valid :
    mulPoly ep_Q2_002_coefficient_09_0402
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0403 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (7, 2)]
]

/-- Partial product 403 for generator 9. -/
def ep_Q2_002_partial_09_0403 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (7, 2)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 9. -/
theorem ep_Q2_002_partial_09_0403_valid :
    mulPoly ep_Q2_002_coefficient_09_0403
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0404 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (15, 2)]
]

/-- Partial product 404 for generator 9. -/
def ep_Q2_002_partial_09_0404 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (15, 2)],
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 9. -/
theorem ep_Q2_002_partial_09_0404_valid :
    mulPoly ep_Q2_002_coefficient_09_0404
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0405 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (7, 1)]
]

/-- Partial product 405 for generator 9. -/
def ep_Q2_002_partial_09_0405 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (7, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 9. -/
theorem ep_Q2_002_partial_09_0405_valid :
    mulPoly ep_Q2_002_coefficient_09_0405
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0406 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (15, 1)]
]

/-- Partial product 406 for generator 9. -/
def ep_Q2_002_partial_09_0406 : Poly :=
[
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 9. -/
theorem ep_Q2_002_partial_09_0406_valid :
    mulPoly ep_Q2_002_coefficient_09_0406
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0407 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1)]
]

/-- Partial product 407 for generator 9. -/
def ep_Q2_002_partial_09_0407 : Poly :=
[
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 9. -/
theorem ep_Q2_002_partial_09_0407_valid :
    mulPoly ep_Q2_002_coefficient_09_0407
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0408 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 408 for generator 9. -/
def ep_Q2_002_partial_09_0408 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 9. -/
theorem ep_Q2_002_partial_09_0408_valid :
    mulPoly ep_Q2_002_coefficient_09_0408
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0409 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (14, 1)]
]

/-- Partial product 409 for generator 9. -/
def ep_Q2_002_partial_09_0409 : Poly :=
[
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 9. -/
theorem ep_Q2_002_partial_09_0409_valid :
    mulPoly ep_Q2_002_coefficient_09_0409
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0410 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 410 for generator 9. -/
def ep_Q2_002_partial_09_0410 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 9. -/
theorem ep_Q2_002_partial_09_0410_valid :
    mulPoly ep_Q2_002_coefficient_09_0410
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0411 : Poly :=
[
  term ((-37348342873430514324656726400 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1)]
]

/-- Partial product 411 for generator 9. -/
def ep_Q2_002_partial_09_0411 : Poly :=
[
  term ((-74696685746861028649313452800 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (4, 1)],
  term ((37348342873430514324656726400 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 9. -/
theorem ep_Q2_002_partial_09_0411_valid :
    mulPoly ep_Q2_002_coefficient_09_0411
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0412 : Poly :=
[
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1)]
]

/-- Partial product 412 for generator 9. -/
def ep_Q2_002_partial_09_0412 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 9. -/
theorem ep_Q2_002_partial_09_0412_valid :
    mulPoly ep_Q2_002_coefficient_09_0412
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0413 : Poly :=
[
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 413 for generator 9. -/
def ep_Q2_002_partial_09_0413 : Poly :=
[
  term ((-27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 9. -/
theorem ep_Q2_002_partial_09_0413_valid :
    mulPoly ep_Q2_002_coefficient_09_0413
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0414 : Poly :=
[
  term ((2570531680760195772454821707328 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1)]
]

/-- Partial product 414 for generator 9. -/
def ep_Q2_002_partial_09_0414 : Poly :=
[
  term ((5141063361520391544909643414656 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (14, 1)],
  term ((-2570531680760195772454821707328 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 9. -/
theorem ep_Q2_002_partial_09_0414_valid :
    mulPoly ep_Q2_002_coefficient_09_0414
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0415 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (15, 2)]
]

/-- Partial product 415 for generator 9. -/
def ep_Q2_002_partial_09_0415 : Poly :=
[
  term ((9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (15, 2)],
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 9. -/
theorem ep_Q2_002_partial_09_0415_valid :
    mulPoly ep_Q2_002_coefficient_09_0415
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0416 : Poly :=
[
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1)]
]

/-- Partial product 416 for generator 9. -/
def ep_Q2_002_partial_09_0416 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (7, 1)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 9. -/
theorem ep_Q2_002_partial_09_0416_valid :
    mulPoly ep_Q2_002_coefficient_09_0416
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0417 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (14, 1)]
]

/-- Partial product 417 for generator 9. -/
def ep_Q2_002_partial_09_0417 : Poly :=
[
  term ((27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (7, 1), (14, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 9. -/
theorem ep_Q2_002_partial_09_0417_valid :
    mulPoly ep_Q2_002_coefficient_09_0417
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0418 : Poly :=
[
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 418 for generator 9. -/
def ep_Q2_002_partial_09_0418 : Poly :=
[
  term ((-9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 9. -/
theorem ep_Q2_002_partial_09_0418_valid :
    mulPoly ep_Q2_002_coefficient_09_0418
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0419 : Poly :=
[
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 1)]
]

/-- Partial product 419 for generator 9. -/
def ep_Q2_002_partial_09_0419 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 9. -/
theorem ep_Q2_002_partial_09_0419_valid :
    mulPoly ep_Q2_002_coefficient_09_0419
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0420 : Poly :=
[
  term ((128917724735471768758145149920 : Rat) / 115799135485108289802725034287) [(1, 2), (6, 1)]
]

/-- Partial product 420 for generator 9. -/
def ep_Q2_002_partial_09_0420 : Poly :=
[
  term ((257835449470943537516290299840 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (6, 1)],
  term ((-128917724735471768758145149920 : Rat) / 115799135485108289802725034287) [(1, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 9. -/
theorem ep_Q2_002_partial_09_0420_valid :
    mulPoly ep_Q2_002_coefficient_09_0420
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0421 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 421 for generator 9. -/
def ep_Q2_002_partial_09_0421 : Poly :=
[
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (7, 1), (11, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 9. -/
theorem ep_Q2_002_partial_09_0421_valid :
    mulPoly ep_Q2_002_coefficient_09_0421
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0422 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 422 for generator 9. -/
def ep_Q2_002_partial_09_0422 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 9. -/
theorem ep_Q2_002_partial_09_0422_valid :
    mulPoly ep_Q2_002_coefficient_09_0422
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0423 : Poly :=
[
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (14, 1)]
]

/-- Partial product 423 for generator 9. -/
def ep_Q2_002_partial_09_0423 : Poly :=
[
  term ((-1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 9. -/
theorem ep_Q2_002_partial_09_0423_valid :
    mulPoly ep_Q2_002_coefficient_09_0423
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0424 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (15, 1)]
]

/-- Partial product 424 for generator 9. -/
def ep_Q2_002_partial_09_0424 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 9. -/
theorem ep_Q2_002_partial_09_0424_valid :
    mulPoly ep_Q2_002_coefficient_09_0424
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0425 : Poly :=
[
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)]
]

/-- Partial product 425 for generator 9. -/
def ep_Q2_002_partial_09_0425 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (7, 2)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 9. -/
theorem ep_Q2_002_partial_09_0425_valid :
    mulPoly ep_Q2_002_coefficient_09_0425
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0426 : Poly :=
[
  term ((1504665864717487240971972924480 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1)]
]

/-- Partial product 426 for generator 9. -/
def ep_Q2_002_partial_09_0426 : Poly :=
[
  term ((3009331729434974481943945848960 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (14, 1)],
  term ((-1504665864717487240971972924480 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 9. -/
theorem ep_Q2_002_partial_09_0426_valid :
    mulPoly ep_Q2_002_coefficient_09_0426
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0427 : Poly :=
[
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)]
]

/-- Partial product 427 for generator 9. -/
def ep_Q2_002_partial_09_0427 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (15, 2)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 9. -/
theorem ep_Q2_002_partial_09_0427_valid :
    mulPoly ep_Q2_002_coefficient_09_0427
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0428 : Poly :=
[
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1)]
]

/-- Partial product 428 for generator 9. -/
def ep_Q2_002_partial_09_0428 : Poly :=
[
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 9. -/
theorem ep_Q2_002_partial_09_0428_valid :
    mulPoly ep_Q2_002_coefficient_09_0428
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0429 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 429 for generator 9. -/
def ep_Q2_002_partial_09_0429 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 9. -/
theorem ep_Q2_002_partial_09_0429_valid :
    mulPoly ep_Q2_002_coefficient_09_0429
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0430 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 430 for generator 9. -/
def ep_Q2_002_partial_09_0430 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 9. -/
theorem ep_Q2_002_partial_09_0430_valid :
    mulPoly ep_Q2_002_coefficient_09_0430
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0431 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 431 for generator 9. -/
def ep_Q2_002_partial_09_0431 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 9. -/
theorem ep_Q2_002_partial_09_0431_valid :
    mulPoly ep_Q2_002_coefficient_09_0431
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0432 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 9. -/
def ep_Q2_002_partial_09_0432 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 9. -/
theorem ep_Q2_002_partial_09_0432_valid :
    mulPoly ep_Q2_002_coefficient_09_0432
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0433 : Poly :=
[
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1)]
]

/-- Partial product 433 for generator 9. -/
def ep_Q2_002_partial_09_0433 : Poly :=
[
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 9. -/
theorem ep_Q2_002_partial_09_0433_valid :
    mulPoly ep_Q2_002_coefficient_09_0433
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0434 : Poly :=
[
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (15, 1)]
]

/-- Partial product 434 for generator 9. -/
def ep_Q2_002_partial_09_0434 : Poly :=
[
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 9. -/
theorem ep_Q2_002_partial_09_0434_valid :
    mulPoly ep_Q2_002_coefficient_09_0434
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0435 : Poly :=
[
  term ((-38126575709 : Rat) / 6343986210) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 9. -/
def ep_Q2_002_partial_09_0435 : Poly :=
[
  term ((38126575709 : Rat) / 6343986210) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-38126575709 : Rat) / 3171993105) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 9. -/
theorem ep_Q2_002_partial_09_0435_valid :
    mulPoly ep_Q2_002_coefficient_09_0435
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0436 : Poly :=
[
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1)]
]

/-- Partial product 436 for generator 9. -/
def ep_Q2_002_partial_09_0436 : Poly :=
[
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 9. -/
theorem ep_Q2_002_partial_09_0436_valid :
    mulPoly ep_Q2_002_coefficient_09_0436
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0437 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 437 for generator 9. -/
def ep_Q2_002_partial_09_0437 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 9. -/
theorem ep_Q2_002_partial_09_0437_valid :
    mulPoly ep_Q2_002_coefficient_09_0437
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0438 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 438 for generator 9. -/
def ep_Q2_002_partial_09_0438 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 9. -/
theorem ep_Q2_002_partial_09_0438_valid :
    mulPoly ep_Q2_002_coefficient_09_0438
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0439 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 439 for generator 9. -/
def ep_Q2_002_partial_09_0439 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 9. -/
theorem ep_Q2_002_partial_09_0439_valid :
    mulPoly ep_Q2_002_coefficient_09_0439
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0440 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 9. -/
def ep_Q2_002_partial_09_0440 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 9. -/
theorem ep_Q2_002_partial_09_0440_valid :
    mulPoly ep_Q2_002_coefficient_09_0440
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0441 : Poly :=
[
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1)]
]

/-- Partial product 441 for generator 9. -/
def ep_Q2_002_partial_09_0441 : Poly :=
[
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 9. -/
theorem ep_Q2_002_partial_09_0441_valid :
    mulPoly ep_Q2_002_coefficient_09_0441
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0442 : Poly :=
[
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 442 for generator 9. -/
def ep_Q2_002_partial_09_0442 : Poly :=
[
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 9. -/
theorem ep_Q2_002_partial_09_0442_valid :
    mulPoly ep_Q2_002_coefficient_09_0442
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0443 : Poly :=
[
  term ((38126575709 : Rat) / 6343986210) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 9. -/
def ep_Q2_002_partial_09_0443 : Poly :=
[
  term ((-38126575709 : Rat) / 6343986210) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((38126575709 : Rat) / 3171993105) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 9. -/
theorem ep_Q2_002_partial_09_0443_valid :
    mulPoly ep_Q2_002_coefficient_09_0443
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0444 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 444 for generator 9. -/
def ep_Q2_002_partial_09_0444 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 9. -/
theorem ep_Q2_002_partial_09_0444_valid :
    mulPoly ep_Q2_002_coefficient_09_0444
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0445 : Poly :=
[
  term ((-10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 445 for generator 9. -/
def ep_Q2_002_partial_09_0445 : Poly :=
[
  term ((10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-20117803134414401579895665468472 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 9. -/
theorem ep_Q2_002_partial_09_0445_valid :
    mulPoly ep_Q2_002_coefficient_09_0445
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0446 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 446 for generator 9. -/
def ep_Q2_002_partial_09_0446 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 9. -/
theorem ep_Q2_002_partial_09_0446_valid :
    mulPoly ep_Q2_002_coefficient_09_0446
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0447 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (12, 1), (15, 2)]
]

/-- Partial product 447 for generator 9. -/
def ep_Q2_002_partial_09_0447 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 9. -/
theorem ep_Q2_002_partial_09_0447_valid :
    mulPoly ep_Q2_002_coefficient_09_0447
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0448 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 448 for generator 9. -/
def ep_Q2_002_partial_09_0448 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 9. -/
theorem ep_Q2_002_partial_09_0448_valid :
    mulPoly ep_Q2_002_coefficient_09_0448
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0449 : Poly :=
[
  term ((18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 449 for generator 9. -/
def ep_Q2_002_partial_09_0449 : Poly :=
[
  term ((-18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((37885590799338631515467325875424 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 9. -/
theorem ep_Q2_002_partial_09_0449_valid :
    mulPoly ep_Q2_002_coefficient_09_0449
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0450 : Poly :=
[
  term ((87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (15, 2)]
]

/-- Partial product 450 for generator 9. -/
def ep_Q2_002_partial_09_0450 : Poly :=
[
  term ((-87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (15, 2)],
  term ((175879254853121922291254489547540296224716 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 9. -/
theorem ep_Q2_002_partial_09_0450_valid :
    mulPoly ep_Q2_002_coefficient_09_0450
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0451 : Poly :=
[
  term ((220140210347 : Rat) / 44407903470) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 451 for generator 9. -/
def ep_Q2_002_partial_09_0451 : Poly :=
[
  term ((-220140210347 : Rat) / 44407903470) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((220140210347 : Rat) / 22203951735) [(2, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 9. -/
theorem ep_Q2_002_partial_09_0451_valid :
    mulPoly ep_Q2_002_coefficient_09_0451
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0452 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 452 for generator 9. -/
def ep_Q2_002_partial_09_0452 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 9. -/
theorem ep_Q2_002_partial_09_0452_valid :
    mulPoly ep_Q2_002_coefficient_09_0452
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0453 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 453 for generator 9. -/
def ep_Q2_002_partial_09_0453 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 9. -/
theorem ep_Q2_002_partial_09_0453_valid :
    mulPoly ep_Q2_002_coefficient_09_0453
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0454 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 454 for generator 9. -/
def ep_Q2_002_partial_09_0454 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 9. -/
theorem ep_Q2_002_partial_09_0454_valid :
    mulPoly ep_Q2_002_coefficient_09_0454
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0455 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 9. -/
def ep_Q2_002_partial_09_0455 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 9. -/
theorem ep_Q2_002_partial_09_0455_valid :
    mulPoly ep_Q2_002_coefficient_09_0455
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0456 : Poly :=
[
  term ((188483291916828633902048342006088 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 456 for generator 9. -/
def ep_Q2_002_partial_09_0456 : Poly :=
[
  term ((-188483291916828633902048342006088 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((376966583833657267804096684012176 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 9. -/
theorem ep_Q2_002_partial_09_0456_valid :
    mulPoly ep_Q2_002_coefficient_09_0456
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0457 : Poly :=
[
  term ((-354949336285028624679741558264096 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 457 for generator 9. -/
def ep_Q2_002_partial_09_0457 : Poly :=
[
  term ((354949336285028624679741558264096 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-709898672570057249359483116528192 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 9. -/
theorem ep_Q2_002_partial_09_0457_valid :
    mulPoly ep_Q2_002_coefficient_09_0457
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0458 : Poly :=
[
  term ((-3220418955820213549204864556198538929586156 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (15, 2)]
]

/-- Partial product 458 for generator 9. -/
def ep_Q2_002_partial_09_0458 : Poly :=
[
  term ((3220418955820213549204864556198538929586156 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-6440837911640427098409729112397077859172312 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 9. -/
theorem ep_Q2_002_partial_09_0458_valid :
    mulPoly ep_Q2_002_coefficient_09_0458
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0459 : Poly :=
[
  term ((-621943304939 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 459 for generator 9. -/
def ep_Q2_002_partial_09_0459 : Poly :=
[
  term ((621943304939 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1243886609878 : Rat) / 22203951735) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 9. -/
theorem ep_Q2_002_partial_09_0459_valid :
    mulPoly ep_Q2_002_coefficient_09_0459
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0460 : Poly :=
[
  term ((-112510911297545564265543261697776 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1)]
]

/-- Partial product 460 for generator 9. -/
def ep_Q2_002_partial_09_0460 : Poly :=
[
  term ((112510911297545564265543261697776 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1)],
  term ((-225021822595091128531086523395552 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 9. -/
theorem ep_Q2_002_partial_09_0460_valid :
    mulPoly ep_Q2_002_coefficient_09_0460
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0461 : Poly :=
[
  term ((211879116094331598938731248403392 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1)]
]

/-- Partial product 461 for generator 9. -/
def ep_Q2_002_partial_09_0461 : Poly :=
[
  term ((-211879116094331598938731248403392 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((423758232188663197877462496806784 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 9. -/
theorem ep_Q2_002_partial_09_0461_valid :
    mulPoly ep_Q2_002_coefficient_09_0461
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0462 : Poly :=
[
  term ((-6544647032869533293107394619778384806965448 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (15, 1)]
]

/-- Partial product 462 for generator 9. -/
def ep_Q2_002_partial_09_0462 : Poly :=
[
  term ((6544647032869533293107394619778384806965448 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((-13089294065739066586214789239556769613930896 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 9. -/
theorem ep_Q2_002_partial_09_0462_valid :
    mulPoly ep_Q2_002_coefficient_09_0462
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0463 : Poly :=
[
  term ((-102724072574 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 9. -/
def ep_Q2_002_partial_09_0463 : Poly :=
[
  term ((102724072574 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-205448145148 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 9. -/
theorem ep_Q2_002_partial_09_0463_valid :
    mulPoly ep_Q2_002_coefficient_09_0463
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0464 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1)]
]

/-- Partial product 464 for generator 9. -/
def ep_Q2_002_partial_09_0464 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 9. -/
theorem ep_Q2_002_partial_09_0464_valid :
    mulPoly ep_Q2_002_coefficient_09_0464
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0465 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 465 for generator 9. -/
def ep_Q2_002_partial_09_0465 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 9. -/
theorem ep_Q2_002_partial_09_0465_valid :
    mulPoly ep_Q2_002_coefficient_09_0465
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0466 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 466 for generator 9. -/
def ep_Q2_002_partial_09_0466 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 9. -/
theorem ep_Q2_002_partial_09_0466_valid :
    mulPoly ep_Q2_002_coefficient_09_0466
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0467 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 467 for generator 9. -/
def ep_Q2_002_partial_09_0467 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 9. -/
theorem ep_Q2_002_partial_09_0467_valid :
    mulPoly ep_Q2_002_coefficient_09_0467
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0468 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 468 for generator 9. -/
def ep_Q2_002_partial_09_0468 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 9. -/
theorem ep_Q2_002_partial_09_0468_valid :
    mulPoly ep_Q2_002_coefficient_09_0468
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0469 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 469 for generator 9. -/
def ep_Q2_002_partial_09_0469 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 9. -/
theorem ep_Q2_002_partial_09_0469_valid :
    mulPoly ep_Q2_002_coefficient_09_0469
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0470 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (15, 2)]
]

/-- Partial product 470 for generator 9. -/
def ep_Q2_002_partial_09_0470 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 9. -/
theorem ep_Q2_002_partial_09_0470_valid :
    mulPoly ep_Q2_002_coefficient_09_0470
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0471 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 471 for generator 9. -/
def ep_Q2_002_partial_09_0471 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 9. -/
theorem ep_Q2_002_partial_09_0471_valid :
    mulPoly ep_Q2_002_coefficient_09_0471
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0472 : Poly :=
[
  term ((25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 472 for generator 9. -/
def ep_Q2_002_partial_09_0472 : Poly :=
[
  term ((-25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1)],
  term ((50231284607103739475446562361084 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 9. -/
theorem ep_Q2_002_partial_09_0472_valid :
    mulPoly ep_Q2_002_coefficient_09_0472
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0473 : Poly :=
[
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 473 for generator 9. -/
def ep_Q2_002_partial_09_0473 : Poly :=
[
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 9. -/
theorem ep_Q2_002_partial_09_0473_valid :
    mulPoly ep_Q2_002_coefficient_09_0473
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0474 : Poly :=
[
  term ((14300253825730561294765166711592 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 474 for generator 9. -/
def ep_Q2_002_partial_09_0474 : Poly :=
[
  term ((-14300253825730561294765166711592 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((28600507651461122589530333423184 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 9. -/
theorem ep_Q2_002_partial_09_0474_valid :
    mulPoly ep_Q2_002_coefficient_09_0474
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0475 : Poly :=
[
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 475 for generator 9. -/
def ep_Q2_002_partial_09_0475 : Poly :=
[
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 9. -/
theorem ep_Q2_002_partial_09_0475_valid :
    mulPoly ep_Q2_002_coefficient_09_0475
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0476 : Poly :=
[
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 476 for generator 9. -/
def ep_Q2_002_partial_09_0476 : Poly :=
[
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 9. -/
theorem ep_Q2_002_partial_09_0476_valid :
    mulPoly ep_Q2_002_coefficient_09_0476
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0477 : Poly :=
[
  term ((-39643219857 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 9. -/
def ep_Q2_002_partial_09_0477 : Poly :=
[
  term ((39643219857 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-79286439714 : Rat) / 7401317245) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 9. -/
theorem ep_Q2_002_partial_09_0477_valid :
    mulPoly ep_Q2_002_coefficient_09_0477
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0478 : Poly :=
[
  term ((-47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 478 for generator 9. -/
def ep_Q2_002_partial_09_0478 : Poly :=
[
  term ((47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1)],
  term ((-94594915818339142505629623391728 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 9. -/
theorem ep_Q2_002_partial_09_0478_valid :
    mulPoly ep_Q2_002_coefficient_09_0478
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0479 : Poly :=
[
  term ((-26930055988147287201625935202464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 479 for generator 9. -/
def ep_Q2_002_partial_09_0479 : Poly :=
[
  term ((26930055988147287201625935202464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-53860111976294574403251870404928 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 9. -/
theorem ep_Q2_002_partial_09_0479_valid :
    mulPoly ep_Q2_002_coefficient_09_0479
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0480 : Poly :=
[
  term ((-366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 480 for generator 9. -/
def ep_Q2_002_partial_09_0480 : Poly :=
[
  term ((366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 1)],
  term ((-733289072438507339304006111283254458050638 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 9. -/
theorem ep_Q2_002_partial_09_0480_valid :
    mulPoly ep_Q2_002_coefficient_09_0480
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0481 : Poly :=
[
  term ((-313631849579 : Rat) / 88815806940) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 9. -/
def ep_Q2_002_partial_09_0481 : Poly :=
[
  term ((313631849579 : Rat) / 88815806940) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-313631849579 : Rat) / 44407903470) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 9. -/
theorem ep_Q2_002_partial_09_0481_valid :
    mulPoly ep_Q2_002_coefficient_09_0481
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0482 : Poly :=
[
  term ((2805089674211140817842663874118414909025356 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 3)]
]

/-- Partial product 482 for generator 9. -/
def ep_Q2_002_partial_09_0482 : Poly :=
[
  term ((-2805089674211140817842663874118414909025356 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 3)],
  term ((5610179348422281635685327748236829818050712 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 9. -/
theorem ep_Q2_002_partial_09_0482_valid :
    mulPoly ep_Q2_002_coefficient_09_0482
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0483 : Poly :=
[
  term ((197389596199 : Rat) / 22203951735) [(2, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 483 for generator 9. -/
def ep_Q2_002_partial_09_0483 : Poly :=
[
  term ((-197389596199 : Rat) / 22203951735) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((394779192398 : Rat) / 22203951735) [(2, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 9. -/
theorem ep_Q2_002_partial_09_0483_valid :
    mulPoly ep_Q2_002_coefficient_09_0483
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0484 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1)]
]

/-- Partial product 484 for generator 9. -/
def ep_Q2_002_partial_09_0484 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 9. -/
theorem ep_Q2_002_partial_09_0484_valid :
    mulPoly ep_Q2_002_coefficient_09_0484
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0485 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1)]
]

/-- Partial product 485 for generator 9. -/
def ep_Q2_002_partial_09_0485 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 9. -/
theorem ep_Q2_002_partial_09_0485_valid :
    mulPoly ep_Q2_002_coefficient_09_0485
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0486 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (15, 1)]
]

/-- Partial product 486 for generator 9. -/
def ep_Q2_002_partial_09_0486 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 9. -/
theorem ep_Q2_002_partial_09_0486_valid :
    mulPoly ep_Q2_002_coefficient_09_0486
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0487 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 487 for generator 9. -/
def ep_Q2_002_partial_09_0487 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 2), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 9. -/
theorem ep_Q2_002_partial_09_0487_valid :
    mulPoly ep_Q2_002_coefficient_09_0487
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0488 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (15, 1)]
]

/-- Partial product 488 for generator 9. -/
def ep_Q2_002_partial_09_0488 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 9. -/
theorem ep_Q2_002_partial_09_0488_valid :
    mulPoly ep_Q2_002_coefficient_09_0488
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0489 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (15, 1)]
]

/-- Partial product 489 for generator 9. -/
def ep_Q2_002_partial_09_0489 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 9. -/
theorem ep_Q2_002_partial_09_0489_valid :
    mulPoly ep_Q2_002_coefficient_09_0489
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0490 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (15, 2)]
]

/-- Partial product 490 for generator 9. -/
def ep_Q2_002_partial_09_0490 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 9. -/
theorem ep_Q2_002_partial_09_0490_valid :
    mulPoly ep_Q2_002_coefficient_09_0490
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0491 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

/-- Partial product 491 for generator 9. -/
def ep_Q2_002_partial_09_0491 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 2), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 9. -/
theorem ep_Q2_002_partial_09_0491_valid :
    mulPoly ep_Q2_002_coefficient_09_0491
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0492 : Poly :=
[
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 492 for generator 9. -/
def ep_Q2_002_partial_09_0492 : Poly :=
[
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 9. -/
theorem ep_Q2_002_partial_09_0492_valid :
    mulPoly ep_Q2_002_coefficient_09_0492
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0493 : Poly :=
[
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 493 for generator 9. -/
def ep_Q2_002_partial_09_0493 : Poly :=
[
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 9. -/
theorem ep_Q2_002_partial_09_0493_valid :
    mulPoly ep_Q2_002_coefficient_09_0493
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0494 : Poly :=
[
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (15, 2)]
]

/-- Partial product 494 for generator 9. -/
def ep_Q2_002_partial_09_0494 : Poly :=
[
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (15, 2)],
  term ((-519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 9. -/
theorem ep_Q2_002_partial_09_0494_valid :
    mulPoly ep_Q2_002_coefficient_09_0494
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0495 : Poly :=
[
  term ((-1505925468 : Rat) / 7401317245) [(2, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 495 for generator 9. -/
def ep_Q2_002_partial_09_0495 : Poly :=
[
  term ((1505925468 : Rat) / 7401317245) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3011850936 : Rat) / 7401317245) [(2, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 9. -/
theorem ep_Q2_002_partial_09_0495_valid :
    mulPoly ep_Q2_002_coefficient_09_0495
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0496 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 496 for generator 9. -/
def ep_Q2_002_partial_09_0496 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 9. -/
theorem ep_Q2_002_partial_09_0496_valid :
    mulPoly ep_Q2_002_coefficient_09_0496
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0497 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 497 for generator 9. -/
def ep_Q2_002_partial_09_0497 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 9. -/
theorem ep_Q2_002_partial_09_0497_valid :
    mulPoly ep_Q2_002_coefficient_09_0497
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0498 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 498 for generator 9. -/
def ep_Q2_002_partial_09_0498 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 9. -/
theorem ep_Q2_002_partial_09_0498_valid :
    mulPoly ep_Q2_002_coefficient_09_0498
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0499 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 9. -/
def ep_Q2_002_partial_09_0499 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((10542029528 : Rat) / 7401317245) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 9. -/
theorem ep_Q2_002_partial_09_0499_valid :
    mulPoly ep_Q2_002_coefficient_09_0499
        ep_Q2_002_generator_09_0400_0499 =
      ep_Q2_002_partial_09_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0400_0499 : List Poly :=
[
  ep_Q2_002_partial_09_0400,
  ep_Q2_002_partial_09_0401,
  ep_Q2_002_partial_09_0402,
  ep_Q2_002_partial_09_0403,
  ep_Q2_002_partial_09_0404,
  ep_Q2_002_partial_09_0405,
  ep_Q2_002_partial_09_0406,
  ep_Q2_002_partial_09_0407,
  ep_Q2_002_partial_09_0408,
  ep_Q2_002_partial_09_0409,
  ep_Q2_002_partial_09_0410,
  ep_Q2_002_partial_09_0411,
  ep_Q2_002_partial_09_0412,
  ep_Q2_002_partial_09_0413,
  ep_Q2_002_partial_09_0414,
  ep_Q2_002_partial_09_0415,
  ep_Q2_002_partial_09_0416,
  ep_Q2_002_partial_09_0417,
  ep_Q2_002_partial_09_0418,
  ep_Q2_002_partial_09_0419,
  ep_Q2_002_partial_09_0420,
  ep_Q2_002_partial_09_0421,
  ep_Q2_002_partial_09_0422,
  ep_Q2_002_partial_09_0423,
  ep_Q2_002_partial_09_0424,
  ep_Q2_002_partial_09_0425,
  ep_Q2_002_partial_09_0426,
  ep_Q2_002_partial_09_0427,
  ep_Q2_002_partial_09_0428,
  ep_Q2_002_partial_09_0429,
  ep_Q2_002_partial_09_0430,
  ep_Q2_002_partial_09_0431,
  ep_Q2_002_partial_09_0432,
  ep_Q2_002_partial_09_0433,
  ep_Q2_002_partial_09_0434,
  ep_Q2_002_partial_09_0435,
  ep_Q2_002_partial_09_0436,
  ep_Q2_002_partial_09_0437,
  ep_Q2_002_partial_09_0438,
  ep_Q2_002_partial_09_0439,
  ep_Q2_002_partial_09_0440,
  ep_Q2_002_partial_09_0441,
  ep_Q2_002_partial_09_0442,
  ep_Q2_002_partial_09_0443,
  ep_Q2_002_partial_09_0444,
  ep_Q2_002_partial_09_0445,
  ep_Q2_002_partial_09_0446,
  ep_Q2_002_partial_09_0447,
  ep_Q2_002_partial_09_0448,
  ep_Q2_002_partial_09_0449,
  ep_Q2_002_partial_09_0450,
  ep_Q2_002_partial_09_0451,
  ep_Q2_002_partial_09_0452,
  ep_Q2_002_partial_09_0453,
  ep_Q2_002_partial_09_0454,
  ep_Q2_002_partial_09_0455,
  ep_Q2_002_partial_09_0456,
  ep_Q2_002_partial_09_0457,
  ep_Q2_002_partial_09_0458,
  ep_Q2_002_partial_09_0459,
  ep_Q2_002_partial_09_0460,
  ep_Q2_002_partial_09_0461,
  ep_Q2_002_partial_09_0462,
  ep_Q2_002_partial_09_0463,
  ep_Q2_002_partial_09_0464,
  ep_Q2_002_partial_09_0465,
  ep_Q2_002_partial_09_0466,
  ep_Q2_002_partial_09_0467,
  ep_Q2_002_partial_09_0468,
  ep_Q2_002_partial_09_0469,
  ep_Q2_002_partial_09_0470,
  ep_Q2_002_partial_09_0471,
  ep_Q2_002_partial_09_0472,
  ep_Q2_002_partial_09_0473,
  ep_Q2_002_partial_09_0474,
  ep_Q2_002_partial_09_0475,
  ep_Q2_002_partial_09_0476,
  ep_Q2_002_partial_09_0477,
  ep_Q2_002_partial_09_0478,
  ep_Q2_002_partial_09_0479,
  ep_Q2_002_partial_09_0480,
  ep_Q2_002_partial_09_0481,
  ep_Q2_002_partial_09_0482,
  ep_Q2_002_partial_09_0483,
  ep_Q2_002_partial_09_0484,
  ep_Q2_002_partial_09_0485,
  ep_Q2_002_partial_09_0486,
  ep_Q2_002_partial_09_0487,
  ep_Q2_002_partial_09_0488,
  ep_Q2_002_partial_09_0489,
  ep_Q2_002_partial_09_0490,
  ep_Q2_002_partial_09_0491,
  ep_Q2_002_partial_09_0492,
  ep_Q2_002_partial_09_0493,
  ep_Q2_002_partial_09_0494,
  ep_Q2_002_partial_09_0495,
  ep_Q2_002_partial_09_0496,
  ep_Q2_002_partial_09_0497,
  ep_Q2_002_partial_09_0498,
  ep_Q2_002_partial_09_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0400_0499 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (7, 1)],
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-74696685746861028649313452800 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (4, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1)],
  term ((-27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((5141063361520391544909643414656 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (14, 1)],
  term ((9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (15, 2)],
  term ((27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (7, 1), (14, 1)],
  term ((-9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((257835449470943537516290299840 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (6, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (7, 1), (11, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((3009331729434974481943945848960 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (14, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (7, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (15, 1)],
  term ((9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (7, 1), (15, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (7, 2)],
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (15, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (7, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((37348342873430514324656726400 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((-2570531680760195772454821707328 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1)],
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (15, 2)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (14, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 1)],
  term ((-128917724735471768758145149920 : Rat) / 115799135485108289802725034287) [(1, 2), (6, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (14, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (15, 1)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)],
  term ((-1504665864717487240971972924480 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)],
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((38126575709 : Rat) / 6343986210) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-38126575709 : Rat) / 6343986210) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (15, 2)],
  term ((-220140210347 : Rat) / 44407903470) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-188483291916828633902048342006088 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((354949336285028624679741558264096 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((3220418955820213549204864556198538929586156 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((621943304939 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((112510911297545564265543261697776 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1)],
  term ((-211879116094331598938731248403392 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((6544647032869533293107394619778384806965448 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((102724072574 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1)],
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-14300253825730561294765166711592 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((39643219857 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1)],
  term ((26930055988147287201625935202464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 1)],
  term ((313631849579 : Rat) / 88815806940) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2805089674211140817842663874118414909025356 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 3)],
  term ((-197389596199 : Rat) / 22203951735) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (15, 2)],
  term ((1505925468 : Rat) / 7401317245) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((-1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-38126575709 : Rat) / 3171993105) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((38126575709 : Rat) / 3171993105) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20117803134414401579895665468472 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (12, 1), (15, 2)],
  term ((-150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((37885590799338631515467325875424 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((175879254853121922291254489547540296224716 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (4, 1), (15, 2)],
  term ((220140210347 : Rat) / 22203951735) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((376966583833657267804096684012176 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-709898672570057249359483116528192 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-6440837911640427098409729112397077859172312 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-1243886609878 : Rat) / 22203951735) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-225021822595091128531086523395552 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 2), (11, 1)],
  term ((423758232188663197877462496806784 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 2), (13, 1)],
  term ((-13089294065739066586214789239556769613930896 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 2), (15, 1)],
  term ((-205448145148 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((50231284607103739475446562361084 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1)],
  term ((11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((28600507651461122589530333423184 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((-21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-79286439714 : Rat) / 7401317245) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-94594915818339142505629623391728 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1)],
  term ((-53860111976294574403251870404928 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (15, 2)],
  term ((-733289072438507339304006111283254458050638 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 1)],
  term ((-313631849579 : Rat) / 44407903470) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((5610179348422281635685327748236829818050712 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 3)],
  term ((394779192398 : Rat) / 22203951735) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 2), (7, 1), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 2), (7, 1), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 2), (7, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 2), (11, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 2), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 2), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (15, 2)],
  term ((-3011850936 : Rat) / 7401317245) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 400 through 499. -/
theorem ep_Q2_002_block_09_0400_0499_valid :
    checkProductSumEq ep_Q2_002_partials_09_0400_0499
      ep_Q2_002_block_09_0400_0499 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
