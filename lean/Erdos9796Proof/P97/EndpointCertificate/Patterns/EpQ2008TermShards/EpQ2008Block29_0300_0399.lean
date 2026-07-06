/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 29:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_29_0300_0399 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0300 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 300 for generator 29. -/
def ep_Q2_008_partial_29_0300 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 29. -/
theorem ep_Q2_008_partial_29_0300_valid :
    mulPoly ep_Q2_008_coefficient_29_0300
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0301 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 29. -/
def ep_Q2_008_partial_29_0301 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 29. -/
theorem ep_Q2_008_partial_29_0301_valid :
    mulPoly ep_Q2_008_coefficient_29_0301
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0302 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 302 for generator 29. -/
def ep_Q2_008_partial_29_0302 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 29. -/
theorem ep_Q2_008_partial_29_0302_valid :
    mulPoly ep_Q2_008_coefficient_29_0302
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0303 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 29. -/
def ep_Q2_008_partial_29_0303 : Poly :=
[
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 29. -/
theorem ep_Q2_008_partial_29_0303_valid :
    mulPoly ep_Q2_008_coefficient_29_0303
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0304 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 29. -/
def ep_Q2_008_partial_29_0304 : Poly :=
[
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 29. -/
theorem ep_Q2_008_partial_29_0304_valid :
    mulPoly ep_Q2_008_coefficient_29_0304
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0305 : Poly :=
[
  term ((-459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 305 for generator 29. -/
def ep_Q2_008_partial_29_0305 : Poly :=
[
  term ((-919594861613583750 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-919594861613583750 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 29. -/
theorem ep_Q2_008_partial_29_0305_valid :
    mulPoly ep_Q2_008_coefficient_29_0305
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0306 : Poly :=
[
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 29. -/
def ep_Q2_008_partial_29_0306 : Poly :=
[
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 29. -/
theorem ep_Q2_008_partial_29_0306_valid :
    mulPoly ep_Q2_008_coefficient_29_0306
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0307 : Poly :=
[
  term ((9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 307 for generator 29. -/
def ep_Q2_008_partial_29_0307 : Poly :=
[
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 29. -/
theorem ep_Q2_008_partial_29_0307_valid :
    mulPoly ep_Q2_008_coefficient_29_0307
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0308 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 29. -/
def ep_Q2_008_partial_29_0308 : Poly :=
[
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 29. -/
theorem ep_Q2_008_partial_29_0308_valid :
    mulPoly ep_Q2_008_coefficient_29_0308
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0309 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 309 for generator 29. -/
def ep_Q2_008_partial_29_0309 : Poly :=
[
  term ((2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 29. -/
theorem ep_Q2_008_partial_29_0309_valid :
    mulPoly ep_Q2_008_coefficient_29_0309
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0310 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 29. -/
def ep_Q2_008_partial_29_0310 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 29. -/
theorem ep_Q2_008_partial_29_0310_valid :
    mulPoly ep_Q2_008_coefficient_29_0310
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0311 : Poly :=
[
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 29. -/
def ep_Q2_008_partial_29_0311 : Poly :=
[
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 29. -/
theorem ep_Q2_008_partial_29_0311_valid :
    mulPoly ep_Q2_008_coefficient_29_0311
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0312 : Poly :=
[
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 29. -/
def ep_Q2_008_partial_29_0312 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 29. -/
theorem ep_Q2_008_partial_29_0312_valid :
    mulPoly ep_Q2_008_coefficient_29_0312
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0313 : Poly :=
[
  term ((164091169508496300 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 313 for generator 29. -/
def ep_Q2_008_partial_29_0313 : Poly :=
[
  term ((328182339016992600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-164091169508496300 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((328182339016992600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-164091169508496300 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 29. -/
theorem ep_Q2_008_partial_29_0313_valid :
    mulPoly ep_Q2_008_coefficient_29_0313
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0314 : Poly :=
[
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 29. -/
def ep_Q2_008_partial_29_0314 : Poly :=
[
  term ((-182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 29. -/
theorem ep_Q2_008_partial_29_0314_valid :
    mulPoly ep_Q2_008_coefficient_29_0314
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0315 : Poly :=
[
  term ((23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 29. -/
def ep_Q2_008_partial_29_0315 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 29. -/
theorem ep_Q2_008_partial_29_0315_valid :
    mulPoly ep_Q2_008_coefficient_29_0315
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0316 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 316 for generator 29. -/
def ep_Q2_008_partial_29_0316 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 29. -/
theorem ep_Q2_008_partial_29_0316_valid :
    mulPoly ep_Q2_008_coefficient_29_0316
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0317 : Poly :=
[
  term ((-5013054186459084794545464334696103908560600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 29. -/
def ep_Q2_008_partial_29_0317 : Poly :=
[
  term ((-10026108372918169589090928669392207817121200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5013054186459084794545464334696103908560600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10026108372918169589090928669392207817121200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5013054186459084794545464334696103908560600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 29. -/
theorem ep_Q2_008_partial_29_0317_valid :
    mulPoly ep_Q2_008_coefficient_29_0317
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0318 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 318 for generator 29. -/
def ep_Q2_008_partial_29_0318 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 29. -/
theorem ep_Q2_008_partial_29_0318_valid :
    mulPoly ep_Q2_008_coefficient_29_0318
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0319 : Poly :=
[
  term ((-120671854903320377733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 319 for generator 29. -/
def ep_Q2_008_partial_29_0319 : Poly :=
[
  term ((-120671854903320377733 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((120671854903320377733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-120671854903320377733 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((120671854903320377733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 29. -/
theorem ep_Q2_008_partial_29_0319_valid :
    mulPoly ep_Q2_008_coefficient_29_0319
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0320 : Poly :=
[
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 320 for generator 29. -/
def ep_Q2_008_partial_29_0320 : Poly :=
[
  term ((456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 29. -/
theorem ep_Q2_008_partial_29_0320_valid :
    mulPoly ep_Q2_008_coefficient_29_0320
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0321 : Poly :=
[
  term ((-38816249744893500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 321 for generator 29. -/
def ep_Q2_008_partial_29_0321 : Poly :=
[
  term ((-77632499489787000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((38816249744893500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-77632499489787000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((38816249744893500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 29. -/
theorem ep_Q2_008_partial_29_0321_valid :
    mulPoly ep_Q2_008_coefficient_29_0321
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0322 : Poly :=
[
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 29. -/
def ep_Q2_008_partial_29_0322 : Poly :=
[
  term ((2068629126325446269059588109957391129600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((2068629126325446269059588109957391129600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 29. -/
theorem ep_Q2_008_partial_29_0322_valid :
    mulPoly ep_Q2_008_coefficient_29_0322
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0323 : Poly :=
[
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 29. -/
def ep_Q2_008_partial_29_0323 : Poly :=
[
  term ((-43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 29. -/
theorem ep_Q2_008_partial_29_0323_valid :
    mulPoly ep_Q2_008_coefficient_29_0323
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0324 : Poly :=
[
  term ((-81004634290292457177550877219499800617200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 324 for generator 29. -/
def ep_Q2_008_partial_29_0324 : Poly :=
[
  term ((-162009268580584914355101754438999601234400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((81004634290292457177550877219499800617200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-162009268580584914355101754438999601234400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((81004634290292457177550877219499800617200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 29. -/
theorem ep_Q2_008_partial_29_0324_valid :
    mulPoly ep_Q2_008_coefficient_29_0324
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0325 : Poly :=
[
  term ((-155349436721667908625 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 325 for generator 29. -/
def ep_Q2_008_partial_29_0325 : Poly :=
[
  term ((-155349436721667908625 : Rat) / 1385912907228352718) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((155349436721667908625 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-155349436721667908625 : Rat) / 1385912907228352718) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((155349436721667908625 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 29. -/
theorem ep_Q2_008_partial_29_0325_valid :
    mulPoly ep_Q2_008_coefficient_29_0325
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0326 : Poly :=
[
  term ((-13601223213820707088773899487761979948563700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 29. -/
def ep_Q2_008_partial_29_0326 : Poly :=
[
  term ((-27202446427641414177547798975523959897127400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13601223213820707088773899487761979948563700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-27202446427641414177547798975523959897127400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((13601223213820707088773899487761979948563700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 29. -/
theorem ep_Q2_008_partial_29_0326_valid :
    mulPoly ep_Q2_008_coefficient_29_0326
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0327 : Poly :=
[
  term ((-9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 327 for generator 29. -/
def ep_Q2_008_partial_29_0327 : Poly :=
[
  term ((-18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 29. -/
theorem ep_Q2_008_partial_29_0327_valid :
    mulPoly ep_Q2_008_coefficient_29_0327
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0328 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 328 for generator 29. -/
def ep_Q2_008_partial_29_0328 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 29. -/
theorem ep_Q2_008_partial_29_0328_valid :
    mulPoly ep_Q2_008_coefficient_29_0328
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0329 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 29. -/
def ep_Q2_008_partial_29_0329 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 29. -/
theorem ep_Q2_008_partial_29_0329_valid :
    mulPoly ep_Q2_008_coefficient_29_0329
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0330 : Poly :=
[
  term ((-88591129797359136861865607988732221461725 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 29. -/
def ep_Q2_008_partial_29_0330 : Poly :=
[
  term ((-88591129797359136861865607988732221461725 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((88591129797359136861865607988732221461725 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-88591129797359136861865607988732221461725 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((88591129797359136861865607988732221461725 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 29. -/
theorem ep_Q2_008_partial_29_0330_valid :
    mulPoly ep_Q2_008_coefficient_29_0330
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0331 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 29. -/
def ep_Q2_008_partial_29_0331 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 29. -/
theorem ep_Q2_008_partial_29_0331_valid :
    mulPoly ep_Q2_008_coefficient_29_0331
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0332 : Poly :=
[
  term ((-420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 332 for generator 29. -/
def ep_Q2_008_partial_29_0332 : Poly :=
[
  term ((-840840044332819500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-840840044332819500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 29. -/
theorem ep_Q2_008_partial_29_0332_valid :
    mulPoly ep_Q2_008_coefficient_29_0332
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0333 : Poly :=
[
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 29. -/
def ep_Q2_008_partial_29_0333 : Poly :=
[
  term ((-2062803814349319000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2062803814349319000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 29. -/
theorem ep_Q2_008_partial_29_0333_valid :
    mulPoly ep_Q2_008_coefficient_29_0333
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0334 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 29. -/
def ep_Q2_008_partial_29_0334 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 3), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 29. -/
theorem ep_Q2_008_partial_29_0334_valid :
    mulPoly ep_Q2_008_coefficient_29_0334
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0335 : Poly :=
[
  term ((-12311804347091546733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 335 for generator 29. -/
def ep_Q2_008_partial_29_0335 : Poly :=
[
  term ((-12311804347091546733 : Rat) / 1385912907228352718) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((12311804347091546733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (12, 2), (16, 1)],
  term ((-12311804347091546733 : Rat) / 1385912907228352718) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((12311804347091546733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 29. -/
theorem ep_Q2_008_partial_29_0335_valid :
    mulPoly ep_Q2_008_coefficient_29_0335
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0336 : Poly :=
[
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 29. -/
def ep_Q2_008_partial_29_0336 : Poly :=
[
  term ((-45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 29. -/
theorem ep_Q2_008_partial_29_0336_valid :
    mulPoly ep_Q2_008_coefficient_29_0336
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0337 : Poly :=
[
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 337 for generator 29. -/
def ep_Q2_008_partial_29_0337 : Poly :=
[
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 29. -/
theorem ep_Q2_008_partial_29_0337_valid :
    mulPoly ep_Q2_008_coefficient_29_0337
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0338 : Poly :=
[
  term ((3523673212944332440001169191007533040327105 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 29. -/
def ep_Q2_008_partial_29_0338 : Poly :=
[
  term ((7047346425888664880002338382015066080654210 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3523673212944332440001169191007533040327105 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7047346425888664880002338382015066080654210 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3523673212944332440001169191007533040327105 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 29. -/
theorem ep_Q2_008_partial_29_0338_valid :
    mulPoly ep_Q2_008_coefficient_29_0338
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0339 : Poly :=
[
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 339 for generator 29. -/
def ep_Q2_008_partial_29_0339 : Poly :=
[
  term ((10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 4), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 29. -/
theorem ep_Q2_008_partial_29_0339_valid :
    mulPoly ep_Q2_008_coefficient_29_0339
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0340 : Poly :=
[
  term ((-91464271753434150271228595050765772221200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 29. -/
def ep_Q2_008_partial_29_0340 : Poly :=
[
  term ((-182928543506868300542457190101531544442400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((91464271753434150271228595050765772221200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-182928543506868300542457190101531544442400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 3), (16, 1)],
  term ((91464271753434150271228595050765772221200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 29. -/
theorem ep_Q2_008_partial_29_0340_valid :
    mulPoly ep_Q2_008_coefficient_29_0340
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0341 : Poly :=
[
  term ((16781544750335901405 : Rat) / 2771825814456705436) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 341 for generator 29. -/
def ep_Q2_008_partial_29_0341 : Poly :=
[
  term ((16781544750335901405 : Rat) / 1385912907228352718) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-16781544750335901405 : Rat) / 2771825814456705436) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((16781544750335901405 : Rat) / 1385912907228352718) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-16781544750335901405 : Rat) / 2771825814456705436) [(4, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 29. -/
theorem ep_Q2_008_partial_29_0341_valid :
    mulPoly ep_Q2_008_coefficient_29_0341
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0342 : Poly :=
[
  term ((-4299250458209831468656396661229402758400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 29. -/
def ep_Q2_008_partial_29_0342 : Poly :=
[
  term ((-8598500916419662937312793322458805516800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4299250458209831468656396661229402758400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-8598500916419662937312793322458805516800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 4), (15, 2), (16, 1)],
  term ((4299250458209831468656396661229402758400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 29. -/
theorem ep_Q2_008_partial_29_0342_valid :
    mulPoly ep_Q2_008_coefficient_29_0342
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0343 : Poly :=
[
  term ((5814918488637908210002889155082808867055521 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 343 for generator 29. -/
def ep_Q2_008_partial_29_0343 : Poly :=
[
  term ((5814918488637908210002889155082808867055521 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5814918488637908210002889155082808867055521 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((5814918488637908210002889155082808867055521 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5814918488637908210002889155082808867055521 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 29. -/
theorem ep_Q2_008_partial_29_0343_valid :
    mulPoly ep_Q2_008_coefficient_29_0343
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0344 : Poly :=
[
  term ((62650008611922924681 : Rat) / 11087303257826821744) [(4, 1), (16, 1)]
]

/-- Partial product 344 for generator 29. -/
def ep_Q2_008_partial_29_0344 : Poly :=
[
  term ((62650008611922924681 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-62650008611922924681 : Rat) / 11087303257826821744) [(4, 1), (12, 2), (16, 1)],
  term ((62650008611922924681 : Rat) / 5543651628913410872) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62650008611922924681 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 29. -/
theorem ep_Q2_008_partial_29_0344_valid :
    mulPoly ep_Q2_008_coefficient_29_0344
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0345 : Poly :=
[
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 29. -/
def ep_Q2_008_partial_29_0345 : Poly :=
[
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 29. -/
theorem ep_Q2_008_partial_29_0345_valid :
    mulPoly ep_Q2_008_coefficient_29_0345
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0346 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 29. -/
def ep_Q2_008_partial_29_0346 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 29. -/
theorem ep_Q2_008_partial_29_0346_valid :
    mulPoly ep_Q2_008_coefficient_29_0346
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0347 : Poly :=
[
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (16, 1)]
]

/-- Partial product 347 for generator 29. -/
def ep_Q2_008_partial_29_0347 : Poly :=
[
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (12, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 29. -/
theorem ep_Q2_008_partial_29_0347_valid :
    mulPoly ep_Q2_008_coefficient_29_0347
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0348 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 29. -/
def ep_Q2_008_partial_29_0348 : Poly :=
[
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 29. -/
theorem ep_Q2_008_partial_29_0348_valid :
    mulPoly ep_Q2_008_coefficient_29_0348
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0349 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 29. -/
def ep_Q2_008_partial_29_0349 : Poly :=
[
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 29. -/
theorem ep_Q2_008_partial_29_0349_valid :
    mulPoly ep_Q2_008_coefficient_29_0349
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0350 : Poly :=
[
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 29. -/
def ep_Q2_008_partial_29_0350 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 29. -/
theorem ep_Q2_008_partial_29_0350_valid :
    mulPoly ep_Q2_008_coefficient_29_0350
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0351 : Poly :=
[
  term ((72820581017187118888356654976531200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 29. -/
def ep_Q2_008_partial_29_0351 : Poly :=
[
  term ((145641162034374237776713309953062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72820581017187118888356654976531200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((145641162034374237776713309953062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-72820581017187118888356654976531200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 29. -/
theorem ep_Q2_008_partial_29_0351_valid :
    mulPoly ep_Q2_008_coefficient_29_0351
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0352 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 29. -/
def ep_Q2_008_partial_29_0352 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 29. -/
theorem ep_Q2_008_partial_29_0352_valid :
    mulPoly ep_Q2_008_coefficient_29_0352
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0353 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 29. -/
def ep_Q2_008_partial_29_0353 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 29. -/
theorem ep_Q2_008_partial_29_0353_valid :
    mulPoly ep_Q2_008_coefficient_29_0353
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0354 : Poly :=
[
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 354 for generator 29. -/
def ep_Q2_008_partial_29_0354 : Poly :=
[
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 29. -/
theorem ep_Q2_008_partial_29_0354_valid :
    mulPoly ep_Q2_008_coefficient_29_0354
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0355 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 29. -/
def ep_Q2_008_partial_29_0355 : Poly :=
[
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 29. -/
theorem ep_Q2_008_partial_29_0355_valid :
    mulPoly ep_Q2_008_coefficient_29_0355
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0356 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 356 for generator 29. -/
def ep_Q2_008_partial_29_0356 : Poly :=
[
  term ((258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 29. -/
theorem ep_Q2_008_partial_29_0356_valid :
    mulPoly ep_Q2_008_coefficient_29_0356
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0357 : Poly :=
[
  term ((-26381371073182535157 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 357 for generator 29. -/
def ep_Q2_008_partial_29_0357 : Poly :=
[
  term ((-26381371073182535157 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((26381371073182535157 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26381371073182535157 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26381371073182535157 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 29. -/
theorem ep_Q2_008_partial_29_0357_valid :
    mulPoly ep_Q2_008_coefficient_29_0357
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0358 : Poly :=
[
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 358 for generator 29. -/
def ep_Q2_008_partial_29_0358 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 3), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 29. -/
theorem ep_Q2_008_partial_29_0358_valid :
    mulPoly ep_Q2_008_coefficient_29_0358
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0359 : Poly :=
[
  term ((7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 29. -/
def ep_Q2_008_partial_29_0359 : Poly :=
[
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 29. -/
theorem ep_Q2_008_partial_29_0359_valid :
    mulPoly ep_Q2_008_coefficient_29_0359
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0360 : Poly :=
[
  term ((64099216594865602719 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 360 for generator 29. -/
def ep_Q2_008_partial_29_0360 : Poly :=
[
  term ((64099216594865602719 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64099216594865602719 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((64099216594865602719 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64099216594865602719 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 29. -/
theorem ep_Q2_008_partial_29_0360_valid :
    mulPoly ep_Q2_008_coefficient_29_0360
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0361 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 29. -/
def ep_Q2_008_partial_29_0361 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 29. -/
theorem ep_Q2_008_partial_29_0361_valid :
    mulPoly ep_Q2_008_coefficient_29_0361
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0362 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

/-- Partial product 362 for generator 29. -/
def ep_Q2_008_partial_29_0362 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 2), (13, 3), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 4), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 29. -/
theorem ep_Q2_008_partial_29_0362_valid :
    mulPoly ep_Q2_008_coefficient_29_0362
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0363 : Poly :=
[
  term ((-3476948304762521726553956141469699473346363 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 29. -/
def ep_Q2_008_partial_29_0363 : Poly :=
[
  term ((-3476948304762521726553956141469699473346363 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3476948304762521726553956141469699473346363 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3476948304762521726553956141469699473346363 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((3476948304762521726553956141469699473346363 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 29. -/
theorem ep_Q2_008_partial_29_0363_valid :
    mulPoly ep_Q2_008_coefficient_29_0363
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0364 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 29. -/
def ep_Q2_008_partial_29_0364 : Poly :=
[
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 29. -/
theorem ep_Q2_008_partial_29_0364_valid :
    mulPoly ep_Q2_008_coefficient_29_0364
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0365 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 365 for generator 29. -/
def ep_Q2_008_partial_29_0365 : Poly :=
[
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 29. -/
theorem ep_Q2_008_partial_29_0365_valid :
    mulPoly ep_Q2_008_coefficient_29_0365
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0366 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 29. -/
def ep_Q2_008_partial_29_0366 : Poly :=
[
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 29. -/
theorem ep_Q2_008_partial_29_0366_valid :
    mulPoly ep_Q2_008_coefficient_29_0366
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0367 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 29. -/
def ep_Q2_008_partial_29_0367 : Poly :=
[
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 29. -/
theorem ep_Q2_008_partial_29_0367_valid :
    mulPoly ep_Q2_008_coefficient_29_0367
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0368 : Poly :=
[
  term ((1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 368 for generator 29. -/
def ep_Q2_008_partial_29_0368 : Poly :=
[
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 29. -/
theorem ep_Q2_008_partial_29_0368_valid :
    mulPoly ep_Q2_008_coefficient_29_0368
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0369 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 369 for generator 29. -/
def ep_Q2_008_partial_29_0369 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 29. -/
theorem ep_Q2_008_partial_29_0369_valid :
    mulPoly ep_Q2_008_coefficient_29_0369
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0370 : Poly :=
[
  term ((44420941355493493715799620780899897334103 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 29. -/
def ep_Q2_008_partial_29_0370 : Poly :=
[
  term ((44420941355493493715799620780899897334103 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44420941355493493715799620780899897334103 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((44420941355493493715799620780899897334103 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-44420941355493493715799620780899897334103 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 29. -/
theorem ep_Q2_008_partial_29_0370_valid :
    mulPoly ep_Q2_008_coefficient_29_0370
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0371 : Poly :=
[
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 29. -/
def ep_Q2_008_partial_29_0371 : Poly :=
[
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 29. -/
theorem ep_Q2_008_partial_29_0371_valid :
    mulPoly ep_Q2_008_coefficient_29_0371
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0372 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 372 for generator 29. -/
def ep_Q2_008_partial_29_0372 : Poly :=
[
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 29. -/
theorem ep_Q2_008_partial_29_0372_valid :
    mulPoly ep_Q2_008_coefficient_29_0372
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0373 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 29. -/
def ep_Q2_008_partial_29_0373 : Poly :=
[
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 29. -/
theorem ep_Q2_008_partial_29_0373_valid :
    mulPoly ep_Q2_008_coefficient_29_0373
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0374 : Poly :=
[
  term ((12780729831051093891 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 374 for generator 29. -/
def ep_Q2_008_partial_29_0374 : Poly :=
[
  term ((25561459662102187782 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12780729831051093891 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((25561459662102187782 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12780729831051093891 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 29. -/
theorem ep_Q2_008_partial_29_0374_valid :
    mulPoly ep_Q2_008_coefficient_29_0374
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0375 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 375 for generator 29. -/
def ep_Q2_008_partial_29_0375 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 29. -/
theorem ep_Q2_008_partial_29_0375_valid :
    mulPoly ep_Q2_008_coefficient_29_0375
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0376 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 29. -/
def ep_Q2_008_partial_29_0376 : Poly :=
[
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 29. -/
theorem ep_Q2_008_partial_29_0376_valid :
    mulPoly ep_Q2_008_coefficient_29_0376
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0377 : Poly :=
[
  term ((55049612826636740457476495137555200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 29. -/
def ep_Q2_008_partial_29_0377 : Poly :=
[
  term ((110099225653273480914952990275110400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-55049612826636740457476495137555200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((110099225653273480914952990275110400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-55049612826636740457476495137555200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 29. -/
theorem ep_Q2_008_partial_29_0377_valid :
    mulPoly ep_Q2_008_coefficient_29_0377
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0378 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 29. -/
def ep_Q2_008_partial_29_0378 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 29. -/
theorem ep_Q2_008_partial_29_0378_valid :
    mulPoly ep_Q2_008_coefficient_29_0378
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0379 : Poly :=
[
  term ((-10437907863049239564039509830917243703074009 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 29. -/
def ep_Q2_008_partial_29_0379 : Poly :=
[
  term ((-10437907863049239564039509830917243703074009 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((10437907863049239564039509830917243703074009 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10437907863049239564039509830917243703074009 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10437907863049239564039509830917243703074009 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 29. -/
theorem ep_Q2_008_partial_29_0379_valid :
    mulPoly ep_Q2_008_coefficient_29_0379
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0380 : Poly :=
[
  term ((2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 380 for generator 29. -/
def ep_Q2_008_partial_29_0380 : Poly :=
[
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 29. -/
theorem ep_Q2_008_partial_29_0380_valid :
    mulPoly ep_Q2_008_coefficient_29_0380
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0381 : Poly :=
[
  term ((43420828019282493519 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 381 for generator 29. -/
def ep_Q2_008_partial_29_0381 : Poly :=
[
  term ((86841656038564987038 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-43420828019282493519 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (13, 4), (16, 1)],
  term ((86841656038564987038 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-43420828019282493519 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 29. -/
theorem ep_Q2_008_partial_29_0381_valid :
    mulPoly ep_Q2_008_coefficient_29_0381
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0382 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 29. -/
def ep_Q2_008_partial_29_0382 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 29. -/
theorem ep_Q2_008_partial_29_0382_valid :
    mulPoly ep_Q2_008_coefficient_29_0382
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0383 : Poly :=
[
  term ((269917895580576072999180983301729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 383 for generator 29. -/
def ep_Q2_008_partial_29_0383 : Poly :=
[
  term ((539835791161152145998361966603459200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-269917895580576072999180983301729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((539835791161152145998361966603459200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-269917895580576072999180983301729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 29. -/
theorem ep_Q2_008_partial_29_0383_valid :
    mulPoly ep_Q2_008_coefficient_29_0383
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0384 : Poly :=
[
  term ((-33582539150706894141 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 384 for generator 29. -/
def ep_Q2_008_partial_29_0384 : Poly :=
[
  term ((-33582539150706894141 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33582539150706894141 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-33582539150706894141 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((33582539150706894141 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 29. -/
theorem ep_Q2_008_partial_29_0384_valid :
    mulPoly ep_Q2_008_coefficient_29_0384
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0385 : Poly :=
[
  term ((-1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 29. -/
def ep_Q2_008_partial_29_0385 : Poly :=
[
  term ((-3170408039467636566532773849212102400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3170408039467636566532773849212102400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 29. -/
theorem ep_Q2_008_partial_29_0385_valid :
    mulPoly ep_Q2_008_coefficient_29_0385
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0386 : Poly :=
[
  term ((42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 386 for generator 29. -/
def ep_Q2_008_partial_29_0386 : Poly :=
[
  term ((42690950048753730273 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((42690950048753730273 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 3), (14, 1), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 29. -/
theorem ep_Q2_008_partial_29_0386_valid :
    mulPoly ep_Q2_008_coefficient_29_0386
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0387 : Poly :=
[
  term ((-37817198755804077045729104409984442785303 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 29. -/
def ep_Q2_008_partial_29_0387 : Poly :=
[
  term ((-37817198755804077045729104409984442785303 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37817198755804077045729104409984442785303 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37817198755804077045729104409984442785303 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((37817198755804077045729104409984442785303 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 29. -/
theorem ep_Q2_008_partial_29_0387_valid :
    mulPoly ep_Q2_008_coefficient_29_0387
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0388 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 388 for generator 29. -/
def ep_Q2_008_partial_29_0388 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 29. -/
theorem ep_Q2_008_partial_29_0388_valid :
    mulPoly ep_Q2_008_coefficient_29_0388
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0389 : Poly :=
[
  term ((-4316009465015059768811638153195363200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 389 for generator 29. -/
def ep_Q2_008_partial_29_0389 : Poly :=
[
  term ((-8632018930030119537623276306390726400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4316009465015059768811638153195363200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-8632018930030119537623276306390726400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((4316009465015059768811638153195363200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 29. -/
theorem ep_Q2_008_partial_29_0389_valid :
    mulPoly ep_Q2_008_coefficient_29_0389
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0390 : Poly :=
[
  term ((-274757588541005844411 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 390 for generator 29. -/
def ep_Q2_008_partial_29_0390 : Poly :=
[
  term ((-274757588541005844411 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((274757588541005844411 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((-274757588541005844411 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((274757588541005844411 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 29. -/
theorem ep_Q2_008_partial_29_0390_valid :
    mulPoly ep_Q2_008_coefficient_29_0390
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0391 : Poly :=
[
  term ((-83677632867511664292668132629063776000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 29. -/
def ep_Q2_008_partial_29_0391 : Poly :=
[
  term ((-167355265735023328585336265258127552000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((83677632867511664292668132629063776000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-167355265735023328585336265258127552000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((83677632867511664292668132629063776000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 29. -/
theorem ep_Q2_008_partial_29_0391_valid :
    mulPoly ep_Q2_008_coefficient_29_0391
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0392 : Poly :=
[
  term ((100304998866436056438842902182038400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 392 for generator 29. -/
def ep_Q2_008_partial_29_0392 : Poly :=
[
  term ((200609997732872112877685804364076800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-100304998866436056438842902182038400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((200609997732872112877685804364076800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-100304998866436056438842902182038400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 29. -/
theorem ep_Q2_008_partial_29_0392_valid :
    mulPoly ep_Q2_008_coefficient_29_0392
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0393 : Poly :=
[
  term ((282742181714058376671 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 393 for generator 29. -/
def ep_Q2_008_partial_29_0393 : Poly :=
[
  term ((282742181714058376671 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-282742181714058376671 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((282742181714058376671 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-282742181714058376671 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 29. -/
theorem ep_Q2_008_partial_29_0393_valid :
    mulPoly ep_Q2_008_coefficient_29_0393
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0394 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 394 for generator 29. -/
def ep_Q2_008_partial_29_0394 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 29. -/
theorem ep_Q2_008_partial_29_0394_valid :
    mulPoly ep_Q2_008_coefficient_29_0394
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0395 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 29. -/
def ep_Q2_008_partial_29_0395 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 29. -/
theorem ep_Q2_008_partial_29_0395_valid :
    mulPoly ep_Q2_008_coefficient_29_0395
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0396 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 29. -/
def ep_Q2_008_partial_29_0396 : Poly :=
[
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 29. -/
theorem ep_Q2_008_partial_29_0396_valid :
    mulPoly ep_Q2_008_coefficient_29_0396
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0397 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 397 for generator 29. -/
def ep_Q2_008_partial_29_0397 : Poly :=
[
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 29. -/
theorem ep_Q2_008_partial_29_0397_valid :
    mulPoly ep_Q2_008_coefficient_29_0397
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0398 : Poly :=
[
  term ((-156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 398 for generator 29. -/
def ep_Q2_008_partial_29_0398 : Poly :=
[
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 29. -/
theorem ep_Q2_008_partial_29_0398_valid :
    mulPoly ep_Q2_008_coefficient_29_0398
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0399 : Poly :=
[
  term ((461237401672921185637844148547968000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 29. -/
def ep_Q2_008_partial_29_0399 : Poly :=
[
  term ((922474803345842371275688297095936000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-461237401672921185637844148547968000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((922474803345842371275688297095936000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-461237401672921185637844148547968000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 29. -/
theorem ep_Q2_008_partial_29_0399_valid :
    mulPoly ep_Q2_008_coefficient_29_0399
        ep_Q2_008_generator_29_0300_0399 =
      ep_Q2_008_partial_29_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_29_0300_0399 : List Poly :=
[
  ep_Q2_008_partial_29_0300,
  ep_Q2_008_partial_29_0301,
  ep_Q2_008_partial_29_0302,
  ep_Q2_008_partial_29_0303,
  ep_Q2_008_partial_29_0304,
  ep_Q2_008_partial_29_0305,
  ep_Q2_008_partial_29_0306,
  ep_Q2_008_partial_29_0307,
  ep_Q2_008_partial_29_0308,
  ep_Q2_008_partial_29_0309,
  ep_Q2_008_partial_29_0310,
  ep_Q2_008_partial_29_0311,
  ep_Q2_008_partial_29_0312,
  ep_Q2_008_partial_29_0313,
  ep_Q2_008_partial_29_0314,
  ep_Q2_008_partial_29_0315,
  ep_Q2_008_partial_29_0316,
  ep_Q2_008_partial_29_0317,
  ep_Q2_008_partial_29_0318,
  ep_Q2_008_partial_29_0319,
  ep_Q2_008_partial_29_0320,
  ep_Q2_008_partial_29_0321,
  ep_Q2_008_partial_29_0322,
  ep_Q2_008_partial_29_0323,
  ep_Q2_008_partial_29_0324,
  ep_Q2_008_partial_29_0325,
  ep_Q2_008_partial_29_0326,
  ep_Q2_008_partial_29_0327,
  ep_Q2_008_partial_29_0328,
  ep_Q2_008_partial_29_0329,
  ep_Q2_008_partial_29_0330,
  ep_Q2_008_partial_29_0331,
  ep_Q2_008_partial_29_0332,
  ep_Q2_008_partial_29_0333,
  ep_Q2_008_partial_29_0334,
  ep_Q2_008_partial_29_0335,
  ep_Q2_008_partial_29_0336,
  ep_Q2_008_partial_29_0337,
  ep_Q2_008_partial_29_0338,
  ep_Q2_008_partial_29_0339,
  ep_Q2_008_partial_29_0340,
  ep_Q2_008_partial_29_0341,
  ep_Q2_008_partial_29_0342,
  ep_Q2_008_partial_29_0343,
  ep_Q2_008_partial_29_0344,
  ep_Q2_008_partial_29_0345,
  ep_Q2_008_partial_29_0346,
  ep_Q2_008_partial_29_0347,
  ep_Q2_008_partial_29_0348,
  ep_Q2_008_partial_29_0349,
  ep_Q2_008_partial_29_0350,
  ep_Q2_008_partial_29_0351,
  ep_Q2_008_partial_29_0352,
  ep_Q2_008_partial_29_0353,
  ep_Q2_008_partial_29_0354,
  ep_Q2_008_partial_29_0355,
  ep_Q2_008_partial_29_0356,
  ep_Q2_008_partial_29_0357,
  ep_Q2_008_partial_29_0358,
  ep_Q2_008_partial_29_0359,
  ep_Q2_008_partial_29_0360,
  ep_Q2_008_partial_29_0361,
  ep_Q2_008_partial_29_0362,
  ep_Q2_008_partial_29_0363,
  ep_Q2_008_partial_29_0364,
  ep_Q2_008_partial_29_0365,
  ep_Q2_008_partial_29_0366,
  ep_Q2_008_partial_29_0367,
  ep_Q2_008_partial_29_0368,
  ep_Q2_008_partial_29_0369,
  ep_Q2_008_partial_29_0370,
  ep_Q2_008_partial_29_0371,
  ep_Q2_008_partial_29_0372,
  ep_Q2_008_partial_29_0373,
  ep_Q2_008_partial_29_0374,
  ep_Q2_008_partial_29_0375,
  ep_Q2_008_partial_29_0376,
  ep_Q2_008_partial_29_0377,
  ep_Q2_008_partial_29_0378,
  ep_Q2_008_partial_29_0379,
  ep_Q2_008_partial_29_0380,
  ep_Q2_008_partial_29_0381,
  ep_Q2_008_partial_29_0382,
  ep_Q2_008_partial_29_0383,
  ep_Q2_008_partial_29_0384,
  ep_Q2_008_partial_29_0385,
  ep_Q2_008_partial_29_0386,
  ep_Q2_008_partial_29_0387,
  ep_Q2_008_partial_29_0388,
  ep_Q2_008_partial_29_0389,
  ep_Q2_008_partial_29_0390,
  ep_Q2_008_partial_29_0391,
  ep_Q2_008_partial_29_0392,
  ep_Q2_008_partial_29_0393,
  ep_Q2_008_partial_29_0394,
  ep_Q2_008_partial_29_0395,
  ep_Q2_008_partial_29_0396,
  ep_Q2_008_partial_29_0397,
  ep_Q2_008_partial_29_0398,
  ep_Q2_008_partial_29_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_29_0300_0399 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-318807011044220460169400651017669756187475 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-325995519667405719847789866845345356800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 3), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-919594861613583750 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-919594861613583750 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 3), (16, 1)],
  term ((9536176493959289733 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((328182339016992600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((327204667826429774732033641193313373755375 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((325995519667405719847789866845345356800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-164091169508496300 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((304740743372921700 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-169376973655670247744537608156715878400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-164091169508496300 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 3), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 4), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-10026108372918169589090928669392207817121200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-120671854903320377733 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((5013054186459084794545464334696103908560600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((120671854903320377733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-120671854903320377733 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10026108372918169589090928669392207817121200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((120671854903320377733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((4825157240550577890251688245429674533816600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 4), (16, 1)],
  term ((-162009268580584914355101754438999601234400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-155349436721667908625 : Rat) / 1385912907228352718) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27202446427641414177547798975523959897127400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((12198264265091619512238022431234819243750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((1840621661788967089403479791284888985600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((38816249744893500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-88591129797359136861865607988732221461725 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-77632499489787000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((81004634290292457177550877219499800617200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((155349436721667908625 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2068629126325446269059588109957391129600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13601223213820707088773899487761979948563700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((88591129797359136861865607988732221461725 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((38816249744893500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-88591129797359136861865607988732221461725 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37732877710811599354799159186539076295915525 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-162009268580584914355101754438999601234400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-27121441793351121720370248098304460096510200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((155349436721667908625 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((12441242053757309253088271099232823464035700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((8283086311840601848355877934927794739200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 5), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 6), (15, 1), (16, 1)],
  term ((-2062803814349319000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-840840044332819500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-12311804347091546733 : Rat) / 1385912907228352718) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-840840044332819500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((12311804347091546733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (12, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 3), (16, 1)],
  term ((-12311804347091546733 : Rat) / 1385912907228352718) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2062803814349319000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((12311804347091546733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (13, 2), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 3), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 4), (15, 2), (16, 1)],
  term ((7047346425888664880002338382015066080654210 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182928543506868300542457190101531544442400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((16781544750335901405 : Rat) / 1385912907228352718) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-8598500916419662937312793322458805516800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5814918488637908210002889155082808867055521 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((62650008611922924681 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3523673212944332440001169191007533040327105 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((91464271753434150271228595050765772221200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-16781544750335901405 : Rat) / 2771825814456705436) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((4299250458209831468656396661229402758400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 5543651628913410872) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-5814918488637908210002889155082808867055521 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-62650008611922924681 : Rat) / 11087303257826821744) [(4, 1), (12, 2), (16, 1)],
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 3), (16, 1)],
  term ((62650008611922924681 : Rat) / 5543651628913410872) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((5814918488637908210002889155082808867055521 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((22374467214916751310006464372977455455561319 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 4), (16, 1)],
  term ((-62650008611922924681 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (16, 1)],
  term ((-172569788053240338462775393390917059046345 : Rat) / 5817503512114810875025545802033898437862) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-188376176807078150966764611037618086861600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 3), (16, 1)],
  term ((82865770837014487333915801728306966704400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 4), (15, 2), (16, 1)],
  term ((-16781544750335901405 : Rat) / 2771825814456705436) [(4, 1), (13, 4), (16, 1)],
  term ((4299250458209831468656396661229402758400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 5), (15, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (12, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (13, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((145641162034374237776713309953062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72820581017187118888356654976531200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-86118515737047828202827774583310400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-72820581017187118888356654976531200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-26381371073182535157 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((26381371073182535157 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26381371073182535157 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26381371073182535157 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 4), (16, 1)],
  term ((64099216594865602719 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13110279805848179982639806999982945696327540 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 3), (16, 1)],
  term ((-3476948304762521726553956141469699473346363 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-64099216594865602719 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 2), (13, 3), (16, 1)],
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3476948304762521726553956141469699473346363 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 3), (13, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((-3476948304762521726553956141469699473346363 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1196145421590106065921597372103426774501731 : Rat) / 23270014048459243500102183208135593751448) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-64099216594865602719 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 4), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 5), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 5), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((44420941355493493715799620780899897334103 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((25561459662102187782 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3622194517148310505459649912754796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44420941355493493715799620780899897334103 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12780729831051093891 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((25561459662102187782 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((44420941355493493715799620780899897334103 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12780729831051093891 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-62938899345770628388099113133717125876422775 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((7502552735828434690306086147533990400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((-2202294158723335268832325141620614400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 4), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 5), (15, 1), (16, 1)],
  term ((110099225653273480914952990275110400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-55049612826636740457476495137555200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1484441283807928656474021351640281600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((110099225653273480914952990275110400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-55049612826636740457476495137555200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((-37817198755804077045729104409984442785303 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-33582539150706894141 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((539835791161152145998361966603459200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8632018930030119537623276306390726400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-274757588541005844411 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-10437915690668211400745626807165759453232409 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((33582539150706894141 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-167355265735023328585336265258127552000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((31580430534786434283420932286233123864913045 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((12512377148710243722469712541169920000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((-43420828019282493519 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (13, 4), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((200609997732872112877685804364076800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((282742181714058376671 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10437907863049239564039509830917243703074009 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2617299799112013939798796204701859366086828 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((4469129242829623957511346863747328000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((86841656038564987038 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((1145601425547423202278864303983260800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((116033319246126057069 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((85262836887245482575934519553669827200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((539835791161152145998361966603459200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-33582539150706894141 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-100304998866436056438842902182038400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-282742181714058376671 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-3170408039467636566532773849212102400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10437907863049239564039509830917243703074009 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2234564621414811978755673431873664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 2), (15, 2), (16, 1)],
  term ((-43420828019282493519 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 3), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((42690950048753730273 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 3), (14, 1), (16, 1)],
  term ((-269917895580576072999180983301729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (15, 2), (16, 1)],
  term ((33582539150706894141 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 3), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 4), (13, 1), (15, 1), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 4), (16, 1)],
  term ((282742181714058376671 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((200609997732872112877685804364076800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-37820107600771203691365830854147721898903 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-282742181714058376671 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-16704254021969224054624752300425466472932834 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-8502937079264212697929883145378528000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-163039256270008268816524627104932188800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((274757588541005844411 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (13, 4), (16, 1)],
  term ((83677632867511664292668132629063776000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1650519059261435829446246845408166400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((1079101654807102297536945705858547200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-461237401672921185637844148547968000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((922474803345842371275688297095936000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-461237401672921185637844148547968000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 300 through 399. -/
theorem ep_Q2_008_block_29_0300_0399_valid :
    checkProductSumEq ep_Q2_008_partials_29_0300_0399
      ep_Q2_008_block_29_0300_0399 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
