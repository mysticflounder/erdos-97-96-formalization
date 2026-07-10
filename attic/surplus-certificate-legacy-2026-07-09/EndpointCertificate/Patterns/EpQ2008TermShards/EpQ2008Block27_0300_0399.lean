/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0300 : Poly :=
[
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 27. -/
def ep_Q2_008_partial_27_0300 : Poly :=
[
  term ((-25891905370046625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 27. -/
theorem ep_Q2_008_partial_27_0300_valid :
    mulPoly ep_Q2_008_coefficient_27_0300
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0301 : Poly :=
[
  term ((2389372865588389950254528268723460800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 27. -/
def ep_Q2_008_partial_27_0301 : Poly :=
[
  term ((4778745731176779900509056537446921600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2389372865588389950254528268723460800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 27. -/
theorem ep_Q2_008_partial_27_0301_valid :
    mulPoly ep_Q2_008_coefficient_27_0301
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0302 : Poly :=
[
  term ((4744206808436961099 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 302 for generator 27. -/
def ep_Q2_008_partial_27_0302 : Poly :=
[
  term ((4744206808436961099 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4744206808436961099 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 27. -/
theorem ep_Q2_008_partial_27_0302_valid :
    mulPoly ep_Q2_008_coefficient_27_0302
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0303 : Poly :=
[
  term ((47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 27. -/
def ep_Q2_008_partial_27_0303 : Poly :=
[
  term ((95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 27. -/
theorem ep_Q2_008_partial_27_0303_valid :
    mulPoly ep_Q2_008_coefficient_27_0303
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0304 : Poly :=
[
  term ((-147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 27. -/
def ep_Q2_008_partial_27_0304 : Poly :=
[
  term ((-295590437569487961233639991988300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 27. -/
theorem ep_Q2_008_partial_27_0304_valid :
    mulPoly ep_Q2_008_coefficient_27_0304
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0305 : Poly :=
[
  term ((-6986928998826554805 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 305 for generator 27. -/
def ep_Q2_008_partial_27_0305 : Poly :=
[
  term ((-6986928998826554805 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((6986928998826554805 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 27. -/
theorem ep_Q2_008_partial_27_0305_valid :
    mulPoly ep_Q2_008_coefficient_27_0305
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0306 : Poly :=
[
  term ((-2656508851257165795057296759919627610014513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 27. -/
def ep_Q2_008_partial_27_0306 : Poly :=
[
  term ((-2656508851257165795057296759919627610014513 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2656508851257165795057296759919627610014513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 27. -/
theorem ep_Q2_008_partial_27_0306_valid :
    mulPoly ep_Q2_008_coefficient_27_0306
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0307 : Poly :=
[
  term ((480796685728101444322437880027305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 307 for generator 27. -/
def ep_Q2_008_partial_27_0307 : Poly :=
[
  term ((961593371456202888644875760054611200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-480796685728101444322437880027305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 27. -/
theorem ep_Q2_008_partial_27_0307_valid :
    mulPoly ep_Q2_008_coefficient_27_0307
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0308 : Poly :=
[
  term ((-187441555900800119543040434348876488500915 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 27. -/
def ep_Q2_008_partial_27_0308 : Poly :=
[
  term ((-374883111801600239086080868697752977001830 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((187441555900800119543040434348876488500915 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 27. -/
theorem ep_Q2_008_partial_27_0308_valid :
    mulPoly ep_Q2_008_coefficient_27_0308
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0309 : Poly :=
[
  term ((3284450867379434607 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 309 for generator 27. -/
def ep_Q2_008_partial_27_0309 : Poly :=
[
  term ((3284450867379434607 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3284450867379434607 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 27. -/
theorem ep_Q2_008_partial_27_0309_valid :
    mulPoly ep_Q2_008_coefficient_27_0309
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0310 : Poly :=
[
  term ((16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 27. -/
def ep_Q2_008_partial_27_0310 : Poly :=
[
  term ((33180618982781375327757118439348064000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 27. -/
theorem ep_Q2_008_partial_27_0310_valid :
    mulPoly ep_Q2_008_coefficient_27_0310
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0311 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 311 for generator 27. -/
def ep_Q2_008_partial_27_0311 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 27. -/
theorem ep_Q2_008_partial_27_0311_valid :
    mulPoly ep_Q2_008_coefficient_27_0311
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0312 : Poly :=
[
  term ((-248309097547344245706848432973965072841787 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 27. -/
def ep_Q2_008_partial_27_0312 : Poly :=
[
  term ((-248309097547344245706848432973965072841787 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((248309097547344245706848432973965072841787 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 27. -/
theorem ep_Q2_008_partial_27_0312_valid :
    mulPoly ep_Q2_008_coefficient_27_0312
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0313 : Poly :=
[
  term ((-25502223610551969251 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 313 for generator 27. -/
def ep_Q2_008_partial_27_0313 : Poly :=
[
  term ((-25502223610551969251 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((25502223610551969251 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 27. -/
theorem ep_Q2_008_partial_27_0313_valid :
    mulPoly ep_Q2_008_coefficient_27_0313
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0314 : Poly :=
[
  term ((1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 27. -/
def ep_Q2_008_partial_27_0314 : Poly :=
[
  term ((2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 27. -/
theorem ep_Q2_008_partial_27_0314_valid :
    mulPoly ep_Q2_008_coefficient_27_0314
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0315 : Poly :=
[
  term ((33495582468249501163658967938918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 27. -/
def ep_Q2_008_partial_27_0315 : Poly :=
[
  term ((66991164936499002327317935877836800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33495582468249501163658967938918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 27. -/
theorem ep_Q2_008_partial_27_0315_valid :
    mulPoly ep_Q2_008_coefficient_27_0315
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0316 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 27. -/
def ep_Q2_008_partial_27_0316 : Poly :=
[
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 27. -/
theorem ep_Q2_008_partial_27_0316_valid :
    mulPoly ep_Q2_008_coefficient_27_0316
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0317 : Poly :=
[
  term ((222133921724121400498513653611270040699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 27. -/
def ep_Q2_008_partial_27_0317 : Poly :=
[
  term ((444267843448242800997027307222540081398630 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-222133921724121400498513653611270040699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 27. -/
theorem ep_Q2_008_partial_27_0317_valid :
    mulPoly ep_Q2_008_coefficient_27_0317
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0318 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 318 for generator 27. -/
def ep_Q2_008_partial_27_0318 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 27. -/
theorem ep_Q2_008_partial_27_0318_valid :
    mulPoly ep_Q2_008_coefficient_27_0318
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0319 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 27. -/
def ep_Q2_008_partial_27_0319 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 27. -/
theorem ep_Q2_008_partial_27_0319_valid :
    mulPoly ep_Q2_008_coefficient_27_0319
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0320 : Poly :=
[
  term ((197106059535537187787589436346638752422389 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 27. -/
def ep_Q2_008_partial_27_0320 : Poly :=
[
  term ((197106059535537187787589436346638752422389 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-197106059535537187787589436346638752422389 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 27. -/
theorem ep_Q2_008_partial_27_0320_valid :
    mulPoly ep_Q2_008_coefficient_27_0320
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0321 : Poly :=
[
  term ((24448544116696581235210886566348800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 321 for generator 27. -/
def ep_Q2_008_partial_27_0321 : Poly :=
[
  term ((48897088233393162470421773132697600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-24448544116696581235210886566348800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 27. -/
theorem ep_Q2_008_partial_27_0321_valid :
    mulPoly ep_Q2_008_coefficient_27_0321
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0322 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 322 for generator 27. -/
def ep_Q2_008_partial_27_0322 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 27. -/
theorem ep_Q2_008_partial_27_0322_valid :
    mulPoly ep_Q2_008_coefficient_27_0322
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0323 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (15, 2), (16, 1)]
]

/-- Partial product 323 for generator 27. -/
def ep_Q2_008_partial_27_0323 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (14, 1), (15, 2), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 27. -/
theorem ep_Q2_008_partial_27_0323_valid :
    mulPoly ep_Q2_008_coefficient_27_0323
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0324 : Poly :=
[
  term ((234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 324 for generator 27. -/
def ep_Q2_008_partial_27_0324 : Poly :=
[
  term ((469995660344778750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 27. -/
theorem ep_Q2_008_partial_27_0324_valid :
    mulPoly ep_Q2_008_coefficient_27_0324
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0325 : Poly :=
[
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 27. -/
def ep_Q2_008_partial_27_0325 : Poly :=
[
  term ((-234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 27. -/
theorem ep_Q2_008_partial_27_0325_valid :
    mulPoly ep_Q2_008_coefficient_27_0325
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0326 : Poly :=
[
  term ((37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 27. -/
def ep_Q2_008_partial_27_0326 : Poly :=
[
  term ((75135467655888909367688745185022516660600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 27. -/
theorem ep_Q2_008_partial_27_0326_valid :
    mulPoly ep_Q2_008_coefficient_27_0326
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0327 : Poly :=
[
  term ((-4380228660796789694230382606387524515150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 327 for generator 27. -/
def ep_Q2_008_partial_27_0327 : Poly :=
[
  term ((-8760457321593579388460765212775049030300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((4380228660796789694230382606387524515150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 27. -/
theorem ep_Q2_008_partial_27_0327_valid :
    mulPoly ep_Q2_008_coefficient_27_0327
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0328 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 328 for generator 27. -/
def ep_Q2_008_partial_27_0328 : Poly :=
[
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 27. -/
theorem ep_Q2_008_partial_27_0328_valid :
    mulPoly ep_Q2_008_coefficient_27_0328
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0329 : Poly :=
[
  term ((10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 329 for generator 27. -/
def ep_Q2_008_partial_27_0329 : Poly :=
[
  term ((20837939701755204000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 27. -/
theorem ep_Q2_008_partial_27_0329_valid :
    mulPoly ep_Q2_008_coefficient_27_0329
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0330 : Poly :=
[
  term ((-1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 330 for generator 27. -/
def ep_Q2_008_partial_27_0330 : Poly :=
[
  term ((-2067544998638029754313846828117248426184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 27. -/
theorem ep_Q2_008_partial_27_0330_valid :
    mulPoly ep_Q2_008_coefficient_27_0330
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0331 : Poly :=
[
  term ((4248773279509728375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 331 for generator 27. -/
def ep_Q2_008_partial_27_0331 : Poly :=
[
  term ((8497546559019456750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4248773279509728375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 27. -/
theorem ep_Q2_008_partial_27_0331_valid :
    mulPoly ep_Q2_008_coefficient_27_0331
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0332 : Poly :=
[
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 27. -/
def ep_Q2_008_partial_27_0332 : Poly :=
[
  term ((-608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 27. -/
theorem ep_Q2_008_partial_27_0332_valid :
    mulPoly ep_Q2_008_coefficient_27_0332
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0333 : Poly :=
[
  term ((45019733204907645853695746998902655758075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 27. -/
def ep_Q2_008_partial_27_0333 : Poly :=
[
  term ((45019733204907645853695746998902655758075 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45019733204907645853695746998902655758075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 27. -/
theorem ep_Q2_008_partial_27_0333_valid :
    mulPoly ep_Q2_008_coefficient_27_0333
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0334 : Poly :=
[
  term ((6941360425022499925825819486392138134400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 27. -/
def ep_Q2_008_partial_27_0334 : Poly :=
[
  term ((13882720850044999851651638972784276268800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6941360425022499925825819486392138134400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 27. -/
theorem ep_Q2_008_partial_27_0334_valid :
    mulPoly ep_Q2_008_coefficient_27_0334
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0335 : Poly :=
[
  term ((30969599139304956000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 335 for generator 27. -/
def ep_Q2_008_partial_27_0335 : Poly :=
[
  term ((61939198278609912000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-30969599139304956000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 27. -/
theorem ep_Q2_008_partial_27_0335_valid :
    mulPoly ep_Q2_008_coefficient_27_0335
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0336 : Poly :=
[
  term ((2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 27. -/
def ep_Q2_008_partial_27_0336 : Poly :=
[
  term ((5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 27. -/
theorem ep_Q2_008_partial_27_0336_valid :
    mulPoly ep_Q2_008_coefficient_27_0336
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0337 : Poly :=
[
  term ((-207456214280770125 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 337 for generator 27. -/
def ep_Q2_008_partial_27_0337 : Poly :=
[
  term ((-207456214280770125 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((207456214280770125 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 27. -/
theorem ep_Q2_008_partial_27_0337_valid :
    mulPoly ep_Q2_008_coefficient_27_0337
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0338 : Poly :=
[
  term ((109547733925558665238982947308267034015800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 27. -/
def ep_Q2_008_partial_27_0338 : Poly :=
[
  term ((219095467851117330477965894616534068031600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-109547733925558665238982947308267034015800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 27. -/
theorem ep_Q2_008_partial_27_0338_valid :
    mulPoly ep_Q2_008_coefficient_27_0338
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0339 : Poly :=
[
  term ((-2251070540899400428130005893102265632000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 339 for generator 27. -/
def ep_Q2_008_partial_27_0339 : Poly :=
[
  term ((-4502141081798800856260011786204531264000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2251070540899400428130005893102265632000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 27. -/
theorem ep_Q2_008_partial_27_0339_valid :
    mulPoly ep_Q2_008_coefficient_27_0339
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0340 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 27. -/
def ep_Q2_008_partial_27_0340 : Poly :=
[
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 27. -/
theorem ep_Q2_008_partial_27_0340_valid :
    mulPoly ep_Q2_008_coefficient_27_0340
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0341 : Poly :=
[
  term ((10720245855913254000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 341 for generator 27. -/
def ep_Q2_008_partial_27_0341 : Poly :=
[
  term ((21440491711826508000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-10720245855913254000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 27. -/
theorem ep_Q2_008_partial_27_0341_valid :
    mulPoly ep_Q2_008_coefficient_27_0341
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0342 : Poly :=
[
  term ((887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 27. -/
def ep_Q2_008_partial_27_0342 : Poly :=
[
  term ((1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 27. -/
theorem ep_Q2_008_partial_27_0342_valid :
    mulPoly ep_Q2_008_coefficient_27_0342
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0343 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 343 for generator 27. -/
def ep_Q2_008_partial_27_0343 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 27. -/
theorem ep_Q2_008_partial_27_0343_valid :
    mulPoly ep_Q2_008_coefficient_27_0343
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0344 : Poly :=
[
  term ((91619064408362469212274743712140367523875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 27. -/
def ep_Q2_008_partial_27_0344 : Poly :=
[
  term ((91619064408362469212274743712140367523875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-91619064408362469212274743712140367523875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 27. -/
theorem ep_Q2_008_partial_27_0344_valid :
    mulPoly ep_Q2_008_coefficient_27_0344
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0345 : Poly :=
[
  term ((-19274969785069125 : Rat) / 23895050124626771) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 345 for generator 27. -/
def ep_Q2_008_partial_27_0345 : Poly :=
[
  term ((-38549939570138250 : Rat) / 23895050124626771) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((19274969785069125 : Rat) / 23895050124626771) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 27. -/
theorem ep_Q2_008_partial_27_0345_valid :
    mulPoly ep_Q2_008_coefficient_27_0345
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0346 : Poly :=
[
  term ((-1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 346 for generator 27. -/
def ep_Q2_008_partial_27_0346 : Poly :=
[
  term ((-3914050489566017362445843304318888076800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 27. -/
theorem ep_Q2_008_partial_27_0346_valid :
    mulPoly ep_Q2_008_coefficient_27_0346
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0347 : Poly :=
[
  term ((-48748672533921967185 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 347 for generator 27. -/
def ep_Q2_008_partial_27_0347 : Poly :=
[
  term ((-48748672533921967185 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48748672533921967185 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 27. -/
theorem ep_Q2_008_partial_27_0347_valid :
    mulPoly ep_Q2_008_coefficient_27_0347
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0348 : Poly :=
[
  term ((47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 27. -/
def ep_Q2_008_partial_27_0348 : Poly :=
[
  term ((95656145159816542134619072728930847872000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 27. -/
theorem ep_Q2_008_partial_27_0348_valid :
    mulPoly ep_Q2_008_coefficient_27_0348
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0349 : Poly :=
[
  term ((-298866563054428146573751864435621484520150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 27. -/
def ep_Q2_008_partial_27_0349 : Poly :=
[
  term ((-597733126108856293147503728871242969040300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((298866563054428146573751864435621484520150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 27. -/
theorem ep_Q2_008_partial_27_0349_valid :
    mulPoly ep_Q2_008_coefficient_27_0349
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0350 : Poly :=
[
  term ((2497965466424768865463160654519426351550513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 350 for generator 27. -/
def ep_Q2_008_partial_27_0350 : Poly :=
[
  term ((2497965466424768865463160654519426351550513 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2497965466424768865463160654519426351550513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 27. -/
theorem ep_Q2_008_partial_27_0350_valid :
    mulPoly ep_Q2_008_coefficient_27_0350
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0351 : Poly :=
[
  term ((-23308638671110373457 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 351 for generator 27. -/
def ep_Q2_008_partial_27_0351 : Poly :=
[
  term ((-23308638671110373457 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((23308638671110373457 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 27. -/
theorem ep_Q2_008_partial_27_0351_valid :
    mulPoly ep_Q2_008_coefficient_27_0351
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0352 : Poly :=
[
  term ((10669200091379382918994071875855395344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 27. -/
def ep_Q2_008_partial_27_0352 : Poly :=
[
  term ((21338400182758765837988143751710790688000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10669200091379382918994071875855395344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 27. -/
theorem ep_Q2_008_partial_27_0352_valid :
    mulPoly ep_Q2_008_coefficient_27_0352
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0353 : Poly :=
[
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 353 for generator 27. -/
def ep_Q2_008_partial_27_0353 : Poly :=
[
  term ((-69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 27. -/
theorem ep_Q2_008_partial_27_0353_valid :
    mulPoly ep_Q2_008_coefficient_27_0353
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0354 : Poly :=
[
  term ((-1803914359136268410360349996333768437397923 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 27. -/
def ep_Q2_008_partial_27_0354 : Poly :=
[
  term ((-1803914359136268410360349996333768437397923 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1803914359136268410360349996333768437397923 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 27. -/
theorem ep_Q2_008_partial_27_0354_valid :
    mulPoly ep_Q2_008_coefficient_27_0354
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0355 : Poly :=
[
  term ((42823568215561658201166562492419483058800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 355 for generator 27. -/
def ep_Q2_008_partial_27_0355 : Poly :=
[
  term ((85647136431123316402333124984838966117600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-42823568215561658201166562492419483058800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 27. -/
theorem ep_Q2_008_partial_27_0355_valid :
    mulPoly ep_Q2_008_coefficient_27_0355
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0356 : Poly :=
[
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 27. -/
def ep_Q2_008_partial_27_0356 : Poly :=
[
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 27. -/
theorem ep_Q2_008_partial_27_0356_valid :
    mulPoly ep_Q2_008_coefficient_27_0356
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0357 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (16, 1)]
]

/-- Partial product 357 for generator 27. -/
def ep_Q2_008_partial_27_0357 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 27. -/
theorem ep_Q2_008_partial_27_0357_valid :
    mulPoly ep_Q2_008_coefficient_27_0357
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0358 : Poly :=
[
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(2, 1), (3, 2), (16, 1)]
]

/-- Partial product 358 for generator 27. -/
def ep_Q2_008_partial_27_0358 : Poly :=
[
  term ((1804205182183737225 : Rat) / 692956453614176359) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(2, 1), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 27. -/
theorem ep_Q2_008_partial_27_0358_valid :
    mulPoly ep_Q2_008_coefficient_27_0358
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0359 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 27. -/
def ep_Q2_008_partial_27_0359 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 27. -/
theorem ep_Q2_008_partial_27_0359_valid :
    mulPoly ep_Q2_008_coefficient_27_0359
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0360 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 360 for generator 27. -/
def ep_Q2_008_partial_27_0360 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 27. -/
theorem ep_Q2_008_partial_27_0360_valid :
    mulPoly ep_Q2_008_coefficient_27_0360
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0361 : Poly :=
[
  term ((-183182332336911912211947647612899200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 27. -/
def ep_Q2_008_partial_27_0361 : Poly :=
[
  term ((-366364664673823824423895295225798400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((183182332336911912211947647612899200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 27. -/
theorem ep_Q2_008_partial_27_0361_valid :
    mulPoly ep_Q2_008_coefficient_27_0361
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0362 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 362 for generator 27. -/
def ep_Q2_008_partial_27_0362 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 27. -/
theorem ep_Q2_008_partial_27_0362_valid :
    mulPoly ep_Q2_008_coefficient_27_0362
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0363 : Poly :=
[
  term ((96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 363 for generator 27. -/
def ep_Q2_008_partial_27_0363 : Poly :=
[
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 27. -/
theorem ep_Q2_008_partial_27_0363_valid :
    mulPoly ep_Q2_008_coefficient_27_0363
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0364 : Poly :=
[
  term ((225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 27. -/
def ep_Q2_008_partial_27_0364 : Poly :=
[
  term ((451786477680673938926876063542694400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 27. -/
theorem ep_Q2_008_partial_27_0364_valid :
    mulPoly ep_Q2_008_coefficient_27_0364
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0365 : Poly :=
[
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 27. -/
def ep_Q2_008_partial_27_0365 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 27. -/
theorem ep_Q2_008_partial_27_0365_valid :
    mulPoly ep_Q2_008_coefficient_27_0365
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0366 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 366 for generator 27. -/
def ep_Q2_008_partial_27_0366 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 27. -/
theorem ep_Q2_008_partial_27_0366_valid :
    mulPoly ep_Q2_008_coefficient_27_0366
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0367 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 27. -/
def ep_Q2_008_partial_27_0367 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 27. -/
theorem ep_Q2_008_partial_27_0367_valid :
    mulPoly ep_Q2_008_coefficient_27_0367
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0368 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 368 for generator 27. -/
def ep_Q2_008_partial_27_0368 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 27. -/
theorem ep_Q2_008_partial_27_0368_valid :
    mulPoly ep_Q2_008_coefficient_27_0368
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0369 : Poly :=
[
  term ((-12133278408592729461 : Rat) / 382320801994028336) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 369 for generator 27. -/
def ep_Q2_008_partial_27_0369 : Poly :=
[
  term ((-12133278408592729461 : Rat) / 191160400997014168) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((12133278408592729461 : Rat) / 382320801994028336) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 27. -/
theorem ep_Q2_008_partial_27_0369_valid :
    mulPoly ep_Q2_008_coefficient_27_0369
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0370 : Poly :=
[
  term ((16145958387756791961 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 27. -/
def ep_Q2_008_partial_27_0370 : Poly :=
[
  term ((32291916775513583922 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16145958387756791961 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 27. -/
theorem ep_Q2_008_partial_27_0370_valid :
    mulPoly ep_Q2_008_coefficient_27_0370
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0371 : Poly :=
[
  term ((37673902904765847909 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 371 for generator 27. -/
def ep_Q2_008_partial_27_0371 : Poly :=
[
  term ((75347805809531695818 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-37673902904765847909 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 27. -/
theorem ep_Q2_008_partial_27_0371_valid :
    mulPoly ep_Q2_008_coefficient_27_0371
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0372 : Poly :=
[
  term ((-12525414675047893253206982086047601171677117 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 27. -/
def ep_Q2_008_partial_27_0372 : Poly :=
[
  term ((-12525414675047893253206982086047601171677117 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((12525414675047893253206982086047601171677117 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 27. -/
theorem ep_Q2_008_partial_27_0372_valid :
    mulPoly ep_Q2_008_coefficient_27_0372
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0373 : Poly :=
[
  term ((71154552749323020910461639991627200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 373 for generator 27. -/
def ep_Q2_008_partial_27_0373 : Poly :=
[
  term ((142309105498646041820923279983254400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-71154552749323020910461639991627200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 27. -/
theorem ep_Q2_008_partial_27_0373_valid :
    mulPoly ep_Q2_008_coefficient_27_0373
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0374 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 27. -/
def ep_Q2_008_partial_27_0374 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 27. -/
theorem ep_Q2_008_partial_27_0374_valid :
    mulPoly ep_Q2_008_coefficient_27_0374
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0375 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 375 for generator 27. -/
def ep_Q2_008_partial_27_0375 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 27. -/
theorem ep_Q2_008_partial_27_0375_valid :
    mulPoly ep_Q2_008_coefficient_27_0375
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0376 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 376 for generator 27. -/
def ep_Q2_008_partial_27_0376 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 27. -/
theorem ep_Q2_008_partial_27_0376_valid :
    mulPoly ep_Q2_008_coefficient_27_0376
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0377 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 27. -/
def ep_Q2_008_partial_27_0377 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 27. -/
theorem ep_Q2_008_partial_27_0377_valid :
    mulPoly ep_Q2_008_coefficient_27_0377
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0378 : Poly :=
[
  term ((31647219708350243584522465033367092529733 : Rat) / 23270014048459243500102183208135593751448) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 27. -/
def ep_Q2_008_partial_27_0378 : Poly :=
[
  term ((31647219708350243584522465033367092529733 : Rat) / 11635007024229621750051091604067796875724) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31647219708350243584522465033367092529733 : Rat) / 23270014048459243500102183208135593751448) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 27. -/
theorem ep_Q2_008_partial_27_0378_valid :
    mulPoly ep_Q2_008_coefficient_27_0378
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0379 : Poly :=
[
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 379 for generator 27. -/
def ep_Q2_008_partial_27_0379 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 27. -/
theorem ep_Q2_008_partial_27_0379_valid :
    mulPoly ep_Q2_008_coefficient_27_0379
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0380 : Poly :=
[
  term ((-1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 380 for generator 27. -/
def ep_Q2_008_partial_27_0380 : Poly :=
[
  term ((-1203246973189179433531786288486998954033321 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 27. -/
theorem ep_Q2_008_partial_27_0380_valid :
    mulPoly ep_Q2_008_coefficient_27_0380
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0381 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 381 for generator 27. -/
def ep_Q2_008_partial_27_0381 : Poly :=
[
  term ((333483259973220000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 27. -/
theorem ep_Q2_008_partial_27_0381_valid :
    mulPoly ep_Q2_008_coefficient_27_0381
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0382 : Poly :=
[
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 382 for generator 27. -/
def ep_Q2_008_partial_27_0382 : Poly :=
[
  term ((796967334100975500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 27. -/
theorem ep_Q2_008_partial_27_0382_valid :
    mulPoly ep_Q2_008_coefficient_27_0382
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0383 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 27. -/
def ep_Q2_008_partial_27_0383 : Poly :=
[
  term ((-1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 27. -/
theorem ep_Q2_008_partial_27_0383_valid :
    mulPoly ep_Q2_008_coefficient_27_0383
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0384 : Poly :=
[
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 27. -/
def ep_Q2_008_partial_27_0384 : Poly :=
[
  term ((-117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 27. -/
theorem ep_Q2_008_partial_27_0384_valid :
    mulPoly ep_Q2_008_coefficient_27_0384
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0385 : Poly :=
[
  term ((-190561862841840000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 385 for generator 27. -/
def ep_Q2_008_partial_27_0385 : Poly :=
[
  term ((-381123725683680000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((190561862841840000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 27. -/
theorem ep_Q2_008_partial_27_0385_valid :
    mulPoly ep_Q2_008_coefficient_27_0385
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0386 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 386 for generator 27. -/
def ep_Q2_008_partial_27_0386 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 27. -/
theorem ep_Q2_008_partial_27_0386_valid :
    mulPoly ep_Q2_008_coefficient_27_0386
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0387 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 387 for generator 27. -/
def ep_Q2_008_partial_27_0387 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 27. -/
theorem ep_Q2_008_partial_27_0387_valid :
    mulPoly ep_Q2_008_coefficient_27_0387
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0388 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 27. -/
def ep_Q2_008_partial_27_0388 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 27. -/
theorem ep_Q2_008_partial_27_0388_valid :
    mulPoly ep_Q2_008_coefficient_27_0388
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0389 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 27. -/
def ep_Q2_008_partial_27_0389 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 27. -/
theorem ep_Q2_008_partial_27_0389_valid :
    mulPoly ep_Q2_008_coefficient_27_0389
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0390 : Poly :=
[
  term ((-88859959302246612600817057264776551901006 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 390 for generator 27. -/
def ep_Q2_008_partial_27_0390 : Poly :=
[
  term ((-177719918604493225201634114529553103802012 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((88859959302246612600817057264776551901006 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 27. -/
theorem ep_Q2_008_partial_27_0390_valid :
    mulPoly ep_Q2_008_coefficient_27_0390
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0391 : Poly :=
[
  term ((-33780521031056193195 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 391 for generator 27. -/
def ep_Q2_008_partial_27_0391 : Poly :=
[
  term ((-33780521031056193195 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((33780521031056193195 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 27. -/
theorem ep_Q2_008_partial_27_0391_valid :
    mulPoly ep_Q2_008_coefficient_27_0391
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0392 : Poly :=
[
  term ((-129933069857257559064736873314041190431109 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 27. -/
def ep_Q2_008_partial_27_0392 : Poly :=
[
  term ((-129933069857257559064736873314041190431109 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((129933069857257559064736873314041190431109 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 27. -/
theorem ep_Q2_008_partial_27_0392_valid :
    mulPoly ep_Q2_008_coefficient_27_0392
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0393 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 393 for generator 27. -/
def ep_Q2_008_partial_27_0393 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 27. -/
theorem ep_Q2_008_partial_27_0393_valid :
    mulPoly ep_Q2_008_coefficient_27_0393
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0394 : Poly :=
[
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 394 for generator 27. -/
def ep_Q2_008_partial_27_0394 : Poly :=
[
  term ((-11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 27. -/
theorem ep_Q2_008_partial_27_0394_valid :
    mulPoly ep_Q2_008_coefficient_27_0394
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0395 : Poly :=
[
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 395 for generator 27. -/
def ep_Q2_008_partial_27_0395 : Poly :=
[
  term ((-2554572896850671361 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((2554572896850671361 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 27. -/
theorem ep_Q2_008_partial_27_0395_valid :
    mulPoly ep_Q2_008_coefficient_27_0395
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0396 : Poly :=
[
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 27. -/
def ep_Q2_008_partial_27_0396 : Poly :=
[
  term ((-25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 27. -/
theorem ep_Q2_008_partial_27_0396_valid :
    mulPoly ep_Q2_008_coefficient_27_0396
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0397 : Poly :=
[
  term ((1348244537930017183337437300150026291337889 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 397 for generator 27. -/
def ep_Q2_008_partial_27_0397 : Poly :=
[
  term ((1348244537930017183337437300150026291337889 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1348244537930017183337437300150026291337889 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 27. -/
theorem ep_Q2_008_partial_27_0397_valid :
    mulPoly ep_Q2_008_coefficient_27_0397
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0398 : Poly :=
[
  term ((189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 398 for generator 27. -/
def ep_Q2_008_partial_27_0398 : Poly :=
[
  term ((379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 27. -/
theorem ep_Q2_008_partial_27_0398_valid :
    mulPoly ep_Q2_008_coefficient_27_0398
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0399 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 27. -/
def ep_Q2_008_partial_27_0399 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 27. -/
theorem ep_Q2_008_partial_27_0399_valid :
    mulPoly ep_Q2_008_coefficient_27_0399
        ep_Q2_008_generator_27_0300_0399 =
      ep_Q2_008_partial_27_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0300_0399 : List Poly :=
[
  ep_Q2_008_partial_27_0300,
  ep_Q2_008_partial_27_0301,
  ep_Q2_008_partial_27_0302,
  ep_Q2_008_partial_27_0303,
  ep_Q2_008_partial_27_0304,
  ep_Q2_008_partial_27_0305,
  ep_Q2_008_partial_27_0306,
  ep_Q2_008_partial_27_0307,
  ep_Q2_008_partial_27_0308,
  ep_Q2_008_partial_27_0309,
  ep_Q2_008_partial_27_0310,
  ep_Q2_008_partial_27_0311,
  ep_Q2_008_partial_27_0312,
  ep_Q2_008_partial_27_0313,
  ep_Q2_008_partial_27_0314,
  ep_Q2_008_partial_27_0315,
  ep_Q2_008_partial_27_0316,
  ep_Q2_008_partial_27_0317,
  ep_Q2_008_partial_27_0318,
  ep_Q2_008_partial_27_0319,
  ep_Q2_008_partial_27_0320,
  ep_Q2_008_partial_27_0321,
  ep_Q2_008_partial_27_0322,
  ep_Q2_008_partial_27_0323,
  ep_Q2_008_partial_27_0324,
  ep_Q2_008_partial_27_0325,
  ep_Q2_008_partial_27_0326,
  ep_Q2_008_partial_27_0327,
  ep_Q2_008_partial_27_0328,
  ep_Q2_008_partial_27_0329,
  ep_Q2_008_partial_27_0330,
  ep_Q2_008_partial_27_0331,
  ep_Q2_008_partial_27_0332,
  ep_Q2_008_partial_27_0333,
  ep_Q2_008_partial_27_0334,
  ep_Q2_008_partial_27_0335,
  ep_Q2_008_partial_27_0336,
  ep_Q2_008_partial_27_0337,
  ep_Q2_008_partial_27_0338,
  ep_Q2_008_partial_27_0339,
  ep_Q2_008_partial_27_0340,
  ep_Q2_008_partial_27_0341,
  ep_Q2_008_partial_27_0342,
  ep_Q2_008_partial_27_0343,
  ep_Q2_008_partial_27_0344,
  ep_Q2_008_partial_27_0345,
  ep_Q2_008_partial_27_0346,
  ep_Q2_008_partial_27_0347,
  ep_Q2_008_partial_27_0348,
  ep_Q2_008_partial_27_0349,
  ep_Q2_008_partial_27_0350,
  ep_Q2_008_partial_27_0351,
  ep_Q2_008_partial_27_0352,
  ep_Q2_008_partial_27_0353,
  ep_Q2_008_partial_27_0354,
  ep_Q2_008_partial_27_0355,
  ep_Q2_008_partial_27_0356,
  ep_Q2_008_partial_27_0357,
  ep_Q2_008_partial_27_0358,
  ep_Q2_008_partial_27_0359,
  ep_Q2_008_partial_27_0360,
  ep_Q2_008_partial_27_0361,
  ep_Q2_008_partial_27_0362,
  ep_Q2_008_partial_27_0363,
  ep_Q2_008_partial_27_0364,
  ep_Q2_008_partial_27_0365,
  ep_Q2_008_partial_27_0366,
  ep_Q2_008_partial_27_0367,
  ep_Q2_008_partial_27_0368,
  ep_Q2_008_partial_27_0369,
  ep_Q2_008_partial_27_0370,
  ep_Q2_008_partial_27_0371,
  ep_Q2_008_partial_27_0372,
  ep_Q2_008_partial_27_0373,
  ep_Q2_008_partial_27_0374,
  ep_Q2_008_partial_27_0375,
  ep_Q2_008_partial_27_0376,
  ep_Q2_008_partial_27_0377,
  ep_Q2_008_partial_27_0378,
  ep_Q2_008_partial_27_0379,
  ep_Q2_008_partial_27_0380,
  ep_Q2_008_partial_27_0381,
  ep_Q2_008_partial_27_0382,
  ep_Q2_008_partial_27_0383,
  ep_Q2_008_partial_27_0384,
  ep_Q2_008_partial_27_0385,
  ep_Q2_008_partial_27_0386,
  ep_Q2_008_partial_27_0387,
  ep_Q2_008_partial_27_0388,
  ep_Q2_008_partial_27_0389,
  ep_Q2_008_partial_27_0390,
  ep_Q2_008_partial_27_0391,
  ep_Q2_008_partial_27_0392,
  ep_Q2_008_partial_27_0393,
  ep_Q2_008_partial_27_0394,
  ep_Q2_008_partial_27_0395,
  ep_Q2_008_partial_27_0396,
  ep_Q2_008_partial_27_0397,
  ep_Q2_008_partial_27_0398,
  ep_Q2_008_partial_27_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0300_0399 : Poly :=
[
  term ((-25891905370046625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4778745731176779900509056537446921600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2389372865588389950254528268723460800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4744206808436961099 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4744206808436961099 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-295590437569487961233639991988300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6986928998826554805 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((6986928998826554805 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2656508851257165795057296759919627610014513 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((961593371456202888644875760054611200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2656508851257165795057296759919627610014513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-480796685728101444322437880027305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-374883111801600239086080868697752977001830 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((3284450867379434607 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((187441555900800119543040434348876488500915 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3284450867379434607 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((33180618982781375327757118439348064000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-248309097547344245706848432973965072841787 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25502223610551969251 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((248309097547344245706848432973965072841787 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((25502223610551969251 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((66991164936499002327317935877836800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33495582468249501163658967938918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((444267843448242800997027307222540081398630 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-222133921724121400498513653611270040699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((197106059535537187787589436346638752422389 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((48897088233393162470421773132697600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-197106059535537187787589436346638752422389 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-24448544116696581235210886566348800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (14, 1), (15, 2), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (15, 2), (16, 1)],
  term ((469995660344778750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((75135467655888909367688745185022516660600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8760457321593579388460765212775049030300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((4380228660796789694230382606387524515150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((20837939701755204000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2067544998638029754313846828117248426184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8497546559019456750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4248773279509728375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((45019733204907645853695746998902655758075 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45019733204907645853695746998902655758075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((13882720850044999851651638972784276268800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6941360425022499925825819486392138134400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((61939198278609912000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-30969599139304956000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-207456214280770125 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((207456214280770125 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((219095467851117330477965894616534068031600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4502141081798800856260011786204531264000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-109547733925558665238982947308267034015800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2251070540899400428130005893102265632000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((21440491711826508000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10720245855913254000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((91619064408362469212274743712140367523875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-38549939570138250 : Rat) / 23895050124626771) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-91619064408362469212274743712140367523875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((19274969785069125 : Rat) / 23895050124626771) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-3914050489566017362445843304318888076800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48748672533921967185 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((48748672533921967185 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((95656145159816542134619072728930847872000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-597733126108856293147503728871242969040300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((298866563054428146573751864435621484520150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2497965466424768865463160654519426351550513 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23308638671110373457 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2497965466424768865463160654519426351550513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((23308638671110373457 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((21338400182758765837988143751710790688000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-10669200091379382918994071875855395344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1803914359136268410360349996333768437397923 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((85647136431123316402333124984838966117600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((1803914359136268410360349996333768437397923 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-42823568215561658201166562492419483058800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(2, 1), (3, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-366364664673823824423895295225798400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((183182332336911912211947647612899200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((451786477680673938926876063542694400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12133278408592729461 : Rat) / 191160400997014168) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((12133278408592729461 : Rat) / 382320801994028336) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((32291916775513583922 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16145958387756791961 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((75347805809531695818 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-37673902904765847909 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-12525414675047893253206982086047601171677117 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((12525414675047893253206982086047601171677117 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((142309105498646041820923279983254400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-71154552749323020910461639991627200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((31647219708350243584522465033367092529733 : Rat) / 11635007024229621750051091604067796875724) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31647219708350243584522465033367092529733 : Rat) / 23270014048459243500102183208135593751448) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1203246973189179433531786288486998954033321 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((333483259973220000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((796967334100975500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-381123725683680000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((190561862841840000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-177719918604493225201634114529553103802012 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33780521031056193195 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((88859959302246612600817057264776551901006 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((33780521031056193195 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-129933069857257559064736873314041190431109 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((129933069857257559064736873314041190431109 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((2554572896850671361 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((1348244537930017183337437300150026291337889 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1348244537930017183337437300150026291337889 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 300 through 399. -/
theorem ep_Q2_008_block_27_0300_0399_valid :
    checkProductSumEq ep_Q2_008_partials_27_0300_0399
      ep_Q2_008_block_27_0300_0399 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
