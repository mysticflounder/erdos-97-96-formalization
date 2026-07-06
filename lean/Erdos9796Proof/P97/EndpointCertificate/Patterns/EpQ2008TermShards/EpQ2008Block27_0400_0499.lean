/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0400 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 400 for generator 27. -/
def ep_Q2_008_partial_27_0400 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 27. -/
theorem ep_Q2_008_partial_27_0400_valid :
    mulPoly ep_Q2_008_coefficient_27_0400
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0401 : Poly :=
[
  term ((393485585446447867870113539161872000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 27. -/
def ep_Q2_008_partial_27_0401 : Poly :=
[
  term ((786971170892895735740227078323744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-393485585446447867870113539161872000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 27. -/
theorem ep_Q2_008_partial_27_0401_valid :
    mulPoly ep_Q2_008_coefficient_27_0401
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0402 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 402 for generator 27. -/
def ep_Q2_008_partial_27_0402 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 27. -/
theorem ep_Q2_008_partial_27_0402_valid :
    mulPoly ep_Q2_008_coefficient_27_0402
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0403 : Poly :=
[
  term ((-152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 403 for generator 27. -/
def ep_Q2_008_partial_27_0403 : Poly :=
[
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 27. -/
theorem ep_Q2_008_partial_27_0403_valid :
    mulPoly ep_Q2_008_coefficient_27_0403
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0404 : Poly :=
[
  term ((-355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 27. -/
def ep_Q2_008_partial_27_0404 : Poly :=
[
  term ((-710757950493876271878702392832499200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 27. -/
theorem ep_Q2_008_partial_27_0404_valid :
    mulPoly ep_Q2_008_coefficient_27_0404
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0405 : Poly :=
[
  term ((-223436267859446481536441343005731200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 405 for generator 27. -/
def ep_Q2_008_partial_27_0405 : Poly :=
[
  term ((-446872535718892963072882686011462400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((223436267859446481536441343005731200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 27. -/
theorem ep_Q2_008_partial_27_0405_valid :
    mulPoly ep_Q2_008_coefficient_27_0405
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0406 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 406 for generator 27. -/
def ep_Q2_008_partial_27_0406 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 27. -/
theorem ep_Q2_008_partial_27_0406_valid :
    mulPoly ep_Q2_008_coefficient_27_0406
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0407 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 407 for generator 27. -/
def ep_Q2_008_partial_27_0407 : Poly :=
[
  term ((-187532765152567200 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 27. -/
theorem ep_Q2_008_partial_27_0407_valid :
    mulPoly ep_Q2_008_coefficient_27_0407
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0408 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 27. -/
def ep_Q2_008_partial_27_0408 : Poly :=
[
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 27. -/
theorem ep_Q2_008_partial_27_0408_valid :
    mulPoly ep_Q2_008_coefficient_27_0408
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0409 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 27. -/
def ep_Q2_008_partial_27_0409 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 27. -/
theorem ep_Q2_008_partial_27_0409_valid :
    mulPoly ep_Q2_008_coefficient_27_0409
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0410 : Poly :=
[
  term ((2122382747400993000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 27. -/
def ep_Q2_008_partial_27_0410 : Poly :=
[
  term ((4244765494801986000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2122382747400993000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 27. -/
theorem ep_Q2_008_partial_27_0410_valid :
    mulPoly ep_Q2_008_coefficient_27_0410
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0411 : Poly :=
[
  term ((-1736494975146267000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 411 for generator 27. -/
def ep_Q2_008_partial_27_0411 : Poly :=
[
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1736494975146267000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 27. -/
theorem ep_Q2_008_partial_27_0411_valid :
    mulPoly ep_Q2_008_coefficient_27_0411
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0412 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 412 for generator 27. -/
def ep_Q2_008_partial_27_0412 : Poly :=
[
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 27. -/
theorem ep_Q2_008_partial_27_0412_valid :
    mulPoly ep_Q2_008_coefficient_27_0412
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0413 : Poly :=
[
  term ((3858877722547260000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 413 for generator 27. -/
def ep_Q2_008_partial_27_0413 : Poly :=
[
  term ((7717755445094520000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 27. -/
theorem ep_Q2_008_partial_27_0413_valid :
    mulPoly ep_Q2_008_coefficient_27_0413
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0414 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 414 for generator 27. -/
def ep_Q2_008_partial_27_0414 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 27. -/
theorem ep_Q2_008_partial_27_0414_valid :
    mulPoly ep_Q2_008_coefficient_27_0414
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0415 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 415 for generator 27. -/
def ep_Q2_008_partial_27_0415 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 27. -/
theorem ep_Q2_008_partial_27_0415_valid :
    mulPoly ep_Q2_008_coefficient_27_0415
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0416 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 416 for generator 27. -/
def ep_Q2_008_partial_27_0416 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 27. -/
theorem ep_Q2_008_partial_27_0416_valid :
    mulPoly ep_Q2_008_coefficient_27_0416
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0417 : Poly :=
[
  term ((2382276856869612000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 417 for generator 27. -/
def ep_Q2_008_partial_27_0417 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 27. -/
theorem ep_Q2_008_partial_27_0417_valid :
    mulPoly ep_Q2_008_coefficient_27_0417
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0418 : Poly :=
[
  term ((-1159843021887522672928412996800312817265600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 418 for generator 27. -/
def ep_Q2_008_partial_27_0418 : Poly :=
[
  term ((-2319686043775045345856825993600625634531200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1159843021887522672928412996800312817265600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 27. -/
theorem ep_Q2_008_partial_27_0418_valid :
    mulPoly ep_Q2_008_coefficient_27_0418
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0419 : Poly :=
[
  term ((54982867156914358125 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 419 for generator 27. -/
def ep_Q2_008_partial_27_0419 : Poly :=
[
  term ((54982867156914358125 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-54982867156914358125 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 27. -/
theorem ep_Q2_008_partial_27_0419_valid :
    mulPoly ep_Q2_008_coefficient_27_0419
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0420 : Poly :=
[
  term ((-419562910314193326658991037422064889117200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 27. -/
def ep_Q2_008_partial_27_0420 : Poly :=
[
  term ((-839125820628386653317982074844129778234400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((419562910314193326658991037422064889117200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 27. -/
theorem ep_Q2_008_partial_27_0420_valid :
    mulPoly ep_Q2_008_coefficient_27_0420
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0421 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 421 for generator 27. -/
def ep_Q2_008_partial_27_0421 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 27. -/
theorem ep_Q2_008_partial_27_0421_valid :
    mulPoly ep_Q2_008_coefficient_27_0421
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0422 : Poly :=
[
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 422 for generator 27. -/
def ep_Q2_008_partial_27_0422 : Poly :=
[
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 27. -/
theorem ep_Q2_008_partial_27_0422_valid :
    mulPoly ep_Q2_008_coefficient_27_0422
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0423 : Poly :=
[
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 423 for generator 27. -/
def ep_Q2_008_partial_27_0423 : Poly :=
[
  term ((-16675937998087284000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((8337968999043642000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 27. -/
theorem ep_Q2_008_partial_27_0423_valid :
    mulPoly ep_Q2_008_coefficient_27_0423
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0424 : Poly :=
[
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 27. -/
def ep_Q2_008_partial_27_0424 : Poly :=
[
  term ((-1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 27. -/
theorem ep_Q2_008_partial_27_0424_valid :
    mulPoly ep_Q2_008_coefficient_27_0424
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0425 : Poly :=
[
  term ((112731648181801625282765093024934145568625 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 425 for generator 27. -/
def ep_Q2_008_partial_27_0425 : Poly :=
[
  term ((112731648181801625282765093024934145568625 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112731648181801625282765093024934145568625 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 27. -/
theorem ep_Q2_008_partial_27_0425_valid :
    mulPoly ep_Q2_008_coefficient_27_0425
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0426 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 426 for generator 27. -/
def ep_Q2_008_partial_27_0426 : Poly :=
[
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 27. -/
theorem ep_Q2_008_partial_27_0426_valid :
    mulPoly ep_Q2_008_coefficient_27_0426
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0427 : Poly :=
[
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 27. -/
def ep_Q2_008_partial_27_0427 : Poly :=
[
  term ((-28774067239140492845006392159786527129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 27. -/
theorem ep_Q2_008_partial_27_0427_valid :
    mulPoly ep_Q2_008_coefficient_27_0427
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0428 : Poly :=
[
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 428 for generator 27. -/
def ep_Q2_008_partial_27_0428 : Poly :=
[
  term ((14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 27. -/
theorem ep_Q2_008_partial_27_0428_valid :
    mulPoly ep_Q2_008_coefficient_27_0428
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0429 : Poly :=
[
  term ((18356352709764979298020110423086006991680247 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 27. -/
def ep_Q2_008_partial_27_0429 : Poly :=
[
  term ((18356352709764979298020110423086006991680247 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18356352709764979298020110423086006991680247 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 27. -/
theorem ep_Q2_008_partial_27_0429_valid :
    mulPoly ep_Q2_008_coefficient_27_0429
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0430 : Poly :=
[
  term ((-4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 430 for generator 27. -/
def ep_Q2_008_partial_27_0430 : Poly :=
[
  term ((-9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 27. -/
theorem ep_Q2_008_partial_27_0430_valid :
    mulPoly ep_Q2_008_coefficient_27_0430
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0431 : Poly :=
[
  term ((-18427696466331058066184720511833271100800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 431 for generator 27. -/
def ep_Q2_008_partial_27_0431 : Poly :=
[
  term ((-36855392932662116132369441023666542201600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((18427696466331058066184720511833271100800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 27. -/
theorem ep_Q2_008_partial_27_0431_valid :
    mulPoly ep_Q2_008_coefficient_27_0431
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0432 : Poly :=
[
  term ((-15566498222321469819 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 2), (16, 1)]
]

/-- Partial product 432 for generator 27. -/
def ep_Q2_008_partial_27_0432 : Poly :=
[
  term ((-15566498222321469819 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((15566498222321469819 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 27. -/
theorem ep_Q2_008_partial_27_0432_valid :
    mulPoly ep_Q2_008_coefficient_27_0432
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0433 : Poly :=
[
  term ((-15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 27. -/
def ep_Q2_008_partial_27_0433 : Poly :=
[
  term ((-31935456362629892452450810936264943961600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 27. -/
theorem ep_Q2_008_partial_27_0433_valid :
    mulPoly ep_Q2_008_coefficient_27_0433
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0434 : Poly :=
[
  term ((2132832442297447694011137645559206128441541 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 434 for generator 27. -/
def ep_Q2_008_partial_27_0434 : Poly :=
[
  term ((2132832442297447694011137645559206128441541 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2132832442297447694011137645559206128441541 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 27. -/
theorem ep_Q2_008_partial_27_0434_valid :
    mulPoly ep_Q2_008_coefficient_27_0434
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0435 : Poly :=
[
  term ((-7268994436113062091 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 435 for generator 27. -/
def ep_Q2_008_partial_27_0435 : Poly :=
[
  term ((-7268994436113062091 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((7268994436113062091 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 27. -/
theorem ep_Q2_008_partial_27_0435_valid :
    mulPoly ep_Q2_008_coefficient_27_0435
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0436 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 27. -/
def ep_Q2_008_partial_27_0436 : Poly :=
[
  term ((139222372092821066577478733701459200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 27. -/
theorem ep_Q2_008_partial_27_0436_valid :
    mulPoly ep_Q2_008_coefficient_27_0436
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0437 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (15, 2), (16, 1)]
]

/-- Partial product 437 for generator 27. -/
def ep_Q2_008_partial_27_0437 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (14, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 27. -/
theorem ep_Q2_008_partial_27_0437_valid :
    mulPoly ep_Q2_008_coefficient_27_0437
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0438 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 27. -/
def ep_Q2_008_partial_27_0438 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 27. -/
theorem ep_Q2_008_partial_27_0438_valid :
    mulPoly ep_Q2_008_coefficient_27_0438
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0439 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 439 for generator 27. -/
def ep_Q2_008_partial_27_0439 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 27. -/
theorem ep_Q2_008_partial_27_0439_valid :
    mulPoly ep_Q2_008_coefficient_27_0439
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0440 : Poly :=
[
  term ((44905351817864232769849070562806400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 27. -/
def ep_Q2_008_partial_27_0440 : Poly :=
[
  term ((89810703635728465539698141125612800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44905351817864232769849070562806400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 27. -/
theorem ep_Q2_008_partial_27_0440_valid :
    mulPoly ep_Q2_008_coefficient_27_0440
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0441 : Poly :=
[
  term ((-451786477680673938926876063542694400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 441 for generator 27. -/
def ep_Q2_008_partial_27_0441 : Poly :=
[
  term ((-903572955361347877853752127085388800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((451786477680673938926876063542694400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 27. -/
theorem ep_Q2_008_partial_27_0441_valid :
    mulPoly ep_Q2_008_coefficient_27_0441
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0442 : Poly :=
[
  term ((107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 442 for generator 27. -/
def ep_Q2_008_partial_27_0442 : Poly :=
[
  term ((215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 27. -/
theorem ep_Q2_008_partial_27_0442_valid :
    mulPoly ep_Q2_008_coefficient_27_0442
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0443 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 27. -/
def ep_Q2_008_partial_27_0443 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 27. -/
theorem ep_Q2_008_partial_27_0443_valid :
    mulPoly ep_Q2_008_coefficient_27_0443
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0444 : Poly :=
[
  term ((51722604861417223586467965213156000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 444 for generator 27. -/
def ep_Q2_008_partial_27_0444 : Poly :=
[
  term ((103445209722834447172935930426312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51722604861417223586467965213156000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 27. -/
theorem ep_Q2_008_partial_27_0444_valid :
    mulPoly ep_Q2_008_coefficient_27_0444
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0445 : Poly :=
[
  term ((5014213127946281709 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 445 for generator 27. -/
def ep_Q2_008_partial_27_0445 : Poly :=
[
  term ((5014213127946281709 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 27. -/
theorem ep_Q2_008_partial_27_0445_valid :
    mulPoly ep_Q2_008_coefficient_27_0445
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0446 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 446 for generator 27. -/
def ep_Q2_008_partial_27_0446 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 27. -/
theorem ep_Q2_008_partial_27_0446_valid :
    mulPoly ep_Q2_008_coefficient_27_0446
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0447 : Poly :=
[
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 27. -/
def ep_Q2_008_partial_27_0447 : Poly :=
[
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 27. -/
theorem ep_Q2_008_partial_27_0447_valid :
    mulPoly ep_Q2_008_coefficient_27_0447
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0448 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 448 for generator 27. -/
def ep_Q2_008_partial_27_0448 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 27. -/
theorem ep_Q2_008_partial_27_0448_valid :
    mulPoly ep_Q2_008_coefficient_27_0448
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0449 : Poly :=
[
  term ((-96769695974371875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 449 for generator 27. -/
def ep_Q2_008_partial_27_0449 : Poly :=
[
  term ((-193539391948743750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((96769695974371875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 27. -/
theorem ep_Q2_008_partial_27_0449_valid :
    mulPoly ep_Q2_008_coefficient_27_0449
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0450 : Poly :=
[
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 450 for generator 27. -/
def ep_Q2_008_partial_27_0450 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 27. -/
theorem ep_Q2_008_partial_27_0450_valid :
    mulPoly ep_Q2_008_coefficient_27_0450
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0451 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 27. -/
def ep_Q2_008_partial_27_0451 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 27. -/
theorem ep_Q2_008_partial_27_0451_valid :
    mulPoly ep_Q2_008_coefficient_27_0451
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0452 : Poly :=
[
  term ((80148355842805908269 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 452 for generator 27. -/
def ep_Q2_008_partial_27_0452 : Poly :=
[
  term ((80148355842805908269 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-80148355842805908269 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 27. -/
theorem ep_Q2_008_partial_27_0452_valid :
    mulPoly ep_Q2_008_coefficient_27_0452
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0453 : Poly :=
[
  term ((-9171633373354442207297872677735614119733898 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 27. -/
def ep_Q2_008_partial_27_0453 : Poly :=
[
  term ((-18343266746708884414595745355471228239467796 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9171633373354442207297872677735614119733898 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 27. -/
theorem ep_Q2_008_partial_27_0453_valid :
    mulPoly ep_Q2_008_coefficient_27_0453
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0454 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 3), (16, 1)]
]

/-- Partial product 454 for generator 27. -/
def ep_Q2_008_partial_27_0454 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 3), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 27. -/
theorem ep_Q2_008_partial_27_0454_valid :
    mulPoly ep_Q2_008_coefficient_27_0454
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0455 : Poly :=
[
  term ((-5275884283439533856747683113413053311235805 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 27. -/
def ep_Q2_008_partial_27_0455 : Poly :=
[
  term ((-5275884283439533856747683113413053311235805 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((5275884283439533856747683113413053311235805 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 27. -/
theorem ep_Q2_008_partial_27_0455_valid :
    mulPoly ep_Q2_008_coefficient_27_0455
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0456 : Poly :=
[
  term ((184101571353417750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 456 for generator 27. -/
def ep_Q2_008_partial_27_0456 : Poly :=
[
  term ((368203142706835500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-184101571353417750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 27. -/
theorem ep_Q2_008_partial_27_0456_valid :
    mulPoly ep_Q2_008_coefficient_27_0456
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0457 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 27. -/
def ep_Q2_008_partial_27_0457 : Poly :=
[
  term ((-1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 27. -/
theorem ep_Q2_008_partial_27_0457_valid :
    mulPoly ep_Q2_008_coefficient_27_0457
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0458 : Poly :=
[
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 27. -/
def ep_Q2_008_partial_27_0458 : Poly :=
[
  term ((-117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 27. -/
theorem ep_Q2_008_partial_27_0458_valid :
    mulPoly ep_Q2_008_coefficient_27_0458
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0459 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 459 for generator 27. -/
def ep_Q2_008_partial_27_0459 : Poly :=
[
  term ((333483259973220000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 27. -/
theorem ep_Q2_008_partial_27_0459_valid :
    mulPoly ep_Q2_008_coefficient_27_0459
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0460 : Poly :=
[
  term ((-2598076843751232120278021201443490400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 27. -/
def ep_Q2_008_partial_27_0460 : Poly :=
[
  term ((-5196153687502464240556042402886980800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2598076843751232120278021201443490400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 27. -/
theorem ep_Q2_008_partial_27_0460_valid :
    mulPoly ep_Q2_008_coefficient_27_0460
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0461 : Poly :=
[
  term ((-354975089606243809156831192783545600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 461 for generator 27. -/
def ep_Q2_008_partial_27_0461 : Poly :=
[
  term ((-709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((354975089606243809156831192783545600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 27. -/
theorem ep_Q2_008_partial_27_0461_valid :
    mulPoly ep_Q2_008_coefficient_27_0461
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0462 : Poly :=
[
  term ((-91585862847001948137 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 462 for generator 27. -/
def ep_Q2_008_partial_27_0462 : Poly :=
[
  term ((-91585862847001948137 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((91585862847001948137 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 27. -/
theorem ep_Q2_008_partial_27_0462_valid :
    mulPoly ep_Q2_008_coefficient_27_0462
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0463 : Poly :=
[
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 27. -/
def ep_Q2_008_partial_27_0463 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 27. -/
theorem ep_Q2_008_partial_27_0463_valid :
    mulPoly ep_Q2_008_coefficient_27_0463
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0464 : Poly :=
[
  term ((27332960733988565007041245843243200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 464 for generator 27. -/
def ep_Q2_008_partial_27_0464 : Poly :=
[
  term ((54665921467977130014082491686486400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27332960733988565007041245843243200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 27. -/
theorem ep_Q2_008_partial_27_0464_valid :
    mulPoly ep_Q2_008_coefficient_27_0464
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0465 : Poly :=
[
  term ((86478700168221514065 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 465 for generator 27. -/
def ep_Q2_008_partial_27_0465 : Poly :=
[
  term ((86478700168221514065 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-86478700168221514065 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 27. -/
theorem ep_Q2_008_partial_27_0465_valid :
    mulPoly ep_Q2_008_coefficient_27_0465
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0466 : Poly :=
[
  term ((8453214950894534171532795940230097345739953 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 27. -/
def ep_Q2_008_partial_27_0466 : Poly :=
[
  term ((8453214950894534171532795940230097345739953 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8453214950894534171532795940230097345739953 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 27. -/
theorem ep_Q2_008_partial_27_0466_valid :
    mulPoly ep_Q2_008_coefficient_27_0466
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0467 : Poly :=
[
  term ((-2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 467 for generator 27. -/
def ep_Q2_008_partial_27_0467 : Poly :=
[
  term ((-4073980994828984444386525976297491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 27. -/
theorem ep_Q2_008_partial_27_0467_valid :
    mulPoly ep_Q2_008_coefficient_27_0467
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0468 : Poly :=
[
  term ((-26205908907996947848496633425200944166745080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 468 for generator 27. -/
def ep_Q2_008_partial_27_0468 : Poly :=
[
  term ((-52411817815993895696993266850401888333490160 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((26205908907996947848496633425200944166745080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 27. -/
theorem ep_Q2_008_partial_27_0468_valid :
    mulPoly ep_Q2_008_coefficient_27_0468
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0469 : Poly :=
[
  term ((-1105435311678405078387 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 469 for generator 27. -/
def ep_Q2_008_partial_27_0469 : Poly :=
[
  term ((-1105435311678405078387 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1105435311678405078387 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 27. -/
theorem ep_Q2_008_partial_27_0469_valid :
    mulPoly ep_Q2_008_coefficient_27_0469
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0470 : Poly :=
[
  term ((32145988502728390861698812800147166400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 470 for generator 27. -/
def ep_Q2_008_partial_27_0470 : Poly :=
[
  term ((64291977005456781723397625600294332800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-32145988502728390861698812800147166400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 27. -/
theorem ep_Q2_008_partial_27_0470_valid :
    mulPoly ep_Q2_008_coefficient_27_0470
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0471 : Poly :=
[
  term ((-4253712633580717119599745219299775248352457 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 471 for generator 27. -/
def ep_Q2_008_partial_27_0471 : Poly :=
[
  term ((-4253712633580717119599745219299775248352457 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((4253712633580717119599745219299775248352457 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 27. -/
theorem ep_Q2_008_partial_27_0471_valid :
    mulPoly ep_Q2_008_coefficient_27_0471
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0472 : Poly :=
[
  term ((-114964261396351643425 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 472 for generator 27. -/
def ep_Q2_008_partial_27_0472 : Poly :=
[
  term ((-114964261396351643425 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((114964261396351643425 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 27. -/
theorem ep_Q2_008_partial_27_0472_valid :
    mulPoly ep_Q2_008_coefficient_27_0472
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0473 : Poly :=
[
  term ((-890608226295059988134860010475590400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 27. -/
def ep_Q2_008_partial_27_0473 : Poly :=
[
  term ((-1781216452590119976269720020951180800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((890608226295059988134860010475590400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 27. -/
theorem ep_Q2_008_partial_27_0473_valid :
    mulPoly ep_Q2_008_coefficient_27_0473
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0474 : Poly :=
[
  term ((-21749241751389497238702195621110400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 474 for generator 27. -/
def ep_Q2_008_partial_27_0474 : Poly :=
[
  term ((-43498483502778994477404391242220800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21749241751389497238702195621110400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 27. -/
theorem ep_Q2_008_partial_27_0474_valid :
    mulPoly ep_Q2_008_coefficient_27_0474
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0475 : Poly :=
[
  term ((-462960647073216979909929497380838400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 27. -/
def ep_Q2_008_partial_27_0475 : Poly :=
[
  term ((-925921294146433959819858994761676800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((462960647073216979909929497380838400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 27. -/
theorem ep_Q2_008_partial_27_0475_valid :
    mulPoly ep_Q2_008_coefficient_27_0475
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0476 : Poly :=
[
  term ((26206038323975572874407968550785628307285880 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 476 for generator 27. -/
def ep_Q2_008_partial_27_0476 : Poly :=
[
  term ((52412076647951145748815937101571256614571760 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26206038323975572874407968550785628307285880 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 27. -/
theorem ep_Q2_008_partial_27_0476_valid :
    mulPoly ep_Q2_008_coefficient_27_0476
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0477 : Poly :=
[
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 477 for generator 27. -/
def ep_Q2_008_partial_27_0477 : Poly :=
[
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 27. -/
theorem ep_Q2_008_partial_27_0477_valid :
    mulPoly ep_Q2_008_coefficient_27_0477
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0478 : Poly :=
[
  term ((610379372653711546652602918111538368108749 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 27. -/
def ep_Q2_008_partial_27_0478 : Poly :=
[
  term ((610379372653711546652602918111538368108749 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-610379372653711546652602918111538368108749 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 27. -/
theorem ep_Q2_008_partial_27_0478_valid :
    mulPoly ep_Q2_008_coefficient_27_0478
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0479 : Poly :=
[
  term ((338469629756535654644513710993708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 479 for generator 27. -/
def ep_Q2_008_partial_27_0479 : Poly :=
[
  term ((676939259513071309289027421987417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-338469629756535654644513710993708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 27. -/
theorem ep_Q2_008_partial_27_0479_valid :
    mulPoly ep_Q2_008_coefficient_27_0479
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0480 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 480 for generator 27. -/
def ep_Q2_008_partial_27_0480 : Poly :=
[
  term ((2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 27. -/
theorem ep_Q2_008_partial_27_0480_valid :
    mulPoly ep_Q2_008_coefficient_27_0480
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0481 : Poly :=
[
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)]
]

/-- Partial product 481 for generator 27. -/
def ep_Q2_008_partial_27_0481 : Poly :=
[
  term ((45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (14, 1), (15, 2), (16, 1)],
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 27. -/
theorem ep_Q2_008_partial_27_0481_valid :
    mulPoly ep_Q2_008_coefficient_27_0481
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0482 : Poly :=
[
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 482 for generator 27. -/
def ep_Q2_008_partial_27_0482 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 27. -/
theorem ep_Q2_008_partial_27_0482_valid :
    mulPoly ep_Q2_008_coefficient_27_0482
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0483 : Poly :=
[
  term ((7428339615903475500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 483 for generator 27. -/
def ep_Q2_008_partial_27_0483 : Poly :=
[
  term ((14856679231806951000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7428339615903475500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 27. -/
theorem ep_Q2_008_partial_27_0483_valid :
    mulPoly ep_Q2_008_coefficient_27_0483
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0484 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 27. -/
def ep_Q2_008_partial_27_0484 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 27. -/
theorem ep_Q2_008_partial_27_0484_valid :
    mulPoly ep_Q2_008_coefficient_27_0484
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0485 : Poly :=
[
  term ((-5932971136629482153706491359246494292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 485 for generator 27. -/
def ep_Q2_008_partial_27_0485 : Poly :=
[
  term ((-11865942273258964307412982718492988585600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5932971136629482153706491359246494292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 27. -/
theorem ep_Q2_008_partial_27_0485_valid :
    mulPoly ep_Q2_008_coefficient_27_0485
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0486 : Poly :=
[
  term ((-17867076426522090000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 486 for generator 27. -/
def ep_Q2_008_partial_27_0486 : Poly :=
[
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((17867076426522090000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 27. -/
theorem ep_Q2_008_partial_27_0486_valid :
    mulPoly ep_Q2_008_coefficient_27_0486
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0487 : Poly :=
[
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 487 for generator 27. -/
def ep_Q2_008_partial_27_0487 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 27. -/
theorem ep_Q2_008_partial_27_0487_valid :
    mulPoly ep_Q2_008_coefficient_27_0487
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0488 : Poly :=
[
  term ((-5527302246299986875 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 488 for generator 27. -/
def ep_Q2_008_partial_27_0488 : Poly :=
[
  term ((-5527302246299986875 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5527302246299986875 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 27. -/
theorem ep_Q2_008_partial_27_0488_valid :
    mulPoly ep_Q2_008_coefficient_27_0488
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0489 : Poly :=
[
  term ((4527005300448308809975813357028703843900 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 489 for generator 27. -/
def ep_Q2_008_partial_27_0489 : Poly :=
[
  term ((9054010600896617619951626714057407687800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4527005300448308809975813357028703843900 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 27. -/
theorem ep_Q2_008_partial_27_0489_valid :
    mulPoly ep_Q2_008_coefficient_27_0489
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0490 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 490 for generator 27. -/
def ep_Q2_008_partial_27_0490 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 27. -/
theorem ep_Q2_008_partial_27_0490_valid :
    mulPoly ep_Q2_008_coefficient_27_0490
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0491 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 491 for generator 27. -/
def ep_Q2_008_partial_27_0491 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 27. -/
theorem ep_Q2_008_partial_27_0491_valid :
    mulPoly ep_Q2_008_coefficient_27_0491
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0492 : Poly :=
[
  term ((20844922497609105000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 492 for generator 27. -/
def ep_Q2_008_partial_27_0492 : Poly :=
[
  term ((41689844995218210000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-20844922497609105000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 27. -/
theorem ep_Q2_008_partial_27_0492_valid :
    mulPoly ep_Q2_008_coefficient_27_0492
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0493 : Poly :=
[
  term ((1725642981633458718407474569776623904000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 493 for generator 27. -/
def ep_Q2_008_partial_27_0493 : Poly :=
[
  term ((3451285963266917436814949139553247808000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1725642981633458718407474569776623904000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 27. -/
theorem ep_Q2_008_partial_27_0493_valid :
    mulPoly ep_Q2_008_coefficient_27_0493
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0494 : Poly :=
[
  term ((-515700953587329750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 494 for generator 27. -/
def ep_Q2_008_partial_27_0494 : Poly :=
[
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 27. -/
theorem ep_Q2_008_partial_27_0494_valid :
    mulPoly ep_Q2_008_coefficient_27_0494
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0495 : Poly :=
[
  term ((8486988219088779375 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 495 for generator 27. -/
def ep_Q2_008_partial_27_0495 : Poly :=
[
  term ((8486988219088779375 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8486988219088779375 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 27. -/
theorem ep_Q2_008_partial_27_0495_valid :
    mulPoly ep_Q2_008_coefficient_27_0495
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0496 : Poly :=
[
  term ((869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 496 for generator 27. -/
def ep_Q2_008_partial_27_0496 : Poly :=
[
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 27. -/
theorem ep_Q2_008_partial_27_0496_valid :
    mulPoly ep_Q2_008_coefficient_27_0496
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0497 : Poly :=
[
  term ((-450006642365431115403 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 497 for generator 27. -/
def ep_Q2_008_partial_27_0497 : Poly :=
[
  term ((-450006642365431115403 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((450006642365431115403 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 27. -/
theorem ep_Q2_008_partial_27_0497_valid :
    mulPoly ep_Q2_008_coefficient_27_0497
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0498 : Poly :=
[
  term ((-7232369532398296408916297087348611288101777 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 27. -/
def ep_Q2_008_partial_27_0498 : Poly :=
[
  term ((-14464739064796592817832594174697222576203554 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7232369532398296408916297087348611288101777 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 27. -/
theorem ep_Q2_008_partial_27_0498_valid :
    mulPoly ep_Q2_008_coefficient_27_0498
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0499 : Poly :=
[
  term ((15641669549084907901144872072348775286649679 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 27. -/
def ep_Q2_008_partial_27_0499 : Poly :=
[
  term ((15641669549084907901144872072348775286649679 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15641669549084907901144872072348775286649679 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 27. -/
theorem ep_Q2_008_partial_27_0499_valid :
    mulPoly ep_Q2_008_coefficient_27_0499
        ep_Q2_008_generator_27_0400_0499 =
      ep_Q2_008_partial_27_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0400_0499 : List Poly :=
[
  ep_Q2_008_partial_27_0400,
  ep_Q2_008_partial_27_0401,
  ep_Q2_008_partial_27_0402,
  ep_Q2_008_partial_27_0403,
  ep_Q2_008_partial_27_0404,
  ep_Q2_008_partial_27_0405,
  ep_Q2_008_partial_27_0406,
  ep_Q2_008_partial_27_0407,
  ep_Q2_008_partial_27_0408,
  ep_Q2_008_partial_27_0409,
  ep_Q2_008_partial_27_0410,
  ep_Q2_008_partial_27_0411,
  ep_Q2_008_partial_27_0412,
  ep_Q2_008_partial_27_0413,
  ep_Q2_008_partial_27_0414,
  ep_Q2_008_partial_27_0415,
  ep_Q2_008_partial_27_0416,
  ep_Q2_008_partial_27_0417,
  ep_Q2_008_partial_27_0418,
  ep_Q2_008_partial_27_0419,
  ep_Q2_008_partial_27_0420,
  ep_Q2_008_partial_27_0421,
  ep_Q2_008_partial_27_0422,
  ep_Q2_008_partial_27_0423,
  ep_Q2_008_partial_27_0424,
  ep_Q2_008_partial_27_0425,
  ep_Q2_008_partial_27_0426,
  ep_Q2_008_partial_27_0427,
  ep_Q2_008_partial_27_0428,
  ep_Q2_008_partial_27_0429,
  ep_Q2_008_partial_27_0430,
  ep_Q2_008_partial_27_0431,
  ep_Q2_008_partial_27_0432,
  ep_Q2_008_partial_27_0433,
  ep_Q2_008_partial_27_0434,
  ep_Q2_008_partial_27_0435,
  ep_Q2_008_partial_27_0436,
  ep_Q2_008_partial_27_0437,
  ep_Q2_008_partial_27_0438,
  ep_Q2_008_partial_27_0439,
  ep_Q2_008_partial_27_0440,
  ep_Q2_008_partial_27_0441,
  ep_Q2_008_partial_27_0442,
  ep_Q2_008_partial_27_0443,
  ep_Q2_008_partial_27_0444,
  ep_Q2_008_partial_27_0445,
  ep_Q2_008_partial_27_0446,
  ep_Q2_008_partial_27_0447,
  ep_Q2_008_partial_27_0448,
  ep_Q2_008_partial_27_0449,
  ep_Q2_008_partial_27_0450,
  ep_Q2_008_partial_27_0451,
  ep_Q2_008_partial_27_0452,
  ep_Q2_008_partial_27_0453,
  ep_Q2_008_partial_27_0454,
  ep_Q2_008_partial_27_0455,
  ep_Q2_008_partial_27_0456,
  ep_Q2_008_partial_27_0457,
  ep_Q2_008_partial_27_0458,
  ep_Q2_008_partial_27_0459,
  ep_Q2_008_partial_27_0460,
  ep_Q2_008_partial_27_0461,
  ep_Q2_008_partial_27_0462,
  ep_Q2_008_partial_27_0463,
  ep_Q2_008_partial_27_0464,
  ep_Q2_008_partial_27_0465,
  ep_Q2_008_partial_27_0466,
  ep_Q2_008_partial_27_0467,
  ep_Q2_008_partial_27_0468,
  ep_Q2_008_partial_27_0469,
  ep_Q2_008_partial_27_0470,
  ep_Q2_008_partial_27_0471,
  ep_Q2_008_partial_27_0472,
  ep_Q2_008_partial_27_0473,
  ep_Q2_008_partial_27_0474,
  ep_Q2_008_partial_27_0475,
  ep_Q2_008_partial_27_0476,
  ep_Q2_008_partial_27_0477,
  ep_Q2_008_partial_27_0478,
  ep_Q2_008_partial_27_0479,
  ep_Q2_008_partial_27_0480,
  ep_Q2_008_partial_27_0481,
  ep_Q2_008_partial_27_0482,
  ep_Q2_008_partial_27_0483,
  ep_Q2_008_partial_27_0484,
  ep_Q2_008_partial_27_0485,
  ep_Q2_008_partial_27_0486,
  ep_Q2_008_partial_27_0487,
  ep_Q2_008_partial_27_0488,
  ep_Q2_008_partial_27_0489,
  ep_Q2_008_partial_27_0490,
  ep_Q2_008_partial_27_0491,
  ep_Q2_008_partial_27_0492,
  ep_Q2_008_partial_27_0493,
  ep_Q2_008_partial_27_0494,
  ep_Q2_008_partial_27_0495,
  ep_Q2_008_partial_27_0496,
  ep_Q2_008_partial_27_0497,
  ep_Q2_008_partial_27_0498,
  ep_Q2_008_partial_27_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0400_0499 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((786971170892895735740227078323744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-393485585446447867870113539161872000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-710757950493876271878702392832499200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-446872535718892963072882686011462400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((223436267859446481536441343005731200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-187532765152567200 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4244765494801986000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2122382747400993000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1736494975146267000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2319686043775045345856825993600625634531200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((54982867156914358125 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1159843021887522672928412996800312817265600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54982867156914358125 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-839125820628386653317982074844129778234400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((419562910314193326658991037422064889117200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-16675937998087284000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((8337968999043642000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((112731648181801625282765093024934145568625 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-112731648181801625282765093024934145568625 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-28774067239140492845006392159786527129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((18356352709764979298020110423086006991680247 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-18356352709764979298020110423086006991680247 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-36855392932662116132369441023666542201600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-15566498222321469819 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((18427696466331058066184720511833271100800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((15566498222321469819 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-31935456362629892452450810936264943961600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((2132832442297447694011137645559206128441541 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7268994436113062091 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-2132832442297447694011137645559206128441541 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((7268994436113062091 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (16, 1)],
  term ((139222372092821066577478733701459200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (14, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((89810703635728465539698141125612800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44905351817864232769849070562806400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-903572955361347877853752127085388800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((451786477680673938926876063542694400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((103445209722834447172935930426312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-51722604861417223586467965213156000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-193539391948743750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((96769695974371875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((80148355842805908269 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-80148355842805908269 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-18343266746708884414595745355471228239467796 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9171633373354442207297872677735614119733898 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 3), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-5275884283439533856747683113413053311235805 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((5275884283439533856747683113413053311235805 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((368203142706835500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-184101571353417750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((333483259973220000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-5196153687502464240556042402886980800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2598076843751232120278021201443490400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-91585862847001948137 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((354975089606243809156831192783545600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((91585862847001948137 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((54665921467977130014082491686486400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((86478700168221514065 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-27332960733988565007041245843243200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-86478700168221514065 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((8453214950894534171532795940230097345739953 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4073980994828984444386525976297491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8453214950894534171532795940230097345739953 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-52411817815993895696993266850401888333490160 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1105435311678405078387 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((26205908907996947848496633425200944166745080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1105435311678405078387 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((64291977005456781723397625600294332800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-32145988502728390861698812800147166400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4253712633580717119599745219299775248352457 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-114964261396351643425 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((4253712633580717119599745219299775248352457 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((114964261396351643425 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-1781216452590119976269720020951180800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((890608226295059988134860010475590400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43498483502778994477404391242220800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21749241751389497238702195621110400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-925921294146433959819858994761676800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((462960647073216979909929497380838400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((52412076647951145748815937101571256614571760 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-26206038323975572874407968550785628307285880 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((610379372653711546652602918111538368108749 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((676939259513071309289027421987417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-610379372653711546652602918111538368108749 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-338469629756535654644513710993708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (14, 1), (15, 2), (16, 1)],
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((14856679231806951000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7428339615903475500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11865942273258964307412982718492988585600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5932971136629482153706491359246494292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((17867076426522090000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5527302246299986875 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5527302246299986875 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((9054010600896617619951626714057407687800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4527005300448308809975813357028703843900 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((41689844995218210000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-20844922497609105000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((3451285963266917436814949139553247808000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1725642981633458718407474569776623904000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((8486988219088779375 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8486988219088779375 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-450006642365431115403 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((450006642365431115403 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14464739064796592817832594174697222576203554 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7232369532398296408916297087348611288101777 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((15641669549084907901144872072348775286649679 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15641669549084907901144872072348775286649679 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 400 through 499. -/
theorem ep_Q2_008_block_27_0400_0499_valid :
    checkProductSumEq ep_Q2_008_partials_27_0400_0499
      ep_Q2_008_block_27_0400_0499 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
