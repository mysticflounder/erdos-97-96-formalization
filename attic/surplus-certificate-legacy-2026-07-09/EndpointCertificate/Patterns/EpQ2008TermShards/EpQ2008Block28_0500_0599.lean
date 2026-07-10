/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 28:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_28_0500_0599 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0500 : Poly :=
[
  term ((754681021517603253 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 500 for generator 28. -/
def ep_Q2_008_partial_28_0500 : Poly :=
[
  term ((754681021517603253 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-754681021517603253 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((754681021517603253 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-754681021517603253 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 28. -/
theorem ep_Q2_008_partial_28_0500_valid :
    mulPoly ep_Q2_008_coefficient_28_0500
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0501 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 501 for generator 28. -/
def ep_Q2_008_partial_28_0501 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 28. -/
theorem ep_Q2_008_partial_28_0501_valid :
    mulPoly ep_Q2_008_coefficient_28_0501
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0502 : Poly :=
[
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 502 for generator 28. -/
def ep_Q2_008_partial_28_0502 : Poly :=
[
  term ((-7030820451939963474 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3515410225969981737 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-7030820451939963474 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3515410225969981737 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 28. -/
theorem ep_Q2_008_partial_28_0502_valid :
    mulPoly ep_Q2_008_coefficient_28_0502
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0503 : Poly :=
[
  term ((701452629821795310284442077578476117595500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 28. -/
def ep_Q2_008_partial_28_0503 : Poly :=
[
  term ((1402905259643590620568884155156952235191000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-701452629821795310284442077578476117595500 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1402905259643590620568884155156952235191000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-701452629821795310284442077578476117595500 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 28. -/
theorem ep_Q2_008_partial_28_0503_valid :
    mulPoly ep_Q2_008_coefficient_28_0503
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0504 : Poly :=
[
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 504 for generator 28. -/
def ep_Q2_008_partial_28_0504 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 28. -/
theorem ep_Q2_008_partial_28_0504_valid :
    mulPoly ep_Q2_008_coefficient_28_0504
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0505 : Poly :=
[
  term ((-63130336707044718000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 505 for generator 28. -/
def ep_Q2_008_partial_28_0505 : Poly :=
[
  term ((-126260673414089436000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((63130336707044718000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-126260673414089436000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((63130336707044718000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 28. -/
theorem ep_Q2_008_partial_28_0505_valid :
    mulPoly ep_Q2_008_coefficient_28_0505
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0506 : Poly :=
[
  term ((-5226233030089903547176922982752060966400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 506 for generator 28. -/
def ep_Q2_008_partial_28_0506 : Poly :=
[
  term ((-10452466060179807094353845965504121932800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((5226233030089903547176922982752060966400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10452466060179807094353845965504121932800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((5226233030089903547176922982752060966400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 28. -/
theorem ep_Q2_008_partial_28_0506_valid :
    mulPoly ep_Q2_008_coefficient_28_0506
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0507 : Poly :=
[
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 507 for generator 28. -/
def ep_Q2_008_partial_28_0507 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 28. -/
theorem ep_Q2_008_partial_28_0507_valid :
    mulPoly ep_Q2_008_coefficient_28_0507
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0508 : Poly :=
[
  term ((2995209948436101768 : Rat) / 692956453614176359) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 508 for generator 28. -/
def ep_Q2_008_partial_28_0508 : Poly :=
[
  term ((5990419896872203536 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2995209948436101768 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((5990419896872203536 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2995209948436101768 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 28. -/
theorem ep_Q2_008_partial_28_0508_valid :
    mulPoly ep_Q2_008_coefficient_28_0508
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0509 : Poly :=
[
  term ((60981728946984434407335147871046110479600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 509 for generator 28. -/
def ep_Q2_008_partial_28_0509 : Poly :=
[
  term ((121963457893968868814670295742092220959200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-60981728946984434407335147871046110479600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((121963457893968868814670295742092220959200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-60981728946984434407335147871046110479600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 28. -/
theorem ep_Q2_008_partial_28_0509_valid :
    mulPoly ep_Q2_008_coefficient_28_0509
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0510 : Poly :=
[
  term ((1291152693571377738 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 510 for generator 28. -/
def ep_Q2_008_partial_28_0510 : Poly :=
[
  term ((2582305387142755476 : Rat) / 692956453614176359) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1291152693571377738 : Rat) / 692956453614176359) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((2582305387142755476 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1291152693571377738 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 28. -/
theorem ep_Q2_008_partial_28_0510_valid :
    mulPoly ep_Q2_008_coefficient_28_0510
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0511 : Poly :=
[
  term ((36789009572319465017193152073204128165495592 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 511 for generator 28. -/
def ep_Q2_008_partial_28_0511 : Poly :=
[
  term ((73578019144638930034386304146408256330991184 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-36789009572319465017193152073204128165495592 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((73578019144638930034386304146408256330991184 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-36789009572319465017193152073204128165495592 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 28. -/
theorem ep_Q2_008_partial_28_0511_valid :
    mulPoly ep_Q2_008_coefficient_28_0511
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0512 : Poly :=
[
  term ((-1898308371774153392778837277412760322965773 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 28. -/
def ep_Q2_008_partial_28_0512 : Poly :=
[
  term ((-1898308371774153392778837277412760322965773 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1898308371774153392778837277412760322965773 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1898308371774153392778837277412760322965773 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((1898308371774153392778837277412760322965773 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 28. -/
theorem ep_Q2_008_partial_28_0512_valid :
    mulPoly ep_Q2_008_coefficient_28_0512
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0513 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 513 for generator 28. -/
def ep_Q2_008_partial_28_0513 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 2), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 28. -/
theorem ep_Q2_008_partial_28_0513_valid :
    mulPoly ep_Q2_008_coefficient_28_0513
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0514 : Poly :=
[
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 514 for generator 28. -/
def ep_Q2_008_partial_28_0514 : Poly :=
[
  term ((-46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 28. -/
theorem ep_Q2_008_partial_28_0514_valid :
    mulPoly ep_Q2_008_coefficient_28_0514
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0515 : Poly :=
[
  term ((72486837235487860173130134686509559329200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 515 for generator 28. -/
def ep_Q2_008_partial_28_0515 : Poly :=
[
  term ((144973674470975720346260269373019118658400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-72486837235487860173130134686509559329200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((144973674470975720346260269373019118658400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-72486837235487860173130134686509559329200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 28. -/
theorem ep_Q2_008_partial_28_0515_valid :
    mulPoly ep_Q2_008_coefficient_28_0515
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0516 : Poly :=
[
  term ((231777133243455688323 : Rat) / 5543651628913410872) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 516 for generator 28. -/
def ep_Q2_008_partial_28_0516 : Poly :=
[
  term ((231777133243455688323 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-231777133243455688323 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((231777133243455688323 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-231777133243455688323 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 28. -/
theorem ep_Q2_008_partial_28_0516_valid :
    mulPoly ep_Q2_008_coefficient_28_0516
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0517 : Poly :=
[
  term ((32666266018254227427811549646310886227050550 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 28. -/
def ep_Q2_008_partial_28_0517 : Poly :=
[
  term ((65332532036508454855623099292621772454101100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32666266018254227427811549646310886227050550 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((65332532036508454855623099292621772454101100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-32666266018254227427811549646310886227050550 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 28. -/
theorem ep_Q2_008_partial_28_0517_valid :
    mulPoly ep_Q2_008_coefficient_28_0517
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0518 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 518 for generator 28. -/
def ep_Q2_008_partial_28_0518 : Poly :=
[
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (13, 3), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 28. -/
theorem ep_Q2_008_partial_28_0518_valid :
    mulPoly ep_Q2_008_coefficient_28_0518
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0519 : Poly :=
[
  term ((1938760777577736642389293617615891803916203 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 28. -/
def ep_Q2_008_partial_28_0519 : Poly :=
[
  term ((1938760777577736642389293617615891803916203 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1938760777577736642389293617615891803916203 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((1938760777577736642389293617615891803916203 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1938760777577736642389293617615891803916203 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 28. -/
theorem ep_Q2_008_partial_28_0519_valid :
    mulPoly ep_Q2_008_coefficient_28_0519
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0520 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 28. -/
def ep_Q2_008_partial_28_0520 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 28. -/
theorem ep_Q2_008_partial_28_0520_valid :
    mulPoly ep_Q2_008_coefficient_28_0520
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0521 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 521 for generator 28. -/
def ep_Q2_008_partial_28_0521 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 28. -/
theorem ep_Q2_008_partial_28_0521_valid :
    mulPoly ep_Q2_008_coefficient_28_0521
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0522 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 28. -/
def ep_Q2_008_partial_28_0522 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 28. -/
theorem ep_Q2_008_partial_28_0522_valid :
    mulPoly ep_Q2_008_coefficient_28_0522
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0523 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 523 for generator 28. -/
def ep_Q2_008_partial_28_0523 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 28. -/
theorem ep_Q2_008_partial_28_0523_valid :
    mulPoly ep_Q2_008_coefficient_28_0523
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0524 : Poly :=
[
  term ((-1807145910722695755707504254170777600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 28. -/
def ep_Q2_008_partial_28_0524 : Poly :=
[
  term ((-3614291821445391511415008508341555200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1807145910722695755707504254170777600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3614291821445391511415008508341555200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1807145910722695755707504254170777600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 28. -/
theorem ep_Q2_008_partial_28_0524_valid :
    mulPoly ep_Q2_008_coefficient_28_0524
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0525 : Poly :=
[
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 28. -/
def ep_Q2_008_partial_28_0525 : Poly :=
[
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 28. -/
theorem ep_Q2_008_partial_28_0525_valid :
    mulPoly ep_Q2_008_coefficient_28_0525
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0526 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 28. -/
def ep_Q2_008_partial_28_0526 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 28. -/
theorem ep_Q2_008_partial_28_0526_valid :
    mulPoly ep_Q2_008_coefficient_28_0526
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0527 : Poly :=
[
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 527 for generator 28. -/
def ep_Q2_008_partial_28_0527 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 28. -/
theorem ep_Q2_008_partial_28_0527_valid :
    mulPoly ep_Q2_008_coefficient_28_0527
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0528 : Poly :=
[
  term ((1710334522648265625937459383411628800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 28. -/
def ep_Q2_008_partial_28_0528 : Poly :=
[
  term ((3420669045296531251874918766823257600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1710334522648265625937459383411628800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((3420669045296531251874918766823257600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1710334522648265625937459383411628800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 28. -/
theorem ep_Q2_008_partial_28_0528_valid :
    mulPoly ep_Q2_008_coefficient_28_0528
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0529 : Poly :=
[
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 529 for generator 28. -/
def ep_Q2_008_partial_28_0529 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 28. -/
theorem ep_Q2_008_partial_28_0529_valid :
    mulPoly ep_Q2_008_coefficient_28_0529
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0530 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 530 for generator 28. -/
def ep_Q2_008_partial_28_0530 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(3, 2), (5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 28. -/
theorem ep_Q2_008_partial_28_0530_valid :
    mulPoly ep_Q2_008_coefficient_28_0530
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0531 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 531 for generator 28. -/
def ep_Q2_008_partial_28_0531 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (5, 2), (10, 1), (12, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (5, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 28. -/
theorem ep_Q2_008_partial_28_0531_valid :
    mulPoly ep_Q2_008_coefficient_28_0531
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0532 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 28. -/
def ep_Q2_008_partial_28_0532 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 28. -/
theorem ep_Q2_008_partial_28_0532_valid :
    mulPoly ep_Q2_008_coefficient_28_0532
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0533 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 533 for generator 28. -/
def ep_Q2_008_partial_28_0533 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (10, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (10, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 28. -/
theorem ep_Q2_008_partial_28_0533_valid :
    mulPoly ep_Q2_008_coefficient_28_0533
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0534 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 534 for generator 28. -/
def ep_Q2_008_partial_28_0534 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (5, 2), (10, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 28. -/
theorem ep_Q2_008_partial_28_0534_valid :
    mulPoly ep_Q2_008_coefficient_28_0534
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0535 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 28. -/
def ep_Q2_008_partial_28_0535 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 28. -/
theorem ep_Q2_008_partial_28_0535_valid :
    mulPoly ep_Q2_008_coefficient_28_0535
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0536 : Poly :=
[
  term ((-301391223238126783272 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 536 for generator 28. -/
def ep_Q2_008_partial_28_0536 : Poly :=
[
  term ((-602782446476253566544 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((301391223238126783272 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-602782446476253566544 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((301391223238126783272 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 28. -/
theorem ep_Q2_008_partial_28_0536_valid :
    mulPoly ep_Q2_008_coefficient_28_0536
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0537 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 537 for generator 28. -/
def ep_Q2_008_partial_28_0537 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (12, 1), (15, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 28. -/
theorem ep_Q2_008_partial_28_0537_valid :
    mulPoly ep_Q2_008_coefficient_28_0537
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0538 : Poly :=
[
  term ((-367773001305982278 : Rat) / 692956453614176359) [(5, 2), (12, 1), (16, 1)]
]

/-- Partial product 538 for generator 28. -/
def ep_Q2_008_partial_28_0538 : Poly :=
[
  term ((-735546002611964556 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((367773001305982278 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (16, 1)],
  term ((-735546002611964556 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((367773001305982278 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 28. -/
theorem ep_Q2_008_partial_28_0538_valid :
    mulPoly ep_Q2_008_coefficient_28_0538
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0539 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (16, 1)]
]

/-- Partial product 539 for generator 28. -/
def ep_Q2_008_partial_28_0539 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 2), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 28. -/
theorem ep_Q2_008_partial_28_0539_valid :
    mulPoly ep_Q2_008_coefficient_28_0539
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0540 : Poly :=
[
  term ((-3934260495166427459886794713907682648621042 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 28. -/
def ep_Q2_008_partial_28_0540 : Poly :=
[
  term ((-7868520990332854919773589427815365297242084 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3934260495166427459886794713907682648621042 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7868520990332854919773589427815365297242084 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((3934260495166427459886794713907682648621042 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 28. -/
theorem ep_Q2_008_partial_28_0540_valid :
    mulPoly ep_Q2_008_coefficient_28_0540
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0541 : Poly :=
[
  term ((285245264850369991311 : Rat) / 692956453614176359) [(5, 2), (13, 2), (16, 1)]
]

/-- Partial product 541 for generator 28. -/
def ep_Q2_008_partial_28_0541 : Poly :=
[
  term ((570490529700739982622 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-285245264850369991311 : Rat) / 692956453614176359) [(2, 2), (5, 2), (13, 2), (16, 1)],
  term ((570490529700739982622 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-285245264850369991311 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 28. -/
theorem ep_Q2_008_partial_28_0541_valid :
    mulPoly ep_Q2_008_coefficient_28_0541
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0542 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 542 for generator 28. -/
def ep_Q2_008_partial_28_0542 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 28. -/
theorem ep_Q2_008_partial_28_0542_valid :
    mulPoly ep_Q2_008_coefficient_28_0542
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0543 : Poly :=
[
  term ((-35024956417101223881 : Rat) / 5543651628913410872) [(5, 2), (16, 1)]
]

/-- Partial product 543 for generator 28. -/
def ep_Q2_008_partial_28_0543 : Poly :=
[
  term ((-35024956417101223881 : Rat) / 2771825814456705436) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((35024956417101223881 : Rat) / 5543651628913410872) [(2, 2), (5, 2), (16, 1)],
  term ((-35024956417101223881 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((35024956417101223881 : Rat) / 5543651628913410872) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 28. -/
theorem ep_Q2_008_partial_28_0543_valid :
    mulPoly ep_Q2_008_coefficient_28_0543
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0544 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 544 for generator 28. -/
def ep_Q2_008_partial_28_0544 : Poly :=
[
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 28. -/
theorem ep_Q2_008_partial_28_0544_valid :
    mulPoly ep_Q2_008_coefficient_28_0544
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0545 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 28. -/
def ep_Q2_008_partial_28_0545 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 28. -/
theorem ep_Q2_008_partial_28_0545_valid :
    mulPoly ep_Q2_008_coefficient_28_0545
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0546 : Poly :=
[
  term ((-4100402568637808240573294611277401900800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 28. -/
def ep_Q2_008_partial_28_0546 : Poly :=
[
  term ((-8200805137275616481146589222554803801600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4100402568637808240573294611277401900800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8200805137275616481146589222554803801600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4100402568637808240573294611277401900800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 28. -/
theorem ep_Q2_008_partial_28_0546_valid :
    mulPoly ep_Q2_008_coefficient_28_0546
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0547 : Poly :=
[
  term ((-22727951612902975131 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 547 for generator 28. -/
def ep_Q2_008_partial_28_0547 : Poly :=
[
  term ((-45455903225805950262 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((22727951612902975131 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-45455903225805950262 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((22727951612902975131 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 28. -/
theorem ep_Q2_008_partial_28_0547_valid :
    mulPoly ep_Q2_008_coefficient_28_0547
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0548 : Poly :=
[
  term ((-1950042994925908094628132857928004800000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 548 for generator 28. -/
def ep_Q2_008_partial_28_0548 : Poly :=
[
  term ((-3900085989851816189256265715856009600000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1950042994925908094628132857928004800000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3900085989851816189256265715856009600000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1950042994925908094628132857928004800000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 28. -/
theorem ep_Q2_008_partial_28_0548_valid :
    mulPoly ep_Q2_008_coefficient_28_0548
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0549 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 549 for generator 28. -/
def ep_Q2_008_partial_28_0549 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 28. -/
theorem ep_Q2_008_partial_28_0549_valid :
    mulPoly ep_Q2_008_coefficient_28_0549
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0550 : Poly :=
[
  term ((9275232236768513487 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 550 for generator 28. -/
def ep_Q2_008_partial_28_0550 : Poly :=
[
  term ((9275232236768513487 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9275232236768513487 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((9275232236768513487 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9275232236768513487 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 28. -/
theorem ep_Q2_008_partial_28_0550_valid :
    mulPoly ep_Q2_008_coefficient_28_0550
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0551 : Poly :=
[
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 28. -/
def ep_Q2_008_partial_28_0551 : Poly :=
[
  term ((-48789385395874675328416438830643200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48789385395874675328416438830643200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 28. -/
theorem ep_Q2_008_partial_28_0551_valid :
    mulPoly ep_Q2_008_coefficient_28_0551
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0552 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 552 for generator 28. -/
def ep_Q2_008_partial_28_0552 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 28. -/
theorem ep_Q2_008_partial_28_0552_valid :
    mulPoly ep_Q2_008_coefficient_28_0552
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0553 : Poly :=
[
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 553 for generator 28. -/
def ep_Q2_008_partial_28_0553 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 28. -/
theorem ep_Q2_008_partial_28_0553_valid :
    mulPoly ep_Q2_008_coefficient_28_0553
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0554 : Poly :=
[
  term ((7269687646343786208936332322919303371000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 28. -/
def ep_Q2_008_partial_28_0554 : Poly :=
[
  term ((14539375292687572417872664645838606742000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7269687646343786208936332322919303371000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((14539375292687572417872664645838606742000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7269687646343786208936332322919303371000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 28. -/
theorem ep_Q2_008_partial_28_0554_valid :
    mulPoly ep_Q2_008_coefficient_28_0554
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0555 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 555 for generator 28. -/
def ep_Q2_008_partial_28_0555 : Poly :=
[
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 28. -/
theorem ep_Q2_008_partial_28_0555_valid :
    mulPoly ep_Q2_008_coefficient_28_0555
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0556 : Poly :=
[
  term ((1317184386664505546145049958378030400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 556 for generator 28. -/
def ep_Q2_008_partial_28_0556 : Poly :=
[
  term ((2634368773329011092290099916756060800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1317184386664505546145049958378030400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2634368773329011092290099916756060800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1317184386664505546145049958378030400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 28. -/
theorem ep_Q2_008_partial_28_0556_valid :
    mulPoly ep_Q2_008_coefficient_28_0556
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0557 : Poly :=
[
  term ((31672064140243080171 : Rat) / 2771825814456705436) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 557 for generator 28. -/
def ep_Q2_008_partial_28_0557 : Poly :=
[
  term ((31672064140243080171 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-31672064140243080171 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((31672064140243080171 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31672064140243080171 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 28. -/
theorem ep_Q2_008_partial_28_0557_valid :
    mulPoly ep_Q2_008_coefficient_28_0557
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0558 : Poly :=
[
  term ((598071422966402945354561735319276999173145 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 558 for generator 28. -/
def ep_Q2_008_partial_28_0558 : Poly :=
[
  term ((598071422966402945354561735319276999173145 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-598071422966402945354561735319276999173145 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((598071422966402945354561735319276999173145 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-598071422966402945354561735319276999173145 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 28. -/
theorem ep_Q2_008_partial_28_0558_valid :
    mulPoly ep_Q2_008_coefficient_28_0558
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0559 : Poly :=
[
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 559 for generator 28. -/
def ep_Q2_008_partial_28_0559 : Poly :=
[
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 28. -/
theorem ep_Q2_008_partial_28_0559_valid :
    mulPoly ep_Q2_008_coefficient_28_0559
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0560 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 560 for generator 28. -/
def ep_Q2_008_partial_28_0560 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 28. -/
theorem ep_Q2_008_partial_28_0560_valid :
    mulPoly ep_Q2_008_coefficient_28_0560
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0561 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 28. -/
def ep_Q2_008_partial_28_0561 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 28. -/
theorem ep_Q2_008_partial_28_0561_valid :
    mulPoly ep_Q2_008_coefficient_28_0561
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0562 : Poly :=
[
  term ((-2365746871750624026120895831879071978422385 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 562 for generator 28. -/
def ep_Q2_008_partial_28_0562 : Poly :=
[
  term ((-2365746871750624026120895831879071978422385 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2365746871750624026120895831879071978422385 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2365746871750624026120895831879071978422385 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((2365746871750624026120895831879071978422385 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 28. -/
theorem ep_Q2_008_partial_28_0562_valid :
    mulPoly ep_Q2_008_coefficient_28_0562
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0563 : Poly :=
[
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 563 for generator 28. -/
def ep_Q2_008_partial_28_0563 : Poly :=
[
  term ((206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 28. -/
theorem ep_Q2_008_partial_28_0563_valid :
    mulPoly ep_Q2_008_coefficient_28_0563
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0564 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 28. -/
def ep_Q2_008_partial_28_0564 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 28. -/
theorem ep_Q2_008_partial_28_0564_valid :
    mulPoly ep_Q2_008_coefficient_28_0564
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0565 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 565 for generator 28. -/
def ep_Q2_008_partial_28_0565 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 28. -/
theorem ep_Q2_008_partial_28_0565_valid :
    mulPoly ep_Q2_008_coefficient_28_0565
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0566 : Poly :=
[
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 566 for generator 28. -/
def ep_Q2_008_partial_28_0566 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 28. -/
theorem ep_Q2_008_partial_28_0566_valid :
    mulPoly ep_Q2_008_coefficient_28_0566
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0567 : Poly :=
[
  term ((-225985235014050677230567588154352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 28. -/
def ep_Q2_008_partial_28_0567 : Poly :=
[
  term ((-451970470028101354461135176308704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((225985235014050677230567588154352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-451970470028101354461135176308704000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((225985235014050677230567588154352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 28. -/
theorem ep_Q2_008_partial_28_0567_valid :
    mulPoly ep_Q2_008_coefficient_28_0567
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0568 : Poly :=
[
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 568 for generator 28. -/
def ep_Q2_008_partial_28_0568 : Poly :=
[
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 28. -/
theorem ep_Q2_008_partial_28_0568_valid :
    mulPoly ep_Q2_008_coefficient_28_0568
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0569 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 569 for generator 28. -/
def ep_Q2_008_partial_28_0569 : Poly :=
[
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 28. -/
theorem ep_Q2_008_partial_28_0569_valid :
    mulPoly ep_Q2_008_coefficient_28_0569
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0570 : Poly :=
[
  term ((-36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 28. -/
def ep_Q2_008_partial_28_0570 : Poly :=
[
  term ((-73328561450343063493624814212170777600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-73328561450343063493624814212170777600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 28. -/
theorem ep_Q2_008_partial_28_0570_valid :
    mulPoly ep_Q2_008_coefficient_28_0570
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0571 : Poly :=
[
  term ((-14795677304102171132982799744723200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 571 for generator 28. -/
def ep_Q2_008_partial_28_0571 : Poly :=
[
  term ((-29591354608204342265965599489446400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((14795677304102171132982799744723200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-29591354608204342265965599489446400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((14795677304102171132982799744723200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 28. -/
theorem ep_Q2_008_partial_28_0571_valid :
    mulPoly ep_Q2_008_coefficient_28_0571
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0572 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 2771825814456705436) [(6, 1), (7, 2), (16, 1)]
]

/-- Partial product 572 for generator 28. -/
def ep_Q2_008_partial_28_0572 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 28. -/
theorem ep_Q2_008_partial_28_0572_valid :
    mulPoly ep_Q2_008_coefficient_28_0572
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0573 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 573 for generator 28. -/
def ep_Q2_008_partial_28_0573 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 28. -/
theorem ep_Q2_008_partial_28_0573_valid :
    mulPoly ep_Q2_008_coefficient_28_0573
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0574 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 28. -/
def ep_Q2_008_partial_28_0574 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 28. -/
theorem ep_Q2_008_partial_28_0574_valid :
    mulPoly ep_Q2_008_coefficient_28_0574
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0575 : Poly :=
[
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 28. -/
def ep_Q2_008_partial_28_0575 : Poly :=
[
  term ((-43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 28. -/
theorem ep_Q2_008_partial_28_0575_valid :
    mulPoly ep_Q2_008_coefficient_28_0575
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0576 : Poly :=
[
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 576 for generator 28. -/
def ep_Q2_008_partial_28_0576 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(3, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 28. -/
theorem ep_Q2_008_partial_28_0576_valid :
    mulPoly ep_Q2_008_coefficient_28_0576
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0577 : Poly :=
[
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 577 for generator 28. -/
def ep_Q2_008_partial_28_0577 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 28. -/
theorem ep_Q2_008_partial_28_0577_valid :
    mulPoly ep_Q2_008_coefficient_28_0577
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0578 : Poly :=
[
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 28. -/
def ep_Q2_008_partial_28_0578 : Poly :=
[
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 28. -/
theorem ep_Q2_008_partial_28_0578_valid :
    mulPoly ep_Q2_008_coefficient_28_0578
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0579 : Poly :=
[
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 579 for generator 28. -/
def ep_Q2_008_partial_28_0579 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 28. -/
theorem ep_Q2_008_partial_28_0579_valid :
    mulPoly ep_Q2_008_coefficient_28_0579
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0580 : Poly :=
[
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 580 for generator 28. -/
def ep_Q2_008_partial_28_0580 : Poly :=
[
  term ((2315584888450340175 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2315584888450340175 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((2315584888450340175 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2315584888450340175 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 28. -/
theorem ep_Q2_008_partial_28_0580_valid :
    mulPoly ep_Q2_008_coefficient_28_0580
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0581 : Poly :=
[
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 28. -/
def ep_Q2_008_partial_28_0581 : Poly :=
[
  term ((247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 28. -/
theorem ep_Q2_008_partial_28_0581_valid :
    mulPoly ep_Q2_008_coefficient_28_0581
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0582 : Poly :=
[
  term ((-28685639576536280178410090242209814457850 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 582 for generator 28. -/
def ep_Q2_008_partial_28_0582 : Poly :=
[
  term ((-57371279153072560356820180484419628915700 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28685639576536280178410090242209814457850 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-57371279153072560356820180484419628915700 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((28685639576536280178410090242209814457850 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 28. -/
theorem ep_Q2_008_partial_28_0582_valid :
    mulPoly ep_Q2_008_coefficient_28_0582
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0583 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 583 for generator 28. -/
def ep_Q2_008_partial_28_0583 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 28. -/
theorem ep_Q2_008_partial_28_0583_valid :
    mulPoly ep_Q2_008_coefficient_28_0583
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0584 : Poly :=
[
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 584 for generator 28. -/
def ep_Q2_008_partial_28_0584 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 28. -/
theorem ep_Q2_008_partial_28_0584_valid :
    mulPoly ep_Q2_008_coefficient_28_0584
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0585 : Poly :=
[
  term ((1665435230595642706003553090673756039492600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 585 for generator 28. -/
def ep_Q2_008_partial_28_0585 : Poly :=
[
  term ((3330870461191285412007106181347512078985200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1665435230595642706003553090673756039492600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3330870461191285412007106181347512078985200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1665435230595642706003553090673756039492600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 28. -/
theorem ep_Q2_008_partial_28_0585_valid :
    mulPoly ep_Q2_008_coefficient_28_0585
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0586 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 586 for generator 28. -/
def ep_Q2_008_partial_28_0586 : Poly :=
[
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 28. -/
theorem ep_Q2_008_partial_28_0586_valid :
    mulPoly ep_Q2_008_coefficient_28_0586
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0587 : Poly :=
[
  term ((13505173802565787125 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 587 for generator 28. -/
def ep_Q2_008_partial_28_0587 : Poly :=
[
  term ((13505173802565787125 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-13505173802565787125 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (10, 1), (16, 1)],
  term ((13505173802565787125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13505173802565787125 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 28. -/
theorem ep_Q2_008_partial_28_0587_valid :
    mulPoly ep_Q2_008_coefficient_28_0587
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0588 : Poly :=
[
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 588 for generator 28. -/
def ep_Q2_008_partial_28_0588 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 28. -/
theorem ep_Q2_008_partial_28_0588_valid :
    mulPoly ep_Q2_008_coefficient_28_0588
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0589 : Poly :=
[
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 589 for generator 28. -/
def ep_Q2_008_partial_28_0589 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 28. -/
theorem ep_Q2_008_partial_28_0589_valid :
    mulPoly ep_Q2_008_coefficient_28_0589
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0590 : Poly :=
[
  term ((-10299020183881809514530705983503265259600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 28. -/
def ep_Q2_008_partial_28_0590 : Poly :=
[
  term ((-20598040367763619029061411967006530519200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10299020183881809514530705983503265259600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20598040367763619029061411967006530519200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((10299020183881809514530705983503265259600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 28. -/
theorem ep_Q2_008_partial_28_0590_valid :
    mulPoly ep_Q2_008_coefficient_28_0590
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0591 : Poly :=
[
  term ((5777434996913182368465331176363447024000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 591 for generator 28. -/
def ep_Q2_008_partial_28_0591 : Poly :=
[
  term ((11554869993826364736930662352726894048000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5777434996913182368465331176363447024000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11554869993826364736930662352726894048000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5777434996913182368465331176363447024000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 28. -/
theorem ep_Q2_008_partial_28_0591_valid :
    mulPoly ep_Q2_008_coefficient_28_0591
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0592 : Poly :=
[
  term ((-1379004986442776598 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 592 for generator 28. -/
def ep_Q2_008_partial_28_0592 : Poly :=
[
  term ((-2758009972885553196 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1379004986442776598 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2758009972885553196 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1379004986442776598 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 28. -/
theorem ep_Q2_008_partial_28_0592_valid :
    mulPoly ep_Q2_008_coefficient_28_0592
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0593 : Poly :=
[
  term ((4390416525855895850965814463177940895488800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 593 for generator 28. -/
def ep_Q2_008_partial_28_0593 : Poly :=
[
  term ((8780833051711791701931628926355881790977600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4390416525855895850965814463177940895488800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8780833051711791701931628926355881790977600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4390416525855895850965814463177940895488800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 28. -/
theorem ep_Q2_008_partial_28_0593_valid :
    mulPoly ep_Q2_008_coefficient_28_0593
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0594 : Poly :=
[
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 594 for generator 28. -/
def ep_Q2_008_partial_28_0594 : Poly :=
[
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 28. -/
theorem ep_Q2_008_partial_28_0594_valid :
    mulPoly ep_Q2_008_coefficient_28_0594
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0595 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 595 for generator 28. -/
def ep_Q2_008_partial_28_0595 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 28. -/
theorem ep_Q2_008_partial_28_0595_valid :
    mulPoly ep_Q2_008_coefficient_28_0595
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0596 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 596 for generator 28. -/
def ep_Q2_008_partial_28_0596 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 28. -/
theorem ep_Q2_008_partial_28_0596_valid :
    mulPoly ep_Q2_008_coefficient_28_0596
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0597 : Poly :=
[
  term ((-854603181635955472096344735823436913993873 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 597 for generator 28. -/
def ep_Q2_008_partial_28_0597 : Poly :=
[
  term ((-854603181635955472096344735823436913993873 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((854603181635955472096344735823436913993873 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-854603181635955472096344735823436913993873 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((854603181635955472096344735823436913993873 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 28. -/
theorem ep_Q2_008_partial_28_0597_valid :
    mulPoly ep_Q2_008_coefficient_28_0597
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0598 : Poly :=
[
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 28. -/
def ep_Q2_008_partial_28_0598 : Poly :=
[
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 28. -/
theorem ep_Q2_008_partial_28_0598_valid :
    mulPoly ep_Q2_008_coefficient_28_0598
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0599 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 599 for generator 28. -/
def ep_Q2_008_partial_28_0599 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 28. -/
theorem ep_Q2_008_partial_28_0599_valid :
    mulPoly ep_Q2_008_coefficient_28_0599
        ep_Q2_008_generator_28_0500_0599 =
      ep_Q2_008_partial_28_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_28_0500_0599 : List Poly :=
[
  ep_Q2_008_partial_28_0500,
  ep_Q2_008_partial_28_0501,
  ep_Q2_008_partial_28_0502,
  ep_Q2_008_partial_28_0503,
  ep_Q2_008_partial_28_0504,
  ep_Q2_008_partial_28_0505,
  ep_Q2_008_partial_28_0506,
  ep_Q2_008_partial_28_0507,
  ep_Q2_008_partial_28_0508,
  ep_Q2_008_partial_28_0509,
  ep_Q2_008_partial_28_0510,
  ep_Q2_008_partial_28_0511,
  ep_Q2_008_partial_28_0512,
  ep_Q2_008_partial_28_0513,
  ep_Q2_008_partial_28_0514,
  ep_Q2_008_partial_28_0515,
  ep_Q2_008_partial_28_0516,
  ep_Q2_008_partial_28_0517,
  ep_Q2_008_partial_28_0518,
  ep_Q2_008_partial_28_0519,
  ep_Q2_008_partial_28_0520,
  ep_Q2_008_partial_28_0521,
  ep_Q2_008_partial_28_0522,
  ep_Q2_008_partial_28_0523,
  ep_Q2_008_partial_28_0524,
  ep_Q2_008_partial_28_0525,
  ep_Q2_008_partial_28_0526,
  ep_Q2_008_partial_28_0527,
  ep_Q2_008_partial_28_0528,
  ep_Q2_008_partial_28_0529,
  ep_Q2_008_partial_28_0530,
  ep_Q2_008_partial_28_0531,
  ep_Q2_008_partial_28_0532,
  ep_Q2_008_partial_28_0533,
  ep_Q2_008_partial_28_0534,
  ep_Q2_008_partial_28_0535,
  ep_Q2_008_partial_28_0536,
  ep_Q2_008_partial_28_0537,
  ep_Q2_008_partial_28_0538,
  ep_Q2_008_partial_28_0539,
  ep_Q2_008_partial_28_0540,
  ep_Q2_008_partial_28_0541,
  ep_Q2_008_partial_28_0542,
  ep_Q2_008_partial_28_0543,
  ep_Q2_008_partial_28_0544,
  ep_Q2_008_partial_28_0545,
  ep_Q2_008_partial_28_0546,
  ep_Q2_008_partial_28_0547,
  ep_Q2_008_partial_28_0548,
  ep_Q2_008_partial_28_0549,
  ep_Q2_008_partial_28_0550,
  ep_Q2_008_partial_28_0551,
  ep_Q2_008_partial_28_0552,
  ep_Q2_008_partial_28_0553,
  ep_Q2_008_partial_28_0554,
  ep_Q2_008_partial_28_0555,
  ep_Q2_008_partial_28_0556,
  ep_Q2_008_partial_28_0557,
  ep_Q2_008_partial_28_0558,
  ep_Q2_008_partial_28_0559,
  ep_Q2_008_partial_28_0560,
  ep_Q2_008_partial_28_0561,
  ep_Q2_008_partial_28_0562,
  ep_Q2_008_partial_28_0563,
  ep_Q2_008_partial_28_0564,
  ep_Q2_008_partial_28_0565,
  ep_Q2_008_partial_28_0566,
  ep_Q2_008_partial_28_0567,
  ep_Q2_008_partial_28_0568,
  ep_Q2_008_partial_28_0569,
  ep_Q2_008_partial_28_0570,
  ep_Q2_008_partial_28_0571,
  ep_Q2_008_partial_28_0572,
  ep_Q2_008_partial_28_0573,
  ep_Q2_008_partial_28_0574,
  ep_Q2_008_partial_28_0575,
  ep_Q2_008_partial_28_0576,
  ep_Q2_008_partial_28_0577,
  ep_Q2_008_partial_28_0578,
  ep_Q2_008_partial_28_0579,
  ep_Q2_008_partial_28_0580,
  ep_Q2_008_partial_28_0581,
  ep_Q2_008_partial_28_0582,
  ep_Q2_008_partial_28_0583,
  ep_Q2_008_partial_28_0584,
  ep_Q2_008_partial_28_0585,
  ep_Q2_008_partial_28_0586,
  ep_Q2_008_partial_28_0587,
  ep_Q2_008_partial_28_0588,
  ep_Q2_008_partial_28_0589,
  ep_Q2_008_partial_28_0590,
  ep_Q2_008_partial_28_0591,
  ep_Q2_008_partial_28_0592,
  ep_Q2_008_partial_28_0593,
  ep_Q2_008_partial_28_0594,
  ep_Q2_008_partial_28_0595,
  ep_Q2_008_partial_28_0596,
  ep_Q2_008_partial_28_0597,
  ep_Q2_008_partial_28_0598,
  ep_Q2_008_partial_28_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_28_0500_0599 : Poly :=
[
  term ((754681021517603253 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7030820451939963474 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1402905259643590620568884155156952235191000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-126260673414089436000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-10452466060179807094353845965504121932800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((5990419896872203536 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((121963457893968868814670295742092220959200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2582305387142755476 : Rat) / 692956453614176359) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((73578019144638930034386304146408256330991184 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1898308371774153392778837277412760322965773 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((144973674470975720346260269373019118658400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((231777133243455688323 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((65332532036508454855623099292621772454101100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((1938760777577736642389293617615891803916203 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3614291821445391511415008508341555200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3420669045296531251874918766823257600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-602782446476253566544 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-735546002611964556 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 2), (14, 1), (16, 1)],
  term ((-7868520990332854919773589427815365297242084 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((570490529700739982622 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-35024956417101223881 : Rat) / 2771825814456705436) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8200805137275616481146589222554803801600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45455903225805950262 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3900085989851816189256265715856009600000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((9275232236768513487 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-48789385395874675328416438830643200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14539375292687572417872664645838606742000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((2634368773329011092290099916756060800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((31672064140243080171 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((598071422966402945354561735319276999173145 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-2365746871750624026120895831879071978422385 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-451970470028101354461135176308704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-73328561450343063493624814212170777600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-29591354608204342265965599489446400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-57371279153072560356820180484419628915700 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3330870461191285412007106181347512078985200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((13505173802565787125 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-20598040367763619029061411967006530519200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11554869993826364736930662352726894048000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2758009972885553196 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8780833051711791701931628926355881790977600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-854603181635955472096344735823436913993873 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-754681021517603253 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3515410225969981737 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-701452629821795310284442077578476117595500 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((63130336707044718000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((5226233030089903547176922982752060966400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2995209948436101768 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-60981728946984434407335147871046110479600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1291152693571377738 : Rat) / 692956453614176359) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36789009572319465017193152073204128165495592 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1898308371774153392778837277412760322965773 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 2), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-72486837235487860173130134686509559329200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-231777133243455688323 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-32666266018254227427811549646310886227050550 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (13, 3), (16, 1)],
  term ((-1938760777577736642389293617615891803916203 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1807145910722695755707504254170777600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1710334522648265625937459383411628800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (5, 2), (10, 1), (12, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (10, 1), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (5, 2), (10, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((301391223238126783272 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((367773001305982278 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 2), (16, 1)],
  term ((3934260495166427459886794713907682648621042 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-285245264850369991311 : Rat) / 692956453614176359) [(2, 2), (5, 2), (13, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((35024956417101223881 : Rat) / 5543651628913410872) [(2, 2), (5, 2), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4100402568637808240573294611277401900800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22727951612902975131 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1950042994925908094628132857928004800000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9275232236768513487 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7269687646343786208936332322919303371000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1317184386664505546145049958378030400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31672064140243080171 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-598071422966402945354561735319276999173145 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((2365746871750624026120895831879071978422385 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((225985235014050677230567588154352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((14795677304102171132982799744723200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2315584888450340175 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((28685639576536280178410090242209814457850 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1665435230595642706003553090673756039492600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-13505173802565787125 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (10, 1), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10299020183881809514530705983503265259600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5777434996913182368465331176363447024000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1379004986442776598 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4390416525855895850965814463177940895488800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((854603181635955472096344735823436913993873 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((754681021517603253 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7030820451939963474 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1402905259643590620568884155156952235191000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-126260673414089436000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-10452466060179807094353845965504121932800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((5990419896872203536 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((2582305387142755476 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((121963457893968868814670295742092220959200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((73578019144638930034386304146408256330991184 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1898308371774153392778837277412760322965773 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((231777133243455688323 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((144973674470975720346260269373019118658400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((65332532036508454855623099292621772454101100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((1938760777577736642389293617615891803916203 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3614291821445391511415008508341555200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((3420669045296531251874918766823257600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (10, 1), (15, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-602782446476253566544 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-735546002611964556 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (12, 1), (15, 3), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((-7868520990332854919773589427815365297242084 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((570490529700739982622 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-35024956417101223881 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8200805137275616481146589222554803801600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-45455903225805950262 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3900085989851816189256265715856009600000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((9275232236768513487 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48789385395874675328416438830643200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14539375292687572417872664645838606742000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((31672064140243080171 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2634368773329011092290099916756060800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((598071422966402945354561735319276999173145 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-2365746871750624026120895831879071978422385 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-451970470028101354461135176308704000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-73328561450343063493624814212170777600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-29591354608204342265965599489446400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (15, 2), (16, 1)],
  term ((-43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-57371279153072560356820180484419628915700 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3330870461191285412007106181347512078985200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((13505173802565787125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-20598040367763619029061411967006530519200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2758009972885553196 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11554869993826364736930662352726894048000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((8780833051711791701931628926355881790977600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-854603181635955472096344735823436913993873 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-754681021517603253 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3515410225969981737 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-701452629821795310284442077578476117595500 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((63130336707044718000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((5226233030089903547176922982752060966400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2995209948436101768 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-60981728946984434407335147871046110479600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1291152693571377738 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36789009572319465017193152073204128165495592 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1898308371774153392778837277412760322965773 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-72486837235487860173130134686509559329200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-231777133243455688323 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-32666266018254227427811549646310886227050550 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 3), (16, 1)],
  term ((-1938760777577736642389293617615891803916203 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1807145910722695755707504254170777600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1710334522648265625937459383411628800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (5, 2), (10, 1), (12, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (10, 1), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (5, 2), (10, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((301391223238126783272 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((367773001305982278 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 2), (16, 1)],
  term ((3934260495166427459886794713907682648621042 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-285245264850369991311 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((35024956417101223881 : Rat) / 5543651628913410872) [(3, 2), (5, 2), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4100402568637808240573294611277401900800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22727951612902975131 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1950042994925908094628132857928004800000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9275232236768513487 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7269687646343786208936332322919303371000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1317184386664505546145049958378030400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31672064140243080171 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-598071422966402945354561735319276999173145 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((2365746871750624026120895831879071978422385 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((225985235014050677230567588154352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((14795677304102171132982799744723200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (7, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2315584888450340175 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((28685639576536280178410090242209814457850 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1665435230595642706003553090673756039492600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-13505173802565787125 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (10, 1), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10299020183881809514530705983503265259600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5777434996913182368465331176363447024000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1379004986442776598 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4390416525855895850965814463177940895488800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((854603181635955472096344735823436913993873 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 500 through 599. -/
theorem ep_Q2_008_block_28_0500_0599_valid :
    checkProductSumEq ep_Q2_008_partials_28_0500_0599
      ep_Q2_008_block_28_0500_0599 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
