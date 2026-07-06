/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0700 : Poly :=
[
  term ((-13398880981066875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 700 for generator 27. -/
def ep_Q2_008_partial_27_0700 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((13398880981066875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 27. -/
theorem ep_Q2_008_partial_27_0700_valid :
    mulPoly ep_Q2_008_coefficient_27_0700
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0701 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 701 for generator 27. -/
def ep_Q2_008_partial_27_0701 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 27. -/
theorem ep_Q2_008_partial_27_0701_valid :
    mulPoly ep_Q2_008_coefficient_27_0701
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0702 : Poly :=
[
  term ((1028739732199966598720537975760493340956521 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 702 for generator 27. -/
def ep_Q2_008_partial_27_0702 : Poly :=
[
  term ((1028739732199966598720537975760493340956521 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1028739732199966598720537975760493340956521 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 27. -/
theorem ep_Q2_008_partial_27_0702_valid :
    mulPoly ep_Q2_008_coefficient_27_0702
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0703 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 703 for generator 27. -/
def ep_Q2_008_partial_27_0703 : Poly :=
[
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 27. -/
theorem ep_Q2_008_partial_27_0703_valid :
    mulPoly ep_Q2_008_coefficient_27_0703
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0704 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 704 for generator 27. -/
def ep_Q2_008_partial_27_0704 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 27. -/
theorem ep_Q2_008_partial_27_0704_valid :
    mulPoly ep_Q2_008_coefficient_27_0704
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0705 : Poly :=
[
  term ((1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 705 for generator 27. -/
def ep_Q2_008_partial_27_0705 : Poly :=
[
  term ((-1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1203246973189179433531786288486998954033321 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 27. -/
theorem ep_Q2_008_partial_27_0705_valid :
    mulPoly ep_Q2_008_coefficient_27_0705
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0706 : Poly :=
[
  term ((1203246973189179433531786288486998954033321 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 706 for generator 27. -/
def ep_Q2_008_partial_27_0706 : Poly :=
[
  term ((1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1203246973189179433531786288486998954033321 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 27. -/
theorem ep_Q2_008_partial_27_0706_valid :
    mulPoly ep_Q2_008_coefficient_27_0706
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0707 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 707 for generator 27. -/
def ep_Q2_008_partial_27_0707 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 27. -/
theorem ep_Q2_008_partial_27_0707_valid :
    mulPoly ep_Q2_008_coefficient_27_0707
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0708 : Poly :=
[
  term ((-177786021200264962371581428800161027343612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 708 for generator 27. -/
def ep_Q2_008_partial_27_0708 : Poly :=
[
  term ((-355572042400529924743162857600322054687224 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((177786021200264962371581428800161027343612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 27. -/
theorem ep_Q2_008_partial_27_0708_valid :
    mulPoly ep_Q2_008_coefficient_27_0708
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0709 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 709 for generator 27. -/
def ep_Q2_008_partial_27_0709 : Poly :=
[
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 27. -/
theorem ep_Q2_008_partial_27_0709_valid :
    mulPoly ep_Q2_008_coefficient_27_0709
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0710 : Poly :=
[
  term ((2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 710 for generator 27. -/
def ep_Q2_008_partial_27_0710 : Poly :=
[
  term ((2554572896850671361 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 27. -/
theorem ep_Q2_008_partial_27_0710_valid :
    mulPoly ep_Q2_008_coefficient_27_0710
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0711 : Poly :=
[
  term ((12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 711 for generator 27. -/
def ep_Q2_008_partial_27_0711 : Poly :=
[
  term ((25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 27. -/
theorem ep_Q2_008_partial_27_0711_valid :
    mulPoly ep_Q2_008_coefficient_27_0711
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0712 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 712 for generator 27. -/
def ep_Q2_008_partial_27_0712 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 27. -/
theorem ep_Q2_008_partial_27_0712_valid :
    mulPoly ep_Q2_008_coefficient_27_0712
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0713 : Poly :=
[
  term ((287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 713 for generator 27. -/
def ep_Q2_008_partial_27_0713 : Poly :=
[
  term ((575148859012526117683360950889545600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 27. -/
theorem ep_Q2_008_partial_27_0713_valid :
    mulPoly ep_Q2_008_coefficient_27_0713
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0714 : Poly :=
[
  term ((-47390387520221317401 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 714 for generator 27. -/
def ep_Q2_008_partial_27_0714 : Poly :=
[
  term ((-47390387520221317401 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((47390387520221317401 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 27. -/
theorem ep_Q2_008_partial_27_0714_valid :
    mulPoly ep_Q2_008_coefficient_27_0714
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0715 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 715 for generator 27. -/
def ep_Q2_008_partial_27_0715 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 27. -/
theorem ep_Q2_008_partial_27_0715_valid :
    mulPoly ep_Q2_008_coefficient_27_0715
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0716 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 716 for generator 27. -/
def ep_Q2_008_partial_27_0716 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 27. -/
theorem ep_Q2_008_partial_27_0716_valid :
    mulPoly ep_Q2_008_coefficient_27_0716
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0717 : Poly :=
[
  term ((88851619643790930972110648530988653489806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 717 for generator 27. -/
def ep_Q2_008_partial_27_0717 : Poly :=
[
  term ((-88851619643790930972110648530988653489806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((177703239287581861944221297061977306979612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 27. -/
theorem ep_Q2_008_partial_27_0717_valid :
    mulPoly ep_Q2_008_coefficient_27_0717
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0718 : Poly :=
[
  term ((44425809821895465486055324265494326744903 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 718 for generator 27. -/
def ep_Q2_008_partial_27_0718 : Poly :=
[
  term ((88851619643790930972110648530988653489806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44425809821895465486055324265494326744903 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 27. -/
theorem ep_Q2_008_partial_27_0718_valid :
    mulPoly ep_Q2_008_coefficient_27_0718
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0719 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 719 for generator 27. -/
def ep_Q2_008_partial_27_0719 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 27. -/
theorem ep_Q2_008_partial_27_0719_valid :
    mulPoly ep_Q2_008_coefficient_27_0719
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0720 : Poly :=
[
  term ((6933840720023250837 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 720 for generator 27. -/
def ep_Q2_008_partial_27_0720 : Poly :=
[
  term ((-6933840720023250837 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((6933840720023250837 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 27. -/
theorem ep_Q2_008_partial_27_0720_valid :
    mulPoly ep_Q2_008_coefficient_27_0720
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0721 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 721 for generator 27. -/
def ep_Q2_008_partial_27_0721 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 27. -/
theorem ep_Q2_008_partial_27_0721_valid :
    mulPoly ep_Q2_008_coefficient_27_0721
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0722 : Poly :=
[
  term ((6933840720023250837 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 722 for generator 27. -/
def ep_Q2_008_partial_27_0722 : Poly :=
[
  term ((6933840720023250837 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6933840720023250837 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 27. -/
theorem ep_Q2_008_partial_27_0722_valid :
    mulPoly ep_Q2_008_coefficient_27_0722
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0723 : Poly :=
[
  term ((35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 723 for generator 27. -/
def ep_Q2_008_partial_27_0723 : Poly :=
[
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 27. -/
theorem ep_Q2_008_partial_27_0723_valid :
    mulPoly ep_Q2_008_coefficient_27_0723
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0724 : Poly :=
[
  term ((17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 724 for generator 27. -/
def ep_Q2_008_partial_27_0724 : Poly :=
[
  term ((35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 27. -/
theorem ep_Q2_008_partial_27_0724_valid :
    mulPoly ep_Q2_008_coefficient_27_0724
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0725 : Poly :=
[
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 725 for generator 27. -/
def ep_Q2_008_partial_27_0725 : Poly :=
[
  term ((189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 27. -/
theorem ep_Q2_008_partial_27_0725_valid :
    mulPoly ep_Q2_008_coefficient_27_0725
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0726 : Poly :=
[
  term ((29523847013081470479 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 726 for generator 27. -/
def ep_Q2_008_partial_27_0726 : Poly :=
[
  term ((-29523847013081470479 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((29523847013081470479 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 27. -/
theorem ep_Q2_008_partial_27_0726_valid :
    mulPoly ep_Q2_008_coefficient_27_0726
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0727 : Poly :=
[
  term ((-94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 727 for generator 27. -/
def ep_Q2_008_partial_27_0727 : Poly :=
[
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 27. -/
theorem ep_Q2_008_partial_27_0727_valid :
    mulPoly ep_Q2_008_coefficient_27_0727
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0728 : Poly :=
[
  term ((29523847013081470479 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 728 for generator 27. -/
def ep_Q2_008_partial_27_0728 : Poly :=
[
  term ((29523847013081470479 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-29523847013081470479 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 27. -/
theorem ep_Q2_008_partial_27_0728_valid :
    mulPoly ep_Q2_008_coefficient_27_0728
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0729 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 729 for generator 27. -/
def ep_Q2_008_partial_27_0729 : Poly :=
[
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 27. -/
theorem ep_Q2_008_partial_27_0729_valid :
    mulPoly ep_Q2_008_coefficient_27_0729
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0730 : Poly :=
[
  term ((355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 730 for generator 27. -/
def ep_Q2_008_partial_27_0730 : Poly :=
[
  term ((710757950493876271878702392832499200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 27. -/
theorem ep_Q2_008_partial_27_0730_valid :
    mulPoly ep_Q2_008_coefficient_27_0730
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0731 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 731 for generator 27. -/
def ep_Q2_008_partial_27_0731 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 27. -/
theorem ep_Q2_008_partial_27_0731_valid :
    mulPoly ep_Q2_008_coefficient_27_0731
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0732 : Poly :=
[
  term ((-123380331804771926613485776397193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 732 for generator 27. -/
def ep_Q2_008_partial_27_0732 : Poly :=
[
  term ((-246760663609543853226971552794387200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((123380331804771926613485776397193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 27. -/
theorem ep_Q2_008_partial_27_0732_valid :
    mulPoly ep_Q2_008_coefficient_27_0732
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0733 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 733 for generator 27. -/
def ep_Q2_008_partial_27_0733 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 27. -/
theorem ep_Q2_008_partial_27_0733_valid :
    mulPoly ep_Q2_008_coefficient_27_0733
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0734 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 734 for generator 27. -/
def ep_Q2_008_partial_27_0734 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 27. -/
theorem ep_Q2_008_partial_27_0734_valid :
    mulPoly ep_Q2_008_coefficient_27_0734
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0735 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 735 for generator 27. -/
def ep_Q2_008_partial_27_0735 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 27. -/
theorem ep_Q2_008_partial_27_0735_valid :
    mulPoly ep_Q2_008_coefficient_27_0735
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0736 : Poly :=
[
  term ((964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 736 for generator 27. -/
def ep_Q2_008_partial_27_0736 : Poly :=
[
  term ((-964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 27. -/
theorem ep_Q2_008_partial_27_0736_valid :
    mulPoly ep_Q2_008_coefficient_27_0736
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0737 : Poly :=
[
  term ((482300037835130327346262337993481600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 737 for generator 27. -/
def ep_Q2_008_partial_27_0737 : Poly :=
[
  term ((964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-482300037835130327346262337993481600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 27. -/
theorem ep_Q2_008_partial_27_0737_valid :
    mulPoly ep_Q2_008_coefficient_27_0737
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0738 : Poly :=
[
  term ((21493447512283090276439526653731200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 738 for generator 27. -/
def ep_Q2_008_partial_27_0738 : Poly :=
[
  term ((-21493447512283090276439526653731200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((42986895024566180552879053307462400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 27. -/
theorem ep_Q2_008_partial_27_0738_valid :
    mulPoly ep_Q2_008_coefficient_27_0738
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0739 : Poly :=
[
  term ((10746723756141545138219763326865600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 739 for generator 27. -/
def ep_Q2_008_partial_27_0739 : Poly :=
[
  term ((21493447512283090276439526653731200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10746723756141545138219763326865600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 27. -/
theorem ep_Q2_008_partial_27_0739_valid :
    mulPoly ep_Q2_008_coefficient_27_0739
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0740 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 740 for generator 27. -/
def ep_Q2_008_partial_27_0740 : Poly :=
[
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 27. -/
theorem ep_Q2_008_partial_27_0740_valid :
    mulPoly ep_Q2_008_coefficient_27_0740
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0741 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 741 for generator 27. -/
def ep_Q2_008_partial_27_0741 : Poly :=
[
  term ((187532765152567200 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 27. -/
theorem ep_Q2_008_partial_27_0741_valid :
    mulPoly ep_Q2_008_coefficient_27_0741
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0742 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 742 for generator 27. -/
def ep_Q2_008_partial_27_0742 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 27. -/
theorem ep_Q2_008_partial_27_0742_valid :
    mulPoly ep_Q2_008_coefficient_27_0742
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0743 : Poly :=
[
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 743 for generator 27. -/
def ep_Q2_008_partial_27_0743 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 27. -/
theorem ep_Q2_008_partial_27_0743_valid :
    mulPoly ep_Q2_008_coefficient_27_0743
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0744 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 744 for generator 27. -/
def ep_Q2_008_partial_27_0744 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 27. -/
theorem ep_Q2_008_partial_27_0744_valid :
    mulPoly ep_Q2_008_coefficient_27_0744
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0745 : Poly :=
[
  term ((-23441595644070900 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 745 for generator 27. -/
def ep_Q2_008_partial_27_0745 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 27. -/
theorem ep_Q2_008_partial_27_0745_valid :
    mulPoly ep_Q2_008_coefficient_27_0745
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0746 : Poly :=
[
  term ((1736494975146267000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 746 for generator 27. -/
def ep_Q2_008_partial_27_0746 : Poly :=
[
  term ((3472989950292534000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1736494975146267000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 27. -/
theorem ep_Q2_008_partial_27_0746_valid :
    mulPoly ep_Q2_008_coefficient_27_0746
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0747 : Poly :=
[
  term ((-10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 747 for generator 27. -/
def ep_Q2_008_partial_27_0747 : Poly :=
[
  term ((-20066164157245752000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 27. -/
theorem ep_Q2_008_partial_27_0747_valid :
    mulPoly ep_Q2_008_coefficient_27_0747
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0748 : Poly :=
[
  term ((7910699331221883000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 748 for generator 27. -/
def ep_Q2_008_partial_27_0748 : Poly :=
[
  term ((-7910699331221883000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((15821398662443766000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 27. -/
theorem ep_Q2_008_partial_27_0748_valid :
    mulPoly ep_Q2_008_coefficient_27_0748
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0749 : Poly :=
[
  term ((3955349665610941500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 749 for generator 27. -/
def ep_Q2_008_partial_27_0749 : Poly :=
[
  term ((7910699331221883000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3955349665610941500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 27. -/
theorem ep_Q2_008_partial_27_0749_valid :
    mulPoly ep_Q2_008_coefficient_27_0749
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0750 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 750 for generator 27. -/
def ep_Q2_008_partial_27_0750 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 27. -/
theorem ep_Q2_008_partial_27_0750_valid :
    mulPoly ep_Q2_008_coefficient_27_0750
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0751 : Poly :=
[
  term ((2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 751 for generator 27. -/
def ep_Q2_008_partial_27_0751 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 27. -/
theorem ep_Q2_008_partial_27_0751_valid :
    mulPoly ep_Q2_008_coefficient_27_0751
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0752 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 752 for generator 27. -/
def ep_Q2_008_partial_27_0752 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 27. -/
theorem ep_Q2_008_partial_27_0752_valid :
    mulPoly ep_Q2_008_coefficient_27_0752
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0753 : Poly :=
[
  term ((-2321094160131413589427571596042246877860800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 753 for generator 27. -/
def ep_Q2_008_partial_27_0753 : Poly :=
[
  term ((-4642188320262827178855143192084493755721600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2321094160131413589427571596042246877860800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 27. -/
theorem ep_Q2_008_partial_27_0753_valid :
    mulPoly ep_Q2_008_coefficient_27_0753
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0754 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 754 for generator 27. -/
def ep_Q2_008_partial_27_0754 : Poly :=
[
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 27. -/
theorem ep_Q2_008_partial_27_0754_valid :
    mulPoly ep_Q2_008_coefficient_27_0754
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0755 : Poly :=
[
  term ((8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 755 for generator 27. -/
def ep_Q2_008_partial_27_0755 : Poly :=
[
  term ((16675937998087284000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 27. -/
theorem ep_Q2_008_partial_27_0755_valid :
    mulPoly ep_Q2_008_coefficient_27_0755
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0756 : Poly :=
[
  term ((690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 756 for generator 27. -/
def ep_Q2_008_partial_27_0756 : Poly :=
[
  term ((1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 27. -/
theorem ep_Q2_008_partial_27_0756_valid :
    mulPoly ep_Q2_008_coefficient_27_0756
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0757 : Poly :=
[
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 757 for generator 27. -/
def ep_Q2_008_partial_27_0757 : Poly :=
[
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 27. -/
theorem ep_Q2_008_partial_27_0757_valid :
    mulPoly ep_Q2_008_coefficient_27_0757
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0758 : Poly :=
[
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 758 for generator 27. -/
def ep_Q2_008_partial_27_0758 : Poly :=
[
  term ((-4908845061293746365060287226925842432000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 27. -/
theorem ep_Q2_008_partial_27_0758_valid :
    mulPoly ep_Q2_008_coefficient_27_0758
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0759 : Poly :=
[
  term ((-7337330019522118125 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 759 for generator 27. -/
def ep_Q2_008_partial_27_0759 : Poly :=
[
  term ((-7337330019522118125 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((7337330019522118125 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 27. -/
theorem ep_Q2_008_partial_27_0759_valid :
    mulPoly ep_Q2_008_coefficient_27_0759
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0760 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 27. -/
def ep_Q2_008_partial_27_0760 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 27. -/
theorem ep_Q2_008_partial_27_0760_valid :
    mulPoly ep_Q2_008_coefficient_27_0760
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0761 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 761 for generator 27. -/
def ep_Q2_008_partial_27_0761 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 27. -/
theorem ep_Q2_008_partial_27_0761_valid :
    mulPoly ep_Q2_008_coefficient_27_0761
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0762 : Poly :=
[
  term ((40079222221316191245204935876337094430400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 762 for generator 27. -/
def ep_Q2_008_partial_27_0762 : Poly :=
[
  term ((-40079222221316191245204935876337094430400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((80158444442632382490409871752674188860800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 27. -/
theorem ep_Q2_008_partial_27_0762_valid :
    mulPoly ep_Q2_008_coefficient_27_0762
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0763 : Poly :=
[
  term ((20039611110658095622602467938168547215200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 763 for generator 27. -/
def ep_Q2_008_partial_27_0763 : Poly :=
[
  term ((40079222221316191245204935876337094430400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20039611110658095622602467938168547215200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 27. -/
theorem ep_Q2_008_partial_27_0763_valid :
    mulPoly ep_Q2_008_coefficient_27_0763
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0764 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 764 for generator 27. -/
def ep_Q2_008_partial_27_0764 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 27. -/
theorem ep_Q2_008_partial_27_0764_valid :
    mulPoly ep_Q2_008_coefficient_27_0764
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0765 : Poly :=
[
  term ((22631630140261314000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 765 for generator 27. -/
def ep_Q2_008_partial_27_0765 : Poly :=
[
  term ((-22631630140261314000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((45263260280522628000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 27. -/
theorem ep_Q2_008_partial_27_0765_valid :
    mulPoly ep_Q2_008_coefficient_27_0765
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0766 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 766 for generator 27. -/
def ep_Q2_008_partial_27_0766 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 27. -/
theorem ep_Q2_008_partial_27_0766_valid :
    mulPoly ep_Q2_008_coefficient_27_0766
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0767 : Poly :=
[
  term ((11315815070130657000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 767 for generator 27. -/
def ep_Q2_008_partial_27_0767 : Poly :=
[
  term ((22631630140261314000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-11315815070130657000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 27. -/
theorem ep_Q2_008_partial_27_0767_valid :
    mulPoly ep_Q2_008_coefficient_27_0767
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0768 : Poly :=
[
  term ((1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 768 for generator 27. -/
def ep_Q2_008_partial_27_0768 : Poly :=
[
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 27. -/
theorem ep_Q2_008_partial_27_0768_valid :
    mulPoly ep_Q2_008_coefficient_27_0768
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0769 : Poly :=
[
  term ((936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 769 for generator 27. -/
def ep_Q2_008_partial_27_0769 : Poly :=
[
  term ((1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 27. -/
theorem ep_Q2_008_partial_27_0769_valid :
    mulPoly ep_Q2_008_coefficient_27_0769
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0770 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 770 for generator 27. -/
def ep_Q2_008_partial_27_0770 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 27. -/
theorem ep_Q2_008_partial_27_0770_valid :
    mulPoly ep_Q2_008_coefficient_27_0770
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0771 : Poly :=
[
  term ((-865588729083620625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 771 for generator 27. -/
def ep_Q2_008_partial_27_0771 : Poly :=
[
  term ((865588729083620625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-865588729083620625 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 27. -/
theorem ep_Q2_008_partial_27_0771_valid :
    mulPoly ep_Q2_008_coefficient_27_0771
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0772 : Poly :=
[
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 772 for generator 27. -/
def ep_Q2_008_partial_27_0772 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 27. -/
theorem ep_Q2_008_partial_27_0772_valid :
    mulPoly ep_Q2_008_coefficient_27_0772
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0773 : Poly :=
[
  term ((-8060346295340625 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 773 for generator 27. -/
def ep_Q2_008_partial_27_0773 : Poly :=
[
  term ((-8060346295340625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((8060346295340625 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 27. -/
theorem ep_Q2_008_partial_27_0773_valid :
    mulPoly ep_Q2_008_coefficient_27_0773
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0774 : Poly :=
[
  term ((-443839766060421359398517658361442697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 774 for generator 27. -/
def ep_Q2_008_partial_27_0774 : Poly :=
[
  term ((-887679532120842718797035316722885395200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((443839766060421359398517658361442697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 27. -/
theorem ep_Q2_008_partial_27_0774_valid :
    mulPoly ep_Q2_008_coefficient_27_0774
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0775 : Poly :=
[
  term ((15566498222321469819 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 775 for generator 27. -/
def ep_Q2_008_partial_27_0775 : Poly :=
[
  term ((15566498222321469819 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15566498222321469819 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 27. -/
theorem ep_Q2_008_partial_27_0775_valid :
    mulPoly ep_Q2_008_coefficient_27_0775
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0776 : Poly :=
[
  term ((15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 776 for generator 27. -/
def ep_Q2_008_partial_27_0776 : Poly :=
[
  term ((31935456362629892452450810936264943961600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 27. -/
theorem ep_Q2_008_partial_27_0776_valid :
    mulPoly ep_Q2_008_coefficient_27_0776
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0777 : Poly :=
[
  term ((-7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 777 for generator 27. -/
def ep_Q2_008_partial_27_0777 : Poly :=
[
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 27. -/
theorem ep_Q2_008_partial_27_0777_valid :
    mulPoly ep_Q2_008_coefficient_27_0777
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0778 : Poly :=
[
  term ((630979462380099613784649472090840186841961 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 778 for generator 27. -/
def ep_Q2_008_partial_27_0778 : Poly :=
[
  term ((630979462380099613784649472090840186841961 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-630979462380099613784649472090840186841961 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 27. -/
theorem ep_Q2_008_partial_27_0778_valid :
    mulPoly ep_Q2_008_coefficient_27_0778
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0779 : Poly :=
[
  term ((14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 779 for generator 27. -/
def ep_Q2_008_partial_27_0779 : Poly :=
[
  term ((28774067239140492845006392159786527129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 27. -/
theorem ep_Q2_008_partial_27_0779_valid :
    mulPoly ep_Q2_008_coefficient_27_0779
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0780 : Poly :=
[
  term ((4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 780 for generator 27. -/
def ep_Q2_008_partial_27_0780 : Poly :=
[
  term ((-4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 27. -/
theorem ep_Q2_008_partial_27_0780_valid :
    mulPoly ep_Q2_008_coefficient_27_0780
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0781 : Poly :=
[
  term ((-161060648477794957929 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 781 for generator 27. -/
def ep_Q2_008_partial_27_0781 : Poly :=
[
  term ((161060648477794957929 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-161060648477794957929 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 27. -/
theorem ep_Q2_008_partial_27_0781_valid :
    mulPoly ep_Q2_008_coefficient_27_0781
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0782 : Poly :=
[
  term ((2475810713410980915192939249322364395200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 782 for generator 27. -/
def ep_Q2_008_partial_27_0782 : Poly :=
[
  term ((4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2475810713410980915192939249322364395200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 27. -/
theorem ep_Q2_008_partial_27_0782_valid :
    mulPoly ep_Q2_008_coefficient_27_0782
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0783 : Poly :=
[
  term ((-161060648477794957929 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 783 for generator 27. -/
def ep_Q2_008_partial_27_0783 : Poly :=
[
  term ((-161060648477794957929 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((161060648477794957929 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 27. -/
theorem ep_Q2_008_partial_27_0783_valid :
    mulPoly ep_Q2_008_coefficient_27_0783
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0784 : Poly :=
[
  term ((31299049682083277488741732604315109331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 784 for generator 27. -/
def ep_Q2_008_partial_27_0784 : Poly :=
[
  term ((-31299049682083277488741732604315109331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((62598099364166554977483465208630218662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 27. -/
theorem ep_Q2_008_partial_27_0784_valid :
    mulPoly ep_Q2_008_coefficient_27_0784
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0785 : Poly :=
[
  term ((15649524841041638744370866302157554665600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 785 for generator 27. -/
def ep_Q2_008_partial_27_0785 : Poly :=
[
  term ((31299049682083277488741732604315109331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15649524841041638744370866302157554665600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 27. -/
theorem ep_Q2_008_partial_27_0785_valid :
    mulPoly ep_Q2_008_coefficient_27_0785
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0786 : Poly :=
[
  term ((-2132832442297447694011137645559206128441541 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 786 for generator 27. -/
def ep_Q2_008_partial_27_0786 : Poly :=
[
  term ((2132832442297447694011137645559206128441541 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2132832442297447694011137645559206128441541 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 27. -/
theorem ep_Q2_008_partial_27_0786_valid :
    mulPoly ep_Q2_008_coefficient_27_0786
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0787 : Poly :=
[
  term ((-2405434178716883307646442020376729163185541 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 787 for generator 27. -/
def ep_Q2_008_partial_27_0787 : Poly :=
[
  term ((-2405434178716883307646442020376729163185541 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((2405434178716883307646442020376729163185541 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 27. -/
theorem ep_Q2_008_partial_27_0787_valid :
    mulPoly ep_Q2_008_coefficient_27_0787
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0788 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 788 for generator 27. -/
def ep_Q2_008_partial_27_0788 : Poly :=
[
  term ((-139222372092821066577478733701459200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 27. -/
theorem ep_Q2_008_partial_27_0788_valid :
    mulPoly ep_Q2_008_coefficient_27_0788
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0789 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 789 for generator 27. -/
def ep_Q2_008_partial_27_0789 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 27. -/
theorem ep_Q2_008_partial_27_0789_valid :
    mulPoly ep_Q2_008_coefficient_27_0789
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0790 : Poly :=
[
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 790 for generator 27. -/
def ep_Q2_008_partial_27_0790 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 27. -/
theorem ep_Q2_008_partial_27_0790_valid :
    mulPoly ep_Q2_008_coefficient_27_0790
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0791 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 791 for generator 27. -/
def ep_Q2_008_partial_27_0791 : Poly :=
[
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 27. -/
theorem ep_Q2_008_partial_27_0791_valid :
    mulPoly ep_Q2_008_coefficient_27_0791
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0792 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 792 for generator 27. -/
def ep_Q2_008_partial_27_0792 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 27. -/
theorem ep_Q2_008_partial_27_0792_valid :
    mulPoly ep_Q2_008_coefficient_27_0792
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0793 : Poly :=
[
  term ((-28473937668950038167660256105632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 793 for generator 27. -/
def ep_Q2_008_partial_27_0793 : Poly :=
[
  term ((-56947875337900076335320512211264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((28473937668950038167660256105632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 27. -/
theorem ep_Q2_008_partial_27_0793_valid :
    mulPoly ep_Q2_008_coefficient_27_0793
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0794 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 794 for generator 27. -/
def ep_Q2_008_partial_27_0794 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 27. -/
theorem ep_Q2_008_partial_27_0794_valid :
    mulPoly ep_Q2_008_coefficient_27_0794
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0795 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 795 for generator 27. -/
def ep_Q2_008_partial_27_0795 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 27. -/
theorem ep_Q2_008_partial_27_0795_valid :
    mulPoly ep_Q2_008_coefficient_27_0795
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0796 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 796 for generator 27. -/
def ep_Q2_008_partial_27_0796 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 27. -/
theorem ep_Q2_008_partial_27_0796_valid :
    mulPoly ep_Q2_008_coefficient_27_0796
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0797 : Poly :=
[
  term ((141279197114875508525497270719859200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 797 for generator 27. -/
def ep_Q2_008_partial_27_0797 : Poly :=
[
  term ((-141279197114875508525497270719859200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((282558394229751017050994541439718400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 27. -/
theorem ep_Q2_008_partial_27_0797_valid :
    mulPoly ep_Q2_008_coefficient_27_0797
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0798 : Poly :=
[
  term ((70639598557437754262748635359929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 798 for generator 27. -/
def ep_Q2_008_partial_27_0798 : Poly :=
[
  term ((141279197114875508525497270719859200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-70639598557437754262748635359929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 27. -/
theorem ep_Q2_008_partial_27_0798_valid :
    mulPoly ep_Q2_008_coefficient_27_0798
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0799 : Poly :=
[
  term ((6960295874632231552094729270265600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 799 for generator 27. -/
def ep_Q2_008_partial_27_0799 : Poly :=
[
  term ((-6960295874632231552094729270265600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((13920591749264463104189458540531200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 27. -/
theorem ep_Q2_008_partial_27_0799_valid :
    mulPoly ep_Q2_008_coefficient_27_0799
        ep_Q2_008_generator_27_0700_0799 =
      ep_Q2_008_partial_27_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0700_0799 : List Poly :=
[
  ep_Q2_008_partial_27_0700,
  ep_Q2_008_partial_27_0701,
  ep_Q2_008_partial_27_0702,
  ep_Q2_008_partial_27_0703,
  ep_Q2_008_partial_27_0704,
  ep_Q2_008_partial_27_0705,
  ep_Q2_008_partial_27_0706,
  ep_Q2_008_partial_27_0707,
  ep_Q2_008_partial_27_0708,
  ep_Q2_008_partial_27_0709,
  ep_Q2_008_partial_27_0710,
  ep_Q2_008_partial_27_0711,
  ep_Q2_008_partial_27_0712,
  ep_Q2_008_partial_27_0713,
  ep_Q2_008_partial_27_0714,
  ep_Q2_008_partial_27_0715,
  ep_Q2_008_partial_27_0716,
  ep_Q2_008_partial_27_0717,
  ep_Q2_008_partial_27_0718,
  ep_Q2_008_partial_27_0719,
  ep_Q2_008_partial_27_0720,
  ep_Q2_008_partial_27_0721,
  ep_Q2_008_partial_27_0722,
  ep_Q2_008_partial_27_0723,
  ep_Q2_008_partial_27_0724,
  ep_Q2_008_partial_27_0725,
  ep_Q2_008_partial_27_0726,
  ep_Q2_008_partial_27_0727,
  ep_Q2_008_partial_27_0728,
  ep_Q2_008_partial_27_0729,
  ep_Q2_008_partial_27_0730,
  ep_Q2_008_partial_27_0731,
  ep_Q2_008_partial_27_0732,
  ep_Q2_008_partial_27_0733,
  ep_Q2_008_partial_27_0734,
  ep_Q2_008_partial_27_0735,
  ep_Q2_008_partial_27_0736,
  ep_Q2_008_partial_27_0737,
  ep_Q2_008_partial_27_0738,
  ep_Q2_008_partial_27_0739,
  ep_Q2_008_partial_27_0740,
  ep_Q2_008_partial_27_0741,
  ep_Q2_008_partial_27_0742,
  ep_Q2_008_partial_27_0743,
  ep_Q2_008_partial_27_0744,
  ep_Q2_008_partial_27_0745,
  ep_Q2_008_partial_27_0746,
  ep_Q2_008_partial_27_0747,
  ep_Q2_008_partial_27_0748,
  ep_Q2_008_partial_27_0749,
  ep_Q2_008_partial_27_0750,
  ep_Q2_008_partial_27_0751,
  ep_Q2_008_partial_27_0752,
  ep_Q2_008_partial_27_0753,
  ep_Q2_008_partial_27_0754,
  ep_Q2_008_partial_27_0755,
  ep_Q2_008_partial_27_0756,
  ep_Q2_008_partial_27_0757,
  ep_Q2_008_partial_27_0758,
  ep_Q2_008_partial_27_0759,
  ep_Q2_008_partial_27_0760,
  ep_Q2_008_partial_27_0761,
  ep_Q2_008_partial_27_0762,
  ep_Q2_008_partial_27_0763,
  ep_Q2_008_partial_27_0764,
  ep_Q2_008_partial_27_0765,
  ep_Q2_008_partial_27_0766,
  ep_Q2_008_partial_27_0767,
  ep_Q2_008_partial_27_0768,
  ep_Q2_008_partial_27_0769,
  ep_Q2_008_partial_27_0770,
  ep_Q2_008_partial_27_0771,
  ep_Q2_008_partial_27_0772,
  ep_Q2_008_partial_27_0773,
  ep_Q2_008_partial_27_0774,
  ep_Q2_008_partial_27_0775,
  ep_Q2_008_partial_27_0776,
  ep_Q2_008_partial_27_0777,
  ep_Q2_008_partial_27_0778,
  ep_Q2_008_partial_27_0779,
  ep_Q2_008_partial_27_0780,
  ep_Q2_008_partial_27_0781,
  ep_Q2_008_partial_27_0782,
  ep_Q2_008_partial_27_0783,
  ep_Q2_008_partial_27_0784,
  ep_Q2_008_partial_27_0785,
  ep_Q2_008_partial_27_0786,
  ep_Q2_008_partial_27_0787,
  ep_Q2_008_partial_27_0788,
  ep_Q2_008_partial_27_0789,
  ep_Q2_008_partial_27_0790,
  ep_Q2_008_partial_27_0791,
  ep_Q2_008_partial_27_0792,
  ep_Q2_008_partial_27_0793,
  ep_Q2_008_partial_27_0794,
  ep_Q2_008_partial_27_0795,
  ep_Q2_008_partial_27_0796,
  ep_Q2_008_partial_27_0797,
  ep_Q2_008_partial_27_0798,
  ep_Q2_008_partial_27_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0700_0799 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((13398880981066875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1028739732199966598720537975760493340956521 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1028739732199966598720537975760493340956521 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((7995170523765116349 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((1203246973189179433531786288486998954033321 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1203246973189179433531786288486998954033321 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-355465127072696518089328973552017488703224 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((177786021200264962371581428800161027343612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2554572896850671361 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((575148859012526117683360950889545600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1583814882040130721 : Rat) / 191160400997014168) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((47390387520221317401 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 2), (16, 1)],
  term ((177703239287581861944221297061977306979612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44425809821895465486055324265494326744903 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((6933840720023250837 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6933840720023250837 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((29523847013081470479 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-29523847013081470479 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((710757950493876271878702392832499200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-145223813538990100101442639532601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((123380331804771926613485776397193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-482300037835130327346262337993481600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((42986895024566180552879053307462400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-10746723756141545138219763326865600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((187532765152567200 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1736494975146267000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20066164157245752000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((15821398662443766000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3955349665610941500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4636469046380842001388421276367519802211200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2321094160131413589427571596042246877860800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((16675937998087284000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4908845061293746365060287226925842432000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2191777407956329875 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((7337330019522118125 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((80158444442632382490409871752674188860800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20039611110658095622602467938168547215200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((45263260280522628000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11315815070130657000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-865588729083620625 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((8060346295340625 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-887679532120842718797035316722885395200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((15566498222321469819 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((443839766060421359398517658361442697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15566498222321469819 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((31935456362629892452450810936264943961600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((659753529619240106629655864250626713971561 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-630979462380099613784649472090840186841961 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((28774067239140492845006392159786527129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-161060648477794957929 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2475810713410980915192939249322364395200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((161060648477794957929 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((62598099364166554977483465208630218662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-15649524841041638744370866302157554665600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2132832442297447694011137645559206128441541 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((2405434178716883307646442020376729163185541 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-139222372092821066577478733701459200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (14, 2), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-56947875337900076335320512211264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((28473937668950038167660256105632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((282558394229751017050994541439718400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-70639598557437754262748635359929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6960295874632231552094729270265600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((13920591749264463104189458540531200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 700 through 799. -/
theorem ep_Q2_008_block_27_0700_0799_valid :
    checkProductSumEq ep_Q2_008_partials_27_0700_0799
      ep_Q2_008_block_27_0700_0799 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
