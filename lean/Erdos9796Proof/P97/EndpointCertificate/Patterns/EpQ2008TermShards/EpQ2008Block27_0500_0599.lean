/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0500 : Poly :=
[
  term ((-133246068794081469707980788917783133718698 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 500 for generator 27. -/
def ep_Q2_008_partial_27_0500 : Poly :=
[
  term ((-266492137588162939415961577835566267437396 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((133246068794081469707980788917783133718698 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 27. -/
theorem ep_Q2_008_partial_27_0500_valid :
    mulPoly ep_Q2_008_coefficient_27_0500
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0501 : Poly :=
[
  term ((29575826634980083048 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 501 for generator 27. -/
def ep_Q2_008_partial_27_0501 : Poly :=
[
  term ((59151653269960166096 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29575826634980083048 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 27. -/
theorem ep_Q2_008_partial_27_0501_valid :
    mulPoly ep_Q2_008_coefficient_27_0501
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0502 : Poly :=
[
  term ((11824016359781629505936764667955982870474326 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 27. -/
def ep_Q2_008_partial_27_0502 : Poly :=
[
  term ((23648032719563259011873529335911965740948652 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11824016359781629505936764667955982870474326 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 27. -/
theorem ep_Q2_008_partial_27_0502_valid :
    mulPoly ep_Q2_008_coefficient_27_0502
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0503 : Poly :=
[
  term ((-37673902904765847909 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 503 for generator 27. -/
def ep_Q2_008_partial_27_0503 : Poly :=
[
  term ((-37673902904765847909 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((37673902904765847909 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 27. -/
theorem ep_Q2_008_partial_27_0503_valid :
    mulPoly ep_Q2_008_coefficient_27_0503
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0504 : Poly :=
[
  term ((5631287065510647071719998702174358133276169 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 27. -/
def ep_Q2_008_partial_27_0504 : Poly :=
[
  term ((5631287065510647071719998702174358133276169 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5631287065510647071719998702174358133276169 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 27. -/
theorem ep_Q2_008_partial_27_0504_valid :
    mulPoly ep_Q2_008_coefficient_27_0504
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0505 : Poly :=
[
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 505 for generator 27. -/
def ep_Q2_008_partial_27_0505 : Poly :=
[
  term ((-67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 27. -/
theorem ep_Q2_008_partial_27_0505_valid :
    mulPoly ep_Q2_008_coefficient_27_0505
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0506 : Poly :=
[
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 506 for generator 27. -/
def ep_Q2_008_partial_27_0506 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 27. -/
theorem ep_Q2_008_partial_27_0506_valid :
    mulPoly ep_Q2_008_coefficient_27_0506
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0507 : Poly :=
[
  term ((40812643992161721373646367084739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 27. -/
def ep_Q2_008_partial_27_0507 : Poly :=
[
  term ((81625287984323442747292734169478400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40812643992161721373646367084739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 27. -/
theorem ep_Q2_008_partial_27_0507_valid :
    mulPoly ep_Q2_008_coefficient_27_0507
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0508 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 508 for generator 27. -/
def ep_Q2_008_partial_27_0508 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 27. -/
theorem ep_Q2_008_partial_27_0508_valid :
    mulPoly ep_Q2_008_coefficient_27_0508
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0509 : Poly :=
[
  term ((-564733097100842423658595079428368000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 509 for generator 27. -/
def ep_Q2_008_partial_27_0509 : Poly :=
[
  term ((-1129466194201684847317190158856736000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((564733097100842423658595079428368000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 27. -/
theorem ep_Q2_008_partial_27_0509_valid :
    mulPoly ep_Q2_008_coefficient_27_0509
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0510 : Poly :=
[
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 27. -/
def ep_Q2_008_partial_27_0510 : Poly :=
[
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 27. -/
theorem ep_Q2_008_partial_27_0510_valid :
    mulPoly ep_Q2_008_coefficient_27_0510
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0511 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 511 for generator 27. -/
def ep_Q2_008_partial_27_0511 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 27. -/
theorem ep_Q2_008_partial_27_0511_valid :
    mulPoly ep_Q2_008_coefficient_27_0511
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0512 : Poly :=
[
  term ((80729791938783959805 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 512 for generator 27. -/
def ep_Q2_008_partial_27_0512 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 27. -/
theorem ep_Q2_008_partial_27_0512_valid :
    mulPoly ep_Q2_008_coefficient_27_0512
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0513 : Poly :=
[
  term ((101154417451875068919 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (12, 1), (16, 1)]
]

/-- Partial product 513 for generator 27. -/
def ep_Q2_008_partial_27_0513 : Poly :=
[
  term ((101154417451875068919 : Rat) / 5543651628913410872) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-101154417451875068919 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 27. -/
theorem ep_Q2_008_partial_27_0513_valid :
    mulPoly ep_Q2_008_coefficient_27_0513
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0514 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 514 for generator 27. -/
def ep_Q2_008_partial_27_0514 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 27. -/
theorem ep_Q2_008_partial_27_0514_valid :
    mulPoly ep_Q2_008_coefficient_27_0514
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0515 : Poly :=
[
  term ((-188369514523829239545 : Rat) / 1385912907228352718) [(2, 1), (5, 2), (13, 2), (16, 1)]
]

/-- Partial product 515 for generator 27. -/
def ep_Q2_008_partial_27_0515 : Poly :=
[
  term ((-188369514523829239545 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((188369514523829239545 : Rat) / 1385912907228352718) [(2, 1), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 27. -/
theorem ep_Q2_008_partial_27_0515_valid :
    mulPoly ep_Q2_008_coefficient_27_0515
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0516 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

/-- Partial product 516 for generator 27. -/
def ep_Q2_008_partial_27_0516 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 27. -/
theorem ep_Q2_008_partial_27_0516_valid :
    mulPoly ep_Q2_008_coefficient_27_0516
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0517 : Poly :=
[
  term ((-5664384793023389919 : Rat) / 764641603988056672) [(2, 1), (5, 2), (16, 1)]
]

/-- Partial product 517 for generator 27. -/
def ep_Q2_008_partial_27_0517 : Poly :=
[
  term ((-5664384793023389919 : Rat) / 382320801994028336) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((5664384793023389919 : Rat) / 764641603988056672) [(2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 27. -/
theorem ep_Q2_008_partial_27_0517_valid :
    mulPoly ep_Q2_008_coefficient_27_0517
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0518 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 518 for generator 27. -/
def ep_Q2_008_partial_27_0518 : Poly :=
[
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 27. -/
theorem ep_Q2_008_partial_27_0518_valid :
    mulPoly ep_Q2_008_coefficient_27_0518
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0519 : Poly :=
[
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 27. -/
def ep_Q2_008_partial_27_0519 : Poly :=
[
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 27. -/
theorem ep_Q2_008_partial_27_0519_valid :
    mulPoly ep_Q2_008_coefficient_27_0519
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0520 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 520 for generator 27. -/
def ep_Q2_008_partial_27_0520 : Poly :=
[
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 27. -/
theorem ep_Q2_008_partial_27_0520_valid :
    mulPoly ep_Q2_008_coefficient_27_0520
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0521 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 27. -/
def ep_Q2_008_partial_27_0521 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 27. -/
theorem ep_Q2_008_partial_27_0521_valid :
    mulPoly ep_Q2_008_coefficient_27_0521
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0522 : Poly :=
[
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 522 for generator 27. -/
def ep_Q2_008_partial_27_0522 : Poly :=
[
  term ((25891905370046625 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 27. -/
theorem ep_Q2_008_partial_27_0522_valid :
    mulPoly ep_Q2_008_coefficient_27_0522
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0523 : Poly :=
[
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 523 for generator 27. -/
def ep_Q2_008_partial_27_0523 : Poly :=
[
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 27. -/
theorem ep_Q2_008_partial_27_0523_valid :
    mulPoly ep_Q2_008_coefficient_27_0523
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0524 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 27. -/
def ep_Q2_008_partial_27_0524 : Poly :=
[
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 27. -/
theorem ep_Q2_008_partial_27_0524_valid :
    mulPoly ep_Q2_008_coefficient_27_0524
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0525 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 525 for generator 27. -/
def ep_Q2_008_partial_27_0525 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 27. -/
theorem ep_Q2_008_partial_27_0525_valid :
    mulPoly ep_Q2_008_coefficient_27_0525
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0526 : Poly :=
[
  term ((1700889769131084542552335354017410400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 526 for generator 27. -/
def ep_Q2_008_partial_27_0526 : Poly :=
[
  term ((3401779538262169085104670708034820800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1700889769131084542552335354017410400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 27. -/
theorem ep_Q2_008_partial_27_0526_valid :
    mulPoly ep_Q2_008_coefficient_27_0526
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0527 : Poly :=
[
  term ((14960342541872544879 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 527 for generator 27. -/
def ep_Q2_008_partial_27_0527 : Poly :=
[
  term ((14960342541872544879 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14960342541872544879 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 27. -/
theorem ep_Q2_008_partial_27_0527_valid :
    mulPoly ep_Q2_008_coefficient_27_0527
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0528 : Poly :=
[
  term ((241397861140973483204669186769128950529121 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 27. -/
def ep_Q2_008_partial_27_0528 : Poly :=
[
  term ((241397861140973483204669186769128950529121 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-241397861140973483204669186769128950529121 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 27. -/
theorem ep_Q2_008_partial_27_0528_valid :
    mulPoly ep_Q2_008_coefficient_27_0528
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0529 : Poly :=
[
  term ((25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 529 for generator 27. -/
def ep_Q2_008_partial_27_0529 : Poly :=
[
  term ((51614296195437694954288850905652544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 27. -/
theorem ep_Q2_008_partial_27_0529_valid :
    mulPoly ep_Q2_008_coefficient_27_0529
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0530 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 530 for generator 27. -/
def ep_Q2_008_partial_27_0530 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 27. -/
theorem ep_Q2_008_partial_27_0530_valid :
    mulPoly ep_Q2_008_coefficient_27_0530
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0531 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 531 for generator 27. -/
def ep_Q2_008_partial_27_0531 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 27. -/
theorem ep_Q2_008_partial_27_0531_valid :
    mulPoly ep_Q2_008_coefficient_27_0531
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0532 : Poly :=
[
  term ((1861078886363623434188350840006109531821969 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 27. -/
def ep_Q2_008_partial_27_0532 : Poly :=
[
  term ((1861078886363623434188350840006109531821969 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1861078886363623434188350840006109531821969 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 27. -/
theorem ep_Q2_008_partial_27_0532_valid :
    mulPoly ep_Q2_008_coefficient_27_0532
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0533 : Poly :=
[
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 533 for generator 27. -/
def ep_Q2_008_partial_27_0533 : Poly :=
[
  term ((-206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 27. -/
theorem ep_Q2_008_partial_27_0533_valid :
    mulPoly ep_Q2_008_coefficient_27_0533
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0534 : Poly :=
[
  term ((-864097621601707371826671994251158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 27. -/
def ep_Q2_008_partial_27_0534 : Poly :=
[
  term ((-1728195243203414743653343988502316800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((864097621601707371826671994251158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 27. -/
theorem ep_Q2_008_partial_27_0534_valid :
    mulPoly ep_Q2_008_coefficient_27_0534
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0535 : Poly :=
[
  term ((710757950493876271878702392832499200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 535 for generator 27. -/
def ep_Q2_008_partial_27_0535 : Poly :=
[
  term ((1421515900987752543757404785664998400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-710757950493876271878702392832499200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 27. -/
theorem ep_Q2_008_partial_27_0535_valid :
    mulPoly ep_Q2_008_coefficient_27_0535
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0536 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 536 for generator 27. -/
def ep_Q2_008_partial_27_0536 : Poly :=
[
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 27. -/
theorem ep_Q2_008_partial_27_0536_valid :
    mulPoly ep_Q2_008_coefficient_27_0536
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0537 : Poly :=
[
  term ((-37070428125453746759314522759132531200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 27. -/
def ep_Q2_008_partial_27_0537 : Poly :=
[
  term ((-74140856250907493518629045518265062400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((37070428125453746759314522759132531200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 27. -/
theorem ep_Q2_008_partial_27_0537_valid :
    mulPoly ep_Q2_008_coefficient_27_0537
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0538 : Poly :=
[
  term ((52989796059095673866624476610764800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 538 for generator 27. -/
def ep_Q2_008_partial_27_0538 : Poly :=
[
  term ((105979592118191347733248953221529600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-52989796059095673866624476610764800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 27. -/
theorem ep_Q2_008_partial_27_0538_valid :
    mulPoly ep_Q2_008_coefficient_27_0538
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0539 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 2), (16, 1)]
]

/-- Partial product 539 for generator 27. -/
def ep_Q2_008_partial_27_0539 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 27. -/
theorem ep_Q2_008_partial_27_0539_valid :
    mulPoly ep_Q2_008_coefficient_27_0539
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0540 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 27. -/
def ep_Q2_008_partial_27_0540 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 27. -/
theorem ep_Q2_008_partial_27_0540_valid :
    mulPoly ep_Q2_008_coefficient_27_0540
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0541 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 27. -/
def ep_Q2_008_partial_27_0541 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 27. -/
theorem ep_Q2_008_partial_27_0541_valid :
    mulPoly ep_Q2_008_coefficient_27_0541
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0542 : Poly :=
[
  term ((-7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 542 for generator 27. -/
def ep_Q2_008_partial_27_0542 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 27. -/
theorem ep_Q2_008_partial_27_0542_valid :
    mulPoly ep_Q2_008_coefficient_27_0542
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0543 : Poly :=
[
  term ((6560092128330342000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 27. -/
def ep_Q2_008_partial_27_0543 : Poly :=
[
  term ((13120184256660684000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6560092128330342000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 27. -/
theorem ep_Q2_008_partial_27_0543_valid :
    mulPoly ep_Q2_008_coefficient_27_0543
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0544 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 544 for generator 27. -/
def ep_Q2_008_partial_27_0544 : Poly :=
[
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 27. -/
theorem ep_Q2_008_partial_27_0544_valid :
    mulPoly ep_Q2_008_coefficient_27_0544
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0545 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (16, 1)]
]

/-- Partial product 545 for generator 27. -/
def ep_Q2_008_partial_27_0545 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 27. -/
theorem ep_Q2_008_partial_27_0545_valid :
    mulPoly ep_Q2_008_coefficient_27_0545
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0546 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 27. -/
def ep_Q2_008_partial_27_0546 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 27. -/
theorem ep_Q2_008_partial_27_0546_valid :
    mulPoly ep_Q2_008_coefficient_27_0546
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0547 : Poly :=
[
  term ((5096904805021968351198513559156324348800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 547 for generator 27. -/
def ep_Q2_008_partial_27_0547 : Poly :=
[
  term ((10193809610043936702397027118312648697600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5096904805021968351198513559156324348800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 27. -/
theorem ep_Q2_008_partial_27_0547_valid :
    mulPoly ep_Q2_008_coefficient_27_0547
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0548 : Poly :=
[
  term ((-204589360431255375 : Rat) / 47790100249253542) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 548 for generator 27. -/
def ep_Q2_008_partial_27_0548 : Poly :=
[
  term ((-204589360431255375 : Rat) / 23895050124626771) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((204589360431255375 : Rat) / 47790100249253542) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 27. -/
theorem ep_Q2_008_partial_27_0548_valid :
    mulPoly ep_Q2_008_coefficient_27_0548
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0549 : Poly :=
[
  term ((2023136023635381355579355211454931679636000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 549 for generator 27. -/
def ep_Q2_008_partial_27_0549 : Poly :=
[
  term ((4046272047270762711158710422909863359272000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2023136023635381355579355211454931679636000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 27. -/
theorem ep_Q2_008_partial_27_0549_valid :
    mulPoly ep_Q2_008_coefficient_27_0549
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0550 : Poly :=
[
  term ((1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 550 for generator 27. -/
def ep_Q2_008_partial_27_0550 : Poly :=
[
  term ((2761028770613533949451959311642598246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 27. -/
theorem ep_Q2_008_partial_27_0550_valid :
    mulPoly ep_Q2_008_coefficient_27_0550
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0551 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 551 for generator 27. -/
def ep_Q2_008_partial_27_0551 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 27. -/
theorem ep_Q2_008_partial_27_0551_valid :
    mulPoly ep_Q2_008_coefficient_27_0551
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0552 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 552 for generator 27. -/
def ep_Q2_008_partial_27_0552 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 27. -/
theorem ep_Q2_008_partial_27_0552_valid :
    mulPoly ep_Q2_008_coefficient_27_0552
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0553 : Poly :=
[
  term ((673143265310681985603529504439086500171375 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 553 for generator 27. -/
def ep_Q2_008_partial_27_0553 : Poly :=
[
  term ((673143265310681985603529504439086500171375 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-673143265310681985603529504439086500171375 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 27. -/
theorem ep_Q2_008_partial_27_0553_valid :
    mulPoly ep_Q2_008_coefficient_27_0553
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0554 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 27. -/
def ep_Q2_008_partial_27_0554 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 27. -/
theorem ep_Q2_008_partial_27_0554_valid :
    mulPoly ep_Q2_008_coefficient_27_0554
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0555 : Poly :=
[
  term ((1086908812529704210324287413335995211982121 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 555 for generator 27. -/
def ep_Q2_008_partial_27_0555 : Poly :=
[
  term ((1086908812529704210324287413335995211982121 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1086908812529704210324287413335995211982121 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 27. -/
theorem ep_Q2_008_partial_27_0555_valid :
    mulPoly ep_Q2_008_coefficient_27_0555
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0556 : Poly :=
[
  term ((-24019888633111285559832246362264946019019517 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 27. -/
def ep_Q2_008_partial_27_0556 : Poly :=
[
  term ((-24019888633111285559832246362264946019019517 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24019888633111285559832246362264946019019517 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 27. -/
theorem ep_Q2_008_partial_27_0556_valid :
    mulPoly ep_Q2_008_coefficient_27_0556
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0557 : Poly :=
[
  term ((5428749155630456658478769492202432000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 557 for generator 27. -/
def ep_Q2_008_partial_27_0557 : Poly :=
[
  term ((10857498311260913316957538984404864000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5428749155630456658478769492202432000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 27. -/
theorem ep_Q2_008_partial_27_0557_valid :
    mulPoly ep_Q2_008_coefficient_27_0557
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0558 : Poly :=
[
  term ((20791434692363278441333345814347880083200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 558 for generator 27. -/
def ep_Q2_008_partial_27_0558 : Poly :=
[
  term ((41582869384726556882666691628695760166400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-20791434692363278441333345814347880083200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 27. -/
theorem ep_Q2_008_partial_27_0558_valid :
    mulPoly ep_Q2_008_coefficient_27_0558
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0559 : Poly :=
[
  term ((62554836379172966607 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 559 for generator 27. -/
def ep_Q2_008_partial_27_0559 : Poly :=
[
  term ((62554836379172966607 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-62554836379172966607 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 27. -/
theorem ep_Q2_008_partial_27_0559_valid :
    mulPoly ep_Q2_008_coefficient_27_0559
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0560 : Poly :=
[
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 27. -/
def ep_Q2_008_partial_27_0560 : Poly :=
[
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 27. -/
theorem ep_Q2_008_partial_27_0560_valid :
    mulPoly ep_Q2_008_coefficient_27_0560
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0561 : Poly :=
[
  term ((388410901396338462484200550038550439708357 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 561 for generator 27. -/
def ep_Q2_008_partial_27_0561 : Poly :=
[
  term ((388410901396338462484200550038550439708357 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-388410901396338462484200550038550439708357 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 27. -/
theorem ep_Q2_008_partial_27_0561_valid :
    mulPoly ep_Q2_008_coefficient_27_0561
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0562 : Poly :=
[
  term ((11271532704463160771 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 562 for generator 27. -/
def ep_Q2_008_partial_27_0562 : Poly :=
[
  term ((11271532704463160771 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-11271532704463160771 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 27. -/
theorem ep_Q2_008_partial_27_0562_valid :
    mulPoly ep_Q2_008_coefficient_27_0562
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0563 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 27. -/
def ep_Q2_008_partial_27_0563 : Poly :=
[
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 27. -/
theorem ep_Q2_008_partial_27_0563_valid :
    mulPoly ep_Q2_008_coefficient_27_0563
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0564 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)]
]

/-- Partial product 564 for generator 27. -/
def ep_Q2_008_partial_27_0564 : Poly :=
[
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 27. -/
theorem ep_Q2_008_partial_27_0564_valid :
    mulPoly ep_Q2_008_coefficient_27_0564
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0565 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 565 for generator 27. -/
def ep_Q2_008_partial_27_0565 : Poly :=
[
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 27. -/
theorem ep_Q2_008_partial_27_0565_valid :
    mulPoly ep_Q2_008_coefficient_27_0565
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0566 : Poly :=
[
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 566 for generator 27. -/
def ep_Q2_008_partial_27_0566 : Poly :=
[
  term ((-57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 27. -/
theorem ep_Q2_008_partial_27_0566_valid :
    mulPoly ep_Q2_008_coefficient_27_0566
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0567 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 567 for generator 27. -/
def ep_Q2_008_partial_27_0567 : Poly :=
[
  term ((-187532765152567200 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 27. -/
theorem ep_Q2_008_partial_27_0567_valid :
    mulPoly ep_Q2_008_coefficient_27_0567
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0568 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 568 for generator 27. -/
def ep_Q2_008_partial_27_0568 : Poly :=
[
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 27. -/
theorem ep_Q2_008_partial_27_0568_valid :
    mulPoly ep_Q2_008_coefficient_27_0568
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0569 : Poly :=
[
  term ((2067591143005852613195443897657932146856000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 569 for generator 27. -/
def ep_Q2_008_partial_27_0569 : Poly :=
[
  term ((4135182286011705226390887795315864293712000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2067591143005852613195443897657932146856000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 27. -/
theorem ep_Q2_008_partial_27_0569_valid :
    mulPoly ep_Q2_008_coefficient_27_0569
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0570 : Poly :=
[
  term ((6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 570 for generator 27. -/
def ep_Q2_008_partial_27_0570 : Poly :=
[
  term ((12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 27. -/
theorem ep_Q2_008_partial_27_0570_valid :
    mulPoly ep_Q2_008_coefficient_27_0570
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0571 : Poly :=
[
  term ((63529705823917833144393042481390841713875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 27. -/
def ep_Q2_008_partial_27_0571 : Poly :=
[
  term ((63529705823917833144393042481390841713875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63529705823917833144393042481390841713875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 27. -/
theorem ep_Q2_008_partial_27_0571_valid :
    mulPoly ep_Q2_008_coefficient_27_0571
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0572 : Poly :=
[
  term ((-794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 27. -/
def ep_Q2_008_partial_27_0572 : Poly :=
[
  term ((-1589384067497426170269504969746206118400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 27. -/
theorem ep_Q2_008_partial_27_0572_valid :
    mulPoly ep_Q2_008_coefficient_27_0572
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0573 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 573 for generator 27. -/
def ep_Q2_008_partial_27_0573 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 27. -/
theorem ep_Q2_008_partial_27_0573_valid :
    mulPoly ep_Q2_008_coefficient_27_0573
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0574 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 27. -/
def ep_Q2_008_partial_27_0574 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 27. -/
theorem ep_Q2_008_partial_27_0574_valid :
    mulPoly ep_Q2_008_coefficient_27_0574
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0575 : Poly :=
[
  term ((-232062498744289875 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 575 for generator 27. -/
def ep_Q2_008_partial_27_0575 : Poly :=
[
  term ((-232062498744289875 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((232062498744289875 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 27. -/
theorem ep_Q2_008_partial_27_0575_valid :
    mulPoly ep_Q2_008_coefficient_27_0575
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0576 : Poly :=
[
  term ((-382024188355516583460438421362313129089600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 27. -/
def ep_Q2_008_partial_27_0576 : Poly :=
[
  term ((-764048376711033166920876842724626258179200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((382024188355516583460438421362313129089600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 27. -/
theorem ep_Q2_008_partial_27_0576_valid :
    mulPoly ep_Q2_008_coefficient_27_0576
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0577 : Poly :=
[
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 577 for generator 27. -/
def ep_Q2_008_partial_27_0577 : Poly :=
[
  term ((16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 27. -/
theorem ep_Q2_008_partial_27_0577_valid :
    mulPoly ep_Q2_008_coefficient_27_0577
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0578 : Poly :=
[
  term ((5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 578 for generator 27. -/
def ep_Q2_008_partial_27_0578 : Poly :=
[
  term ((11584560203615351216945025443379634302585600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 27. -/
theorem ep_Q2_008_partial_27_0578_valid :
    mulPoly ep_Q2_008_coefficient_27_0578
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0579 : Poly :=
[
  term ((27396183854000538000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 579 for generator 27. -/
def ep_Q2_008_partial_27_0579 : Poly :=
[
  term ((54792367708001076000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-27396183854000538000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 27. -/
theorem ep_Q2_008_partial_27_0579_valid :
    mulPoly ep_Q2_008_coefficient_27_0579
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0580 : Poly :=
[
  term ((2267987918718260029906966577420705702400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 580 for generator 27. -/
def ep_Q2_008_partial_27_0580 : Poly :=
[
  term ((4535975837436520059813933154841411404800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2267987918718260029906966577420705702400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 27. -/
theorem ep_Q2_008_partial_27_0580_valid :
    mulPoly ep_Q2_008_coefficient_27_0580
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0581 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 581 for generator 27. -/
def ep_Q2_008_partial_27_0581 : Poly :=
[
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 27. -/
theorem ep_Q2_008_partial_27_0581_valid :
    mulPoly ep_Q2_008_coefficient_27_0581
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0582 : Poly :=
[
  term ((-7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 582 for generator 27. -/
def ep_Q2_008_partial_27_0582 : Poly :=
[
  term ((-15834302889151420714938714256617079341750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 27. -/
theorem ep_Q2_008_partial_27_0582_valid :
    mulPoly ep_Q2_008_coefficient_27_0582
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0583 : Poly :=
[
  term ((-2229585589816212375 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 583 for generator 27. -/
def ep_Q2_008_partial_27_0583 : Poly :=
[
  term ((-2229585589816212375 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((2229585589816212375 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 27. -/
theorem ep_Q2_008_partial_27_0583_valid :
    mulPoly ep_Q2_008_coefficient_27_0583
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0584 : Poly :=
[
  term ((69079514921595203764375596201180184800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 584 for generator 27. -/
def ep_Q2_008_partial_27_0584 : Poly :=
[
  term ((138159029843190407528751192402360369600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-69079514921595203764375596201180184800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 27. -/
theorem ep_Q2_008_partial_27_0584_valid :
    mulPoly ep_Q2_008_coefficient_27_0584
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0585 : Poly :=
[
  term ((-276171861205571586 : Rat) / 692956453614176359) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 585 for generator 27. -/
def ep_Q2_008_partial_27_0585 : Poly :=
[
  term ((-552343722411143172 : Rat) / 692956453614176359) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((276171861205571586 : Rat) / 692956453614176359) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 27. -/
theorem ep_Q2_008_partial_27_0585_valid :
    mulPoly ep_Q2_008_coefficient_27_0585
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0586 : Poly :=
[
  term ((506754321820717059635090358717617259193533 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 27. -/
def ep_Q2_008_partial_27_0586 : Poly :=
[
  term ((506754321820717059635090358717617259193533 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-506754321820717059635090358717617259193533 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 27. -/
theorem ep_Q2_008_partial_27_0586_valid :
    mulPoly ep_Q2_008_coefficient_27_0586
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0587 : Poly :=
[
  term ((20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 587 for generator 27. -/
def ep_Q2_008_partial_27_0587 : Poly :=
[
  term ((40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 27. -/
theorem ep_Q2_008_partial_27_0587_valid :
    mulPoly ep_Q2_008_coefficient_27_0587
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0588 : Poly :=
[
  term ((-7258012564237808796809540100722464205490489 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 27. -/
def ep_Q2_008_partial_27_0588 : Poly :=
[
  term ((-7258012564237808796809540100722464205490489 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7258012564237808796809540100722464205490489 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 27. -/
theorem ep_Q2_008_partial_27_0588_valid :
    mulPoly ep_Q2_008_coefficient_27_0588
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0589 : Poly :=
[
  term ((3355616531435365018103696848382400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 589 for generator 27. -/
def ep_Q2_008_partial_27_0589 : Poly :=
[
  term ((6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3355616531435365018103696848382400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 27. -/
theorem ep_Q2_008_partial_27_0589_valid :
    mulPoly ep_Q2_008_coefficient_27_0589
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0590 : Poly :=
[
  term ((-1276455272589561743639636099928634654357302 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 590 for generator 27. -/
def ep_Q2_008_partial_27_0590 : Poly :=
[
  term ((-2552910545179123487279272199857269308714604 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1276455272589561743639636099928634654357302 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 27. -/
theorem ep_Q2_008_partial_27_0590_valid :
    mulPoly ep_Q2_008_coefficient_27_0590
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0591 : Poly :=
[
  term ((-321799351347524988855 : Rat) / 22174606515653643488) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 591 for generator 27. -/
def ep_Q2_008_partial_27_0591 : Poly :=
[
  term ((-321799351347524988855 : Rat) / 11087303257826821744) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((321799351347524988855 : Rat) / 22174606515653643488) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 27. -/
theorem ep_Q2_008_partial_27_0591_valid :
    mulPoly ep_Q2_008_coefficient_27_0591
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0592 : Poly :=
[
  term ((-289376824490244288395489988017069971454127 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 592 for generator 27. -/
def ep_Q2_008_partial_27_0592 : Poly :=
[
  term ((-289376824490244288395489988017069971454127 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((289376824490244288395489988017069971454127 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 27. -/
theorem ep_Q2_008_partial_27_0592_valid :
    mulPoly ep_Q2_008_coefficient_27_0592
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0593 : Poly :=
[
  term ((69678976512274367342882327623339476307200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 593 for generator 27. -/
def ep_Q2_008_partial_27_0593 : Poly :=
[
  term ((139357953024548734685764655246678952614400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-69678976512274367342882327623339476307200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 27. -/
theorem ep_Q2_008_partial_27_0593_valid :
    mulPoly ep_Q2_008_coefficient_27_0593
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0594 : Poly :=
[
  term ((-33180618982781375327757118439348064000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 594 for generator 27. -/
def ep_Q2_008_partial_27_0594 : Poly :=
[
  term ((-66361237965562750655514236878696128000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((33180618982781375327757118439348064000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 27. -/
theorem ep_Q2_008_partial_27_0594_valid :
    mulPoly ep_Q2_008_coefficient_27_0594
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0595 : Poly :=
[
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 595 for generator 27. -/
def ep_Q2_008_partial_27_0595 : Poly :=
[
  term ((2554572896850671361 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2554572896850671361 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 27. -/
theorem ep_Q2_008_partial_27_0595_valid :
    mulPoly ep_Q2_008_coefficient_27_0595
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0596 : Poly :=
[
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 596 for generator 27. -/
def ep_Q2_008_partial_27_0596 : Poly :=
[
  term ((12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 27. -/
theorem ep_Q2_008_partial_27_0596_valid :
    mulPoly ep_Q2_008_coefficient_27_0596
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0597 : Poly :=
[
  term ((3997779616420102156472213319758409211031405 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 597 for generator 27. -/
def ep_Q2_008_partial_27_0597 : Poly :=
[
  term ((3997779616420102156472213319758409211031405 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3997779616420102156472213319758409211031405 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 27. -/
theorem ep_Q2_008_partial_27_0597_valid :
    mulPoly ep_Q2_008_coefficient_27_0597
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0598 : Poly :=
[
  term ((-40389178881873161473591111988130822405600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 598 for generator 27. -/
def ep_Q2_008_partial_27_0598 : Poly :=
[
  term ((-80778357763746322947182223976261644811200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((40389178881873161473591111988130822405600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 27. -/
theorem ep_Q2_008_partial_27_0598_valid :
    mulPoly ep_Q2_008_coefficient_27_0598
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0599 : Poly :=
[
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 27. -/
def ep_Q2_008_partial_27_0599 : Poly :=
[
  term ((-33958123958415888000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 27. -/
theorem ep_Q2_008_partial_27_0599_valid :
    mulPoly ep_Q2_008_coefficient_27_0599
        ep_Q2_008_generator_27_0500_0599 =
      ep_Q2_008_partial_27_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0500_0599 : List Poly :=
[
  ep_Q2_008_partial_27_0500,
  ep_Q2_008_partial_27_0501,
  ep_Q2_008_partial_27_0502,
  ep_Q2_008_partial_27_0503,
  ep_Q2_008_partial_27_0504,
  ep_Q2_008_partial_27_0505,
  ep_Q2_008_partial_27_0506,
  ep_Q2_008_partial_27_0507,
  ep_Q2_008_partial_27_0508,
  ep_Q2_008_partial_27_0509,
  ep_Q2_008_partial_27_0510,
  ep_Q2_008_partial_27_0511,
  ep_Q2_008_partial_27_0512,
  ep_Q2_008_partial_27_0513,
  ep_Q2_008_partial_27_0514,
  ep_Q2_008_partial_27_0515,
  ep_Q2_008_partial_27_0516,
  ep_Q2_008_partial_27_0517,
  ep_Q2_008_partial_27_0518,
  ep_Q2_008_partial_27_0519,
  ep_Q2_008_partial_27_0520,
  ep_Q2_008_partial_27_0521,
  ep_Q2_008_partial_27_0522,
  ep_Q2_008_partial_27_0523,
  ep_Q2_008_partial_27_0524,
  ep_Q2_008_partial_27_0525,
  ep_Q2_008_partial_27_0526,
  ep_Q2_008_partial_27_0527,
  ep_Q2_008_partial_27_0528,
  ep_Q2_008_partial_27_0529,
  ep_Q2_008_partial_27_0530,
  ep_Q2_008_partial_27_0531,
  ep_Q2_008_partial_27_0532,
  ep_Q2_008_partial_27_0533,
  ep_Q2_008_partial_27_0534,
  ep_Q2_008_partial_27_0535,
  ep_Q2_008_partial_27_0536,
  ep_Q2_008_partial_27_0537,
  ep_Q2_008_partial_27_0538,
  ep_Q2_008_partial_27_0539,
  ep_Q2_008_partial_27_0540,
  ep_Q2_008_partial_27_0541,
  ep_Q2_008_partial_27_0542,
  ep_Q2_008_partial_27_0543,
  ep_Q2_008_partial_27_0544,
  ep_Q2_008_partial_27_0545,
  ep_Q2_008_partial_27_0546,
  ep_Q2_008_partial_27_0547,
  ep_Q2_008_partial_27_0548,
  ep_Q2_008_partial_27_0549,
  ep_Q2_008_partial_27_0550,
  ep_Q2_008_partial_27_0551,
  ep_Q2_008_partial_27_0552,
  ep_Q2_008_partial_27_0553,
  ep_Q2_008_partial_27_0554,
  ep_Q2_008_partial_27_0555,
  ep_Q2_008_partial_27_0556,
  ep_Q2_008_partial_27_0557,
  ep_Q2_008_partial_27_0558,
  ep_Q2_008_partial_27_0559,
  ep_Q2_008_partial_27_0560,
  ep_Q2_008_partial_27_0561,
  ep_Q2_008_partial_27_0562,
  ep_Q2_008_partial_27_0563,
  ep_Q2_008_partial_27_0564,
  ep_Q2_008_partial_27_0565,
  ep_Q2_008_partial_27_0566,
  ep_Q2_008_partial_27_0567,
  ep_Q2_008_partial_27_0568,
  ep_Q2_008_partial_27_0569,
  ep_Q2_008_partial_27_0570,
  ep_Q2_008_partial_27_0571,
  ep_Q2_008_partial_27_0572,
  ep_Q2_008_partial_27_0573,
  ep_Q2_008_partial_27_0574,
  ep_Q2_008_partial_27_0575,
  ep_Q2_008_partial_27_0576,
  ep_Q2_008_partial_27_0577,
  ep_Q2_008_partial_27_0578,
  ep_Q2_008_partial_27_0579,
  ep_Q2_008_partial_27_0580,
  ep_Q2_008_partial_27_0581,
  ep_Q2_008_partial_27_0582,
  ep_Q2_008_partial_27_0583,
  ep_Q2_008_partial_27_0584,
  ep_Q2_008_partial_27_0585,
  ep_Q2_008_partial_27_0586,
  ep_Q2_008_partial_27_0587,
  ep_Q2_008_partial_27_0588,
  ep_Q2_008_partial_27_0589,
  ep_Q2_008_partial_27_0590,
  ep_Q2_008_partial_27_0591,
  ep_Q2_008_partial_27_0592,
  ep_Q2_008_partial_27_0593,
  ep_Q2_008_partial_27_0594,
  ep_Q2_008_partial_27_0595,
  ep_Q2_008_partial_27_0596,
  ep_Q2_008_partial_27_0597,
  ep_Q2_008_partial_27_0598,
  ep_Q2_008_partial_27_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0500_0599 : Poly :=
[
  term ((-266492137588162939415961577835566267437396 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((59151653269960166096 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((133246068794081469707980788917783133718698 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29575826634980083048 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((23648032719563259011873529335911965740948652 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11824016359781629505936764667955982870474326 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-37673902904765847909 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((37673902904765847909 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (13, 3), (16, 1)],
  term ((5631287065510647071719998702174358133276169 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5631287065510647071719998702174358133276169 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((81625287984323442747292734169478400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40812643992161721373646367084739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1129466194201684847317190158856736000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((564733097100842423658595079428368000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 3), (16, 1)],
  term ((161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((101154417451875068919 : Rat) / 5543651628913410872) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-101154417451875068919 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-188369514523829239545 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((188369514523829239545 : Rat) / 1385912907228352718) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5664384793023389919 : Rat) / 382320801994028336) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((5664384793023389919 : Rat) / 764641603988056672) [(2, 1), (5, 2), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((3401779538262169085104670708034820800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14960342541872544879 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1700889769131084542552335354017410400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14960342541872544879 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((241397861140973483204669186769128950529121 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-241397861140973483204669186769128950529121 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((51614296195437694954288850905652544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((1861078886363623434188350840006109531821969 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1861078886363623434188350840006109531821969 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1728195243203414743653343988502316800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((864097621601707371826671994251158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1421515900987752543757404785664998400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-710757950493876271878702392832499200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((-74140856250907493518629045518265062400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((37070428125453746759314522759132531200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((105979592118191347733248953221529600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-52989796059095673866624476610764800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((13120184256660684000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6560092128330342000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10193809610043936702397027118312648697600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-204589360431255375 : Rat) / 23895050124626771) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5096904805021968351198513559156324348800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((204589360431255375 : Rat) / 47790100249253542) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((4046272047270762711158710422909863359272000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2023136023635381355579355211454931679636000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2761028770613533949451959311642598246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((673143265310681985603529504439086500171375 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-673143265310681985603529504439086500171375 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1086908812529704210324287413335995211982121 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1086908812529704210324287413335995211982121 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24019888633111285559832246362264946019019517 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10857498311260913316957538984404864000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((24019888633111285559832246362264946019019517 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5428749155630456658478769492202432000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((41582869384726556882666691628695760166400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((62554836379172966607 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-20791434692363278441333345814347880083200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-62554836379172966607 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((388410901396338462484200550038550439708357 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((11271532704463160771 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-388410901396338462484200550038550439708357 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-11271532704463160771 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-187532765152567200 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((4135182286011705226390887795315864293712000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2067591143005852613195443897657932146856000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((63529705823917833144393042481390841713875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63529705823917833144393042481390841713875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1589384067497426170269504969746206118400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-232062498744289875 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((232062498744289875 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-764048376711033166920876842724626258179200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((382024188355516583460438421362313129089600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((11584560203615351216945025443379634302585600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((54792367708001076000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-27396183854000538000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((4535975837436520059813933154841411404800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-2267987918718260029906966577420705702400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-15834302889151420714938714256617079341750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2229585589816212375 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2229585589816212375 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((138159029843190407528751192402360369600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-552343722411143172 : Rat) / 692956453614176359) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-69079514921595203764375596201180184800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((276171861205571586 : Rat) / 692956453614176359) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((506754321820717059635090358717617259193533 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-506754321820717059635090358717617259193533 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-7258012564237808796809540100722464205490489 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((7258012564237808796809540100722464205490489 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3355616531435365018103696848382400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2552910545179123487279272199857269308714604 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-321799351347524988855 : Rat) / 11087303257826821744) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1276455272589561743639636099928634654357302 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((321799351347524988855 : Rat) / 22174606515653643488) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-289376824490244288395489988017069971454127 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((139357953024548734685764655246678952614400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((289376824490244288395489988017069971454127 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-69678976512274367342882327623339476307200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-66361237965562750655514236878696128000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((2554572896850671361 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((33180618982781375327757118439348064000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (13, 3), (16, 1)],
  term ((12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((3997779616420102156472213319758409211031405 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80778357763746322947182223976261644811200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3997779616420102156472213319758409211031405 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((40389178881873161473591111988130822405600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-33958123958415888000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 500 through 599. -/
theorem ep_Q2_008_block_27_0500_0599_valid :
    checkProductSumEq ep_Q2_008_partials_27_0500_0599
      ep_Q2_008_block_27_0500_0599 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
