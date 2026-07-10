/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 28:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_28_0300_0399 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0300 : Poly :=
[
  term ((-35099491895623971963 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 300 for generator 28. -/
def ep_Q2_008_partial_28_0300 : Poly :=
[
  term ((-35099491895623971963 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((35099491895623971963 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-35099491895623971963 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((35099491895623971963 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 28. -/
theorem ep_Q2_008_partial_28_0300_valid :
    mulPoly ep_Q2_008_coefficient_28_0300
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0301 : Poly :=
[
  term ((-495142723891208286804 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 28. -/
def ep_Q2_008_partial_28_0301 : Poly :=
[
  term ((-990285447782416573608 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((495142723891208286804 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-990285447782416573608 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((495142723891208286804 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 28. -/
theorem ep_Q2_008_partial_28_0301_valid :
    mulPoly ep_Q2_008_coefficient_28_0301
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0302 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 302 for generator 28. -/
def ep_Q2_008_partial_28_0302 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 28. -/
theorem ep_Q2_008_partial_28_0302_valid :
    mulPoly ep_Q2_008_coefficient_28_0302
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0303 : Poly :=
[
  term ((4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 28. -/
def ep_Q2_008_partial_28_0303 : Poly :=
[
  term ((4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 28. -/
theorem ep_Q2_008_partial_28_0303_valid :
    mulPoly ep_Q2_008_coefficient_28_0303
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0304 : Poly :=
[
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 28. -/
def ep_Q2_008_partial_28_0304 : Poly :=
[
  term ((73184078093812012992624658245964800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((73184078093812012992624658245964800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 28. -/
theorem ep_Q2_008_partial_28_0304_valid :
    mulPoly ep_Q2_008_coefficient_28_0304
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0305 : Poly :=
[
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 28. -/
def ep_Q2_008_partial_28_0305 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 28. -/
theorem ep_Q2_008_partial_28_0305_valid :
    mulPoly ep_Q2_008_coefficient_28_0305
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0306 : Poly :=
[
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 306 for generator 28. -/
def ep_Q2_008_partial_28_0306 : Poly :=
[
  term ((-927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 28. -/
theorem ep_Q2_008_partial_28_0306_valid :
    mulPoly ep_Q2_008_coefficient_28_0306
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0307 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 28. -/
def ep_Q2_008_partial_28_0307 : Poly :=
[
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 28. -/
theorem ep_Q2_008_partial_28_0307_valid :
    mulPoly ep_Q2_008_coefficient_28_0307
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0308 : Poly :=
[
  term ((-160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 28. -/
def ep_Q2_008_partial_28_0308 : Poly :=
[
  term ((-321573143545605000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 28. -/
theorem ep_Q2_008_partial_28_0308_valid :
    mulPoly ep_Q2_008_coefficient_28_0308
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0309 : Poly :=
[
  term ((-2911945883479699446791177354939776347140967 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 28. -/
def ep_Q2_008_partial_28_0309 : Poly :=
[
  term ((-2911945883479699446791177354939776347140967 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2911945883479699446791177354939776347140967 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2911945883479699446791177354939776347140967 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((2911945883479699446791177354939776347140967 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 28. -/
theorem ep_Q2_008_partial_28_0309_valid :
    mulPoly ep_Q2_008_coefficient_28_0309
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0310 : Poly :=
[
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 28. -/
def ep_Q2_008_partial_28_0310 : Poly :=
[
  term ((3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 28. -/
theorem ep_Q2_008_partial_28_0310_valid :
    mulPoly ep_Q2_008_coefficient_28_0310
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0311 : Poly :=
[
  term ((-36496048422325152993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 311 for generator 28. -/
def ep_Q2_008_partial_28_0311 : Poly :=
[
  term ((-36496048422325152993 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((36496048422325152993 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-36496048422325152993 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((36496048422325152993 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 28. -/
theorem ep_Q2_008_partial_28_0311_valid :
    mulPoly ep_Q2_008_coefficient_28_0311
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0312 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 312 for generator 28. -/
def ep_Q2_008_partial_28_0312 : Poly :=
[
  term ((-333483259973220000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-333483259973220000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 28. -/
theorem ep_Q2_008_partial_28_0312_valid :
    mulPoly ep_Q2_008_coefficient_28_0312
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0313 : Poly :=
[
  term ((-398483667050487750 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 313 for generator 28. -/
def ep_Q2_008_partial_28_0313 : Poly :=
[
  term ((-796967334100975500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-796967334100975500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 28. -/
theorem ep_Q2_008_partial_28_0313_valid :
    mulPoly ep_Q2_008_coefficient_28_0313
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0314 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 28. -/
def ep_Q2_008_partial_28_0314 : Poly :=
[
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 28. -/
theorem ep_Q2_008_partial_28_0314_valid :
    mulPoly ep_Q2_008_coefficient_28_0314
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0315 : Poly :=
[
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 28. -/
def ep_Q2_008_partial_28_0315 : Poly :=
[
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 28. -/
theorem ep_Q2_008_partial_28_0315_valid :
    mulPoly ep_Q2_008_coefficient_28_0315
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0316 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 28. -/
def ep_Q2_008_partial_28_0316 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 28. -/
theorem ep_Q2_008_partial_28_0316_valid :
    mulPoly ep_Q2_008_coefficient_28_0316
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0317 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 317 for generator 28. -/
def ep_Q2_008_partial_28_0317 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 28. -/
theorem ep_Q2_008_partial_28_0317_valid :
    mulPoly ep_Q2_008_coefficient_28_0317
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0318 : Poly :=
[
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 28. -/
def ep_Q2_008_partial_28_0318 : Poly :=
[
  term ((44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 28. -/
theorem ep_Q2_008_partial_28_0318_valid :
    mulPoly ep_Q2_008_coefficient_28_0318
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0319 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 28. -/
def ep_Q2_008_partial_28_0319 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 28. -/
theorem ep_Q2_008_partial_28_0319_valid :
    mulPoly ep_Q2_008_coefficient_28_0319
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0320 : Poly :=
[
  term ((-1564087499603321373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 320 for generator 28. -/
def ep_Q2_008_partial_28_0320 : Poly :=
[
  term ((-1564087499603321373 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1564087499603321373 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1564087499603321373 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1564087499603321373 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 28. -/
theorem ep_Q2_008_partial_28_0320_valid :
    mulPoly ep_Q2_008_coefficient_28_0320
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0321 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 321 for generator 28. -/
def ep_Q2_008_partial_28_0321 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 28. -/
theorem ep_Q2_008_partial_28_0321_valid :
    mulPoly ep_Q2_008_coefficient_28_0321
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0322 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 28. -/
def ep_Q2_008_partial_28_0322 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 28. -/
theorem ep_Q2_008_partial_28_0322_valid :
    mulPoly ep_Q2_008_coefficient_28_0322
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0323 : Poly :=
[
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 28. -/
def ep_Q2_008_partial_28_0323 : Poly :=
[
  term ((-65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 28. -/
theorem ep_Q2_008_partial_28_0323_valid :
    mulPoly ep_Q2_008_coefficient_28_0323
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0324 : Poly :=
[
  term ((-64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 324 for generator 28. -/
def ep_Q2_008_partial_28_0324 : Poly :=
[
  term ((-129638315426419023260420721572812800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-129638315426419023260420721572812800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 28. -/
theorem ep_Q2_008_partial_28_0324_valid :
    mulPoly ep_Q2_008_coefficient_28_0324
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0325 : Poly :=
[
  term ((29378465907533408541 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 325 for generator 28. -/
def ep_Q2_008_partial_28_0325 : Poly :=
[
  term ((29378465907533408541 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29378465907533408541 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((29378465907533408541 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29378465907533408541 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 28. -/
theorem ep_Q2_008_partial_28_0325_valid :
    mulPoly ep_Q2_008_coefficient_28_0325
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0326 : Poly :=
[
  term ((1021436643089486957304424128468610309740369 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 28. -/
def ep_Q2_008_partial_28_0326 : Poly :=
[
  term ((2042873286178973914608848256937220619480738 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1021436643089486957304424128468610309740369 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2042873286178973914608848256937220619480738 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1021436643089486957304424128468610309740369 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 28. -/
theorem ep_Q2_008_partial_28_0326_valid :
    mulPoly ep_Q2_008_coefficient_28_0326
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0327 : Poly :=
[
  term ((169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 327 for generator 28. -/
def ep_Q2_008_partial_28_0327 : Poly :=
[
  term ((339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 28. -/
theorem ep_Q2_008_partial_28_0327_valid :
    mulPoly ep_Q2_008_coefficient_28_0327
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0328 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 328 for generator 28. -/
def ep_Q2_008_partial_28_0328 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 28. -/
theorem ep_Q2_008_partial_28_0328_valid :
    mulPoly ep_Q2_008_coefficient_28_0328
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0329 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 28. -/
def ep_Q2_008_partial_28_0329 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 28. -/
theorem ep_Q2_008_partial_28_0329_valid :
    mulPoly ep_Q2_008_coefficient_28_0329
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0330 : Poly :=
[
  term ((-915920756818221133408373318915894597834215 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 28. -/
def ep_Q2_008_partial_28_0330 : Poly :=
[
  term ((-915920756818221133408373318915894597834215 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((915920756818221133408373318915894597834215 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-915920756818221133408373318915894597834215 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((915920756818221133408373318915894597834215 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 28. -/
theorem ep_Q2_008_partial_28_0330_valid :
    mulPoly ep_Q2_008_coefficient_28_0330
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0331 : Poly :=
[
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 331 for generator 28. -/
def ep_Q2_008_partial_28_0331 : Poly :=
[
  term ((-577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 4), (16, 1)],
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 28. -/
theorem ep_Q2_008_partial_28_0331_valid :
    mulPoly ep_Q2_008_coefficient_28_0331
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0332 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 28. -/
def ep_Q2_008_partial_28_0332 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 28. -/
theorem ep_Q2_008_partial_28_0332_valid :
    mulPoly ep_Q2_008_coefficient_28_0332
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0333 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 28. -/
def ep_Q2_008_partial_28_0333 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 28. -/
theorem ep_Q2_008_partial_28_0333_valid :
    mulPoly ep_Q2_008_coefficient_28_0333
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0334 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 28. -/
def ep_Q2_008_partial_28_0334 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 28. -/
theorem ep_Q2_008_partial_28_0334_valid :
    mulPoly ep_Q2_008_coefficient_28_0334
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0335 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 28. -/
def ep_Q2_008_partial_28_0335 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 28. -/
theorem ep_Q2_008_partial_28_0335_valid :
    mulPoly ep_Q2_008_coefficient_28_0335
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0336 : Poly :=
[
  term ((150487789722706159166953353545510400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 28. -/
def ep_Q2_008_partial_28_0336 : Poly :=
[
  term ((300975579445412318333906707091020800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-150487789722706159166953353545510400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((300975579445412318333906707091020800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-150487789722706159166953353545510400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 28. -/
theorem ep_Q2_008_partial_28_0336_valid :
    mulPoly ep_Q2_008_coefficient_28_0336
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0337 : Poly :=
[
  term ((4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 28. -/
def ep_Q2_008_partial_28_0337 : Poly :=
[
  term ((9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 28. -/
theorem ep_Q2_008_partial_28_0337_valid :
    mulPoly ep_Q2_008_coefficient_28_0337
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0338 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 28. -/
def ep_Q2_008_partial_28_0338 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 28. -/
theorem ep_Q2_008_partial_28_0338_valid :
    mulPoly ep_Q2_008_coefficient_28_0338
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0339 : Poly :=
[
  term ((142692796857305652264317283434323200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 339 for generator 28. -/
def ep_Q2_008_partial_28_0339 : Poly :=
[
  term ((285385593714611304528634566868646400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-142692796857305652264317283434323200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((285385593714611304528634566868646400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 3), (16, 1)],
  term ((-142692796857305652264317283434323200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 28. -/
theorem ep_Q2_008_partial_28_0339_valid :
    mulPoly ep_Q2_008_coefficient_28_0339
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0340 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 28. -/
def ep_Q2_008_partial_28_0340 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 28. -/
theorem ep_Q2_008_partial_28_0340_valid :
    mulPoly ep_Q2_008_coefficient_28_0340
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0341 : Poly :=
[
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 341 for generator 28. -/
def ep_Q2_008_partial_28_0341 : Poly :=
[
  term ((-2669859283589517375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2669859283589517375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 28. -/
theorem ep_Q2_008_partial_28_0341_valid :
    mulPoly ep_Q2_008_coefficient_28_0341
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0342 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 28. -/
def ep_Q2_008_partial_28_0342 : Poly :=
[
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 28. -/
theorem ep_Q2_008_partial_28_0342_valid :
    mulPoly ep_Q2_008_coefficient_28_0342
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0343 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 28. -/
def ep_Q2_008_partial_28_0343 : Poly :=
[
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 28. -/
theorem ep_Q2_008_partial_28_0343_valid :
    mulPoly ep_Q2_008_coefficient_28_0343
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0344 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 344 for generator 28. -/
def ep_Q2_008_partial_28_0344 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 28. -/
theorem ep_Q2_008_partial_28_0344_valid :
    mulPoly ep_Q2_008_coefficient_28_0344
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0345 : Poly :=
[
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 28. -/
def ep_Q2_008_partial_28_0345 : Poly :=
[
  term ((-28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 28. -/
theorem ep_Q2_008_partial_28_0345_valid :
    mulPoly ep_Q2_008_coefficient_28_0345
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0346 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 346 for generator 28. -/
def ep_Q2_008_partial_28_0346 : Poly :=
[
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 28. -/
theorem ep_Q2_008_partial_28_0346_valid :
    mulPoly ep_Q2_008_coefficient_28_0346
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0347 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 347 for generator 28. -/
def ep_Q2_008_partial_28_0347 : Poly :=
[
  term ((2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 28. -/
theorem ep_Q2_008_partial_28_0347_valid :
    mulPoly ep_Q2_008_coefficient_28_0347
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0348 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 28. -/
def ep_Q2_008_partial_28_0348 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 28. -/
theorem ep_Q2_008_partial_28_0348_valid :
    mulPoly ep_Q2_008_coefficient_28_0348
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0349 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 349 for generator 28. -/
def ep_Q2_008_partial_28_0349 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 28. -/
theorem ep_Q2_008_partial_28_0349_valid :
    mulPoly ep_Q2_008_coefficient_28_0349
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0350 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 350 for generator 28. -/
def ep_Q2_008_partial_28_0350 : Poly :=
[
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 28. -/
theorem ep_Q2_008_partial_28_0350_valid :
    mulPoly ep_Q2_008_coefficient_28_0350
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0351 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 351 for generator 28. -/
def ep_Q2_008_partial_28_0351 : Poly :=
[
  term ((2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 28. -/
theorem ep_Q2_008_partial_28_0351_valid :
    mulPoly ep_Q2_008_coefficient_28_0351
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0352 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 28. -/
def ep_Q2_008_partial_28_0352 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 28. -/
theorem ep_Q2_008_partial_28_0352_valid :
    mulPoly ep_Q2_008_coefficient_28_0352
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0353 : Poly :=
[
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 28. -/
def ep_Q2_008_partial_28_0353 : Poly :=
[
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 28. -/
theorem ep_Q2_008_partial_28_0353_valid :
    mulPoly ep_Q2_008_coefficient_28_0353
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0354 : Poly :=
[
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 354 for generator 28. -/
def ep_Q2_008_partial_28_0354 : Poly :=
[
  term ((919594861613583750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((919594861613583750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 28. -/
theorem ep_Q2_008_partial_28_0354_valid :
    mulPoly ep_Q2_008_coefficient_28_0354
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0355 : Poly :=
[
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 28. -/
def ep_Q2_008_partial_28_0355 : Poly :=
[
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 28. -/
theorem ep_Q2_008_partial_28_0355_valid :
    mulPoly ep_Q2_008_coefficient_28_0355
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0356 : Poly :=
[
  term ((-9536176493959289733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 356 for generator 28. -/
def ep_Q2_008_partial_28_0356 : Poly :=
[
  term ((-9536176493959289733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9536176493959289733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9536176493959289733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 28. -/
theorem ep_Q2_008_partial_28_0356_valid :
    mulPoly ep_Q2_008_coefficient_28_0356
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0357 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 28. -/
def ep_Q2_008_partial_28_0357 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 28. -/
theorem ep_Q2_008_partial_28_0357_valid :
    mulPoly ep_Q2_008_coefficient_28_0357
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0358 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 358 for generator 28. -/
def ep_Q2_008_partial_28_0358 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 28. -/
theorem ep_Q2_008_partial_28_0358_valid :
    mulPoly ep_Q2_008_coefficient_28_0358
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0359 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 28. -/
def ep_Q2_008_partial_28_0359 : Poly :=
[
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 28. -/
theorem ep_Q2_008_partial_28_0359_valid :
    mulPoly ep_Q2_008_coefficient_28_0359
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0360 : Poly :=
[
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 28. -/
def ep_Q2_008_partial_28_0360 : Poly :=
[
  term ((44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 28. -/
theorem ep_Q2_008_partial_28_0360_valid :
    mulPoly ep_Q2_008_coefficient_28_0360
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0361 : Poly :=
[
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 28. -/
def ep_Q2_008_partial_28_0361 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 28. -/
theorem ep_Q2_008_partial_28_0361_valid :
    mulPoly ep_Q2_008_coefficient_28_0361
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0362 : Poly :=
[
  term ((-164091169508496300 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 362 for generator 28. -/
def ep_Q2_008_partial_28_0362 : Poly :=
[
  term ((-328182339016992600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((164091169508496300 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-328182339016992600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((164091169508496300 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 28. -/
theorem ep_Q2_008_partial_28_0362_valid :
    mulPoly ep_Q2_008_coefficient_28_0362
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0363 : Poly :=
[
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 28. -/
def ep_Q2_008_partial_28_0363 : Poly :=
[
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 28. -/
theorem ep_Q2_008_partial_28_0363_valid :
    mulPoly ep_Q2_008_coefficient_28_0363
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0364 : Poly :=
[
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 28. -/
def ep_Q2_008_partial_28_0364 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 28. -/
theorem ep_Q2_008_partial_28_0364_valid :
    mulPoly ep_Q2_008_coefficient_28_0364
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0365 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 365 for generator 28. -/
def ep_Q2_008_partial_28_0365 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 28. -/
theorem ep_Q2_008_partial_28_0365_valid :
    mulPoly ep_Q2_008_coefficient_28_0365
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0366 : Poly :=
[
  term ((5015570882626945941286342549207980302256600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 28. -/
def ep_Q2_008_partial_28_0366 : Poly :=
[
  term ((10031141765253891882572685098415960604513200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5015570882626945941286342549207980302256600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10031141765253891882572685098415960604513200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5015570882626945941286342549207980302256600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 28. -/
theorem ep_Q2_008_partial_28_0366_valid :
    mulPoly ep_Q2_008_coefficient_28_0366
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0367 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 367 for generator 28. -/
def ep_Q2_008_partial_28_0367 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 28. -/
theorem ep_Q2_008_partial_28_0367_valid :
    mulPoly ep_Q2_008_coefficient_28_0367
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0368 : Poly :=
[
  term ((22952944099346234733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 368 for generator 28. -/
def ep_Q2_008_partial_28_0368 : Poly :=
[
  term ((22952944099346234733 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-22952944099346234733 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((22952944099346234733 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22952944099346234733 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 28. -/
theorem ep_Q2_008_partial_28_0368_valid :
    mulPoly ep_Q2_008_coefficient_28_0368
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0369 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 369 for generator 28. -/
def ep_Q2_008_partial_28_0369 : Poly :=
[
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 28. -/
theorem ep_Q2_008_partial_28_0369_valid :
    mulPoly ep_Q2_008_coefficient_28_0369
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0370 : Poly :=
[
  term ((38816249744893500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 370 for generator 28. -/
def ep_Q2_008_partial_28_0370 : Poly :=
[
  term ((77632499489787000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((77632499489787000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 28. -/
theorem ep_Q2_008_partial_28_0370_valid :
    mulPoly ep_Q2_008_coefficient_28_0370
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0371 : Poly :=
[
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 28. -/
def ep_Q2_008_partial_28_0371 : Poly :=
[
  term ((-2068629126325446269059588109957391129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2068629126325446269059588109957391129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 28. -/
theorem ep_Q2_008_partial_28_0371_valid :
    mulPoly ep_Q2_008_coefficient_28_0371
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0372 : Poly :=
[
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 28. -/
def ep_Q2_008_partial_28_0372 : Poly :=
[
  term ((43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 28. -/
theorem ep_Q2_008_partial_28_0372_valid :
    mulPoly ep_Q2_008_coefficient_28_0372
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0373 : Poly :=
[
  term ((81118638022560696767378931378836051689200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 373 for generator 28. -/
def ep_Q2_008_partial_28_0373 : Poly :=
[
  term ((162237276045121393534757862757672103378400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81118638022560696767378931378836051689200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((162237276045121393534757862757672103378400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-81118638022560696767378931378836051689200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 28. -/
theorem ep_Q2_008_partial_28_0373_valid :
    mulPoly ep_Q2_008_coefficient_28_0373
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0374 : Poly :=
[
  term ((-1355858966349349875 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 374 for generator 28. -/
def ep_Q2_008_partial_28_0374 : Poly :=
[
  term ((-1355858966349349875 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1355858966349349875 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1355858966349349875 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1355858966349349875 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 28. -/
theorem ep_Q2_008_partial_28_0374_valid :
    mulPoly ep_Q2_008_coefficient_28_0374
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0375 : Poly :=
[
  term ((13511661807461021905240294212247129528557300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 28. -/
def ep_Q2_008_partial_28_0375 : Poly :=
[
  term ((27023323614922043810480588424494259057114600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13511661807461021905240294212247129528557300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((27023323614922043810480588424494259057114600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13511661807461021905240294212247129528557300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 28. -/
theorem ep_Q2_008_partial_28_0375_valid :
    mulPoly ep_Q2_008_coefficient_28_0375
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0376 : Poly :=
[
  term ((9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 376 for generator 28. -/
def ep_Q2_008_partial_28_0376 : Poly :=
[
  term ((18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 28. -/
theorem ep_Q2_008_partial_28_0376_valid :
    mulPoly ep_Q2_008_coefficient_28_0376
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0377 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 377 for generator 28. -/
def ep_Q2_008_partial_28_0377 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 28. -/
theorem ep_Q2_008_partial_28_0377_valid :
    mulPoly ep_Q2_008_coefficient_28_0377
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0378 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 28. -/
def ep_Q2_008_partial_28_0378 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 28. -/
theorem ep_Q2_008_partial_28_0378_valid :
    mulPoly ep_Q2_008_coefficient_28_0378
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0379 : Poly :=
[
  term ((52834293516358971463561722448968200252625 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 28. -/
def ep_Q2_008_partial_28_0379 : Poly :=
[
  term ((52834293516358971463561722448968200252625 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52834293516358971463561722448968200252625 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((52834293516358971463561722448968200252625 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-52834293516358971463561722448968200252625 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 28. -/
theorem ep_Q2_008_partial_28_0379_valid :
    mulPoly ep_Q2_008_coefficient_28_0379
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0380 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 28. -/
def ep_Q2_008_partial_28_0380 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 28. -/
theorem ep_Q2_008_partial_28_0380_valid :
    mulPoly ep_Q2_008_coefficient_28_0380
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0381 : Poly :=
[
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 381 for generator 28. -/
def ep_Q2_008_partial_28_0381 : Poly :=
[
  term ((840840044332819500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((840840044332819500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 28. -/
theorem ep_Q2_008_partial_28_0381_valid :
    mulPoly ep_Q2_008_coefficient_28_0381
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0382 : Poly :=
[
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 28. -/
def ep_Q2_008_partial_28_0382 : Poly :=
[
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 28. -/
theorem ep_Q2_008_partial_28_0382_valid :
    mulPoly ep_Q2_008_coefficient_28_0382
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0383 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 383 for generator 28. -/
def ep_Q2_008_partial_28_0383 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 28. -/
theorem ep_Q2_008_partial_28_0383_valid :
    mulPoly ep_Q2_008_coefficient_28_0383
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0384 : Poly :=
[
  term ((10010798204189927733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 384 for generator 28. -/
def ep_Q2_008_partial_28_0384 : Poly :=
[
  term ((10010798204189927733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-10010798204189927733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((10010798204189927733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-10010798204189927733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 28. -/
theorem ep_Q2_008_partial_28_0384_valid :
    mulPoly ep_Q2_008_coefficient_28_0384
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0385 : Poly :=
[
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 28. -/
def ep_Q2_008_partial_28_0385 : Poly :=
[
  term ((45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 28. -/
theorem ep_Q2_008_partial_28_0385_valid :
    mulPoly ep_Q2_008_coefficient_28_0385
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0386 : Poly :=
[
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 386 for generator 28. -/
def ep_Q2_008_partial_28_0386 : Poly :=
[
  term ((-4366060179532158615 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(3, 2), (4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 28. -/
theorem ep_Q2_008_partial_28_0386_valid :
    mulPoly ep_Q2_008_coefficient_28_0386
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0387 : Poly :=
[
  term ((-3527891345100475537081083081392678286892155 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 28. -/
def ep_Q2_008_partial_28_0387 : Poly :=
[
  term ((-7055782690200951074162166162785356573784310 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3527891345100475537081083081392678286892155 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7055782690200951074162166162785356573784310 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((3527891345100475537081083081392678286892155 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 28. -/
theorem ep_Q2_008_partial_28_0387_valid :
    mulPoly ep_Q2_008_coefficient_28_0387
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0388 : Poly :=
[
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 388 for generator 28. -/
def ep_Q2_008_partial_28_0388 : Poly :=
[
  term ((-10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 4), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 28. -/
theorem ep_Q2_008_partial_28_0388_valid :
    mulPoly ep_Q2_008_coefficient_28_0388
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0389 : Poly :=
[
  term ((91105974309162540131768996264280411709200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 389 for generator 28. -/
def ep_Q2_008_partial_28_0389 : Poly :=
[
  term ((182211948618325080263537992528560823418400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-91105974309162540131768996264280411709200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((182211948618325080263537992528560823418400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 3), (16, 1)],
  term ((-91105974309162540131768996264280411709200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 28. -/
theorem ep_Q2_008_partial_28_0389_valid :
    mulPoly ep_Q2_008_coefficient_28_0389
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0390 : Poly :=
[
  term ((-19172446752638827905 : Rat) / 2771825814456705436) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 390 for generator 28. -/
def ep_Q2_008_partial_28_0390 : Poly :=
[
  term ((-19172446752638827905 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((19172446752638827905 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (13, 2), (16, 1)],
  term ((-19172446752638827905 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((19172446752638827905 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 28. -/
theorem ep_Q2_008_partial_28_0390_valid :
    mulPoly ep_Q2_008_coefficient_28_0390
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0391 : Poly :=
[
  term ((5733432326504725867738025363985909408000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 28. -/
def ep_Q2_008_partial_28_0391 : Poly :=
[
  term ((11466864653009451735476050727971818816000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5733432326504725867738025363985909408000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((11466864653009451735476050727971818816000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((-5733432326504725867738025363985909408000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 28. -/
theorem ep_Q2_008_partial_28_0391_valid :
    mulPoly ep_Q2_008_coefficient_28_0391
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0392 : Poly :=
[
  term ((-5811241414723259978408279948285099558673921 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 392 for generator 28. -/
def ep_Q2_008_partial_28_0392 : Poly :=
[
  term ((-5811241414723259978408279948285099558673921 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((5811241414723259978408279948285099558673921 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-5811241414723259978408279948285099558673921 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((5811241414723259978408279948285099558673921 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 28. -/
theorem ep_Q2_008_partial_28_0392_valid :
    mulPoly ep_Q2_008_coefficient_28_0392
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0393 : Poly :=
[
  term ((78068489591205241633 : Rat) / 5543651628913410872) [(4, 1), (16, 1)]
]

/-- Partial product 393 for generator 28. -/
def ep_Q2_008_partial_28_0393 : Poly :=
[
  term ((78068489591205241633 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-78068489591205241633 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (16, 1)],
  term ((78068489591205241633 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-78068489591205241633 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 28. -/
theorem ep_Q2_008_partial_28_0393_valid :
    mulPoly ep_Q2_008_coefficient_28_0393
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0394 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 394 for generator 28. -/
def ep_Q2_008_partial_28_0394 : Poly :=
[
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 28. -/
theorem ep_Q2_008_partial_28_0394_valid :
    mulPoly ep_Q2_008_coefficient_28_0394
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0395 : Poly :=
[
  term ((-3355090209382692511471275988758857138400 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 28. -/
def ep_Q2_008_partial_28_0395 : Poly :=
[
  term ((-6710180418765385022942551977517714276800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3355090209382692511471275988758857138400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6710180418765385022942551977517714276800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((3355090209382692511471275988758857138400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 28. -/
theorem ep_Q2_008_partial_28_0395_valid :
    mulPoly ep_Q2_008_coefficient_28_0395
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0396 : Poly :=
[
  term ((-55007273450363602635 : Rat) / 11087303257826821744) [(4, 2), (16, 1)]
]

/-- Partial product 396 for generator 28. -/
def ep_Q2_008_partial_28_0396 : Poly :=
[
  term ((-55007273450363602635 : Rat) / 5543651628913410872) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((55007273450363602635 : Rat) / 11087303257826821744) [(2, 2), (4, 2), (16, 1)],
  term ((-55007273450363602635 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((55007273450363602635 : Rat) / 11087303257826821744) [(3, 2), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 28. -/
theorem ep_Q2_008_partial_28_0396_valid :
    mulPoly ep_Q2_008_coefficient_28_0396
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0397 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 397 for generator 28. -/
def ep_Q2_008_partial_28_0397 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 28. -/
theorem ep_Q2_008_partial_28_0397_valid :
    mulPoly ep_Q2_008_coefficient_28_0397
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0398 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 28. -/
def ep_Q2_008_partial_28_0398 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 28. -/
theorem ep_Q2_008_partial_28_0398_valid :
    mulPoly ep_Q2_008_coefficient_28_0398
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0399 : Poly :=
[
  term ((347099319612704436897691121945817600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 28. -/
def ep_Q2_008_partial_28_0399 : Poly :=
[
  term ((694198639225408873795382243891635200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-347099319612704436897691121945817600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((694198639225408873795382243891635200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-347099319612704436897691121945817600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 28. -/
theorem ep_Q2_008_partial_28_0399_valid :
    mulPoly ep_Q2_008_coefficient_28_0399
        ep_Q2_008_generator_28_0300_0399 =
      ep_Q2_008_partial_28_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_28_0300_0399 : List Poly :=
[
  ep_Q2_008_partial_28_0300,
  ep_Q2_008_partial_28_0301,
  ep_Q2_008_partial_28_0302,
  ep_Q2_008_partial_28_0303,
  ep_Q2_008_partial_28_0304,
  ep_Q2_008_partial_28_0305,
  ep_Q2_008_partial_28_0306,
  ep_Q2_008_partial_28_0307,
  ep_Q2_008_partial_28_0308,
  ep_Q2_008_partial_28_0309,
  ep_Q2_008_partial_28_0310,
  ep_Q2_008_partial_28_0311,
  ep_Q2_008_partial_28_0312,
  ep_Q2_008_partial_28_0313,
  ep_Q2_008_partial_28_0314,
  ep_Q2_008_partial_28_0315,
  ep_Q2_008_partial_28_0316,
  ep_Q2_008_partial_28_0317,
  ep_Q2_008_partial_28_0318,
  ep_Q2_008_partial_28_0319,
  ep_Q2_008_partial_28_0320,
  ep_Q2_008_partial_28_0321,
  ep_Q2_008_partial_28_0322,
  ep_Q2_008_partial_28_0323,
  ep_Q2_008_partial_28_0324,
  ep_Q2_008_partial_28_0325,
  ep_Q2_008_partial_28_0326,
  ep_Q2_008_partial_28_0327,
  ep_Q2_008_partial_28_0328,
  ep_Q2_008_partial_28_0329,
  ep_Q2_008_partial_28_0330,
  ep_Q2_008_partial_28_0331,
  ep_Q2_008_partial_28_0332,
  ep_Q2_008_partial_28_0333,
  ep_Q2_008_partial_28_0334,
  ep_Q2_008_partial_28_0335,
  ep_Q2_008_partial_28_0336,
  ep_Q2_008_partial_28_0337,
  ep_Q2_008_partial_28_0338,
  ep_Q2_008_partial_28_0339,
  ep_Q2_008_partial_28_0340,
  ep_Q2_008_partial_28_0341,
  ep_Q2_008_partial_28_0342,
  ep_Q2_008_partial_28_0343,
  ep_Q2_008_partial_28_0344,
  ep_Q2_008_partial_28_0345,
  ep_Q2_008_partial_28_0346,
  ep_Q2_008_partial_28_0347,
  ep_Q2_008_partial_28_0348,
  ep_Q2_008_partial_28_0349,
  ep_Q2_008_partial_28_0350,
  ep_Q2_008_partial_28_0351,
  ep_Q2_008_partial_28_0352,
  ep_Q2_008_partial_28_0353,
  ep_Q2_008_partial_28_0354,
  ep_Q2_008_partial_28_0355,
  ep_Q2_008_partial_28_0356,
  ep_Q2_008_partial_28_0357,
  ep_Q2_008_partial_28_0358,
  ep_Q2_008_partial_28_0359,
  ep_Q2_008_partial_28_0360,
  ep_Q2_008_partial_28_0361,
  ep_Q2_008_partial_28_0362,
  ep_Q2_008_partial_28_0363,
  ep_Q2_008_partial_28_0364,
  ep_Q2_008_partial_28_0365,
  ep_Q2_008_partial_28_0366,
  ep_Q2_008_partial_28_0367,
  ep_Q2_008_partial_28_0368,
  ep_Q2_008_partial_28_0369,
  ep_Q2_008_partial_28_0370,
  ep_Q2_008_partial_28_0371,
  ep_Q2_008_partial_28_0372,
  ep_Q2_008_partial_28_0373,
  ep_Q2_008_partial_28_0374,
  ep_Q2_008_partial_28_0375,
  ep_Q2_008_partial_28_0376,
  ep_Q2_008_partial_28_0377,
  ep_Q2_008_partial_28_0378,
  ep_Q2_008_partial_28_0379,
  ep_Q2_008_partial_28_0380,
  ep_Q2_008_partial_28_0381,
  ep_Q2_008_partial_28_0382,
  ep_Q2_008_partial_28_0383,
  ep_Q2_008_partial_28_0384,
  ep_Q2_008_partial_28_0385,
  ep_Q2_008_partial_28_0386,
  ep_Q2_008_partial_28_0387,
  ep_Q2_008_partial_28_0388,
  ep_Q2_008_partial_28_0389,
  ep_Q2_008_partial_28_0390,
  ep_Q2_008_partial_28_0391,
  ep_Q2_008_partial_28_0392,
  ep_Q2_008_partial_28_0393,
  ep_Q2_008_partial_28_0394,
  ep_Q2_008_partial_28_0395,
  ep_Q2_008_partial_28_0396,
  ep_Q2_008_partial_28_0397,
  ep_Q2_008_partial_28_0398,
  ep_Q2_008_partial_28_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_28_0300_0399 : Poly :=
[
  term ((-35099491895623971963 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-990285447782416573608 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((73184078093812012992624658245964800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2911945883479699446791177354939776347140967 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36496048422325152993 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-333483259973220000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-796967334100975500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1564087499603321373 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129638315426419023260420721572812800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((29378465907533408541 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((2042873286178973914608848256937220619480738 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-915920756818221133408373318915894597834215 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((300975579445412318333906707091020800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((285385593714611304528634566868646400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((919594861613583750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-328182339016992600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10031141765253891882572685098415960604513200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((22952944099346234733 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((77632499489787000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2068629126325446269059588109957391129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((162237276045121393534757862757672103378400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1355858966349349875 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27023323614922043810480588424494259057114600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((52834293516358971463561722448968200252625 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((840840044332819500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((10010798204189927733 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7055782690200951074162166162785356573784310 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((182211948618325080263537992528560823418400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19172446752638827905 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((11466864653009451735476050727971818816000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5811241414723259978408279948285099558673921 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((78068489591205241633 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6710180418765385022942551977517714276800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55007273450363602635 : Rat) / 5543651628913410872) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((694198639225408873795382243891635200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35099491895623971963 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((495142723891208286804 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2911945883479699446791177354939776347140967 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((36496048422325152993 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1564087499603321373 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29378465907533408541 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1021436643089486957304424128468610309740369 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((915920756818221133408373318915894597834215 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150487789722706159166953353545510400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-142692796857305652264317283434323200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9536176493959289733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((164091169508496300 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5015570882626945941286342549207980302256600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-22952944099346234733 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-81118638022560696767378931378836051689200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1355858966349349875 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13511661807461021905240294212247129528557300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-52834293516358971463561722448968200252625 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-10010798204189927733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((3527891345100475537081083081392678286892155 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-91105974309162540131768996264280411709200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((19172446752638827905 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (13, 2), (16, 1)],
  term ((-5733432326504725867738025363985909408000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((5811241414723259978408279948285099558673921 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-78068489591205241633 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3355090209382692511471275988758857138400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((55007273450363602635 : Rat) / 11087303257826821744) [(2, 2), (4, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-347099319612704436897691121945817600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35099491895623971963 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-990285447782416573608 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((73184078093812012992624658245964800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2911945883479699446791177354939776347140967 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36496048422325152993 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((-333483259973220000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-796967334100975500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1564087499603321373 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((29378465907533408541 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129638315426419023260420721572812800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((2042873286178973914608848256937220619480738 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-915920756818221133408373318915894597834215 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 4), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((300975579445412318333906707091020800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((285385593714611304528634566868646400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 3), (16, 1)],
  term ((-2669859283589517375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((919594861613583750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9536176493959289733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((44998781369749506088932377759886292536000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-328182339016992600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10031141765253891882572685098415960604513200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((22952944099346234733 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((77632499489787000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2068629126325446269059588109957391129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((43296984318331175962195331184842057101500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1355858966349349875 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((162237276045121393534757862757672103378400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((27023323614922043810480588424494259057114600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((18143903349746080239255732619365645619200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((52834293516358971463561722448968200252625 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((840840044332819500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((10010798204189927733 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((45897617391294951728575922052778661967600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4366060179532158615 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7055782690200951074162166162785356573784310 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10895266600419700848614841872173084838400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 4), (16, 1)],
  term ((-19172446752638827905 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((182211948618325080263537992528560823418400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 3), (16, 1)],
  term ((11466864653009451735476050727971818816000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((78068489591205241633 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-5811241414723259978408279948285099558673921 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6710180418765385022942551977517714276800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((-55007273450363602635 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((694198639225408873795382243891635200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((35099491895623971963 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((495142723891208286804 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2911945883479699446791177354939776347140967 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((36496048422325152993 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1564087499603321373 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29378465907533408541 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1021436643089486957304424128468610309740369 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((915920756818221133408373318915894597834215 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150487789722706159166953353545510400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-142692796857305652264317283434323200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9536176493959289733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((164091169508496300 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5015570882626945941286342549207980302256600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-22952944099346234733 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-81118638022560696767378931378836051689200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1355858966349349875 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13511661807461021905240294212247129528557300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9071951674873040119627866309682822809600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-52834293516358971463561722448968200252625 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-10010798204189927733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((3527891345100475537081083081392678286892155 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-91105974309162540131768996264280411709200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((19172446752638827905 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (13, 2), (16, 1)],
  term ((-5733432326504725867738025363985909408000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((5811241414723259978408279948285099558673921 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-78068489591205241633 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3355090209382692511471275988758857138400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((55007273450363602635 : Rat) / 11087303257826821744) [(3, 2), (4, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-347099319612704436897691121945817600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 300 through 399. -/
theorem ep_Q2_008_block_28_0300_0399_valid :
    checkProductSumEq ep_Q2_008_partials_28_0300_0399
      ep_Q2_008_block_28_0300_0399 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
