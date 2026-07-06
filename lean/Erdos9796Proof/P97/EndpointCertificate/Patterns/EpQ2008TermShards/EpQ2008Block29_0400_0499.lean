/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 29:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_29_0400_0499 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0400 : Poly :=
[
  term ((-25902532423196157652282899644083200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 29. -/
def ep_Q2_008_partial_29_0400 : Poly :=
[
  term ((-51805064846392315304565799288166400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((25902532423196157652282899644083200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51805064846392315304565799288166400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((25902532423196157652282899644083200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 29. -/
theorem ep_Q2_008_partial_29_0400_valid :
    mulPoly ep_Q2_008_coefficient_29_0400
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0401 : Poly :=
[
  term ((13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 29. -/
def ep_Q2_008_partial_29_0401 : Poly :=
[
  term ((27545000695353086567864247750412800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((27545000695353086567864247750412800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 29. -/
theorem ep_Q2_008_partial_29_0401_valid :
    mulPoly ep_Q2_008_coefficient_29_0401
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0402 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 402 for generator 29. -/
def ep_Q2_008_partial_29_0402 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 29. -/
theorem ep_Q2_008_partial_29_0402_valid :
    mulPoly ep_Q2_008_coefficient_29_0402
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0403 : Poly :=
[
  term ((-2671824678885179964404580031426771200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 29. -/
def ep_Q2_008_partial_29_0403 : Poly :=
[
  term ((-5343649357770359928809160062853542400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2671824678885179964404580031426771200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-5343649357770359928809160062853542400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((2671824678885179964404580031426771200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 29. -/
theorem ep_Q2_008_partial_29_0403_valid :
    mulPoly ep_Q2_008_coefficient_29_0403
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0404 : Poly :=
[
  term ((87057549851662137972186783029347200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 29. -/
def ep_Q2_008_partial_29_0404 : Poly :=
[
  term ((174115099703324275944373566058694400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87057549851662137972186783029347200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((174115099703324275944373566058694400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-87057549851662137972186783029347200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 29. -/
theorem ep_Q2_008_partial_29_0404_valid :
    mulPoly ep_Q2_008_coefficient_29_0404
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0405 : Poly :=
[
  term ((376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 405 for generator 29. -/
def ep_Q2_008_partial_29_0405 : Poly :=
[
  term ((752853231626973750 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 29. -/
theorem ep_Q2_008_partial_29_0405_valid :
    mulPoly ep_Q2_008_coefficient_29_0405
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0406 : Poly :=
[
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 29. -/
def ep_Q2_008_partial_29_0406 : Poly :=
[
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 29. -/
theorem ep_Q2_008_partial_29_0406_valid :
    mulPoly ep_Q2_008_coefficient_29_0406
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0407 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 407 for generator 29. -/
def ep_Q2_008_partial_29_0407 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 29. -/
theorem ep_Q2_008_partial_29_0407_valid :
    mulPoly ep_Q2_008_coefficient_29_0407
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0408 : Poly :=
[
  term ((8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 29. -/
def ep_Q2_008_partial_29_0408 : Poly :=
[
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 29. -/
theorem ep_Q2_008_partial_29_0408_valid :
    mulPoly ep_Q2_008_coefficient_29_0408
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0409 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 409 for generator 29. -/
def ep_Q2_008_partial_29_0409 : Poly :=
[
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 29. -/
theorem ep_Q2_008_partial_29_0409_valid :
    mulPoly ep_Q2_008_coefficient_29_0409
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0410 : Poly :=
[
  term ((3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 410 for generator 29. -/
def ep_Q2_008_partial_29_0410 : Poly :=
[
  term ((3771082783353798885 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((3771082783353798885 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 29. -/
theorem ep_Q2_008_partial_29_0410_valid :
    mulPoly ep_Q2_008_coefficient_29_0410
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0411 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 29. -/
def ep_Q2_008_partial_29_0411 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 29. -/
theorem ep_Q2_008_partial_29_0411_valid :
    mulPoly ep_Q2_008_coefficient_29_0411
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0412 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 412 for generator 29. -/
def ep_Q2_008_partial_29_0412 : Poly :=
[
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(5, 1), (8, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (12, 2), (13, 3), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 29. -/
theorem ep_Q2_008_partial_29_0412_valid :
    mulPoly ep_Q2_008_coefficient_29_0412
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0413 : Poly :=
[
  term ((-16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 29. -/
def ep_Q2_008_partial_29_0413 : Poly :=
[
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 29. -/
theorem ep_Q2_008_partial_29_0413_valid :
    mulPoly ep_Q2_008_coefficient_29_0413
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0414 : Poly :=
[
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 29. -/
def ep_Q2_008_partial_29_0414 : Poly :=
[
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 29. -/
theorem ep_Q2_008_partial_29_0414_valid :
    mulPoly ep_Q2_008_coefficient_29_0414
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0415 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 415 for generator 29. -/
def ep_Q2_008_partial_29_0415 : Poly :=
[
  term ((172223556136072447584 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 4), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 29. -/
theorem ep_Q2_008_partial_29_0415_valid :
    mulPoly ep_Q2_008_coefficient_29_0415
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0416 : Poly :=
[
  term ((4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 416 for generator 29. -/
def ep_Q2_008_partial_29_0416 : Poly :=
[
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 29. -/
theorem ep_Q2_008_partial_29_0416_valid :
    mulPoly ep_Q2_008_coefficient_29_0416
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0417 : Poly :=
[
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 417 for generator 29. -/
def ep_Q2_008_partial_29_0417 : Poly :=
[
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 29. -/
theorem ep_Q2_008_partial_29_0417_valid :
    mulPoly ep_Q2_008_coefficient_29_0417
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0418 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 418 for generator 29. -/
def ep_Q2_008_partial_29_0418 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 29. -/
theorem ep_Q2_008_partial_29_0418_valid :
    mulPoly ep_Q2_008_coefficient_29_0418
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0419 : Poly :=
[
  term ((468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 419 for generator 29. -/
def ep_Q2_008_partial_29_0419 : Poly :=
[
  term ((936120975753739500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((936120975753739500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 29. -/
theorem ep_Q2_008_partial_29_0419_valid :
    mulPoly ep_Q2_008_coefficient_29_0419
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0420 : Poly :=
[
  term ((1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 29. -/
def ep_Q2_008_partial_29_0420 : Poly :=
[
  term ((2062803814349319000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2062803814349319000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 29. -/
theorem ep_Q2_008_partial_29_0420_valid :
    mulPoly ep_Q2_008_coefficient_29_0420
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0421 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 421 for generator 29. -/
def ep_Q2_008_partial_29_0421 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 29. -/
theorem ep_Q2_008_partial_29_0421_valid :
    mulPoly ep_Q2_008_coefficient_29_0421
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0422 : Poly :=
[
  term ((12121242484249706733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 422 for generator 29. -/
def ep_Q2_008_partial_29_0422 : Poly :=
[
  term ((12121242484249706733 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12121242484249706733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((12121242484249706733 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12121242484249706733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 29. -/
theorem ep_Q2_008_partial_29_0422_valid :
    mulPoly ep_Q2_008_coefficient_29_0422
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0423 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 423 for generator 29. -/
def ep_Q2_008_partial_29_0423 : Poly :=
[
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 29. -/
theorem ep_Q2_008_partial_29_0423_valid :
    mulPoly ep_Q2_008_coefficient_29_0423
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0424 : Poly :=
[
  term ((-2704818431715636237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 424 for generator 29. -/
def ep_Q2_008_partial_29_0424 : Poly :=
[
  term ((-5409636863431272474 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2704818431715636237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-5409636863431272474 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2704818431715636237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 29. -/
theorem ep_Q2_008_partial_29_0424_valid :
    mulPoly ep_Q2_008_coefficient_29_0424
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0425 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 425 for generator 29. -/
def ep_Q2_008_partial_29_0425 : Poly :=
[
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 29. -/
theorem ep_Q2_008_partial_29_0425_valid :
    mulPoly ep_Q2_008_coefficient_29_0425
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0426 : Poly :=
[
  term ((384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 29. -/
def ep_Q2_008_partial_29_0426 : Poly :=
[
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 29. -/
theorem ep_Q2_008_partial_29_0426_valid :
    mulPoly ep_Q2_008_coefficient_29_0426
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0427 : Poly :=
[
  term ((67671306727992228779299742749370254177200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 427 for generator 29. -/
def ep_Q2_008_partial_29_0427 : Poly :=
[
  term ((135342613455984457558599485498740508354400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-67671306727992228779299742749370254177200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((135342613455984457558599485498740508354400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-67671306727992228779299742749370254177200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 29. -/
theorem ep_Q2_008_partial_29_0427_valid :
    mulPoly ep_Q2_008_coefficient_29_0427
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0428 : Poly :=
[
  term ((-28317952226144310306 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 428 for generator 29. -/
def ep_Q2_008_partial_29_0428 : Poly :=
[
  term ((-56635904452288620612 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((28317952226144310306 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-56635904452288620612 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((28317952226144310306 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 29. -/
theorem ep_Q2_008_partial_29_0428_valid :
    mulPoly ep_Q2_008_coefficient_29_0428
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0429 : Poly :=
[
  term ((1310158534935847594758111756991666756725414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 29. -/
def ep_Q2_008_partial_29_0429 : Poly :=
[
  term ((2620317069871695189516223513983333513450828 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1310158534935847594758111756991666756725414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((2620317069871695189516223513983333513450828 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1310158534935847594758111756991666756725414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 29. -/
theorem ep_Q2_008_partial_29_0429_valid :
    mulPoly ep_Q2_008_coefficient_29_0429
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0430 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 430 for generator 29. -/
def ep_Q2_008_partial_29_0430 : Poly :=
[
  term ((258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 3), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 29. -/
theorem ep_Q2_008_partial_29_0430_valid :
    mulPoly ep_Q2_008_coefficient_29_0430
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0431 : Poly :=
[
  term ((-21783487427153882806855120084644305264325 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 29. -/
def ep_Q2_008_partial_29_0431 : Poly :=
[
  term ((-43566974854307765613710240169288610528650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21783487427153882806855120084644305264325 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-43566974854307765613710240169288610528650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((21783487427153882806855120084644305264325 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 29. -/
theorem ep_Q2_008_partial_29_0431_valid :
    mulPoly ep_Q2_008_coefficient_29_0431
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0432 : Poly :=
[
  term ((-853091390881121585648443249512767492023314 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 29. -/
def ep_Q2_008_partial_29_0432 : Poly :=
[
  term ((-1706182781762243171296886499025534984046628 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((853091390881121585648443249512767492023314 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1706182781762243171296886499025534984046628 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((853091390881121585648443249512767492023314 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 29. -/
theorem ep_Q2_008_partial_29_0432_valid :
    mulPoly ep_Q2_008_coefficient_29_0432
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0433 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 433 for generator 29. -/
def ep_Q2_008_partial_29_0433 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 29. -/
theorem ep_Q2_008_partial_29_0433_valid :
    mulPoly ep_Q2_008_coefficient_29_0433
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0434 : Poly :=
[
  term ((-124403113388315111688 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 434 for generator 29. -/
def ep_Q2_008_partial_29_0434 : Poly :=
[
  term ((-248806226776630223376 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((124403113388315111688 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((-248806226776630223376 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((124403113388315111688 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 29. -/
theorem ep_Q2_008_partial_29_0434_valid :
    mulPoly ep_Q2_008_coefficient_29_0434
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0435 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 29. -/
def ep_Q2_008_partial_29_0435 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 29. -/
theorem ep_Q2_008_partial_29_0435_valid :
    mulPoly ep_Q2_008_coefficient_29_0435
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0436 : Poly :=
[
  term ((612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 436 for generator 29. -/
def ep_Q2_008_partial_29_0436 : Poly :=
[
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 29. -/
theorem ep_Q2_008_partial_29_0436_valid :
    mulPoly ep_Q2_008_coefficient_29_0436
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0437 : Poly :=
[
  term ((44385193544695590849 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 437 for generator 29. -/
def ep_Q2_008_partial_29_0437 : Poly :=
[
  term ((44385193544695590849 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44385193544695590849 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((44385193544695590849 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-44385193544695590849 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 29. -/
theorem ep_Q2_008_partial_29_0437_valid :
    mulPoly ep_Q2_008_coefficient_29_0437
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0438 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 29. -/
def ep_Q2_008_partial_29_0438 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 29. -/
theorem ep_Q2_008_partial_29_0438_valid :
    mulPoly ep_Q2_008_coefficient_29_0438
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0439 : Poly :=
[
  term ((3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 439 for generator 29. -/
def ep_Q2_008_partial_29_0439 : Poly :=
[
  term ((7030820451939963474 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((7030820451939963474 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 29. -/
theorem ep_Q2_008_partial_29_0439_valid :
    mulPoly ep_Q2_008_coefficient_29_0439
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0440 : Poly :=
[
  term ((-135523317768758243567193846160757931878700 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 29. -/
def ep_Q2_008_partial_29_0440 : Poly :=
[
  term ((-271046635537516487134387692321515863757400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((135523317768758243567193846160757931878700 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-271046635537516487134387692321515863757400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((135523317768758243567193846160757931878700 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 29. -/
theorem ep_Q2_008_partial_29_0440_valid :
    mulPoly ep_Q2_008_coefficient_29_0440
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0441 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 441 for generator 29. -/
def ep_Q2_008_partial_29_0441 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 29. -/
theorem ep_Q2_008_partial_29_0441_valid :
    mulPoly ep_Q2_008_coefficient_29_0441
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0442 : Poly :=
[
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 442 for generator 29. -/
def ep_Q2_008_partial_29_0442 : Poly :=
[
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 29. -/
theorem ep_Q2_008_partial_29_0442_valid :
    mulPoly ep_Q2_008_coefficient_29_0442
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0443 : Poly :=
[
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 29. -/
def ep_Q2_008_partial_29_0443 : Poly :=
[
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 29. -/
theorem ep_Q2_008_partial_29_0443_valid :
    mulPoly ep_Q2_008_coefficient_29_0443
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0444 : Poly :=
[
  term ((-31743896004430628895 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 444 for generator 29. -/
def ep_Q2_008_partial_29_0444 : Poly :=
[
  term ((-31743896004430628895 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((31743896004430628895 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-31743896004430628895 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31743896004430628895 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 29. -/
theorem ep_Q2_008_partial_29_0444_valid :
    mulPoly ep_Q2_008_coefficient_29_0444
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0445 : Poly :=
[
  term ((-64461479504100015237102689615988803996400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 445 for generator 29. -/
def ep_Q2_008_partial_29_0445 : Poly :=
[
  term ((-128922959008200030474205379231977607992800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((64461479504100015237102689615988803996400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-128922959008200030474205379231977607992800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64461479504100015237102689615988803996400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 29. -/
theorem ep_Q2_008_partial_29_0445_valid :
    mulPoly ep_Q2_008_coefficient_29_0445
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0446 : Poly :=
[
  term ((-303098423034692530479 : Rat) / 2771825814456705436) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 446 for generator 29. -/
def ep_Q2_008_partial_29_0446 : Poly :=
[
  term ((-303098423034692530479 : Rat) / 1385912907228352718) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((303098423034692530479 : Rat) / 2771825814456705436) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-303098423034692530479 : Rat) / 1385912907228352718) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((303098423034692530479 : Rat) / 2771825814456705436) [(5, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 29. -/
theorem ep_Q2_008_partial_29_0446_valid :
    mulPoly ep_Q2_008_coefficient_29_0446
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0447 : Poly :=
[
  term ((-29479508394243982001472227743881510693400215 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 29. -/
def ep_Q2_008_partial_29_0447 : Poly :=
[
  term ((-58959016788487964002944455487763021386800430 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((29479508394243982001472227743881510693400215 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-58959016788487964002944455487763021386800430 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((29479508394243982001472227743881510693400215 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 29. -/
theorem ep_Q2_008_partial_29_0447_valid :
    mulPoly ep_Q2_008_coefficient_29_0447
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0448 : Poly :=
[
  term ((9077878214226898167748603621648626865457961 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 29. -/
def ep_Q2_008_partial_29_0448 : Poly :=
[
  term ((9077878214226898167748603621648626865457961 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9077878214226898167748603621648626865457961 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((9077878214226898167748603621648626865457961 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9077878214226898167748603621648626865457961 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 29. -/
theorem ep_Q2_008_partial_29_0448_valid :
    mulPoly ep_Q2_008_coefficient_29_0448
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0449 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 449 for generator 29. -/
def ep_Q2_008_partial_29_0449 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 29. -/
theorem ep_Q2_008_partial_29_0449_valid :
    mulPoly ep_Q2_008_coefficient_29_0449
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0450 : Poly :=
[
  term ((23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 29. -/
def ep_Q2_008_partial_29_0450 : Poly :=
[
  term ((46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 29. -/
theorem ep_Q2_008_partial_29_0450_valid :
    mulPoly ep_Q2_008_coefficient_29_0450
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0451 : Poly :=
[
  term ((-2685625673666865624468337769005995458991228 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 451 for generator 29. -/
def ep_Q2_008_partial_29_0451 : Poly :=
[
  term ((-5371251347333731248936675538011990917982456 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2685625673666865624468337769005995458991228 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5371251347333731248936675538011990917982456 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((2685625673666865624468337769005995458991228 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 29. -/
theorem ep_Q2_008_partial_29_0451_valid :
    mulPoly ep_Q2_008_coefficient_29_0451
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0452 : Poly :=
[
  term ((3145357594510568679 : Rat) / 764641603988056672) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 452 for generator 29. -/
def ep_Q2_008_partial_29_0452 : Poly :=
[
  term ((3145357594510568679 : Rat) / 382320801994028336) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3145357594510568679 : Rat) / 764641603988056672) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((3145357594510568679 : Rat) / 382320801994028336) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3145357594510568679 : Rat) / 764641603988056672) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 29. -/
theorem ep_Q2_008_partial_29_0452_valid :
    mulPoly ep_Q2_008_coefficient_29_0452
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0453 : Poly :=
[
  term ((-25704185315291553882969825739071383546827173 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 29. -/
def ep_Q2_008_partial_29_0453 : Poly :=
[
  term ((-25704185315291553882969825739071383546827173 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((25704185315291553882969825739071383546827173 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-25704185315291553882969825739071383546827173 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((25704185315291553882969825739071383546827173 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 29. -/
theorem ep_Q2_008_partial_29_0453_valid :
    mulPoly ep_Q2_008_coefficient_29_0453
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0454 : Poly :=
[
  term ((-242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 454 for generator 29. -/
def ep_Q2_008_partial_29_0454 : Poly :=
[
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 29. -/
theorem ep_Q2_008_partial_29_0454_valid :
    mulPoly ep_Q2_008_coefficient_29_0454
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0455 : Poly :=
[
  term ((2698876203647273278429468578882410638649265 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 29. -/
def ep_Q2_008_partial_29_0455 : Poly :=
[
  term ((2698876203647273278429468578882410638649265 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2698876203647273278429468578882410638649265 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((2698876203647273278429468578882410638649265 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2698876203647273278429468578882410638649265 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 29. -/
theorem ep_Q2_008_partial_29_0455_valid :
    mulPoly ep_Q2_008_coefficient_29_0455
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0456 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 29. -/
def ep_Q2_008_partial_29_0456 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 29. -/
theorem ep_Q2_008_partial_29_0456_valid :
    mulPoly ep_Q2_008_coefficient_29_0456
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0457 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 457 for generator 29. -/
def ep_Q2_008_partial_29_0457 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 29. -/
theorem ep_Q2_008_partial_29_0457_valid :
    mulPoly ep_Q2_008_coefficient_29_0457
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0458 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 458 for generator 29. -/
def ep_Q2_008_partial_29_0458 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 29. -/
theorem ep_Q2_008_partial_29_0458_valid :
    mulPoly ep_Q2_008_coefficient_29_0458
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0459 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 29. -/
def ep_Q2_008_partial_29_0459 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 29. -/
theorem ep_Q2_008_partial_29_0459_valid :
    mulPoly ep_Q2_008_coefficient_29_0459
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0460 : Poly :=
[
  term ((-15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 29. -/
def ep_Q2_008_partial_29_0460 : Poly :=
[
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 29. -/
theorem ep_Q2_008_partial_29_0460_valid :
    mulPoly ep_Q2_008_coefficient_29_0460
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0461 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 29. -/
def ep_Q2_008_partial_29_0461 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 29. -/
theorem ep_Q2_008_partial_29_0461_valid :
    mulPoly ep_Q2_008_coefficient_29_0461
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0462 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 462 for generator 29. -/
def ep_Q2_008_partial_29_0462 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 29. -/
theorem ep_Q2_008_partial_29_0462_valid :
    mulPoly ep_Q2_008_coefficient_29_0462
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0463 : Poly :=
[
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 29. -/
def ep_Q2_008_partial_29_0463 : Poly :=
[
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 29. -/
theorem ep_Q2_008_partial_29_0463_valid :
    mulPoly ep_Q2_008_coefficient_29_0463
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0464 : Poly :=
[
  term ((25626543902055034350894230495068800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 29. -/
def ep_Q2_008_partial_29_0464 : Poly :=
[
  term ((51253087804110068701788460990137600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25626543902055034350894230495068800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((51253087804110068701788460990137600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25626543902055034350894230495068800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 29. -/
theorem ep_Q2_008_partial_29_0464_valid :
    mulPoly ep_Q2_008_coefficient_29_0464
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0465 : Poly :=
[
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 465 for generator 29. -/
def ep_Q2_008_partial_29_0465 : Poly :=
[
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(5, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (12, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 29. -/
theorem ep_Q2_008_partial_29_0465_valid :
    mulPoly ep_Q2_008_coefficient_29_0465
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0466 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 466 for generator 29. -/
def ep_Q2_008_partial_29_0466 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 29. -/
theorem ep_Q2_008_partial_29_0466_valid :
    mulPoly ep_Q2_008_coefficient_29_0466
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0467 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 467 for generator 29. -/
def ep_Q2_008_partial_29_0467 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 29. -/
theorem ep_Q2_008_partial_29_0467_valid :
    mulPoly ep_Q2_008_coefficient_29_0467
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0468 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 468 for generator 29. -/
def ep_Q2_008_partial_29_0468 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 29. -/
theorem ep_Q2_008_partial_29_0468_valid :
    mulPoly ep_Q2_008_coefficient_29_0468
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0469 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 29. -/
def ep_Q2_008_partial_29_0469 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 29. -/
theorem ep_Q2_008_partial_29_0469_valid :
    mulPoly ep_Q2_008_coefficient_29_0469
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0470 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 470 for generator 29. -/
def ep_Q2_008_partial_29_0470 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 4), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 29. -/
theorem ep_Q2_008_partial_29_0470_valid :
    mulPoly ep_Q2_008_coefficient_29_0470
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0471 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 471 for generator 29. -/
def ep_Q2_008_partial_29_0471 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 29. -/
theorem ep_Q2_008_partial_29_0471_valid :
    mulPoly ep_Q2_008_coefficient_29_0471
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0472 : Poly :=
[
  term ((7956397138394139933 : Rat) / 2771825814456705436) [(5, 2), (12, 1), (16, 1)]
]

/-- Partial product 472 for generator 29. -/
def ep_Q2_008_partial_29_0472 : Poly :=
[
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7956397138394139933 : Rat) / 2771825814456705436) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((-7956397138394139933 : Rat) / 2771825814456705436) [(5, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 29. -/
theorem ep_Q2_008_partial_29_0472_valid :
    mulPoly ep_Q2_008_coefficient_29_0472
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0473 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (16, 1)]
]

/-- Partial product 473 for generator 29. -/
def ep_Q2_008_partial_29_0473 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 3), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 29. -/
theorem ep_Q2_008_partial_29_0473_valid :
    mulPoly ep_Q2_008_coefficient_29_0473
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0474 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 474 for generator 29. -/
def ep_Q2_008_partial_29_0474 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 29. -/
theorem ep_Q2_008_partial_29_0474_valid :
    mulPoly ep_Q2_008_coefficient_29_0474
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0475 : Poly :=
[
  term ((242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (13, 2), (16, 1)]
]

/-- Partial product 475 for generator 29. -/
def ep_Q2_008_partial_29_0475 : Poly :=
[
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 29. -/
theorem ep_Q2_008_partial_29_0475_valid :
    mulPoly ep_Q2_008_coefficient_29_0475
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0476 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 476 for generator 29. -/
def ep_Q2_008_partial_29_0476 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 29. -/
theorem ep_Q2_008_partial_29_0476_valid :
    mulPoly ep_Q2_008_coefficient_29_0476
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0477 : Poly :=
[
  term ((5565872629905255126 : Rat) / 692956453614176359) [(5, 2), (16, 1)]
]

/-- Partial product 477 for generator 29. -/
def ep_Q2_008_partial_29_0477 : Poly :=
[
  term ((11131745259810510252 : Rat) / 692956453614176359) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5565872629905255126 : Rat) / 692956453614176359) [(5, 2), (12, 2), (16, 1)],
  term ((11131745259810510252 : Rat) / 692956453614176359) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5565872629905255126 : Rat) / 692956453614176359) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 29. -/
theorem ep_Q2_008_partial_29_0477_valid :
    mulPoly ep_Q2_008_coefficient_29_0477
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0478 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 29. -/
def ep_Q2_008_partial_29_0478 : Poly :=
[
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 29. -/
theorem ep_Q2_008_partial_29_0478_valid :
    mulPoly ep_Q2_008_coefficient_29_0478
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0479 : Poly :=
[
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 29. -/
def ep_Q2_008_partial_29_0479 : Poly :=
[
  term ((361881534062116797137923254902784000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((361881534062116797137923254902784000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 29. -/
theorem ep_Q2_008_partial_29_0479_valid :
    mulPoly ep_Q2_008_coefficient_29_0479
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0480 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 480 for generator 29. -/
def ep_Q2_008_partial_29_0480 : Poly :=
[
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 29. -/
theorem ep_Q2_008_partial_29_0480_valid :
    mulPoly ep_Q2_008_coefficient_29_0480
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0481 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 29. -/
def ep_Q2_008_partial_29_0481 : Poly :=
[
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 29. -/
theorem ep_Q2_008_partial_29_0481_valid :
    mulPoly ep_Q2_008_coefficient_29_0481
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0482 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 482 for generator 29. -/
def ep_Q2_008_partial_29_0482 : Poly :=
[
  term ((-618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 29. -/
theorem ep_Q2_008_partial_29_0482_valid :
    mulPoly ep_Q2_008_coefficient_29_0482
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0483 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 483 for generator 29. -/
def ep_Q2_008_partial_29_0483 : Poly :=
[
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 29. -/
theorem ep_Q2_008_partial_29_0483_valid :
    mulPoly ep_Q2_008_coefficient_29_0483
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0484 : Poly :=
[
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 484 for generator 29. -/
def ep_Q2_008_partial_29_0484 : Poly :=
[
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 29. -/
theorem ep_Q2_008_partial_29_0484_valid :
    mulPoly ep_Q2_008_coefficient_29_0484
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0485 : Poly :=
[
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 485 for generator 29. -/
def ep_Q2_008_partial_29_0485 : Poly :=
[
  term ((1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 29. -/
theorem ep_Q2_008_partial_29_0485_valid :
    mulPoly ep_Q2_008_coefficient_29_0485
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0486 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 29. -/
def ep_Q2_008_partial_29_0486 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 29. -/
theorem ep_Q2_008_partial_29_0486_valid :
    mulPoly ep_Q2_008_coefficient_29_0486
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0487 : Poly :=
[
  term ((-14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 487 for generator 29. -/
def ep_Q2_008_partial_29_0487 : Poly :=
[
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 29. -/
theorem ep_Q2_008_partial_29_0487_valid :
    mulPoly ep_Q2_008_coefficient_29_0487
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0488 : Poly :=
[
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 488 for generator 29. -/
def ep_Q2_008_partial_29_0488 : Poly :=
[
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 29. -/
theorem ep_Q2_008_partial_29_0488_valid :
    mulPoly ep_Q2_008_coefficient_29_0488
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0489 : Poly :=
[
  term ((-263791735744433374677096317089562400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 489 for generator 29. -/
def ep_Q2_008_partial_29_0489 : Poly :=
[
  term ((-527583471488866749354192634179124800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((263791735744433374677096317089562400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-527583471488866749354192634179124800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((263791735744433374677096317089562400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 29. -/
theorem ep_Q2_008_partial_29_0489_valid :
    mulPoly ep_Q2_008_coefficient_29_0489
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0490 : Poly :=
[
  term ((5801287902334596285 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 490 for generator 29. -/
def ep_Q2_008_partial_29_0490 : Poly :=
[
  term ((5801287902334596285 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5801287902334596285 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((5801287902334596285 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5801287902334596285 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 29. -/
theorem ep_Q2_008_partial_29_0490_valid :
    mulPoly ep_Q2_008_coefficient_29_0490
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0491 : Poly :=
[
  term ((-88956431780343747382367840568765190780206 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 29. -/
def ep_Q2_008_partial_29_0491 : Poly :=
[
  term ((-177912863560687494764735681137530381560412 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((88956431780343747382367840568765190780206 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-177912863560687494764735681137530381560412 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((88956431780343747382367840568765190780206 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 29. -/
theorem ep_Q2_008_partial_29_0491_valid :
    mulPoly ep_Q2_008_coefficient_29_0491
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0492 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 492 for generator 29. -/
def ep_Q2_008_partial_29_0492 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 29. -/
theorem ep_Q2_008_partial_29_0492_valid :
    mulPoly ep_Q2_008_coefficient_29_0492
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0493 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 493 for generator 29. -/
def ep_Q2_008_partial_29_0493 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 29. -/
theorem ep_Q2_008_partial_29_0493_valid :
    mulPoly ep_Q2_008_coefficient_29_0493
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0494 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 29. -/
def ep_Q2_008_partial_29_0494 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 5), (15, 2), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 29. -/
theorem ep_Q2_008_partial_29_0494_valid :
    mulPoly ep_Q2_008_coefficient_29_0494
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0495 : Poly :=
[
  term ((21813427377750406608811755943013363625000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 495 for generator 29. -/
def ep_Q2_008_partial_29_0495 : Poly :=
[
  term ((43626854755500813217623511886026727250000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21813427377750406608811755943013363625000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((43626854755500813217623511886026727250000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21813427377750406608811755943013363625000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 29. -/
theorem ep_Q2_008_partial_29_0495_valid :
    mulPoly ep_Q2_008_coefficient_29_0495
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0496 : Poly :=
[
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 496 for generator 29. -/
def ep_Q2_008_partial_29_0496 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 29. -/
theorem ep_Q2_008_partial_29_0496_valid :
    mulPoly ep_Q2_008_coefficient_29_0496
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0497 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 497 for generator 29. -/
def ep_Q2_008_partial_29_0497 : Poly :=
[
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 29. -/
theorem ep_Q2_008_partial_29_0497_valid :
    mulPoly ep_Q2_008_coefficient_29_0497
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0498 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 29. -/
def ep_Q2_008_partial_29_0498 : Poly :=
[
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 29. -/
theorem ep_Q2_008_partial_29_0498_valid :
    mulPoly ep_Q2_008_coefficient_29_0498
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0499 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 29. -/
def ep_Q2_008_partial_29_0499 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 29. -/
theorem ep_Q2_008_partial_29_0499_valid :
    mulPoly ep_Q2_008_coefficient_29_0499
        ep_Q2_008_generator_29_0400_0499 =
      ep_Q2_008_partial_29_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_29_0400_0499 : List Poly :=
[
  ep_Q2_008_partial_29_0400,
  ep_Q2_008_partial_29_0401,
  ep_Q2_008_partial_29_0402,
  ep_Q2_008_partial_29_0403,
  ep_Q2_008_partial_29_0404,
  ep_Q2_008_partial_29_0405,
  ep_Q2_008_partial_29_0406,
  ep_Q2_008_partial_29_0407,
  ep_Q2_008_partial_29_0408,
  ep_Q2_008_partial_29_0409,
  ep_Q2_008_partial_29_0410,
  ep_Q2_008_partial_29_0411,
  ep_Q2_008_partial_29_0412,
  ep_Q2_008_partial_29_0413,
  ep_Q2_008_partial_29_0414,
  ep_Q2_008_partial_29_0415,
  ep_Q2_008_partial_29_0416,
  ep_Q2_008_partial_29_0417,
  ep_Q2_008_partial_29_0418,
  ep_Q2_008_partial_29_0419,
  ep_Q2_008_partial_29_0420,
  ep_Q2_008_partial_29_0421,
  ep_Q2_008_partial_29_0422,
  ep_Q2_008_partial_29_0423,
  ep_Q2_008_partial_29_0424,
  ep_Q2_008_partial_29_0425,
  ep_Q2_008_partial_29_0426,
  ep_Q2_008_partial_29_0427,
  ep_Q2_008_partial_29_0428,
  ep_Q2_008_partial_29_0429,
  ep_Q2_008_partial_29_0430,
  ep_Q2_008_partial_29_0431,
  ep_Q2_008_partial_29_0432,
  ep_Q2_008_partial_29_0433,
  ep_Q2_008_partial_29_0434,
  ep_Q2_008_partial_29_0435,
  ep_Q2_008_partial_29_0436,
  ep_Q2_008_partial_29_0437,
  ep_Q2_008_partial_29_0438,
  ep_Q2_008_partial_29_0439,
  ep_Q2_008_partial_29_0440,
  ep_Q2_008_partial_29_0441,
  ep_Q2_008_partial_29_0442,
  ep_Q2_008_partial_29_0443,
  ep_Q2_008_partial_29_0444,
  ep_Q2_008_partial_29_0445,
  ep_Q2_008_partial_29_0446,
  ep_Q2_008_partial_29_0447,
  ep_Q2_008_partial_29_0448,
  ep_Q2_008_partial_29_0449,
  ep_Q2_008_partial_29_0450,
  ep_Q2_008_partial_29_0451,
  ep_Q2_008_partial_29_0452,
  ep_Q2_008_partial_29_0453,
  ep_Q2_008_partial_29_0454,
  ep_Q2_008_partial_29_0455,
  ep_Q2_008_partial_29_0456,
  ep_Q2_008_partial_29_0457,
  ep_Q2_008_partial_29_0458,
  ep_Q2_008_partial_29_0459,
  ep_Q2_008_partial_29_0460,
  ep_Q2_008_partial_29_0461,
  ep_Q2_008_partial_29_0462,
  ep_Q2_008_partial_29_0463,
  ep_Q2_008_partial_29_0464,
  ep_Q2_008_partial_29_0465,
  ep_Q2_008_partial_29_0466,
  ep_Q2_008_partial_29_0467,
  ep_Q2_008_partial_29_0468,
  ep_Q2_008_partial_29_0469,
  ep_Q2_008_partial_29_0470,
  ep_Q2_008_partial_29_0471,
  ep_Q2_008_partial_29_0472,
  ep_Q2_008_partial_29_0473,
  ep_Q2_008_partial_29_0474,
  ep_Q2_008_partial_29_0475,
  ep_Q2_008_partial_29_0476,
  ep_Q2_008_partial_29_0477,
  ep_Q2_008_partial_29_0478,
  ep_Q2_008_partial_29_0479,
  ep_Q2_008_partial_29_0480,
  ep_Q2_008_partial_29_0481,
  ep_Q2_008_partial_29_0482,
  ep_Q2_008_partial_29_0483,
  ep_Q2_008_partial_29_0484,
  ep_Q2_008_partial_29_0485,
  ep_Q2_008_partial_29_0486,
  ep_Q2_008_partial_29_0487,
  ep_Q2_008_partial_29_0488,
  ep_Q2_008_partial_29_0489,
  ep_Q2_008_partial_29_0490,
  ep_Q2_008_partial_29_0491,
  ep_Q2_008_partial_29_0492,
  ep_Q2_008_partial_29_0493,
  ep_Q2_008_partial_29_0494,
  ep_Q2_008_partial_29_0495,
  ep_Q2_008_partial_29_0496,
  ep_Q2_008_partial_29_0497,
  ep_Q2_008_partial_29_0498,
  ep_Q2_008_partial_29_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_29_0400_0499 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51805064846392315304565799288166400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5343649357770359928809160062853542400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((25902532423196157652282899644083200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((174115099703324275944373566058694400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2658052178537503421120647907551564800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-51805064846392315304565799288166400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87057549851662137972186783029347200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((27545000695353086567864247750412800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((25902532423196157652282899644083200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 3), (15, 1), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 4), (15, 1), (16, 1)],
  term ((174115099703324275944373566058694400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-87057549851662137972186783029347200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-5242112507699806175683631149591756800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((2671824678885179964404580031426771200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 3), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3771082783353798885 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(5, 1), (8, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (12, 2), (13, 3), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((526876206010307711317082147198395291288485 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((312966521693892623867440820064059520000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 3), (16, 1)],
  term ((-20965021705059812450394312605195784546966624 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 5), (16, 1)],
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((20964734931819230373122575394317939658838624 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 4), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 3), (13, 2), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 3), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((2062803814349319000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((936120975753739500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((12121242484249706733 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((936120975753739500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12121242484249706733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 3), (16, 1)],
  term ((12121242484249706733 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2062803814349319000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12121242484249706733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((135342613455984457558599485498740508354400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56635904452288620612 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2620317069871695189516223513983333513450828 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1042689515541300273560337967906951566958464 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((3878652220196210377318435925689064524800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((2704818431715636237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-43566974854307765613710240169288610528650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5409636863431272474 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-67671306727992228779299742749370254177200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((28317952226144310306 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1310158534935847594758111756991666756725414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 3), (16, 1)],
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21783487427153882806855120084644305264325 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((2704818431715636237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-43566974854307765613710240169288610528650 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6872522474363211150704497757530223748567807 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((135342613455984457558599485498740508354400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((2552645763143702960736923771233963259273628 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((28317952226144310306 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((30137080667271719852433544999476446232818922 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 5), (16, 1)],
  term ((-271046635537516487134387692321515863757400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((44385193544695590849 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1706795378032707216639786348208081378771428 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-44385193544695590849 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-29434166651263048025857585118426189012993022 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((124403113388315111688 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-31743896004430628895 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1706182781762243171296886499025534984046628 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((991387240608054774306240096624765472625214 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-248806226776630223376 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((50085819053596288263 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4535975837436520059813933154841411404800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((44385193544695590849 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((31743896004430628895 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((853091390881121585648443249512767492023314 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 3), (13, 2), (15, 2), (16, 1)],
  term ((124403113388315111688 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 3), (13, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((7030820451939963474 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((-612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 3), (15, 2), (16, 1)],
  term ((-44385193544695590849 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 3), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 4), (13, 1), (15, 1), (16, 1)],
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 4), (16, 1)],
  term ((-31743896004430628895 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-271046635537516487134387692321515863757400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((31743896004430628895 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-12914264732944467407896125524792252519061300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-8677518993356820983991872122305308774400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 4), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((-5371251347333731248936675538011990917982456 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3145357594510568679 : Rat) / 382320801994028336) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9077878214226898167748603621648626865457961 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25704185315291553882969825739071383546827173 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-304247987726324186604802807801755161392644513 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128922959008200030474205379231977607992800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-58894555308983863987707352798147032582804030 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((303098423034692530479 : Rat) / 2771825814456705436) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((29479508394243982001472227743881510693400215 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((2698876203647273278429468578882410638649265 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128922959008200030474205379231977607992800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-303098423034692530479 : Rat) / 1385912907228352718) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2731653581037895707156717181526586979326828 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3145357594510568679 : Rat) / 764641603988056672) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-58959016788487964002944455487763021386800430 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((46622983542725568765075884164196200686187797 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 47790100249253542) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((9077878214226898167748603621648626865457961 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2698876203647273278429468578882410638649265 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((64461479504100015237102689615988803996400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((303098423034692530479 : Rat) / 2771825814456705436) [(5, 1), (12, 3), (13, 1), (16, 1)],
  term ((29479508394243982001472227743881510693400215 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-9077878214226898167748603621648626865457961 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 4), (13, 1), (16, 1)],
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 4), (15, 1), (16, 1)],
  term ((2698876203647273278429468578882410638649265 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((19508473601735610159168287487840864587844837 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5371251347333731248936675538011990917982456 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-23018559641624688258501487970065388087835945 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3145357594510568679 : Rat) / 764641603988056672) [(5, 1), (13, 3), (16, 1)],
  term ((-33259388188847635080514530679306328308568457 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (13, 5), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((51253087804110068701788460990137600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1484441283807928656474021351640281600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25626543902055034350894230495068800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 4), (15, 1), (16, 1)],
  term ((51253087804110068701788460990137600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25626543902055034350894230495068800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((2839800716849950473254649542268364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(5, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (12, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (13, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 3), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2620602257488432947646572042984856746882828 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2620604276212828293552037416426495418041228 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7956397138394139933 : Rat) / 2771825814456705436) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 4), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11131745259810510252 : Rat) / 692956453614176359) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-247571361945604143402 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-5565872629905255126 : Rat) / 692956453614176359) [(5, 2), (12, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 3), (13, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 3), (14, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 3), (15, 2), (16, 1)],
  term ((-7956397138394139933 : Rat) / 2771825814456705436) [(5, 2), (12, 3), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 4), (16, 1)],
  term ((11131745259810510252 : Rat) / 692956453614176359) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((2620602257488432947646572042984856746882828 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5565872629905255126 : Rat) / 692956453614176359) [(5, 2), (13, 2), (16, 1)],
  term ((473614779374199230856 : Rat) / 692956453614176359) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (13, 4), (16, 1)],
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((361881534062116797137923254902784000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((670894437757346218443978034284614400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-533094858078693164454512352898610596796436 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 4), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((-527583471488866749354192634179124800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5801287902334596285 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-177912863560687494764735681137530381560412 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((236661493852748180893135784107946414927715 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((268351716818328072475853413659355200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((36849058405789186249815308768047468800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((43626854755500813217623511886026727250000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((263791735744433374677096317089562400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5801287902334596285 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((88956431780343747382367840568765190780206 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((-21813427377750406608811755943013363625000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 3), (13, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (15, 3), (16, 1)],
  term ((43626854755500813217623511886026727250000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((684379122346976753923022897434671508224885 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-488956858526963071690935786756396000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-177905213600350906196870045344334784250812 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-5801287902334596285 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)],
  term ((266652968712493501969352458239236692923018 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 5), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 5), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 6), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 400 through 499. -/
theorem ep_Q2_008_block_29_0400_0499_valid :
    checkProductSumEq ep_Q2_008_partials_29_0400_0499
      ep_Q2_008_block_29_0400_0499 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
