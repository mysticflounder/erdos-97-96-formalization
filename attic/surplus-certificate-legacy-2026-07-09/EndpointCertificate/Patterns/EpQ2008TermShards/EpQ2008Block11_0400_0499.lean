/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0400_0499 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0400 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 400 for generator 11. -/
def ep_Q2_008_partial_11_0400 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 11. -/
theorem ep_Q2_008_partial_11_0400_valid :
    mulPoly ep_Q2_008_coefficient_11_0400
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0401 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 401 for generator 11. -/
def ep_Q2_008_partial_11_0401 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 11. -/
theorem ep_Q2_008_partial_11_0401_valid :
    mulPoly ep_Q2_008_coefficient_11_0401
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0402 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 11. -/
def ep_Q2_008_partial_11_0402 : Poly :=
[
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 11. -/
theorem ep_Q2_008_partial_11_0402_valid :
    mulPoly ep_Q2_008_coefficient_11_0402
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0403 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 11. -/
def ep_Q2_008_partial_11_0403 : Poly :=
[
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 11. -/
theorem ep_Q2_008_partial_11_0403_valid :
    mulPoly ep_Q2_008_coefficient_11_0403
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0404 : Poly :=
[
  term ((-459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 404 for generator 11. -/
def ep_Q2_008_partial_11_0404 : Poly :=
[
  term ((-919594861613583750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-919594861613583750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 11. -/
theorem ep_Q2_008_partial_11_0404_valid :
    mulPoly ep_Q2_008_coefficient_11_0404
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0405 : Poly :=
[
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 11. -/
def ep_Q2_008_partial_11_0405 : Poly :=
[
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 11. -/
theorem ep_Q2_008_partial_11_0405_valid :
    mulPoly ep_Q2_008_coefficient_11_0405
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0406 : Poly :=
[
  term ((9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 406 for generator 11. -/
def ep_Q2_008_partial_11_0406 : Poly :=
[
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 11. -/
theorem ep_Q2_008_partial_11_0406_valid :
    mulPoly ep_Q2_008_coefficient_11_0406
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0407 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 407 for generator 11. -/
def ep_Q2_008_partial_11_0407 : Poly :=
[
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 11. -/
theorem ep_Q2_008_partial_11_0407_valid :
    mulPoly ep_Q2_008_coefficient_11_0407
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0408 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 408 for generator 11. -/
def ep_Q2_008_partial_11_0408 : Poly :=
[
  term ((2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 11. -/
theorem ep_Q2_008_partial_11_0408_valid :
    mulPoly ep_Q2_008_coefficient_11_0408
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0409 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 11. -/
def ep_Q2_008_partial_11_0409 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 11. -/
theorem ep_Q2_008_partial_11_0409_valid :
    mulPoly ep_Q2_008_coefficient_11_0409
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0410 : Poly :=
[
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 11. -/
def ep_Q2_008_partial_11_0410 : Poly :=
[
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 11. -/
theorem ep_Q2_008_partial_11_0410_valid :
    mulPoly ep_Q2_008_coefficient_11_0410
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0411 : Poly :=
[
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 411 for generator 11. -/
def ep_Q2_008_partial_11_0411 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 11. -/
theorem ep_Q2_008_partial_11_0411_valid :
    mulPoly ep_Q2_008_coefficient_11_0411
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0412 : Poly :=
[
  term ((257857552084779900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 412 for generator 11. -/
def ep_Q2_008_partial_11_0412 : Poly :=
[
  term ((515715104169559800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((515715104169559800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-257857552084779900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-257857552084779900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 11. -/
theorem ep_Q2_008_partial_11_0412_valid :
    mulPoly ep_Q2_008_coefficient_11_0412
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0413 : Poly :=
[
  term ((-143318977708644055783839514594144204800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 11. -/
def ep_Q2_008_partial_11_0413 : Poly :=
[
  term ((-286637955417288111567679029188288409600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-286637955417288111567679029188288409600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((143318977708644055783839514594144204800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((143318977708644055783839514594144204800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 11. -/
theorem ep_Q2_008_partial_11_0413_valid :
    mulPoly ep_Q2_008_coefficient_11_0413
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0414 : Poly :=
[
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 11. -/
def ep_Q2_008_partial_11_0414 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 11. -/
theorem ep_Q2_008_partial_11_0414_valid :
    mulPoly ep_Q2_008_coefficient_11_0414
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0415 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 415 for generator 11. -/
def ep_Q2_008_partial_11_0415 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 11. -/
theorem ep_Q2_008_partial_11_0415_valid :
    mulPoly ep_Q2_008_coefficient_11_0415
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0416 : Poly :=
[
  term ((-5273929183251142934690284671949320692529600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 416 for generator 11. -/
def ep_Q2_008_partial_11_0416 : Poly :=
[
  term ((-10547858366502285869380569343898641385059200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10547858366502285869380569343898641385059200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((5273929183251142934690284671949320692529600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5273929183251142934690284671949320692529600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 11. -/
theorem ep_Q2_008_partial_11_0416_valid :
    mulPoly ep_Q2_008_coefficient_11_0416
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0417 : Poly :=
[
  term ((964719430636815000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 417 for generator 11. -/
def ep_Q2_008_partial_11_0417 : Poly :=
[
  term ((1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-964719430636815000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-964719430636815000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 11. -/
theorem ep_Q2_008_partial_11_0417_valid :
    mulPoly ep_Q2_008_coefficient_11_0417
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0418 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 418 for generator 11. -/
def ep_Q2_008_partial_11_0418 : Poly :=
[
  term ((10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 11. -/
theorem ep_Q2_008_partial_11_0418_valid :
    mulPoly ep_Q2_008_coefficient_11_0418
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0419 : Poly :=
[
  term ((-53823965879724314733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 419 for generator 11. -/
def ep_Q2_008_partial_11_0419 : Poly :=
[
  term ((-53823965879724314733 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-53823965879724314733 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((53823965879724314733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((53823965879724314733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 11. -/
theorem ep_Q2_008_partial_11_0419_valid :
    mulPoly ep_Q2_008_coefficient_11_0419
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0420 : Poly :=
[
  term ((-5491266417448698287065807398301451366400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 420 for generator 11. -/
def ep_Q2_008_partial_11_0420 : Poly :=
[
  term ((-10982532834897396574131614796602902732800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10982532834897396574131614796602902732800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((5491266417448698287065807398301451366400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((5491266417448698287065807398301451366400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 11. -/
theorem ep_Q2_008_partial_11_0420_valid :
    mulPoly ep_Q2_008_coefficient_11_0420
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0421 : Poly :=
[
  term ((4725737463994330500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 421 for generator 11. -/
def ep_Q2_008_partial_11_0421 : Poly :=
[
  term ((9451474927988661000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9451474927988661000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4725737463994330500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4725737463994330500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 11. -/
theorem ep_Q2_008_partial_11_0421_valid :
    mulPoly ep_Q2_008_coefficient_11_0421
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0422 : Poly :=
[
  term ((12472862327133078067973625488926602585600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 11. -/
def ep_Q2_008_partial_11_0422 : Poly :=
[
  term ((24945724654266156135947250977853205171200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((24945724654266156135947250977853205171200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12472862327133078067973625488926602585600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-12472862327133078067973625488926602585600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 11. -/
theorem ep_Q2_008_partial_11_0422_valid :
    mulPoly ep_Q2_008_coefficient_11_0422
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0423 : Poly :=
[
  term ((-311643782175015046902504762724710149682750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 11. -/
def ep_Q2_008_partial_11_0423 : Poly :=
[
  term ((-623287564350030093805009525449420299365500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-623287564350030093805009525449420299365500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((311643782175015046902504762724710149682750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((311643782175015046902504762724710149682750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 11. -/
theorem ep_Q2_008_partial_11_0423_valid :
    mulPoly ep_Q2_008_coefficient_11_0423
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0424 : Poly :=
[
  term ((37197392547067654350380485014533681571600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 424 for generator 11. -/
def ep_Q2_008_partial_11_0424 : Poly :=
[
  term ((74394785094135308700760970029067363143200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((74394785094135308700760970029067363143200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-37197392547067654350380485014533681571600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-37197392547067654350380485014533681571600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 11. -/
theorem ep_Q2_008_partial_11_0424_valid :
    mulPoly ep_Q2_008_coefficient_11_0424
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0425 : Poly :=
[
  term ((-1802453421524677875 : Rat) / 191160400997014168) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 425 for generator 11. -/
def ep_Q2_008_partial_11_0425 : Poly :=
[
  term ((-1802453421524677875 : Rat) / 95580200498507084) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1802453421524677875 : Rat) / 95580200498507084) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1802453421524677875 : Rat) / 191160400997014168) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1802453421524677875 : Rat) / 191160400997014168) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 11. -/
theorem ep_Q2_008_partial_11_0425_valid :
    mulPoly ep_Q2_008_coefficient_11_0425
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0426 : Poly :=
[
  term ((-13092098897146828578581303174825064639440100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 11. -/
def ep_Q2_008_partial_11_0426 : Poly :=
[
  term ((-26184197794293657157162606349650129278880200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26184197794293657157162606349650129278880200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((13092098897146828578581303174825064639440100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((13092098897146828578581303174825064639440100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 11. -/
theorem ep_Q2_008_partial_11_0426_valid :
    mulPoly ep_Q2_008_coefficient_11_0426
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0427 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 427 for generator 11. -/
def ep_Q2_008_partial_11_0427 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 11. -/
theorem ep_Q2_008_partial_11_0427_valid :
    mulPoly ep_Q2_008_coefficient_11_0427
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0428 : Poly :=
[
  term ((-8776127163735875767900870669149687283200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 428 for generator 11. -/
def ep_Q2_008_partial_11_0428 : Poly :=
[
  term ((-17552254327471751535801741338299374566400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-17552254327471751535801741338299374566400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((8776127163735875767900870669149687283200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((8776127163735875767900870669149687283200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 11. -/
theorem ep_Q2_008_partial_11_0428_valid :
    mulPoly ep_Q2_008_coefficient_11_0428
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0429 : Poly :=
[
  term ((3573415285304418000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 429 for generator 11. -/
def ep_Q2_008_partial_11_0429 : Poly :=
[
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3573415285304418000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-3573415285304418000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 11. -/
theorem ep_Q2_008_partial_11_0429_valid :
    mulPoly ep_Q2_008_coefficient_11_0429
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0430 : Poly :=
[
  term ((295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 11. -/
def ep_Q2_008_partial_11_0430 : Poly :=
[
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 11. -/
theorem ep_Q2_008_partial_11_0430_valid :
    mulPoly ep_Q2_008_coefficient_11_0430
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0431 : Poly :=
[
  term ((-218400235214519568209888537922870546073875 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 11. -/
def ep_Q2_008_partial_11_0431 : Poly :=
[
  term ((-218400235214519568209888537922870546073875 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-218400235214519568209888537922870546073875 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((218400235214519568209888537922870546073875 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((218400235214519568209888537922870546073875 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 11. -/
theorem ep_Q2_008_partial_11_0431_valid :
    mulPoly ep_Q2_008_coefficient_11_0431
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0432 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 432 for generator 11. -/
def ep_Q2_008_partial_11_0432 : Poly :=
[
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (15, 4), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 11. -/
theorem ep_Q2_008_partial_11_0432_valid :
    mulPoly ep_Q2_008_coefficient_11_0432
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0433 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 11. -/
def ep_Q2_008_partial_11_0433 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 11. -/
theorem ep_Q2_008_partial_11_0433_valid :
    mulPoly ep_Q2_008_coefficient_11_0433
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0434 : Poly :=
[
  term ((-420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 434 for generator 11. -/
def ep_Q2_008_partial_11_0434 : Poly :=
[
  term ((-840840044332819500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-840840044332819500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 11. -/
theorem ep_Q2_008_partial_11_0434_valid :
    mulPoly ep_Q2_008_coefficient_11_0434
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0435 : Poly :=
[
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 11. -/
def ep_Q2_008_partial_11_0435 : Poly :=
[
  term ((-245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 11. -/
theorem ep_Q2_008_partial_11_0435_valid :
    mulPoly ep_Q2_008_coefficient_11_0435
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0436 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 436 for generator 11. -/
def ep_Q2_008_partial_11_0436 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 11. -/
theorem ep_Q2_008_partial_11_0436_valid :
    mulPoly ep_Q2_008_coefficient_11_0436
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0437 : Poly :=
[
  term ((-10010798204189927733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 437 for generator 11. -/
def ep_Q2_008_partial_11_0437 : Poly :=
[
  term ((-10010798204189927733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-10010798204189927733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((10010798204189927733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((10010798204189927733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 11. -/
theorem ep_Q2_008_partial_11_0437_valid :
    mulPoly ep_Q2_008_coefficient_11_0437
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0438 : Poly :=
[
  term ((-8561775076077229441784764946496067419000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 11. -/
def ep_Q2_008_partial_11_0438 : Poly :=
[
  term ((-17123550152154458883569529892992134838000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17123550152154458883569529892992134838000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8561775076077229441784764946496067419000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8561775076077229441784764946496067419000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 11. -/
theorem ep_Q2_008_partial_11_0438_valid :
    mulPoly ep_Q2_008_coefficient_11_0438
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0439 : Poly :=
[
  term ((-7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 439 for generator 11. -/
def ep_Q2_008_partial_11_0439 : Poly :=
[
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 11. -/
theorem ep_Q2_008_partial_11_0439_valid :
    mulPoly ep_Q2_008_coefficient_11_0439
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0440 : Poly :=
[
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 440 for generator 11. -/
def ep_Q2_008_partial_11_0440 : Poly :=
[
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 11. -/
theorem ep_Q2_008_partial_11_0440_valid :
    mulPoly ep_Q2_008_coefficient_11_0440
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0441 : Poly :=
[
  term ((1313445131442849286044042030317132606848077 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 11. -/
def ep_Q2_008_partial_11_0441 : Poly :=
[
  term ((1313445131442849286044042030317132606848077 : Rat) / 23270014048459243500102183208135593751448) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1313445131442849286044042030317132606848077 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1313445131442849286044042030317132606848077 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1313445131442849286044042030317132606848077 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 11. -/
theorem ep_Q2_008_partial_11_0441_valid :
    mulPoly ep_Q2_008_coefficient_11_0441
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0442 : Poly :=
[
  term ((10399254727031812254693299434731271209600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 442 for generator 11. -/
def ep_Q2_008_partial_11_0442 : Poly :=
[
  term ((20798509454063624509386598869462542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((20798509454063624509386598869462542419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 4), (16, 1)],
  term ((-10399254727031812254693299434731271209600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-10399254727031812254693299434731271209600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 11. -/
theorem ep_Q2_008_partial_11_0442_valid :
    mulPoly ep_Q2_008_coefficient_11_0442
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0443 : Poly :=
[
  term ((-72678277842831482065584275752447140608400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 443 for generator 11. -/
def ep_Q2_008_partial_11_0443 : Poly :=
[
  term ((-145356555685662964131168551504894281216800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-145356555685662964131168551504894281216800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 3), (16, 1)],
  term ((72678277842831482065584275752447140608400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((72678277842831482065584275752447140608400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 11. -/
theorem ep_Q2_008_partial_11_0443_valid :
    mulPoly ep_Q2_008_coefficient_11_0443
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0444 : Poly :=
[
  term ((92256285232876781439 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 444 for generator 11. -/
def ep_Q2_008_partial_11_0444 : Poly :=
[
  term ((92256285232876781439 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((92256285232876781439 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-92256285232876781439 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((-92256285232876781439 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 11. -/
theorem ep_Q2_008_partial_11_0444_valid :
    mulPoly ep_Q2_008_coefficient_11_0444
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0445 : Poly :=
[
  term ((10234295854810220358487380104146562572800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 11. -/
def ep_Q2_008_partial_11_0445 : Poly :=
[
  term ((20468591709620440716974760208293125145600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((20468591709620440716974760208293125145600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((-10234295854810220358487380104146562572800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-10234295854810220358487380104146562572800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 11. -/
theorem ep_Q2_008_partial_11_0445_valid :
    mulPoly ep_Q2_008_coefficient_11_0445
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0446 : Poly :=
[
  term ((9489650387149072262805422251010992988906301 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 446 for generator 11. -/
def ep_Q2_008_partial_11_0446 : Poly :=
[
  term ((9489650387149072262805422251010992988906301 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((9489650387149072262805422251010992988906301 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-9489650387149072262805422251010992988906301 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9489650387149072262805422251010992988906301 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 11. -/
theorem ep_Q2_008_partial_11_0446_valid :
    mulPoly ep_Q2_008_coefficient_11_0446
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0447 : Poly :=
[
  term ((-148867984746297421175 : Rat) / 11087303257826821744) [(4, 1), (16, 1)]
]

/-- Partial product 447 for generator 11. -/
def ep_Q2_008_partial_11_0447 : Poly :=
[
  term ((-148867984746297421175 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-148867984746297421175 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((148867984746297421175 : Rat) / 11087303257826821744) [(4, 1), (14, 2), (16, 1)],
  term ((148867984746297421175 : Rat) / 11087303257826821744) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 11. -/
theorem ep_Q2_008_partial_11_0447_valid :
    mulPoly ep_Q2_008_coefficient_11_0447
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0448 : Poly :=
[
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 11. -/
def ep_Q2_008_partial_11_0448 : Poly :=
[
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 11. -/
theorem ep_Q2_008_partial_11_0448_valid :
    mulPoly ep_Q2_008_coefficient_11_0448
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0449 : Poly :=
[
  term ((3353071484987346606005902547120185980000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 11. -/
def ep_Q2_008_partial_11_0449 : Poly :=
[
  term ((6706142969974693212011805094240371960000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6706142969974693212011805094240371960000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3353071484987346606005902547120185980000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3353071484987346606005902547120185980000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 11. -/
theorem ep_Q2_008_partial_11_0449_valid :
    mulPoly ep_Q2_008_coefficient_11_0449
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0450 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (15, 2), (16, 1)]
]

/-- Partial product 450 for generator 11. -/
def ep_Q2_008_partial_11_0450 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (14, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 11. -/
theorem ep_Q2_008_partial_11_0450_valid :
    mulPoly ep_Q2_008_coefficient_11_0450
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0451 : Poly :=
[
  term ((55007273450363602635 : Rat) / 11087303257826821744) [(4, 2), (16, 1)]
]

/-- Partial product 451 for generator 11. -/
def ep_Q2_008_partial_11_0451 : Poly :=
[
  term ((55007273450363602635 : Rat) / 5543651628913410872) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((55007273450363602635 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-55007273450363602635 : Rat) / 11087303257826821744) [(4, 2), (14, 2), (16, 1)],
  term ((-55007273450363602635 : Rat) / 11087303257826821744) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 11. -/
theorem ep_Q2_008_partial_11_0451_valid :
    mulPoly ep_Q2_008_coefficient_11_0451
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0452 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 11. -/
def ep_Q2_008_partial_11_0452 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 11. -/
theorem ep_Q2_008_partial_11_0452_valid :
    mulPoly ep_Q2_008_coefficient_11_0452
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0453 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 11. -/
def ep_Q2_008_partial_11_0453 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 11. -/
theorem ep_Q2_008_partial_11_0453_valid :
    mulPoly ep_Q2_008_coefficient_11_0453
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0454 : Poly :=
[
  term ((-341000646438220102481639067091987200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 11. -/
def ep_Q2_008_partial_11_0454 : Poly :=
[
  term ((-682001292876440204963278134183974400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-682001292876440204963278134183974400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((341000646438220102481639067091987200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((341000646438220102481639067091987200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 11. -/
theorem ep_Q2_008_partial_11_0454_valid :
    mulPoly ep_Q2_008_coefficient_11_0454
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0455 : Poly :=
[
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 455 for generator 11. -/
def ep_Q2_008_partial_11_0455 : Poly :=
[
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 11. -/
theorem ep_Q2_008_partial_11_0455_valid :
    mulPoly ep_Q2_008_coefficient_11_0455
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0456 : Poly :=
[
  term ((279010932018985846811193842865801600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 11. -/
def ep_Q2_008_partial_11_0456 : Poly :=
[
  term ((558021864037971693622387685731603200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((558021864037971693622387685731603200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-279010932018985846811193842865801600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-279010932018985846811193842865801600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 11. -/
theorem ep_Q2_008_partial_11_0456_valid :
    mulPoly ep_Q2_008_coefficient_11_0456
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0457 : Poly :=
[
  term ((1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 457 for generator 11. -/
def ep_Q2_008_partial_11_0457 : Poly :=
[
  term ((2839800716849950473254649542268364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2839800716849950473254649542268364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 11. -/
theorem ep_Q2_008_partial_11_0457_valid :
    mulPoly ep_Q2_008_coefficient_11_0457
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0458 : Poly :=
[
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 458 for generator 11. -/
def ep_Q2_008_partial_11_0458 : Poly :=
[
  term ((-430558890340181118960 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-430558890340181118960 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 11. -/
theorem ep_Q2_008_partial_11_0458_valid :
    mulPoly ep_Q2_008_coefficient_11_0458
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0459 : Poly :=
[
  term ((-237291228192098116538471300955948000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 459 for generator 11. -/
def ep_Q2_008_partial_11_0459 : Poly :=
[
  term ((-474582456384196233076942601911896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-474582456384196233076942601911896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((237291228192098116538471300955948000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((237291228192098116538471300955948000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 11. -/
theorem ep_Q2_008_partial_11_0459_valid :
    mulPoly ep_Q2_008_coefficient_11_0459
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0460 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 460 for generator 11. -/
def ep_Q2_008_partial_11_0460 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5014213127946281709 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((5014213127946281709 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 11. -/
theorem ep_Q2_008_partial_11_0460_valid :
    mulPoly ep_Q2_008_coefficient_11_0460
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0461 : Poly :=
[
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 11. -/
def ep_Q2_008_partial_11_0461 : Poly :=
[
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 11. -/
theorem ep_Q2_008_partial_11_0461_valid :
    mulPoly ep_Q2_008_coefficient_11_0461
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0462 : Poly :=
[
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 11. -/
def ep_Q2_008_partial_11_0462 : Poly :=
[
  term ((-45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 11. -/
theorem ep_Q2_008_partial_11_0462_valid :
    mulPoly ep_Q2_008_coefficient_11_0462
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0463 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 11. -/
def ep_Q2_008_partial_11_0463 : Poly :=
[
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 11. -/
theorem ep_Q2_008_partial_11_0463_valid :
    mulPoly ep_Q2_008_coefficient_11_0463
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0464 : Poly :=
[
  term ((80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 464 for generator 11. -/
def ep_Q2_008_partial_11_0464 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 11. -/
theorem ep_Q2_008_partial_11_0464_valid :
    mulPoly ep_Q2_008_coefficient_11_0464
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0465 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 465 for generator 11. -/
def ep_Q2_008_partial_11_0465 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 11. -/
theorem ep_Q2_008_partial_11_0465_valid :
    mulPoly ep_Q2_008_coefficient_11_0465
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0466 : Poly :=
[
  term ((-26381371073182535157 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 466 for generator 11. -/
def ep_Q2_008_partial_11_0466 : Poly :=
[
  term ((-26381371073182535157 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-26381371073182535157 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((26381371073182535157 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((26381371073182535157 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 11. -/
theorem ep_Q2_008_partial_11_0466_valid :
    mulPoly ep_Q2_008_coefficient_11_0466
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0467 : Poly :=
[
  term ((-191293933598795210433 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 467 for generator 11. -/
def ep_Q2_008_partial_11_0467 : Poly :=
[
  term ((-191293933598795210433 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-191293933598795210433 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((191293933598795210433 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((191293933598795210433 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 11. -/
theorem ep_Q2_008_partial_11_0467_valid :
    mulPoly ep_Q2_008_coefficient_11_0467
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0468 : Poly :=
[
  term ((-3377125905818110428637843741097968976883963 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 11. -/
def ep_Q2_008_partial_11_0468 : Poly :=
[
  term ((-3377125905818110428637843741097968976883963 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3377125905818110428637843741097968976883963 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((3377125905818110428637843741097968976883963 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3377125905818110428637843741097968976883963 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 11. -/
theorem ep_Q2_008_partial_11_0468_valid :
    mulPoly ep_Q2_008_coefficient_11_0468
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0469 : Poly :=
[
  term ((241876893375776169835 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 469 for generator 11. -/
def ep_Q2_008_partial_11_0469 : Poly :=
[
  term ((241876893375776169835 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((241876893375776169835 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-241876893375776169835 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-241876893375776169835 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 11. -/
theorem ep_Q2_008_partial_11_0469_valid :
    mulPoly ep_Q2_008_coefficient_11_0469
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0470 : Poly :=
[
  term ((236807389687099615428 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 470 for generator 11. -/
def ep_Q2_008_partial_11_0470 : Poly :=
[
  term ((473614779374199230856 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((473614779374199230856 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-236807389687099615428 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-236807389687099615428 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 11. -/
theorem ep_Q2_008_partial_11_0470_valid :
    mulPoly ep_Q2_008_coefficient_11_0470
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0471 : Poly :=
[
  term ((24440444269648214226610681459780055699501497 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 11. -/
def ep_Q2_008_partial_11_0471 : Poly :=
[
  term ((24440444269648214226610681459780055699501497 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((24440444269648214226610681459780055699501497 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-24440444269648214226610681459780055699501497 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24440444269648214226610681459780055699501497 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 11. -/
theorem ep_Q2_008_partial_11_0471_valid :
    mulPoly ep_Q2_008_coefficient_11_0471
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0472 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 472 for generator 11. -/
def ep_Q2_008_partial_11_0472 : Poly :=
[
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 11. -/
theorem ep_Q2_008_partial_11_0472_valid :
    mulPoly ep_Q2_008_coefficient_11_0472
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0473 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 11. -/
def ep_Q2_008_partial_11_0473 : Poly :=
[
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 11. -/
theorem ep_Q2_008_partial_11_0473_valid :
    mulPoly ep_Q2_008_coefficient_11_0473
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0474 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 474 for generator 11. -/
def ep_Q2_008_partial_11_0474 : Poly :=
[
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 11. -/
theorem ep_Q2_008_partial_11_0474_valid :
    mulPoly ep_Q2_008_coefficient_11_0474
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0475 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 475 for generator 11. -/
def ep_Q2_008_partial_11_0475 : Poly :=
[
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 11. -/
theorem ep_Q2_008_partial_11_0475_valid :
    mulPoly ep_Q2_008_coefficient_11_0475
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0476 : Poly :=
[
  term ((1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 476 for generator 11. -/
def ep_Q2_008_partial_11_0476 : Poly :=
[
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 11. -/
theorem ep_Q2_008_partial_11_0476_valid :
    mulPoly ep_Q2_008_coefficient_11_0476
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0477 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 477 for generator 11. -/
def ep_Q2_008_partial_11_0477 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 11. -/
theorem ep_Q2_008_partial_11_0477_valid :
    mulPoly ep_Q2_008_coefficient_11_0477
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0478 : Poly :=
[
  term ((44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 11. -/
def ep_Q2_008_partial_11_0478 : Poly :=
[
  term ((44314686623014006702851226450536982012503 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((44314686623014006702851226450536982012503 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 11. -/
theorem ep_Q2_008_partial_11_0478_valid :
    mulPoly ep_Q2_008_coefficient_11_0478
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0479 : Poly :=
[
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 479 for generator 11. -/
def ep_Q2_008_partial_11_0479 : Poly :=
[
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 11. -/
theorem ep_Q2_008_partial_11_0479_valid :
    mulPoly ep_Q2_008_coefficient_11_0479
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0480 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 480 for generator 11. -/
def ep_Q2_008_partial_11_0480 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 11. -/
theorem ep_Q2_008_partial_11_0480_valid :
    mulPoly ep_Q2_008_coefficient_11_0480
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0481 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 11. -/
def ep_Q2_008_partial_11_0481 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 11. -/
theorem ep_Q2_008_partial_11_0481_valid :
    mulPoly ep_Q2_008_coefficient_11_0481
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0482 : Poly :=
[
  term ((208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 482 for generator 11. -/
def ep_Q2_008_partial_11_0482 : Poly :=
[
  term ((417514184379045798 : Rat) / 23895050124626771) [(2, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((417514184379045798 : Rat) / 23895050124626771) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 11. -/
theorem ep_Q2_008_partial_11_0482_valid :
    mulPoly ep_Q2_008_coefficient_11_0482
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0483 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 483 for generator 11. -/
def ep_Q2_008_partial_11_0483 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 11. -/
theorem ep_Q2_008_partial_11_0483_valid :
    mulPoly ep_Q2_008_coefficient_11_0483
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0484 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 11. -/
def ep_Q2_008_partial_11_0484 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 11. -/
theorem ep_Q2_008_partial_11_0484_valid :
    mulPoly ep_Q2_008_coefficient_11_0484
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0485 : Poly :=
[
  term ((-20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 485 for generator 11. -/
def ep_Q2_008_partial_11_0485 : Poly :=
[
  term ((-41761775247793389312568375621593600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41761775247793389312568375621593600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 11. -/
theorem ep_Q2_008_partial_11_0485_valid :
    mulPoly ep_Q2_008_coefficient_11_0485
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0486 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 11. -/
def ep_Q2_008_partial_11_0486 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 11. -/
theorem ep_Q2_008_partial_11_0486_valid :
    mulPoly ep_Q2_008_coefficient_11_0486
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0487 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 487 for generator 11. -/
def ep_Q2_008_partial_11_0487 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 11. -/
theorem ep_Q2_008_partial_11_0487_valid :
    mulPoly ep_Q2_008_coefficient_11_0487
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0488 : Poly :=
[
  term ((-10437762421874545893270092205574756070998809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 488 for generator 11. -/
def ep_Q2_008_partial_11_0488 : Poly :=
[
  term ((-10437762421874545893270092205574756070998809 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10437762421874545893270092205574756070998809 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10437762421874545893270092205574756070998809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10437762421874545893270092205574756070998809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 11. -/
theorem ep_Q2_008_partial_11_0488_valid :
    mulPoly ep_Q2_008_coefficient_11_0488
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0489 : Poly :=
[
  term ((2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 489 for generator 11. -/
def ep_Q2_008_partial_11_0489 : Poly :=
[
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 11. -/
theorem ep_Q2_008_partial_11_0489_valid :
    mulPoly ep_Q2_008_coefficient_11_0489
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0490 : Poly :=
[
  term ((157261057740232801041 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 490 for generator 11. -/
def ep_Q2_008_partial_11_0490 : Poly :=
[
  term ((157261057740232801041 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((157261057740232801041 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-157261057740232801041 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-157261057740232801041 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 11. -/
theorem ep_Q2_008_partial_11_0490_valid :
    mulPoly ep_Q2_008_coefficient_11_0490
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0491 : Poly :=
[
  term ((-75578076571890910468780103111848368000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 11. -/
def ep_Q2_008_partial_11_0491 : Poly :=
[
  term ((-151156153143781820937560206223696736000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-151156153143781820937560206223696736000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((75578076571890910468780103111848368000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((75578076571890910468780103111848368000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 11. -/
theorem ep_Q2_008_partial_11_0491_valid :
    mulPoly ep_Q2_008_coefficient_11_0491
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0492 : Poly :=
[
  term ((317546109759454558827852411688348800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 492 for generator 11. -/
def ep_Q2_008_partial_11_0492 : Poly :=
[
  term ((635092219518909117655704823376697600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((635092219518909117655704823376697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-317546109759454558827852411688348800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-317546109759454558827852411688348800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 11. -/
theorem ep_Q2_008_partial_11_0492_valid :
    mulPoly ep_Q2_008_coefficient_11_0492
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0493 : Poly :=
[
  term ((-145987463108769200121 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 493 for generator 11. -/
def ep_Q2_008_partial_11_0493 : Poly :=
[
  term ((-145987463108769200121 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-145987463108769200121 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((145987463108769200121 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((145987463108769200121 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 11. -/
theorem ep_Q2_008_partial_11_0493_valid :
    mulPoly ep_Q2_008_coefficient_11_0493
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0494 : Poly :=
[
  term ((-1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 11. -/
def ep_Q2_008_partial_11_0494 : Poly :=
[
  term ((-3170408039467636566532773849212102400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3170408039467636566532773849212102400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 11. -/
theorem ep_Q2_008_partial_11_0494_valid :
    mulPoly ep_Q2_008_coefficient_11_0494
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0495 : Poly :=
[
  term ((42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 495 for generator 11. -/
def ep_Q2_008_partial_11_0495 : Poly :=
[
  term ((42690950048753730273 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((42690950048753730273 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (14, 2), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 11. -/
theorem ep_Q2_008_partial_11_0495_valid :
    mulPoly ep_Q2_008_coefficient_11_0495
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0496 : Poly :=
[
  term ((5158981372585448787435780038059289274238650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 496 for generator 11. -/
def ep_Q2_008_partial_11_0496 : Poly :=
[
  term ((10317962745170897574871560076118578548477300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10317962745170897574871560076118578548477300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5158981372585448787435780038059289274238650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5158981372585448787435780038059289274238650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 11. -/
theorem ep_Q2_008_partial_11_0496_valid :
    mulPoly ep_Q2_008_coefficient_11_0496
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0497 : Poly :=
[
  term ((2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 497 for generator 11. -/
def ep_Q2_008_partial_11_0497 : Poly :=
[
  term ((4073980994828984444386525976297491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4073980994828984444386525976297491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 11. -/
theorem ep_Q2_008_partial_11_0497_valid :
    mulPoly ep_Q2_008_coefficient_11_0497
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0498 : Poly :=
[
  term ((-16941333233145471976013069710250956800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 498 for generator 11. -/
def ep_Q2_008_partial_11_0498 : Poly :=
[
  term ((-33882666466290943952026139420501913600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-33882666466290943952026139420501913600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((16941333233145471976013069710250956800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((16941333233145471976013069710250956800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 11. -/
theorem ep_Q2_008_partial_11_0498_valid :
    mulPoly ep_Q2_008_coefficient_11_0498
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0499 : Poly :=
[
  term ((542581336361988437985 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 499 for generator 11. -/
def ep_Q2_008_partial_11_0499 : Poly :=
[
  term ((542581336361988437985 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((542581336361988437985 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-542581336361988437985 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-542581336361988437985 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 11. -/
theorem ep_Q2_008_partial_11_0499_valid :
    mulPoly ep_Q2_008_coefficient_11_0499
        ep_Q2_008_generator_11_0400_0499 =
      ep_Q2_008_partial_11_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0400_0499 : List Poly :=
[
  ep_Q2_008_partial_11_0400,
  ep_Q2_008_partial_11_0401,
  ep_Q2_008_partial_11_0402,
  ep_Q2_008_partial_11_0403,
  ep_Q2_008_partial_11_0404,
  ep_Q2_008_partial_11_0405,
  ep_Q2_008_partial_11_0406,
  ep_Q2_008_partial_11_0407,
  ep_Q2_008_partial_11_0408,
  ep_Q2_008_partial_11_0409,
  ep_Q2_008_partial_11_0410,
  ep_Q2_008_partial_11_0411,
  ep_Q2_008_partial_11_0412,
  ep_Q2_008_partial_11_0413,
  ep_Q2_008_partial_11_0414,
  ep_Q2_008_partial_11_0415,
  ep_Q2_008_partial_11_0416,
  ep_Q2_008_partial_11_0417,
  ep_Q2_008_partial_11_0418,
  ep_Q2_008_partial_11_0419,
  ep_Q2_008_partial_11_0420,
  ep_Q2_008_partial_11_0421,
  ep_Q2_008_partial_11_0422,
  ep_Q2_008_partial_11_0423,
  ep_Q2_008_partial_11_0424,
  ep_Q2_008_partial_11_0425,
  ep_Q2_008_partial_11_0426,
  ep_Q2_008_partial_11_0427,
  ep_Q2_008_partial_11_0428,
  ep_Q2_008_partial_11_0429,
  ep_Q2_008_partial_11_0430,
  ep_Q2_008_partial_11_0431,
  ep_Q2_008_partial_11_0432,
  ep_Q2_008_partial_11_0433,
  ep_Q2_008_partial_11_0434,
  ep_Q2_008_partial_11_0435,
  ep_Q2_008_partial_11_0436,
  ep_Q2_008_partial_11_0437,
  ep_Q2_008_partial_11_0438,
  ep_Q2_008_partial_11_0439,
  ep_Q2_008_partial_11_0440,
  ep_Q2_008_partial_11_0441,
  ep_Q2_008_partial_11_0442,
  ep_Q2_008_partial_11_0443,
  ep_Q2_008_partial_11_0444,
  ep_Q2_008_partial_11_0445,
  ep_Q2_008_partial_11_0446,
  ep_Q2_008_partial_11_0447,
  ep_Q2_008_partial_11_0448,
  ep_Q2_008_partial_11_0449,
  ep_Q2_008_partial_11_0450,
  ep_Q2_008_partial_11_0451,
  ep_Q2_008_partial_11_0452,
  ep_Q2_008_partial_11_0453,
  ep_Q2_008_partial_11_0454,
  ep_Q2_008_partial_11_0455,
  ep_Q2_008_partial_11_0456,
  ep_Q2_008_partial_11_0457,
  ep_Q2_008_partial_11_0458,
  ep_Q2_008_partial_11_0459,
  ep_Q2_008_partial_11_0460,
  ep_Q2_008_partial_11_0461,
  ep_Q2_008_partial_11_0462,
  ep_Q2_008_partial_11_0463,
  ep_Q2_008_partial_11_0464,
  ep_Q2_008_partial_11_0465,
  ep_Q2_008_partial_11_0466,
  ep_Q2_008_partial_11_0467,
  ep_Q2_008_partial_11_0468,
  ep_Q2_008_partial_11_0469,
  ep_Q2_008_partial_11_0470,
  ep_Q2_008_partial_11_0471,
  ep_Q2_008_partial_11_0472,
  ep_Q2_008_partial_11_0473,
  ep_Q2_008_partial_11_0474,
  ep_Q2_008_partial_11_0475,
  ep_Q2_008_partial_11_0476,
  ep_Q2_008_partial_11_0477,
  ep_Q2_008_partial_11_0478,
  ep_Q2_008_partial_11_0479,
  ep_Q2_008_partial_11_0480,
  ep_Q2_008_partial_11_0481,
  ep_Q2_008_partial_11_0482,
  ep_Q2_008_partial_11_0483,
  ep_Q2_008_partial_11_0484,
  ep_Q2_008_partial_11_0485,
  ep_Q2_008_partial_11_0486,
  ep_Q2_008_partial_11_0487,
  ep_Q2_008_partial_11_0488,
  ep_Q2_008_partial_11_0489,
  ep_Q2_008_partial_11_0490,
  ep_Q2_008_partial_11_0491,
  ep_Q2_008_partial_11_0492,
  ep_Q2_008_partial_11_0493,
  ep_Q2_008_partial_11_0494,
  ep_Q2_008_partial_11_0495,
  ep_Q2_008_partial_11_0496,
  ep_Q2_008_partial_11_0497,
  ep_Q2_008_partial_11_0498,
  ep_Q2_008_partial_11_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0400_0499 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-919594861613583750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((515715104169559800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-286637955417288111567679029188288409600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10547858366502285869380569343898641385059200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-53823965879724314733 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10982532834897396574131614796602902732800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9451474927988661000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24945724654266156135947250977853205171200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-623287564350030093805009525449420299365500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((74394785094135308700760970029067363143200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1802453421524677875 : Rat) / 95580200498507084) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-26184197794293657157162606349650129278880200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-17552254327471751535801741338299374566400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-218400235214519568209888537922870546073875 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-840840044332819500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10010798204189927733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-17123550152154458883569529892992134838000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((1313445131442849286044042030317132606848077 : Rat) / 23270014048459243500102183208135593751448) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20798509454063624509386598869462542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-145356555685662964131168551504894281216800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((92256285232876781439 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((20468591709620440716974760208293125145600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((9489650387149072262805422251010992988906301 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-148867984746297421175 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6706142969974693212011805094240371960000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (14, 1), (15, 2), (16, 1)],
  term ((55007273450363602635 : Rat) / 5543651628913410872) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-682001292876440204963278134183974400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((558021864037971693622387685731603200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2839800716849950473254649542268364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-430558890340181118960 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-474582456384196233076942601911896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5014213127946281709 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-26381371073182535157 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-191293933598795210433 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3377125905818110428637843741097968976883963 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((241876893375776169835 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((473614779374199230856 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((24440444269648214226610681459780055699501497 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((44314686623014006702851226450536982012503 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((417514184379045798 : Rat) / 23895050124626771) [(2, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41761775247793389312568375621593600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10437762421874545893270092205574756070998809 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((157261057740232801041 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-151156153143781820937560206223696736000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((635092219518909117655704823376697600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-145987463108769200121 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3170408039467636566532773849212102400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42690950048753730273 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((10317962745170897574871560076118578548477300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4073980994828984444386525976297491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-33882666466290943952026139420501913600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((542581336361988437985 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-919594861613583750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((515715104169559800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-286637955417288111567679029188288409600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10547858366502285869380569343898641385059200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-53823965879724314733 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((9451474927988661000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10982532834897396574131614796602902732800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((24945724654266156135947250977853205171200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-623287564350030093805009525449420299365500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1802453421524677875 : Rat) / 95580200498507084) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((74394785094135308700760970029067363143200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-26184197794293657157162606349650129278880200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-17552254327471751535801741338299374566400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-218400235214519568209888537922870546073875 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (15, 4), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-840840044332819500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((-10010798204189927733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-17123550152154458883569529892992134838000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((1313445131442849286044042030317132606848077 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((20798509454063624509386598869462542419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 4), (16, 1)],
  term ((92256285232876781439 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-145356555685662964131168551504894281216800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 3), (16, 1)],
  term ((20468591709620440716974760208293125145600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((-148867984746297421175 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((9489650387149072262805422251010992988906301 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((6706142969974693212011805094240371960000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((55007273450363602635 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-682001292876440204963278134183974400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((558021864037971693622387685731603200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-430558890340181118960 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2839800716849950473254649542268364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5014213127946281709 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-474582456384196233076942601911896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-26381371073182535157 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-191293933598795210433 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3377125905818110428637843741097968976883963 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((241876893375776169835 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((473614779374199230856 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((24440444269648214226610681459780055699501497 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((44314686623014006702851226450536982012503 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((417514184379045798 : Rat) / 23895050124626771) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-41761775247793389312568375621593600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10437762421874545893270092205574756070998809 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((157261057740232801041 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-151156153143781820937560206223696736000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-145987463108769200121 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((635092219518909117655704823376697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3170408039467636566532773849212102400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((42690950048753730273 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((10317962745170897574871560076118578548477300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4073980994828984444386525976297491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((542581336361988437985 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33882666466290943952026139420501913600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-257857552084779900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-257857552084779900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((143318977708644055783839514594144204800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((143318977708644055783839514594144204800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5273929183251142934690284671949320692529600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5273929183251142934690284671949320692529600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-964719430636815000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-964719430636815000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((53823965879724314733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((53823965879724314733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (15, 4), (16, 1)],
  term ((5491266417448698287065807398301451366400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4725737463994330500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4725737463994330500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5491266417448698287065807398301451366400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-12472862327133078067973625488926602585600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-12472862327133078067973625488926602585600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((311643782175015046902504762724710149682750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((311643782175015046902504762724710149682750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-37197392547067654350380485014533681571600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1802453421524677875 : Rat) / 191160400997014168) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1802453421524677875 : Rat) / 191160400997014168) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37197392547067654350380485014533681571600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((13092098897146828578581303174825064639440100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((13092098897146828578581303174825064639440100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (15, 5), (16, 1)],
  term ((8776127163735875767900870669149687283200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-3573415285304418000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-3573415285304418000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((8776127163735875767900870669149687283200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((218400235214519568209888537922870546073875 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((218400235214519568209888537922870546073875 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 5), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (15, 4), (16, 1)],
  term ((10010798204189927733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((10010798204189927733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((8561775076077229441784764946496067419000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8561775076077229441784764946496067419000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1313445131442849286044042030317132606848077 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10399254727031812254693299434731271209600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1313445131442849286044042030317132606848077 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10399254727031812254693299434731271209600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 5), (16, 1)],
  term ((72678277842831482065584275752447140608400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-92256285232876781439 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((-92256285232876781439 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((72678277842831482065584275752447140608400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 4), (16, 1)],
  term ((-10234295854810220358487380104146562572800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-10234295854810220358487380104146562572800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 3), (16, 1)],
  term ((-9489650387149072262805422251010992988906301 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((148867984746297421175 : Rat) / 11087303257826821744) [(4, 1), (14, 2), (16, 1)],
  term ((148867984746297421175 : Rat) / 11087303257826821744) [(4, 1), (15, 2), (16, 1)],
  term ((-9489650387149072262805422251010992988906301 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (15, 4), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((-3353071484987346606005902547120185980000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3353071484987346606005902547120185980000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-55007273450363602635 : Rat) / 11087303257826821744) [(4, 2), (14, 2), (16, 1)],
  term ((-55007273450363602635 : Rat) / 11087303257826821744) [(4, 2), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (15, 4), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((341000646438220102481639067091987200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((341000646438220102481639067091987200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-279010932018985846811193842865801600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-279010932018985846811193842865801600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((237291228192098116538471300955948000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((237291228192098116538471300955948000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((26381371073182535157 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((26381371073182535157 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((191293933598795210433 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((191293933598795210433 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3377125905818110428637843741097968976883963 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3377125905818110428637843741097968976883963 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-241876893375776169835 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-241876893375776169835 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-236807389687099615428 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-236807389687099615428 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-24440444269648214226610681459780055699501497 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24440444269648214226610681459780055699501497 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 3), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 4), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((-208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((10437762421874545893270092205574756070998809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10437762421874545893270092205574756070998809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-157261057740232801041 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-157261057740232801041 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 4), (16, 1)],
  term ((75578076571890910468780103111848368000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((75578076571890910468780103111848368000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-317546109759454558827852411688348800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((145987463108769200121 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((145987463108769200121 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-317546109759454558827852411688348800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (14, 2), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5158981372585448787435780038059289274238650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-5158981372585448787435780038059289274238650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2036990497414492222193262988148745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 5), (16, 1)],
  term ((16941333233145471976013069710250956800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-542581336361988437985 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-542581336361988437985 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((16941333233145471976013069710250956800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 400 through 499. -/
theorem ep_Q2_008_block_11_0400_0499_valid :
    checkProductSumEq ep_Q2_008_partials_11_0400_0499
      ep_Q2_008_block_11_0400_0499 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
