/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0600 : Poly :=
[
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 600 for generator 27. -/
def ep_Q2_008_partial_27_0600 : Poly :=
[
  term ((-16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 27. -/
theorem ep_Q2_008_partial_27_0600_valid :
    mulPoly ep_Q2_008_coefficient_27_0600
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0601 : Poly :=
[
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 27. -/
def ep_Q2_008_partial_27_0601 : Poly :=
[
  term ((-95291074274784480000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 27. -/
theorem ep_Q2_008_partial_27_0601_valid :
    mulPoly ep_Q2_008_coefficient_27_0601
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0602 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 602 for generator 27. -/
def ep_Q2_008_partial_27_0602 : Poly :=
[
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 27. -/
theorem ep_Q2_008_partial_27_0602_valid :
    mulPoly ep_Q2_008_coefficient_27_0602
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0603 : Poly :=
[
  term ((25891905370046625 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 27. -/
def ep_Q2_008_partial_27_0603 : Poly :=
[
  term ((51783810740093250 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 27. -/
theorem ep_Q2_008_partial_27_0603_valid :
    mulPoly ep_Q2_008_coefficient_27_0603
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0604 : Poly :=
[
  term ((-962589622703248894708425102348614400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 27. -/
def ep_Q2_008_partial_27_0604 : Poly :=
[
  term ((-1925179245406497789416850204697228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((962589622703248894708425102348614400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 27. -/
theorem ep_Q2_008_partial_27_0604_valid :
    mulPoly ep_Q2_008_coefficient_27_0604
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0605 : Poly :=
[
  term ((558452675388045642190409022939820800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 605 for generator 27. -/
def ep_Q2_008_partial_27_0605 : Poly :=
[
  term ((1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-558452675388045642190409022939820800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 27. -/
theorem ep_Q2_008_partial_27_0605_valid :
    mulPoly ep_Q2_008_coefficient_27_0605
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0606 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 606 for generator 27. -/
def ep_Q2_008_partial_27_0606 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 27. -/
theorem ep_Q2_008_partial_27_0606_valid :
    mulPoly ep_Q2_008_coefficient_27_0606
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0607 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 27. -/
def ep_Q2_008_partial_27_0607 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 27. -/
theorem ep_Q2_008_partial_27_0607_valid :
    mulPoly ep_Q2_008_coefficient_27_0607
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0608 : Poly :=
[
  term ((62494571470102164148595228767065600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 608 for generator 27. -/
def ep_Q2_008_partial_27_0608 : Poly :=
[
  term ((124989142940204328297190457534131200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62494571470102164148595228767065600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 27. -/
theorem ep_Q2_008_partial_27_0608_valid :
    mulPoly ep_Q2_008_coefficient_27_0608
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0609 : Poly :=
[
  term ((2961467115378028413 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

/-- Partial product 609 for generator 27. -/
def ep_Q2_008_partial_27_0609 : Poly :=
[
  term ((2961467115378028413 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2961467115378028413 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 27. -/
theorem ep_Q2_008_partial_27_0609_valid :
    mulPoly ep_Q2_008_coefficient_27_0609
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0610 : Poly :=
[
  term ((2601434641989002852495957146652486191197309 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 27. -/
def ep_Q2_008_partial_27_0610 : Poly :=
[
  term ((2601434641989002852495957146652486191197309 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2601434641989002852495957146652486191197309 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 27. -/
theorem ep_Q2_008_partial_27_0610_valid :
    mulPoly ep_Q2_008_coefficient_27_0610
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0611 : Poly :=
[
  term ((1800840807109634320935941975238009600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 611 for generator 27. -/
def ep_Q2_008_partial_27_0611 : Poly :=
[
  term ((3601681614219268641871883950476019200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1800840807109634320935941975238009600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 27. -/
theorem ep_Q2_008_partial_27_0611_valid :
    mulPoly ep_Q2_008_coefficient_27_0611
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0612 : Poly :=
[
  term ((374714056913287282351403260253652229648230 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 612 for generator 27. -/
def ep_Q2_008_partial_27_0612 : Poly :=
[
  term ((749428113826574564702806520507304459296460 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-374714056913287282351403260253652229648230 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 27. -/
theorem ep_Q2_008_partial_27_0612_valid :
    mulPoly ep_Q2_008_coefficient_27_0612
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0613 : Poly :=
[
  term ((8393596661080777329 : Rat) / 2771825814456705436) [(2, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 613 for generator 27. -/
def ep_Q2_008_partial_27_0613 : Poly :=
[
  term ((8393596661080777329 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-8393596661080777329 : Rat) / 2771825814456705436) [(2, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 27. -/
theorem ep_Q2_008_partial_27_0613_valid :
    mulPoly ep_Q2_008_coefficient_27_0613
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0614 : Poly :=
[
  term ((42575147076733004208992660270708428800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 27. -/
def ep_Q2_008_partial_27_0614 : Poly :=
[
  term ((85150294153466008417985320541416857600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-42575147076733004208992660270708428800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 27. -/
theorem ep_Q2_008_partial_27_0614_valid :
    mulPoly ep_Q2_008_coefficient_27_0614
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0615 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 615 for generator 27. -/
def ep_Q2_008_partial_27_0615 : Poly :=
[
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 27. -/
theorem ep_Q2_008_partial_27_0615_valid :
    mulPoly ep_Q2_008_coefficient_27_0615
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0616 : Poly :=
[
  term ((277939822229380643751731817728678258131189 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 616 for generator 27. -/
def ep_Q2_008_partial_27_0616 : Poly :=
[
  term ((277939822229380643751731817728678258131189 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-277939822229380643751731817728678258131189 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 27. -/
theorem ep_Q2_008_partial_27_0616_valid :
    mulPoly ep_Q2_008_coefficient_27_0616
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0617 : Poly :=
[
  term ((-19319382774024510621 : Rat) / 11087303257826821744) [(2, 1), (7, 2), (16, 1)]
]

/-- Partial product 617 for generator 27. -/
def ep_Q2_008_partial_27_0617 : Poly :=
[
  term ((-19319382774024510621 : Rat) / 5543651628913410872) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((19319382774024510621 : Rat) / 11087303257826821744) [(2, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 27. -/
theorem ep_Q2_008_partial_27_0617_valid :
    mulPoly ep_Q2_008_coefficient_27_0617
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0618 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 27. -/
def ep_Q2_008_partial_27_0618 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 27. -/
theorem ep_Q2_008_partial_27_0618_valid :
    mulPoly ep_Q2_008_coefficient_27_0618
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0619 : Poly :=
[
  term ((-19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 619 for generator 27. -/
def ep_Q2_008_partial_27_0619 : Poly :=
[
  term ((-38799947216034992907421682315097600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 27. -/
theorem ep_Q2_008_partial_27_0619_valid :
    mulPoly ep_Q2_008_coefficient_27_0619
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0620 : Poly :=
[
  term ((-1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 620 for generator 27. -/
def ep_Q2_008_partial_27_0620 : Poly :=
[
  term ((-3263225447317422798120120906270067200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 27. -/
theorem ep_Q2_008_partial_27_0620_valid :
    mulPoly ep_Q2_008_coefficient_27_0620
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0621 : Poly :=
[
  term ((-444207479790875856790794180283605949859430 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 27. -/
def ep_Q2_008_partial_27_0621 : Poly :=
[
  term ((-888414959581751713581588360567211899718860 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((444207479790875856790794180283605949859430 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 27. -/
theorem ep_Q2_008_partial_27_0621_valid :
    mulPoly ep_Q2_008_coefficient_27_0621
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0622 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 622 for generator 27. -/
def ep_Q2_008_partial_27_0622 : Poly :=
[
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 27. -/
theorem ep_Q2_008_partial_27_0622_valid :
    mulPoly ep_Q2_008_coefficient_27_0622
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0623 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 623 for generator 27. -/
def ep_Q2_008_partial_27_0623 : Poly :=
[
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 27. -/
theorem ep_Q2_008_partial_27_0623_valid :
    mulPoly ep_Q2_008_coefficient_27_0623
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0624 : Poly :=
[
  term ((-197159509586209564026446527868722558943989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 27. -/
def ep_Q2_008_partial_27_0624 : Poly :=
[
  term ((-197159509586209564026446527868722558943989 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((197159509586209564026446527868722558943989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 27. -/
theorem ep_Q2_008_partial_27_0624_valid :
    mulPoly ep_Q2_008_coefficient_27_0624
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0625 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (15, 3), (16, 1)]
]

/-- Partial product 625 for generator 27. -/
def ep_Q2_008_partial_27_0625 : Poly :=
[
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (14, 1), (15, 3), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 27. -/
theorem ep_Q2_008_partial_27_0625_valid :
    mulPoly ep_Q2_008_coefficient_27_0625
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0626 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 626 for generator 27. -/
def ep_Q2_008_partial_27_0626 : Poly :=
[
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 27. -/
theorem ep_Q2_008_partial_27_0626_valid :
    mulPoly ep_Q2_008_coefficient_27_0626
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0627 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 27. -/
def ep_Q2_008_partial_27_0627 : Poly :=
[
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (14, 1), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 27. -/
theorem ep_Q2_008_partial_27_0627_valid :
    mulPoly ep_Q2_008_coefficient_27_0627
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0628 : Poly :=
[
  term ((234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 628 for generator 27. -/
def ep_Q2_008_partial_27_0628 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 27. -/
theorem ep_Q2_008_partial_27_0628_valid :
    mulPoly ep_Q2_008_coefficient_27_0628
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0629 : Poly :=
[
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 629 for generator 27. -/
def ep_Q2_008_partial_27_0629 : Poly :=
[
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 5543651628913410872) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 27. -/
theorem ep_Q2_008_partial_27_0629_valid :
    mulPoly ep_Q2_008_coefficient_27_0629
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0630 : Poly :=
[
  term ((9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 27. -/
def ep_Q2_008_partial_27_0630 : Poly :=
[
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 27. -/
theorem ep_Q2_008_partial_27_0630_valid :
    mulPoly ep_Q2_008_coefficient_27_0630
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0631 : Poly :=
[
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 631 for generator 27. -/
def ep_Q2_008_partial_27_0631 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 27. -/
theorem ep_Q2_008_partial_27_0631_valid :
    mulPoly ep_Q2_008_coefficient_27_0631
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0632 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 632 for generator 27. -/
def ep_Q2_008_partial_27_0632 : Poly :=
[
  term ((187532765152567200 : Rat) / 692956453614176359) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 27. -/
theorem ep_Q2_008_partial_27_0632_valid :
    mulPoly ep_Q2_008_coefficient_27_0632
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0633 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 27. -/
def ep_Q2_008_partial_27_0633 : Poly :=
[
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 27. -/
theorem ep_Q2_008_partial_27_0633_valid :
    mulPoly ep_Q2_008_coefficient_27_0633
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0634 : Poly :=
[
  term ((-7897219537447537624513459994307680127375 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 634 for generator 27. -/
def ep_Q2_008_partial_27_0634 : Poly :=
[
  term ((-7897219537447537624513459994307680127375 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7897219537447537624513459994307680127375 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 27. -/
theorem ep_Q2_008_partial_27_0634_valid :
    mulPoly ep_Q2_008_coefficient_27_0634
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0635 : Poly :=
[
  term ((4051821608674623000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 27. -/
def ep_Q2_008_partial_27_0635 : Poly :=
[
  term ((8103643217349246000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4051821608674623000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 27. -/
theorem ep_Q2_008_partial_27_0635_valid :
    mulPoly ep_Q2_008_coefficient_27_0635
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0636 : Poly :=
[
  term ((1350607202891541000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 636 for generator 27. -/
def ep_Q2_008_partial_27_0636 : Poly :=
[
  term ((2701214405783082000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1350607202891541000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 27. -/
theorem ep_Q2_008_partial_27_0636_valid :
    mulPoly ep_Q2_008_coefficient_27_0636
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0637 : Poly :=
[
  term ((-1259326110426265621100329690379022200389500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 27. -/
def ep_Q2_008_partial_27_0637 : Poly :=
[
  term ((-2518652220852531242200659380758044400779000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1259326110426265621100329690379022200389500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 27. -/
theorem ep_Q2_008_partial_27_0637_valid :
    mulPoly ep_Q2_008_coefficient_27_0637
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0638 : Poly :=
[
  term ((46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 638 for generator 27. -/
def ep_Q2_008_partial_27_0638 : Poly :=
[
  term ((92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 27. -/
theorem ep_Q2_008_partial_27_0638_valid :
    mulPoly ep_Q2_008_coefficient_27_0638
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0639 : Poly :=
[
  term ((-836448257146434379266496253175262540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 639 for generator 27. -/
def ep_Q2_008_partial_27_0639 : Poly :=
[
  term ((-1672896514292868758532992506350525081600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((836448257146434379266496253175262540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 27. -/
theorem ep_Q2_008_partial_27_0639_valid :
    mulPoly ep_Q2_008_coefficient_27_0639
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0640 : Poly :=
[
  term ((-313462537437498750 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 640 for generator 27. -/
def ep_Q2_008_partial_27_0640 : Poly :=
[
  term ((-626925074874997500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((313462537437498750 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 27. -/
theorem ep_Q2_008_partial_27_0640_valid :
    mulPoly ep_Q2_008_coefficient_27_0640
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0641 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 27. -/
def ep_Q2_008_partial_27_0641 : Poly :=
[
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 27. -/
theorem ep_Q2_008_partial_27_0641_valid :
    mulPoly ep_Q2_008_coefficient_27_0641
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0642 : Poly :=
[
  term ((952132201707085141053065602582340331471225 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 642 for generator 27. -/
def ep_Q2_008_partial_27_0642 : Poly :=
[
  term ((952132201707085141053065602582340331471225 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-952132201707085141053065602582340331471225 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 27. -/
theorem ep_Q2_008_partial_27_0642_valid :
    mulPoly ep_Q2_008_coefficient_27_0642
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0643 : Poly :=
[
  term ((-3265651484058476250 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 643 for generator 27. -/
def ep_Q2_008_partial_27_0643 : Poly :=
[
  term ((-6531302968116952500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((3265651484058476250 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 27. -/
theorem ep_Q2_008_partial_27_0643_valid :
    mulPoly ep_Q2_008_coefficient_27_0643
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0644 : Poly :=
[
  term ((-2804459966263767205695282350836991832000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 644 for generator 27. -/
def ep_Q2_008_partial_27_0644 : Poly :=
[
  term ((-5608919932527534411390564701673983664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2804459966263767205695282350836991832000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 27. -/
theorem ep_Q2_008_partial_27_0644_valid :
    mulPoly ep_Q2_008_coefficient_27_0644
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0645 : Poly :=
[
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 645 for generator 27. -/
def ep_Q2_008_partial_27_0645 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 27. -/
theorem ep_Q2_008_partial_27_0645_valid :
    mulPoly ep_Q2_008_coefficient_27_0645
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0646 : Poly :=
[
  term ((1612131916733127556467904781378512026757200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 646 for generator 27. -/
def ep_Q2_008_partial_27_0646 : Poly :=
[
  term ((3224263833466255112935809562757024053514400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1612131916733127556467904781378512026757200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 27. -/
theorem ep_Q2_008_partial_27_0646_valid :
    mulPoly ep_Q2_008_coefficient_27_0646
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0647 : Poly :=
[
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 647 for generator 27. -/
def ep_Q2_008_partial_27_0647 : Poly :=
[
  term ((2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 27. -/
theorem ep_Q2_008_partial_27_0647_valid :
    mulPoly ep_Q2_008_coefficient_27_0647
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0648 : Poly :=
[
  term ((-2401473757998039476554631160482182899456375 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 648 for generator 27. -/
def ep_Q2_008_partial_27_0648 : Poly :=
[
  term ((-2401473757998039476554631160482182899456375 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2401473757998039476554631160482182899456375 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 27. -/
theorem ep_Q2_008_partial_27_0648_valid :
    mulPoly ep_Q2_008_coefficient_27_0648
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0649 : Poly :=
[
  term ((866524387903629210032732404455865023396000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 649 for generator 27. -/
def ep_Q2_008_partial_27_0649 : Poly :=
[
  term ((1733048775807258420065464808911730046792000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-866524387903629210032732404455865023396000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 27. -/
theorem ep_Q2_008_partial_27_0649_valid :
    mulPoly ep_Q2_008_coefficient_27_0649
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0650 : Poly :=
[
  term ((-77774749781363452125 : Rat) / 11087303257826821744) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 650 for generator 27. -/
def ep_Q2_008_partial_27_0650 : Poly :=
[
  term ((-77774749781363452125 : Rat) / 5543651628913410872) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((77774749781363452125 : Rat) / 11087303257826821744) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 27. -/
theorem ep_Q2_008_partial_27_0650_valid :
    mulPoly ep_Q2_008_coefficient_27_0650
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0651 : Poly :=
[
  term ((-2621999720101807974344369085985249791086400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 27. -/
def ep_Q2_008_partial_27_0651 : Poly :=
[
  term ((-5243999440203615948688738171970499582172800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2621999720101807974344369085985249791086400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 27. -/
theorem ep_Q2_008_partial_27_0651_valid :
    mulPoly ep_Q2_008_coefficient_27_0651
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0652 : Poly :=
[
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 652 for generator 27. -/
def ep_Q2_008_partial_27_0652 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 27. -/
theorem ep_Q2_008_partial_27_0652_valid :
    mulPoly ep_Q2_008_coefficient_27_0652
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0653 : Poly :=
[
  term ((-1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 653 for generator 27. -/
def ep_Q2_008_partial_27_0653 : Poly :=
[
  term ((-3549894133645972220723947686397626316800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 27. -/
theorem ep_Q2_008_partial_27_0653_valid :
    mulPoly ep_Q2_008_coefficient_27_0653
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0654 : Poly :=
[
  term ((4168984499521821000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 654 for generator 27. -/
def ep_Q2_008_partial_27_0654 : Poly :=
[
  term ((8337968999043642000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-4168984499521821000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 27. -/
theorem ep_Q2_008_partial_27_0654_valid :
    mulPoly ep_Q2_008_coefficient_27_0654
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0655 : Poly :=
[
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 655 for generator 27. -/
def ep_Q2_008_partial_27_0655 : Poly :=
[
  term ((690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 27. -/
theorem ep_Q2_008_partial_27_0655_valid :
    mulPoly ep_Q2_008_coefficient_27_0655
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0656 : Poly :=
[
  term ((-201209011564317875675871715726915837019625 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 656 for generator 27. -/
def ep_Q2_008_partial_27_0656 : Poly :=
[
  term ((-201209011564317875675871715726915837019625 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((201209011564317875675871715726915837019625 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 27. -/
theorem ep_Q2_008_partial_27_0656_valid :
    mulPoly ep_Q2_008_coefficient_27_0656
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0657 : Poly :=
[
  term ((920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 657 for generator 27. -/
def ep_Q2_008_partial_27_0657 : Poly :=
[
  term ((1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 27. -/
theorem ep_Q2_008_partial_27_0657_valid :
    mulPoly ep_Q2_008_coefficient_27_0657
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0658 : Poly :=
[
  term ((2884008043808870023942139140922892998282331 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 27. -/
def ep_Q2_008_partial_27_0658 : Poly :=
[
  term ((2884008043808870023942139140922892998282331 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2884008043808870023942139140922892998282331 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 27. -/
theorem ep_Q2_008_partial_27_0658_valid :
    mulPoly ep_Q2_008_coefficient_27_0658
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0659 : Poly :=
[
  term ((-1049086361414700277171684829478353635200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 659 for generator 27. -/
def ep_Q2_008_partial_27_0659 : Poly :=
[
  term ((-2098172722829400554343369658956707270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1049086361414700277171684829478353635200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 27. -/
theorem ep_Q2_008_partial_27_0659_valid :
    mulPoly ep_Q2_008_coefficient_27_0659
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0660 : Poly :=
[
  term ((21813303624541091199295261739211982406400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 660 for generator 27. -/
def ep_Q2_008_partial_27_0660 : Poly :=
[
  term ((43626607249082182398590523478423964812800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-21813303624541091199295261739211982406400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 27. -/
theorem ep_Q2_008_partial_27_0660_valid :
    mulPoly ep_Q2_008_coefficient_27_0660
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0661 : Poly :=
[
  term ((-2432766473170419048036149418535655802273321 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 661 for generator 27. -/
def ep_Q2_008_partial_27_0661 : Poly :=
[
  term ((-2432766473170419048036149418535655802273321 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2432766473170419048036149418535655802273321 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 27. -/
theorem ep_Q2_008_partial_27_0661_valid :
    mulPoly ep_Q2_008_coefficient_27_0661
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0662 : Poly :=
[
  term ((-79231233012093837 : Rat) / 11087303257826821744) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 662 for generator 27. -/
def ep_Q2_008_partial_27_0662 : Poly :=
[
  term ((-79231233012093837 : Rat) / 5543651628913410872) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((79231233012093837 : Rat) / 11087303257826821744) [(2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 27. -/
theorem ep_Q2_008_partial_27_0662_valid :
    mulPoly ep_Q2_008_coefficient_27_0662
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0663 : Poly :=
[
  term ((-458532796143574580550639543374668486303887 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 27. -/
def ep_Q2_008_partial_27_0663 : Poly :=
[
  term ((-458532796143574580550639543374668486303887 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((458532796143574580550639543374668486303887 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 27. -/
theorem ep_Q2_008_partial_27_0663_valid :
    mulPoly ep_Q2_008_coefficient_27_0663
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0664 : Poly :=
[
  term ((3685635257007061632821121382515217243200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 664 for generator 27. -/
def ep_Q2_008_partial_27_0664 : Poly :=
[
  term ((7371270514014123265642242765030434486400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3685635257007061632821121382515217243200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 27. -/
theorem ep_Q2_008_partial_27_0664_valid :
    mulPoly ep_Q2_008_coefficient_27_0664
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0665 : Poly :=
[
  term ((-17142658848906721566345207505354010904000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 665 for generator 27. -/
def ep_Q2_008_partial_27_0665 : Poly :=
[
  term ((-34285317697813443132690415010708021808000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((17142658848906721566345207505354010904000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 27. -/
theorem ep_Q2_008_partial_27_0665_valid :
    mulPoly ep_Q2_008_coefficient_27_0665
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0666 : Poly :=
[
  term ((-92709074334554646045 : Rat) / 22174606515653643488) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 666 for generator 27. -/
def ep_Q2_008_partial_27_0666 : Poly :=
[
  term ((-92709074334554646045 : Rat) / 11087303257826821744) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((92709074334554646045 : Rat) / 22174606515653643488) [(2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 27. -/
theorem ep_Q2_008_partial_27_0666_valid :
    mulPoly ep_Q2_008_coefficient_27_0666
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0667 : Poly :=
[
  term ((6249147845542512161521699139793069744000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 27. -/
def ep_Q2_008_partial_27_0667 : Poly :=
[
  term ((12498295691085024323043398279586139488000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-6249147845542512161521699139793069744000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 27. -/
theorem ep_Q2_008_partial_27_0667_valid :
    mulPoly ep_Q2_008_coefficient_27_0667
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0668 : Poly :=
[
  term ((-2750889946087675784900207487708468802239997 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 27. -/
def ep_Q2_008_partial_27_0668 : Poly :=
[
  term ((-2750889946087675784900207487708468802239997 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((2750889946087675784900207487708468802239997 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 27. -/
theorem ep_Q2_008_partial_27_0668_valid :
    mulPoly ep_Q2_008_coefficient_27_0668
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0669 : Poly :=
[
  term ((-25597345739320583119 : Rat) / 44349213031307286976) [(2, 1), (16, 1)]
]

/-- Partial product 669 for generator 27. -/
def ep_Q2_008_partial_27_0669 : Poly :=
[
  term ((-25597345739320583119 : Rat) / 22174606515653643488) [(2, 1), (14, 1), (16, 1)],
  term ((25597345739320583119 : Rat) / 44349213031307286976) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 27. -/
theorem ep_Q2_008_partial_27_0669_valid :
    mulPoly ep_Q2_008_coefficient_27_0669
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0670 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 670 for generator 27. -/
def ep_Q2_008_partial_27_0670 : Poly :=
[
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 27. -/
theorem ep_Q2_008_partial_27_0670_valid :
    mulPoly ep_Q2_008_coefficient_27_0670
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0671 : Poly :=
[
  term ((-225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 27. -/
def ep_Q2_008_partial_27_0671 : Poly :=
[
  term ((-451786477680673938926876063542694400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 27. -/
theorem ep_Q2_008_partial_27_0671_valid :
    mulPoly ep_Q2_008_coefficient_27_0671
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0672 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 672 for generator 27. -/
def ep_Q2_008_partial_27_0672 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 27. -/
theorem ep_Q2_008_partial_27_0672_valid :
    mulPoly ep_Q2_008_coefficient_27_0672
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0673 : Poly :=
[
  term ((21830018879528362595206196347651200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 27. -/
def ep_Q2_008_partial_27_0673 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21830018879528362595206196347651200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 27. -/
theorem ep_Q2_008_partial_27_0673_valid :
    mulPoly ep_Q2_008_coefficient_27_0673
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0674 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 27. -/
def ep_Q2_008_partial_27_0674 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 27. -/
theorem ep_Q2_008_partial_27_0674_valid :
    mulPoly ep_Q2_008_coefficient_27_0674
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0675 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 675 for generator 27. -/
def ep_Q2_008_partial_27_0675 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 27. -/
theorem ep_Q2_008_partial_27_0675_valid :
    mulPoly ep_Q2_008_coefficient_27_0675
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0676 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 676 for generator 27. -/
def ep_Q2_008_partial_27_0676 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 27. -/
theorem ep_Q2_008_partial_27_0676_valid :
    mulPoly ep_Q2_008_coefficient_27_0676
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0677 : Poly :=
[
  term ((-613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 27. -/
def ep_Q2_008_partial_27_0677 : Poly :=
[
  term ((613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 27. -/
theorem ep_Q2_008_partial_27_0677_valid :
    mulPoly ep_Q2_008_coefficient_27_0677
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0678 : Poly :=
[
  term ((-306569395569028744271808757403971200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 678 for generator 27. -/
def ep_Q2_008_partial_27_0678 : Poly :=
[
  term ((-613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((306569395569028744271808757403971200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 27. -/
theorem ep_Q2_008_partial_27_0678_valid :
    mulPoly ep_Q2_008_coefficient_27_0678
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0679 : Poly :=
[
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 679 for generator 27. -/
def ep_Q2_008_partial_27_0679 : Poly :=
[
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 27. -/
theorem ep_Q2_008_partial_27_0679_valid :
    mulPoly ep_Q2_008_coefficient_27_0679
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0680 : Poly :=
[
  term ((4271090650342505725149038415844800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 27. -/
def ep_Q2_008_partial_27_0680 : Poly :=
[
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4271090650342505725149038415844800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 27. -/
theorem ep_Q2_008_partial_27_0680_valid :
    mulPoly ep_Q2_008_coefficient_27_0680
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0681 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 681 for generator 27. -/
def ep_Q2_008_partial_27_0681 : Poly :=
[
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 27. -/
theorem ep_Q2_008_partial_27_0681_valid :
    mulPoly ep_Q2_008_coefficient_27_0681
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0682 : Poly :=
[
  term ((-37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 682 for generator 27. -/
def ep_Q2_008_partial_27_0682 : Poly :=
[
  term ((-75347805809531695818 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 27. -/
theorem ep_Q2_008_partial_27_0682_valid :
    mulPoly ep_Q2_008_coefficient_27_0682
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0683 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 683 for generator 27. -/
def ep_Q2_008_partial_27_0683 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 27. -/
theorem ep_Q2_008_partial_27_0683_valid :
    mulPoly ep_Q2_008_coefficient_27_0683
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0684 : Poly :=
[
  term ((-78693816490991964591 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 684 for generator 27. -/
def ep_Q2_008_partial_27_0684 : Poly :=
[
  term ((-78693816490991964591 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((78693816490991964591 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 27. -/
theorem ep_Q2_008_partial_27_0684_valid :
    mulPoly ep_Q2_008_coefficient_27_0684
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0685 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 2), (16, 1)]
]

/-- Partial product 685 for generator 27. -/
def ep_Q2_008_partial_27_0685 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 27. -/
theorem ep_Q2_008_partial_27_0685_valid :
    mulPoly ep_Q2_008_coefficient_27_0685
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0686 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 27. -/
def ep_Q2_008_partial_27_0686 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 27. -/
theorem ep_Q2_008_partial_27_0686_valid :
    mulPoly ep_Q2_008_coefficient_27_0686
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0687 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 27. -/
def ep_Q2_008_partial_27_0687 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 27. -/
theorem ep_Q2_008_partial_27_0687_valid :
    mulPoly ep_Q2_008_coefficient_27_0687
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0688 : Poly :=
[
  term ((-102257736455793015753 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 688 for generator 27. -/
def ep_Q2_008_partial_27_0688 : Poly :=
[
  term ((102257736455793015753 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-204515472911586031506 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 27. -/
theorem ep_Q2_008_partial_27_0688_valid :
    mulPoly ep_Q2_008_coefficient_27_0688
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0689 : Poly :=
[
  term ((-102257736455793015753 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 689 for generator 27. -/
def ep_Q2_008_partial_27_0689 : Poly :=
[
  term ((-102257736455793015753 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((102257736455793015753 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 27. -/
theorem ep_Q2_008_partial_27_0689_valid :
    mulPoly ep_Q2_008_coefficient_27_0689
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0690 : Poly :=
[
  term ((102894727237773938397 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 690 for generator 27. -/
def ep_Q2_008_partial_27_0690 : Poly :=
[
  term ((-102894727237773938397 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((102894727237773938397 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (5, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 27. -/
theorem ep_Q2_008_partial_27_0690_valid :
    mulPoly ep_Q2_008_coefficient_27_0690
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0691 : Poly :=
[
  term ((102894727237773938397 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 691 for generator 27. -/
def ep_Q2_008_partial_27_0691 : Poly :=
[
  term ((102894727237773938397 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-102894727237773938397 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 27. -/
theorem ep_Q2_008_partial_27_0691_valid :
    mulPoly ep_Q2_008_coefficient_27_0691
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0692 : Poly :=
[
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 27. -/
def ep_Q2_008_partial_27_0692 : Poly :=
[
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 27. -/
theorem ep_Q2_008_partial_27_0692_valid :
    mulPoly ep_Q2_008_coefficient_27_0692
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0693 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 693 for generator 27. -/
def ep_Q2_008_partial_27_0693 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 27. -/
theorem ep_Q2_008_partial_27_0693_valid :
    mulPoly ep_Q2_008_coefficient_27_0693
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0694 : Poly :=
[
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 27. -/
def ep_Q2_008_partial_27_0694 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 27. -/
theorem ep_Q2_008_partial_27_0694_valid :
    mulPoly ep_Q2_008_coefficient_27_0694
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0695 : Poly :=
[
  term ((3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 695 for generator 27. -/
def ep_Q2_008_partial_27_0695 : Poly :=
[
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 27. -/
theorem ep_Q2_008_partial_27_0695_valid :
    mulPoly ep_Q2_008_coefficient_27_0695
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0696 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 696 for generator 27. -/
def ep_Q2_008_partial_27_0696 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 27. -/
theorem ep_Q2_008_partial_27_0696_valid :
    mulPoly ep_Q2_008_coefficient_27_0696
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0697 : Poly :=
[
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 697 for generator 27. -/
def ep_Q2_008_partial_27_0697 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 27. -/
theorem ep_Q2_008_partial_27_0697_valid :
    mulPoly ep_Q2_008_coefficient_27_0697
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0698 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 698 for generator 27. -/
def ep_Q2_008_partial_27_0698 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 27. -/
theorem ep_Q2_008_partial_27_0698_valid :
    mulPoly ep_Q2_008_coefficient_27_0698
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0699 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 699 for generator 27. -/
def ep_Q2_008_partial_27_0699 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 27. -/
theorem ep_Q2_008_partial_27_0699_valid :
    mulPoly ep_Q2_008_coefficient_27_0699
        ep_Q2_008_generator_27_0600_0699 =
      ep_Q2_008_partial_27_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0600_0699 : List Poly :=
[
  ep_Q2_008_partial_27_0600,
  ep_Q2_008_partial_27_0601,
  ep_Q2_008_partial_27_0602,
  ep_Q2_008_partial_27_0603,
  ep_Q2_008_partial_27_0604,
  ep_Q2_008_partial_27_0605,
  ep_Q2_008_partial_27_0606,
  ep_Q2_008_partial_27_0607,
  ep_Q2_008_partial_27_0608,
  ep_Q2_008_partial_27_0609,
  ep_Q2_008_partial_27_0610,
  ep_Q2_008_partial_27_0611,
  ep_Q2_008_partial_27_0612,
  ep_Q2_008_partial_27_0613,
  ep_Q2_008_partial_27_0614,
  ep_Q2_008_partial_27_0615,
  ep_Q2_008_partial_27_0616,
  ep_Q2_008_partial_27_0617,
  ep_Q2_008_partial_27_0618,
  ep_Q2_008_partial_27_0619,
  ep_Q2_008_partial_27_0620,
  ep_Q2_008_partial_27_0621,
  ep_Q2_008_partial_27_0622,
  ep_Q2_008_partial_27_0623,
  ep_Q2_008_partial_27_0624,
  ep_Q2_008_partial_27_0625,
  ep_Q2_008_partial_27_0626,
  ep_Q2_008_partial_27_0627,
  ep_Q2_008_partial_27_0628,
  ep_Q2_008_partial_27_0629,
  ep_Q2_008_partial_27_0630,
  ep_Q2_008_partial_27_0631,
  ep_Q2_008_partial_27_0632,
  ep_Q2_008_partial_27_0633,
  ep_Q2_008_partial_27_0634,
  ep_Q2_008_partial_27_0635,
  ep_Q2_008_partial_27_0636,
  ep_Q2_008_partial_27_0637,
  ep_Q2_008_partial_27_0638,
  ep_Q2_008_partial_27_0639,
  ep_Q2_008_partial_27_0640,
  ep_Q2_008_partial_27_0641,
  ep_Q2_008_partial_27_0642,
  ep_Q2_008_partial_27_0643,
  ep_Q2_008_partial_27_0644,
  ep_Q2_008_partial_27_0645,
  ep_Q2_008_partial_27_0646,
  ep_Q2_008_partial_27_0647,
  ep_Q2_008_partial_27_0648,
  ep_Q2_008_partial_27_0649,
  ep_Q2_008_partial_27_0650,
  ep_Q2_008_partial_27_0651,
  ep_Q2_008_partial_27_0652,
  ep_Q2_008_partial_27_0653,
  ep_Q2_008_partial_27_0654,
  ep_Q2_008_partial_27_0655,
  ep_Q2_008_partial_27_0656,
  ep_Q2_008_partial_27_0657,
  ep_Q2_008_partial_27_0658,
  ep_Q2_008_partial_27_0659,
  ep_Q2_008_partial_27_0660,
  ep_Q2_008_partial_27_0661,
  ep_Q2_008_partial_27_0662,
  ep_Q2_008_partial_27_0663,
  ep_Q2_008_partial_27_0664,
  ep_Q2_008_partial_27_0665,
  ep_Q2_008_partial_27_0666,
  ep_Q2_008_partial_27_0667,
  ep_Q2_008_partial_27_0668,
  ep_Q2_008_partial_27_0669,
  ep_Q2_008_partial_27_0670,
  ep_Q2_008_partial_27_0671,
  ep_Q2_008_partial_27_0672,
  ep_Q2_008_partial_27_0673,
  ep_Q2_008_partial_27_0674,
  ep_Q2_008_partial_27_0675,
  ep_Q2_008_partial_27_0676,
  ep_Q2_008_partial_27_0677,
  ep_Q2_008_partial_27_0678,
  ep_Q2_008_partial_27_0679,
  ep_Q2_008_partial_27_0680,
  ep_Q2_008_partial_27_0681,
  ep_Q2_008_partial_27_0682,
  ep_Q2_008_partial_27_0683,
  ep_Q2_008_partial_27_0684,
  ep_Q2_008_partial_27_0685,
  ep_Q2_008_partial_27_0686,
  ep_Q2_008_partial_27_0687,
  ep_Q2_008_partial_27_0688,
  ep_Q2_008_partial_27_0689,
  ep_Q2_008_partial_27_0690,
  ep_Q2_008_partial_27_0691,
  ep_Q2_008_partial_27_0692,
  ep_Q2_008_partial_27_0693,
  ep_Q2_008_partial_27_0694,
  ep_Q2_008_partial_27_0695,
  ep_Q2_008_partial_27_0696,
  ep_Q2_008_partial_27_0697,
  ep_Q2_008_partial_27_0698,
  ep_Q2_008_partial_27_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0600_0699 : Poly :=
[
  term ((-16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-95291074274784480000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((51783810740093250 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1925179245406497789416850204697228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((962589622703248894708425102348614400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-558452675388045642190409022939820800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((124989142940204328297190457534131200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2961467115378028413 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-62494571470102164148595228767065600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2961467115378028413 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((2601434641989002852495957146652486191197309 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3601681614219268641871883950476019200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2601434641989002852495957146652486191197309 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1800840807109634320935941975238009600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((749428113826574564702806520507304459296460 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((8393596661080777329 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-374714056913287282351403260253652229648230 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-8393596661080777329 : Rat) / 2771825814456705436) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((85150294153466008417985320541416857600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-42575147076733004208992660270708428800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((277939822229380643751731817728678258131189 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19319382774024510621 : Rat) / 5543651628913410872) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-277939822229380643751731817728678258131189 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((19319382774024510621 : Rat) / 11087303257826821744) [(2, 1), (7, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-38799947216034992907421682315097600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3263225447317422798120120906270067200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-888414959581751713581588360567211899718860 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((444207479790875856790794180283605949859430 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((-197159509586209564026446527868722558943989 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (14, 1), (15, 3), (16, 1)],
  term ((197159509586209564026446527868722558943989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (15, 3), (16, 1)],
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (14, 1), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)],
  term ((234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 5543651628913410872) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((187532765152567200 : Rat) / 692956453614176359) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7897219537447537624513459994307680127375 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7897219537447537624513459994307680127375 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4051821608674623000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2701214405783082000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1350607202891541000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2518652220852531242200659380758044400779000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1259326110426265621100329690379022200389500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1672896514292868758532992506350525081600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-626925074874997500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((836448257146434379266496253175262540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((313462537437498750 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((952132201707085141053065602582340331471225 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6531302968116952500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-952132201707085141053065602582340331471225 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((3265651484058476250 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)],
  term ((-5608919932527534411390564701673983664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2804459966263767205695282350836991832000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3224263833466255112935809562757024053514400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1612131916733127556467904781378512026757200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2401473757998039476554631160482182899456375 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2401473757998039476554631160482182899456375 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1733048775807258420065464808911730046792000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-77774749781363452125 : Rat) / 5543651628913410872) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-866524387903629210032732404455865023396000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((77774749781363452125 : Rat) / 11087303257826821744) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5243999440203615948688738171970499582172800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((2621999720101807974344369085985249791086400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3549894133645972220723947686397626316800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((8337968999043642000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4168984499521821000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-201209011564317875675871715726915837019625 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((201209011564317875675871715726915837019625 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((2884008043808870023942139140922892998282331 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2098172722829400554343369658956707270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2884008043808870023942139140922892998282331 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1049086361414700277171684829478353635200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((43626607249082182398590523478423964812800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-21813303624541091199295261739211982406400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2432766473170419048036149418535655802273321 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79231233012093837 : Rat) / 5543651628913410872) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((2432766473170419048036149418535655802273321 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((79231233012093837 : Rat) / 11087303257826821744) [(2, 1), (12, 1), (16, 1)],
  term ((-458532796143574580550639543374668486303887 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7371270514014123265642242765030434486400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((458532796143574580550639543374668486303887 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3685635257007061632821121382515217243200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-34285317697813443132690415010708021808000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-92709074334554646045 : Rat) / 11087303257826821744) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((17142658848906721566345207505354010904000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((92709074334554646045 : Rat) / 22174606515653643488) [(2, 1), (13, 2), (16, 1)],
  term ((12498295691085024323043398279586139488000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-6249147845542512161521699139793069744000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2750889946087675784900207487708468802239997 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25597345739320583119 : Rat) / 22174606515653643488) [(2, 1), (14, 1), (16, 1)],
  term ((2750889946087675784900207487708468802239997 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (15, 2), (16, 1)],
  term ((25597345739320583119 : Rat) / 44349213031307286976) [(2, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-451786477680673938926876063542694400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21830018879528362595206196347651200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((306569395569028744271808757403971200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4271090650342505725149038415844800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75347805809531695818 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-164805594559028188383 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((78693816490991964591 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-204515472911586031506 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 2), (16, 1)],
  term ((102257736455793015753 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((102894727237773938397 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((-102894727237773938397 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 600 through 699. -/
theorem ep_Q2_008_block_27_0600_0699_valid :
    checkProductSumEq ep_Q2_008_partials_27_0600_0699
      ep_Q2_008_block_27_0600_0699 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
