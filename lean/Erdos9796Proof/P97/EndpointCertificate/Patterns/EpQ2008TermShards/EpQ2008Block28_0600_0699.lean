/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 28:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_28_0600_0699 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0600 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 28. -/
def ep_Q2_008_partial_28_0600 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 28. -/
theorem ep_Q2_008_partial_28_0600_valid :
    mulPoly ep_Q2_008_coefficient_28_0600
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0601 : Poly :=
[
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 601 for generator 28. -/
def ep_Q2_008_partial_28_0601 : Poly :=
[
  term ((3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 28. -/
theorem ep_Q2_008_partial_28_0601_valid :
    mulPoly ep_Q2_008_coefficient_28_0601
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0602 : Poly :=
[
  term ((953547560855834107686298423963586449452189 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 602 for generator 28. -/
def ep_Q2_008_partial_28_0602 : Poly :=
[
  term ((1907095121711668215372596847927172898904378 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-953547560855834107686298423963586449452189 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1907095121711668215372596847927172898904378 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-953547560855834107686298423963586449452189 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 28. -/
theorem ep_Q2_008_partial_28_0602_valid :
    mulPoly ep_Q2_008_coefficient_28_0602
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0603 : Poly :=
[
  term ((-1130535622777007419027099491517621615251321 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 603 for generator 28. -/
def ep_Q2_008_partial_28_0603 : Poly :=
[
  term ((-1130535622777007419027099491517621615251321 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1130535622777007419027099491517621615251321 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1130535622777007419027099491517621615251321 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((1130535622777007419027099491517621615251321 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 28. -/
theorem ep_Q2_008_partial_28_0603_valid :
    mulPoly ep_Q2_008_coefficient_28_0603
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0604 : Poly :=
[
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 604 for generator 28. -/
def ep_Q2_008_partial_28_0604 : Poly :=
[
  term ((41889972037375162185 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((41889972037375162185 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(3, 2), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 28. -/
theorem ep_Q2_008_partial_28_0604_valid :
    mulPoly ep_Q2_008_coefficient_28_0604
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0605 : Poly :=
[
  term ((2737783666446414751818906762777270174841623 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 605 for generator 28. -/
def ep_Q2_008_partial_28_0605 : Poly :=
[
  term ((2737783666446414751818906762777270174841623 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2737783666446414751818906762777270174841623 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2737783666446414751818906762777270174841623 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2737783666446414751818906762777270174841623 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 28. -/
theorem ep_Q2_008_partial_28_0605_valid :
    mulPoly ep_Q2_008_coefficient_28_0605
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0606 : Poly :=
[
  term ((-298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 606 for generator 28. -/
def ep_Q2_008_partial_28_0606 : Poly :=
[
  term ((-597162407119350232432664644142267520000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-597162407119350232432664644142267520000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 28. -/
theorem ep_Q2_008_partial_28_0606_valid :
    mulPoly ep_Q2_008_coefficient_28_0606
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0607 : Poly :=
[
  term ((50702951438540015305459308333614427225600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 607 for generator 28. -/
def ep_Q2_008_partial_28_0607 : Poly :=
[
  term ((101405902877080030610918616667228854451200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-50702951438540015305459308333614427225600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((101405902877080030610918616667228854451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-50702951438540015305459308333614427225600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 28. -/
theorem ep_Q2_008_partial_28_0607_valid :
    mulPoly ep_Q2_008_coefficient_28_0607
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0608 : Poly :=
[
  term ((-4821165600984702195 : Rat) / 692956453614176359) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 608 for generator 28. -/
def ep_Q2_008_partial_28_0608 : Poly :=
[
  term ((-9642331201969404390 : Rat) / 692956453614176359) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((-9642331201969404390 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(3, 2), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 28. -/
theorem ep_Q2_008_partial_28_0608_valid :
    mulPoly ep_Q2_008_coefficient_28_0608
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0609 : Poly :=
[
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 28. -/
def ep_Q2_008_partial_28_0609 : Poly :=
[
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 28. -/
theorem ep_Q2_008_partial_28_0609_valid :
    mulPoly ep_Q2_008_coefficient_28_0609
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0610 : Poly :=
[
  term ((-399694431279621624234344027399011687679657 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 610 for generator 28. -/
def ep_Q2_008_partial_28_0610 : Poly :=
[
  term ((-399694431279621624234344027399011687679657 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((399694431279621624234344027399011687679657 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-399694431279621624234344027399011687679657 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((399694431279621624234344027399011687679657 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 28. -/
theorem ep_Q2_008_partial_28_0610_valid :
    mulPoly ep_Q2_008_coefficient_28_0610
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0611 : Poly :=
[
  term ((-3000794601597693705 : Rat) / 1385912907228352718) [(6, 1), (16, 1)]
]

/-- Partial product 611 for generator 28. -/
def ep_Q2_008_partial_28_0611 : Poly :=
[
  term ((-3000794601597693705 : Rat) / 692956453614176359) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((3000794601597693705 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (16, 1)],
  term ((-3000794601597693705 : Rat) / 692956453614176359) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3000794601597693705 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 28. -/
theorem ep_Q2_008_partial_28_0611_valid :
    mulPoly ep_Q2_008_coefficient_28_0611
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0612 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 28. -/
def ep_Q2_008_partial_28_0612 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 28. -/
theorem ep_Q2_008_partial_28_0612_valid :
    mulPoly ep_Q2_008_coefficient_28_0612
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0613 : Poly :=
[
  term ((8948932486457965944387489371521996342200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 28. -/
def ep_Q2_008_partial_28_0613 : Poly :=
[
  term ((17897864972915931888774978743043992684400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8948932486457965944387489371521996342200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((17897864972915931888774978743043992684400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8948932486457965944387489371521996342200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 28. -/
theorem ep_Q2_008_partial_28_0613_valid :
    mulPoly ep_Q2_008_coefficient_28_0613
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0614 : Poly :=
[
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (15, 2), (16, 1)]
]

/-- Partial product 614 for generator 28. -/
def ep_Q2_008_partial_28_0614 : Poly :=
[
  term ((-29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (15, 2), (16, 1)],
  term ((-29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 28. -/
theorem ep_Q2_008_partial_28_0614_valid :
    mulPoly ep_Q2_008_coefficient_28_0614
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0615 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(6, 2), (16, 1)]
]

/-- Partial product 615 for generator 28. -/
def ep_Q2_008_partial_28_0615 : Poly :=
[
  term ((692576845212253500 : Rat) / 692956453614176359) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(2, 2), (6, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(3, 2), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 28. -/
theorem ep_Q2_008_partial_28_0615_valid :
    mulPoly ep_Q2_008_coefficient_28_0615
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0616 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 616 for generator 28. -/
def ep_Q2_008_partial_28_0616 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 28. -/
theorem ep_Q2_008_partial_28_0616_valid :
    mulPoly ep_Q2_008_coefficient_28_0616
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0617 : Poly :=
[
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 617 for generator 28. -/
def ep_Q2_008_partial_28_0617 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 28. -/
theorem ep_Q2_008_partial_28_0617_valid :
    mulPoly ep_Q2_008_coefficient_28_0617
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0618 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 618 for generator 28. -/
def ep_Q2_008_partial_28_0618 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 28. -/
theorem ep_Q2_008_partial_28_0618_valid :
    mulPoly ep_Q2_008_coefficient_28_0618
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0619 : Poly :=
[
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 619 for generator 28. -/
def ep_Q2_008_partial_28_0619 : Poly :=
[
  term ((-201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 28. -/
theorem ep_Q2_008_partial_28_0619_valid :
    mulPoly ep_Q2_008_coefficient_28_0619
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0620 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 620 for generator 28. -/
def ep_Q2_008_partial_28_0620 : Poly :=
[
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 28. -/
theorem ep_Q2_008_partial_28_0620_valid :
    mulPoly ep_Q2_008_coefficient_28_0620
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0621 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 28. -/
def ep_Q2_008_partial_28_0621 : Poly :=
[
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (8, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 28. -/
theorem ep_Q2_008_partial_28_0621_valid :
    mulPoly ep_Q2_008_coefficient_28_0621
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0622 : Poly :=
[
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 28. -/
def ep_Q2_008_partial_28_0622 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 28. -/
theorem ep_Q2_008_partial_28_0622_valid :
    mulPoly ep_Q2_008_coefficient_28_0622
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0623 : Poly :=
[
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 28. -/
def ep_Q2_008_partial_28_0623 : Poly :=
[
  term ((-46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 28. -/
theorem ep_Q2_008_partial_28_0623_valid :
    mulPoly ep_Q2_008_coefficient_28_0623
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0624 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 624 for generator 28. -/
def ep_Q2_008_partial_28_0624 : Poly :=
[
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 28. -/
theorem ep_Q2_008_partial_28_0624_valid :
    mulPoly ep_Q2_008_coefficient_28_0624
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0625 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 28. -/
def ep_Q2_008_partial_28_0625 : Poly :=
[
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 28. -/
theorem ep_Q2_008_partial_28_0625_valid :
    mulPoly ep_Q2_008_coefficient_28_0625
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0626 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 626 for generator 28. -/
def ep_Q2_008_partial_28_0626 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 28. -/
theorem ep_Q2_008_partial_28_0626_valid :
    mulPoly ep_Q2_008_coefficient_28_0626
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0627 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 28. -/
def ep_Q2_008_partial_28_0627 : Poly :=
[
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 28. -/
theorem ep_Q2_008_partial_28_0627_valid :
    mulPoly ep_Q2_008_coefficient_28_0627
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0628 : Poly :=
[
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 628 for generator 28. -/
def ep_Q2_008_partial_28_0628 : Poly :=
[
  term ((57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 28. -/
theorem ep_Q2_008_partial_28_0628_valid :
    mulPoly ep_Q2_008_coefficient_28_0628
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0629 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 629 for generator 28. -/
def ep_Q2_008_partial_28_0629 : Poly :=
[
  term ((187532765152567200 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((187532765152567200 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 28. -/
theorem ep_Q2_008_partial_28_0629_valid :
    mulPoly ep_Q2_008_coefficient_28_0629
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0630 : Poly :=
[
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 28. -/
def ep_Q2_008_partial_28_0630 : Poly :=
[
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 28. -/
theorem ep_Q2_008_partial_28_0630_valid :
    mulPoly ep_Q2_008_coefficient_28_0630
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0631 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 631 for generator 28. -/
def ep_Q2_008_partial_28_0631 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 28. -/
theorem ep_Q2_008_partial_28_0631_valid :
    mulPoly ep_Q2_008_coefficient_28_0631
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0632 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 28. -/
def ep_Q2_008_partial_28_0632 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 28. -/
theorem ep_Q2_008_partial_28_0632_valid :
    mulPoly ep_Q2_008_coefficient_28_0632
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0633 : Poly :=
[
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 633 for generator 28. -/
def ep_Q2_008_partial_28_0633 : Poly :=
[
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 28. -/
theorem ep_Q2_008_partial_28_0633_valid :
    mulPoly ep_Q2_008_coefficient_28_0633
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0634 : Poly :=
[
  term ((306771294787898013 : Rat) / 95580200498507084) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 634 for generator 28. -/
def ep_Q2_008_partial_28_0634 : Poly :=
[
  term ((306771294787898013 : Rat) / 47790100249253542) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-306771294787898013 : Rat) / 95580200498507084) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((306771294787898013 : Rat) / 47790100249253542) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-306771294787898013 : Rat) / 95580200498507084) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 28. -/
theorem ep_Q2_008_partial_28_0634_valid :
    mulPoly ep_Q2_008_coefficient_28_0634
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0635 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 28. -/
def ep_Q2_008_partial_28_0635 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 28. -/
theorem ep_Q2_008_partial_28_0635_valid :
    mulPoly ep_Q2_008_coefficient_28_0635
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0636 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 28. -/
def ep_Q2_008_partial_28_0636 : Poly :=
[
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 28. -/
theorem ep_Q2_008_partial_28_0636_valid :
    mulPoly ep_Q2_008_coefficient_28_0636
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0637 : Poly :=
[
  term ((-2068124108485156447578024358043359151083200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 637 for generator 28. -/
def ep_Q2_008_partial_28_0637 : Poly :=
[
  term ((-4136248216970312895156048716086718302166400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2068124108485156447578024358043359151083200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4136248216970312895156048716086718302166400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2068124108485156447578024358043359151083200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 28. -/
theorem ep_Q2_008_partial_28_0637_valid :
    mulPoly ep_Q2_008_coefficient_28_0637
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0638 : Poly :=
[
  term ((22801202324208861183 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 638 for generator 28. -/
def ep_Q2_008_partial_28_0638 : Poly :=
[
  term ((22801202324208861183 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22801202324208861183 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((22801202324208861183 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22801202324208861183 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 28. -/
theorem ep_Q2_008_partial_28_0638_valid :
    mulPoly ep_Q2_008_coefficient_28_0638
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0639 : Poly :=
[
  term ((22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 28. -/
def ep_Q2_008_partial_28_0639 : Poly :=
[
  term ((22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 28. -/
theorem ep_Q2_008_partial_28_0639_valid :
    mulPoly ep_Q2_008_coefficient_28_0639
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0640 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 640 for generator 28. -/
def ep_Q2_008_partial_28_0640 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 28. -/
theorem ep_Q2_008_partial_28_0640_valid :
    mulPoly ep_Q2_008_coefficient_28_0640
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0641 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 641 for generator 28. -/
def ep_Q2_008_partial_28_0641 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 28. -/
theorem ep_Q2_008_partial_28_0641_valid :
    mulPoly ep_Q2_008_coefficient_28_0641
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0642 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 28. -/
def ep_Q2_008_partial_28_0642 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 28. -/
theorem ep_Q2_008_partial_28_0642_valid :
    mulPoly ep_Q2_008_coefficient_28_0642
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0643 : Poly :=
[
  term ((3556028236266770880291348090390618827150871 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 28. -/
def ep_Q2_008_partial_28_0643 : Poly :=
[
  term ((3556028236266770880291348090390618827150871 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3556028236266770880291348090390618827150871 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3556028236266770880291348090390618827150871 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3556028236266770880291348090390618827150871 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 28. -/
theorem ep_Q2_008_partial_28_0643_valid :
    mulPoly ep_Q2_008_coefficient_28_0643
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0644 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 644 for generator 28. -/
def ep_Q2_008_partial_28_0644 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 28. -/
theorem ep_Q2_008_partial_28_0644_valid :
    mulPoly ep_Q2_008_coefficient_28_0644
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0645 : Poly :=
[
  term ((-2369997271055410233780196315133072727983703 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 28. -/
def ep_Q2_008_partial_28_0645 : Poly :=
[
  term ((-2369997271055410233780196315133072727983703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2369997271055410233780196315133072727983703 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2369997271055410233780196315133072727983703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2369997271055410233780196315133072727983703 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 28. -/
theorem ep_Q2_008_partial_28_0645_valid :
    mulPoly ep_Q2_008_coefficient_28_0645
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0646 : Poly :=
[
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 646 for generator 28. -/
def ep_Q2_008_partial_28_0646 : Poly :=
[
  term ((-1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 28. -/
theorem ep_Q2_008_partial_28_0646_valid :
    mulPoly ep_Q2_008_coefficient_28_0646
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0647 : Poly :=
[
  term ((3669736757946079131 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 647 for generator 28. -/
def ep_Q2_008_partial_28_0647 : Poly :=
[
  term ((7339473515892158262 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3669736757946079131 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((7339473515892158262 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3669736757946079131 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 28. -/
theorem ep_Q2_008_partial_28_0647_valid :
    mulPoly ep_Q2_008_coefficient_28_0647
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0648 : Poly :=
[
  term ((372312268861031552084156108417948659200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 648 for generator 28. -/
def ep_Q2_008_partial_28_0648 : Poly :=
[
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-372312268861031552084156108417948659200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-372312268861031552084156108417948659200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 28. -/
theorem ep_Q2_008_partial_28_0648_valid :
    mulPoly ep_Q2_008_coefficient_28_0648
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0649 : Poly :=
[
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 649 for generator 28. -/
def ep_Q2_008_partial_28_0649 : Poly :=
[
  term ((-2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 28. -/
theorem ep_Q2_008_partial_28_0649_valid :
    mulPoly ep_Q2_008_coefficient_28_0649
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0650 : Poly :=
[
  term ((-5878049765099575680 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 650 for generator 28. -/
def ep_Q2_008_partial_28_0650 : Poly :=
[
  term ((-11756099530199151360 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5878049765099575680 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-11756099530199151360 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5878049765099575680 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 28. -/
theorem ep_Q2_008_partial_28_0650_valid :
    mulPoly ep_Q2_008_coefficient_28_0650
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0651 : Poly :=
[
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 28. -/
def ep_Q2_008_partial_28_0651 : Poly :=
[
  term ((398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 28. -/
theorem ep_Q2_008_partial_28_0651_valid :
    mulPoly ep_Q2_008_coefficient_28_0651
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0652 : Poly :=
[
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 652 for generator 28. -/
def ep_Q2_008_partial_28_0652 : Poly :=
[
  term ((9894046412742829623 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((9894046412742829623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 28. -/
theorem ep_Q2_008_partial_28_0652_valid :
    mulPoly ep_Q2_008_coefficient_28_0652
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0653 : Poly :=
[
  term ((1546019229135016062895828805465763034094400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 653 for generator 28. -/
def ep_Q2_008_partial_28_0653 : Poly :=
[
  term ((3092038458270032125791657610931526068188800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1546019229135016062895828805465763034094400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3092038458270032125791657610931526068188800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1546019229135016062895828805465763034094400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 28. -/
theorem ep_Q2_008_partial_28_0653_valid :
    mulPoly ep_Q2_008_coefficient_28_0653
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0654 : Poly :=
[
  term ((-8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 654 for generator 28. -/
def ep_Q2_008_partial_28_0654 : Poly :=
[
  term ((-16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 28. -/
theorem ep_Q2_008_partial_28_0654_valid :
    mulPoly ep_Q2_008_coefficient_28_0654
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0655 : Poly :=
[
  term ((-5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 655 for generator 28. -/
def ep_Q2_008_partial_28_0655 : Poly :=
[
  term ((-11538806012559469797211250117643842674502400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11538806012559469797211250117643842674502400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 28. -/
theorem ep_Q2_008_partial_28_0655_valid :
    mulPoly ep_Q2_008_coefficient_28_0655
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0656 : Poly :=
[
  term ((-13102522712782866000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 656 for generator 28. -/
def ep_Q2_008_partial_28_0656 : Poly :=
[
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 28. -/
theorem ep_Q2_008_partial_28_0656_valid :
    mulPoly ep_Q2_008_coefficient_28_0656
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0657 : Poly :=
[
  term ((-1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 657 for generator 28. -/
def ep_Q2_008_partial_28_0657 : Poly :=
[
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 28. -/
theorem ep_Q2_008_partial_28_0657_valid :
    mulPoly ep_Q2_008_coefficient_28_0657
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0658 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 658 for generator 28. -/
def ep_Q2_008_partial_28_0658 : Poly :=
[
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 28. -/
theorem ep_Q2_008_partial_28_0658_valid :
    mulPoly ep_Q2_008_coefficient_28_0658
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0659 : Poly :=
[
  term ((9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 659 for generator 28. -/
def ep_Q2_008_partial_28_0659 : Poly :=
[
  term ((18288725419798293897468857870080000557750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((18288725419798293897468857870080000557750 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 28. -/
theorem ep_Q2_008_partial_28_0659_valid :
    mulPoly ep_Q2_008_coefficient_28_0659
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0660 : Poly :=
[
  term ((-4565634877182441879 : Rat) / 5543651628913410872) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 660 for generator 28. -/
def ep_Q2_008_partial_28_0660 : Poly :=
[
  term ((-4565634877182441879 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((4565634877182441879 : Rat) / 5543651628913410872) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-4565634877182441879 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4565634877182441879 : Rat) / 5543651628913410872) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 28. -/
theorem ep_Q2_008_partial_28_0660_valid :
    mulPoly ep_Q2_008_coefficient_28_0660
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0661 : Poly :=
[
  term ((-5748970768111201481407041911822920867200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 661 for generator 28. -/
def ep_Q2_008_partial_28_0661 : Poly :=
[
  term ((-11497941536222402962814083823645841734400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5748970768111201481407041911822920867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11497941536222402962814083823645841734400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((5748970768111201481407041911822920867200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 28. -/
theorem ep_Q2_008_partial_28_0661_valid :
    mulPoly ep_Q2_008_coefficient_28_0661
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0662 : Poly :=
[
  term ((-52360161454792419045 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 662 for generator 28. -/
def ep_Q2_008_partial_28_0662 : Poly :=
[
  term ((-52360161454792419045 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((52360161454792419045 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-52360161454792419045 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((52360161454792419045 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 28. -/
theorem ep_Q2_008_partial_28_0662_valid :
    mulPoly ep_Q2_008_coefficient_28_0662
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0663 : Poly :=
[
  term ((-617896786923448162366477975033065647352642 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 28. -/
def ep_Q2_008_partial_28_0663 : Poly :=
[
  term ((-1235793573846896324732955950066131294705284 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((617896786923448162366477975033065647352642 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1235793573846896324732955950066131294705284 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((617896786923448162366477975033065647352642 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 28. -/
theorem ep_Q2_008_partial_28_0663_valid :
    mulPoly ep_Q2_008_coefficient_28_0663
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0664 : Poly :=
[
  term ((-103228592390875389908577701811305088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 664 for generator 28. -/
def ep_Q2_008_partial_28_0664 : Poly :=
[
  term ((-206457184781750779817155403622610176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((103228592390875389908577701811305088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-206457184781750779817155403622610176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((103228592390875389908577701811305088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 28. -/
theorem ep_Q2_008_partial_28_0664_valid :
    mulPoly ep_Q2_008_coefficient_28_0664
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0665 : Poly :=
[
  term ((782134374110088934845571486453610159281599 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 665 for generator 28. -/
def ep_Q2_008_partial_28_0665 : Poly :=
[
  term ((1564268748220177869691142972907220318563198 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-782134374110088934845571486453610159281599 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1564268748220177869691142972907220318563198 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-782134374110088934845571486453610159281599 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 28. -/
theorem ep_Q2_008_partial_28_0665_valid :
    mulPoly ep_Q2_008_coefficient_28_0665
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0666 : Poly :=
[
  term ((141083985721873250580612602297385600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 666 for generator 28. -/
def ep_Q2_008_partial_28_0666 : Poly :=
[
  term ((282167971443746501161225204594771200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-141083985721873250580612602297385600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((282167971443746501161225204594771200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-141083985721873250580612602297385600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 28. -/
theorem ep_Q2_008_partial_28_0666_valid :
    mulPoly ep_Q2_008_coefficient_28_0666
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0667 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 667 for generator 28. -/
def ep_Q2_008_partial_28_0667 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 28. -/
theorem ep_Q2_008_partial_28_0667_valid :
    mulPoly ep_Q2_008_coefficient_28_0667
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0668 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 668 for generator 28. -/
def ep_Q2_008_partial_28_0668 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 28. -/
theorem ep_Q2_008_partial_28_0668_valid :
    mulPoly ep_Q2_008_coefficient_28_0668
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0669 : Poly :=
[
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 28. -/
def ep_Q2_008_partial_28_0669 : Poly :=
[
  term ((14389928409317076905567890827930124579200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((14389928409317076905567890827930124579200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 28. -/
theorem ep_Q2_008_partial_28_0669_valid :
    mulPoly ep_Q2_008_coefficient_28_0669
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0670 : Poly :=
[
  term ((2696580468174137680582935037982294014379313 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 670 for generator 28. -/
def ep_Q2_008_partial_28_0670 : Poly :=
[
  term ((2696580468174137680582935037982294014379313 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2696580468174137680582935037982294014379313 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2696580468174137680582935037982294014379313 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2696580468174137680582935037982294014379313 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 28. -/
theorem ep_Q2_008_partial_28_0670_valid :
    mulPoly ep_Q2_008_coefficient_28_0670
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0671 : Poly :=
[
  term ((280311804159153982317 : Rat) / 11087303257826821744) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 671 for generator 28. -/
def ep_Q2_008_partial_28_0671 : Poly :=
[
  term ((280311804159153982317 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-280311804159153982317 : Rat) / 11087303257826821744) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((280311804159153982317 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280311804159153982317 : Rat) / 11087303257826821744) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 28. -/
theorem ep_Q2_008_partial_28_0671_valid :
    mulPoly ep_Q2_008_coefficient_28_0671
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0672 : Poly :=
[
  term ((-1131580323467343807416598964597672541349375 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 672 for generator 28. -/
def ep_Q2_008_partial_28_0672 : Poly :=
[
  term ((-1131580323467343807416598964597672541349375 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1131580323467343807416598964597672541349375 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1131580323467343807416598964597672541349375 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1131580323467343807416598964597672541349375 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 28. -/
theorem ep_Q2_008_partial_28_0672_valid :
    mulPoly ep_Q2_008_coefficient_28_0672
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0673 : Poly :=
[
  term ((-69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 673 for generator 28. -/
def ep_Q2_008_partial_28_0673 : Poly :=
[
  term ((-138716461057548294762761350956851556710400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-138716461057548294762761350956851556710400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 28. -/
theorem ep_Q2_008_partial_28_0673_valid :
    mulPoly ep_Q2_008_coefficient_28_0673
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0674 : Poly :=
[
  term ((-92168386063281598132658662331522400000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 674 for generator 28. -/
def ep_Q2_008_partial_28_0674 : Poly :=
[
  term ((-184336772126563196265317324663044800000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((92168386063281598132658662331522400000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-184336772126563196265317324663044800000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((92168386063281598132658662331522400000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 28. -/
theorem ep_Q2_008_partial_28_0674_valid :
    mulPoly ep_Q2_008_coefficient_28_0674
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0675 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 675 for generator 28. -/
def ep_Q2_008_partial_28_0675 : Poly :=
[
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (13, 3), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 28. -/
theorem ep_Q2_008_partial_28_0675_valid :
    mulPoly ep_Q2_008_coefficient_28_0675
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0676 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 28. -/
def ep_Q2_008_partial_28_0676 : Poly :=
[
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 28. -/
theorem ep_Q2_008_partial_28_0676_valid :
    mulPoly ep_Q2_008_coefficient_28_0676
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0677 : Poly :=
[
  term ((-2960359691404068796447144061156951616039127 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 28. -/
def ep_Q2_008_partial_28_0677 : Poly :=
[
  term ((-2960359691404068796447144061156951616039127 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2960359691404068796447144061156951616039127 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2960359691404068796447144061156951616039127 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((2960359691404068796447144061156951616039127 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 28. -/
theorem ep_Q2_008_partial_28_0677_valid :
    mulPoly ep_Q2_008_coefficient_28_0677
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0678 : Poly :=
[
  term ((40394717370712573285438893579446137766400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 678 for generator 28. -/
def ep_Q2_008_partial_28_0678 : Poly :=
[
  term ((80789434741425146570877787158892275532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-40394717370712573285438893579446137766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((80789434741425146570877787158892275532800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-40394717370712573285438893579446137766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 28. -/
theorem ep_Q2_008_partial_28_0678_valid :
    mulPoly ep_Q2_008_coefficient_28_0678
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0679 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 679 for generator 28. -/
def ep_Q2_008_partial_28_0679 : Poly :=
[
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 28. -/
theorem ep_Q2_008_partial_28_0679_valid :
    mulPoly ep_Q2_008_coefficient_28_0679
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0680 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 28. -/
def ep_Q2_008_partial_28_0680 : Poly :=
[
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 28. -/
theorem ep_Q2_008_partial_28_0680_valid :
    mulPoly ep_Q2_008_coefficient_28_0680
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0681 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 681 for generator 28. -/
def ep_Q2_008_partial_28_0681 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 28. -/
theorem ep_Q2_008_partial_28_0681_valid :
    mulPoly ep_Q2_008_coefficient_28_0681
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0682 : Poly :=
[
  term ((2066870285405646046114965399369625052404800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 682 for generator 28. -/
def ep_Q2_008_partial_28_0682 : Poly :=
[
  term ((4133740570811292092229930798739250104809600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2066870285405646046114965399369625052404800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4133740570811292092229930798739250104809600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2066870285405646046114965399369625052404800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 28. -/
theorem ep_Q2_008_partial_28_0682_valid :
    mulPoly ep_Q2_008_coefficient_28_0682
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0683 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 683 for generator 28. -/
def ep_Q2_008_partial_28_0683 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 28. -/
theorem ep_Q2_008_partial_28_0683_valid :
    mulPoly ep_Q2_008_coefficient_28_0683
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0684 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 684 for generator 28. -/
def ep_Q2_008_partial_28_0684 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 28. -/
theorem ep_Q2_008_partial_28_0684_valid :
    mulPoly ep_Q2_008_coefficient_28_0684
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0685 : Poly :=
[
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 685 for generator 28. -/
def ep_Q2_008_partial_28_0685 : Poly :=
[
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 28. -/
theorem ep_Q2_008_partial_28_0685_valid :
    mulPoly ep_Q2_008_coefficient_28_0685
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0686 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 686 for generator 28. -/
def ep_Q2_008_partial_28_0686 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (15, 3), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 28. -/
theorem ep_Q2_008_partial_28_0686_valid :
    mulPoly ep_Q2_008_coefficient_28_0686
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0687 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 687 for generator 28. -/
def ep_Q2_008_partial_28_0687 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 28. -/
theorem ep_Q2_008_partial_28_0687_valid :
    mulPoly ep_Q2_008_coefficient_28_0687
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0688 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 688 for generator 28. -/
def ep_Q2_008_partial_28_0688 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 28. -/
theorem ep_Q2_008_partial_28_0688_valid :
    mulPoly ep_Q2_008_coefficient_28_0688
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0689 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 689 for generator 28. -/
def ep_Q2_008_partial_28_0689 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 28. -/
theorem ep_Q2_008_partial_28_0689_valid :
    mulPoly ep_Q2_008_coefficient_28_0689
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0690 : Poly :=
[
  term ((-144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 28. -/
def ep_Q2_008_partial_28_0690 : Poly :=
[
  term ((-289747558634110033779850606101849600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-289747558634110033779850606101849600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 28. -/
theorem ep_Q2_008_partial_28_0690_valid :
    mulPoly ep_Q2_008_coefficient_28_0690
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0691 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 691 for generator 28. -/
def ep_Q2_008_partial_28_0691 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 28. -/
theorem ep_Q2_008_partial_28_0691_valid :
    mulPoly ep_Q2_008_coefficient_28_0691
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0692 : Poly :=
[
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 692 for generator 28. -/
def ep_Q2_008_partial_28_0692 : Poly :=
[
  term ((16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 28. -/
theorem ep_Q2_008_partial_28_0692_valid :
    mulPoly ep_Q2_008_coefficient_28_0692
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0693 : Poly :=
[
  term ((47645537137392240000 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 693 for generator 28. -/
def ep_Q2_008_partial_28_0693 : Poly :=
[
  term ((95291074274784480000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((95291074274784480000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(3, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 28. -/
theorem ep_Q2_008_partial_28_0693_valid :
    mulPoly ep_Q2_008_coefficient_28_0693
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0694 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 694 for generator 28. -/
def ep_Q2_008_partial_28_0694 : Poly :=
[
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 28. -/
theorem ep_Q2_008_partial_28_0694_valid :
    mulPoly ep_Q2_008_coefficient_28_0694
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0695 : Poly :=
[
  term ((-3150357271167392811221177239993293415425 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 695 for generator 28. -/
def ep_Q2_008_partial_28_0695 : Poly :=
[
  term ((-6300714542334785622442354479986586830850 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3150357271167392811221177239993293415425 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6300714542334785622442354479986586830850 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((3150357271167392811221177239993293415425 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 28. -/
theorem ep_Q2_008_partial_28_0695_valid :
    mulPoly ep_Q2_008_coefficient_28_0695
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0696 : Poly :=
[
  term ((-88924011397546254053311302978274812748206 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 696 for generator 28. -/
def ep_Q2_008_partial_28_0696 : Poly :=
[
  term ((-177848022795092508106622605956549625496412 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88924011397546254053311302978274812748206 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-177848022795092508106622605956549625496412 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((88924011397546254053311302978274812748206 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 28. -/
theorem ep_Q2_008_partial_28_0696_valid :
    mulPoly ep_Q2_008_coefficient_28_0696
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0697 : Poly :=
[
  term ((-17589973572100560788740195544373580800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 697 for generator 28. -/
def ep_Q2_008_partial_28_0697 : Poly :=
[
  term ((-35179947144201121577480391088747161600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((17589973572100560788740195544373580800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-35179947144201121577480391088747161600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((17589973572100560788740195544373580800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 28. -/
theorem ep_Q2_008_partial_28_0697_valid :
    mulPoly ep_Q2_008_coefficient_28_0697
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0698 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 698 for generator 28. -/
def ep_Q2_008_partial_28_0698 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 28. -/
theorem ep_Q2_008_partial_28_0698_valid :
    mulPoly ep_Q2_008_coefficient_28_0698
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0699 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 699 for generator 28. -/
def ep_Q2_008_partial_28_0699 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 28. -/
theorem ep_Q2_008_partial_28_0699_valid :
    mulPoly ep_Q2_008_coefficient_28_0699
        ep_Q2_008_generator_28_0600_0699 =
      ep_Q2_008_partial_28_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_28_0600_0699 : List Poly :=
[
  ep_Q2_008_partial_28_0600,
  ep_Q2_008_partial_28_0601,
  ep_Q2_008_partial_28_0602,
  ep_Q2_008_partial_28_0603,
  ep_Q2_008_partial_28_0604,
  ep_Q2_008_partial_28_0605,
  ep_Q2_008_partial_28_0606,
  ep_Q2_008_partial_28_0607,
  ep_Q2_008_partial_28_0608,
  ep_Q2_008_partial_28_0609,
  ep_Q2_008_partial_28_0610,
  ep_Q2_008_partial_28_0611,
  ep_Q2_008_partial_28_0612,
  ep_Q2_008_partial_28_0613,
  ep_Q2_008_partial_28_0614,
  ep_Q2_008_partial_28_0615,
  ep_Q2_008_partial_28_0616,
  ep_Q2_008_partial_28_0617,
  ep_Q2_008_partial_28_0618,
  ep_Q2_008_partial_28_0619,
  ep_Q2_008_partial_28_0620,
  ep_Q2_008_partial_28_0621,
  ep_Q2_008_partial_28_0622,
  ep_Q2_008_partial_28_0623,
  ep_Q2_008_partial_28_0624,
  ep_Q2_008_partial_28_0625,
  ep_Q2_008_partial_28_0626,
  ep_Q2_008_partial_28_0627,
  ep_Q2_008_partial_28_0628,
  ep_Q2_008_partial_28_0629,
  ep_Q2_008_partial_28_0630,
  ep_Q2_008_partial_28_0631,
  ep_Q2_008_partial_28_0632,
  ep_Q2_008_partial_28_0633,
  ep_Q2_008_partial_28_0634,
  ep_Q2_008_partial_28_0635,
  ep_Q2_008_partial_28_0636,
  ep_Q2_008_partial_28_0637,
  ep_Q2_008_partial_28_0638,
  ep_Q2_008_partial_28_0639,
  ep_Q2_008_partial_28_0640,
  ep_Q2_008_partial_28_0641,
  ep_Q2_008_partial_28_0642,
  ep_Q2_008_partial_28_0643,
  ep_Q2_008_partial_28_0644,
  ep_Q2_008_partial_28_0645,
  ep_Q2_008_partial_28_0646,
  ep_Q2_008_partial_28_0647,
  ep_Q2_008_partial_28_0648,
  ep_Q2_008_partial_28_0649,
  ep_Q2_008_partial_28_0650,
  ep_Q2_008_partial_28_0651,
  ep_Q2_008_partial_28_0652,
  ep_Q2_008_partial_28_0653,
  ep_Q2_008_partial_28_0654,
  ep_Q2_008_partial_28_0655,
  ep_Q2_008_partial_28_0656,
  ep_Q2_008_partial_28_0657,
  ep_Q2_008_partial_28_0658,
  ep_Q2_008_partial_28_0659,
  ep_Q2_008_partial_28_0660,
  ep_Q2_008_partial_28_0661,
  ep_Q2_008_partial_28_0662,
  ep_Q2_008_partial_28_0663,
  ep_Q2_008_partial_28_0664,
  ep_Q2_008_partial_28_0665,
  ep_Q2_008_partial_28_0666,
  ep_Q2_008_partial_28_0667,
  ep_Q2_008_partial_28_0668,
  ep_Q2_008_partial_28_0669,
  ep_Q2_008_partial_28_0670,
  ep_Q2_008_partial_28_0671,
  ep_Q2_008_partial_28_0672,
  ep_Q2_008_partial_28_0673,
  ep_Q2_008_partial_28_0674,
  ep_Q2_008_partial_28_0675,
  ep_Q2_008_partial_28_0676,
  ep_Q2_008_partial_28_0677,
  ep_Q2_008_partial_28_0678,
  ep_Q2_008_partial_28_0679,
  ep_Q2_008_partial_28_0680,
  ep_Q2_008_partial_28_0681,
  ep_Q2_008_partial_28_0682,
  ep_Q2_008_partial_28_0683,
  ep_Q2_008_partial_28_0684,
  ep_Q2_008_partial_28_0685,
  ep_Q2_008_partial_28_0686,
  ep_Q2_008_partial_28_0687,
  ep_Q2_008_partial_28_0688,
  ep_Q2_008_partial_28_0689,
  ep_Q2_008_partial_28_0690,
  ep_Q2_008_partial_28_0691,
  ep_Q2_008_partial_28_0692,
  ep_Q2_008_partial_28_0693,
  ep_Q2_008_partial_28_0694,
  ep_Q2_008_partial_28_0695,
  ep_Q2_008_partial_28_0696,
  ep_Q2_008_partial_28_0697,
  ep_Q2_008_partial_28_0698,
  ep_Q2_008_partial_28_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_28_0600_0699 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((1907095121711668215372596847927172898904378 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1130535622777007419027099491517621615251321 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((41889972037375162185 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((2737783666446414751818906762777270174841623 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-597162407119350232432664644142267520000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((101405902877080030610918616667228854451200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9642331201969404390 : Rat) / 692956453614176359) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-399694431279621624234344027399011687679657 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3000794601597693705 : Rat) / 692956453614176359) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17897864972915931888774978743043992684400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (8, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((187532765152567200 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((306771294787898013 : Rat) / 47790100249253542) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4136248216970312895156048716086718302166400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((22801202324208861183 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((3556028236266770880291348090390618827150871 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2369997271055410233780196315133072727983703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((7339473515892158262 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11756099530199151360 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9894046412742829623 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3092038458270032125791657610931526068188800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11538806012559469797211250117643842674502400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((18288725419798293897468857870080000557750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4565634877182441879 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11497941536222402962814083823645841734400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52360161454792419045 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1235793573846896324732955950066131294705284 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-206457184781750779817155403622610176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1564268748220177869691142972907220318563198 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((282167971443746501161225204594771200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14389928409317076905567890827930124579200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2696580468174137680582935037982294014379313 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((280311804159153982317 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1131580323467343807416598964597672541349375 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-138716461057548294762761350956851556710400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-184336772126563196265317324663044800000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-2960359691404068796447144061156951616039127 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((80789434741425146570877787158892275532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4133740570811292092229930798739250104809600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-289747558634110033779850606101849600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((95291074274784480000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-6300714542334785622442354479986586830850 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-177848022795092508106622605956549625496412 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35179947144201121577480391088747161600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((-953547560855834107686298423963586449452189 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1130535622777007419027099491517621615251321 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2737783666446414751818906762777270174841623 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-50702951438540015305459308333614427225600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((399694431279621624234344027399011687679657 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((3000794601597693705 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8948932486457965944387489371521996342200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (15, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(2, 2), (6, 2), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-306771294787898013 : Rat) / 95580200498507084) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2068124108485156447578024358043359151083200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22801202324208861183 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-3556028236266770880291348090390618827150871 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((2369997271055410233780196315133072727983703 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3669736757946079131 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-372312268861031552084156108417948659200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5878049765099575680 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1546019229135016062895828805465763034094400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((4565634877182441879 : Rat) / 5543651628913410872) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((5748970768111201481407041911822920867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((52360161454792419045 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((617896786923448162366477975033065647352642 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((103228592390875389908577701811305088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-782134374110088934845571486453610159281599 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-141083985721873250580612602297385600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2696580468174137680582935037982294014379313 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-280311804159153982317 : Rat) / 11087303257826821744) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((1131580323467343807416598964597672541349375 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((92168386063281598132658662331522400000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (13, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((2960359691404068796447144061156951616039127 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-40394717370712573285438893579446137766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2066870285405646046114965399369625052404800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3150357271167392811221177239993293415425 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((88924011397546254053311302978274812748206 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17589973572100560788740195544373580800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 2), (13, 3), (15, 2), (16, 1)],
  term ((3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((1907095121711668215372596847927172898904378 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((41889972037375162185 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1130535622777007419027099491517621615251321 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((2737783666446414751818906762777270174841623 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-597162407119350232432664644142267520000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((-9642331201969404390 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((101405902877080030610918616667228854451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3000794601597693705 : Rat) / 692956453614176359) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-399694431279621624234344027399011687679657 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((17897864972915931888774978743043992684400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((187532765152567200 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((306771294787898013 : Rat) / 47790100249253542) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((22801202324208861183 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4136248216970312895156048716086718302166400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((3556028236266770880291348090390618827150871 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2369997271055410233780196315133072727983703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((7339473515892158262 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-11756099530199151360 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((9894046412742829623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3092038458270032125791657610931526068188800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11538806012559469797211250117643842674502400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-4565634877182441879 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((18288725419798293897468857870080000557750 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-52360161454792419045 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11497941536222402962814083823645841734400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1235793573846896324732955950066131294705284 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-206457184781750779817155403622610176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((1564268748220177869691142972907220318563198 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((282167971443746501161225204594771200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((14389928409317076905567890827930124579200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((280311804159153982317 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2696580468174137680582935037982294014379313 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1131580323467343807416598964597672541349375 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-138716461057548294762761350956851556710400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-184336772126563196265317324663044800000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-2960359691404068796447144061156951616039127 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((80789434741425146570877787158892275532800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4133740570811292092229930798739250104809600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (10, 1), (15, 3), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-289747558634110033779850606101849600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((95291074274784480000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-6300714542334785622442354479986586830850 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-177848022795092508106622605956549625496412 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-35179947144201121577480391088747161600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-953547560855834107686298423963586449452189 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1130535622777007419027099491517621615251321 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2737783666446414751818906762777270174841623 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-50702951438540015305459308333614427225600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(3, 2), (6, 1), (13, 2), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((399694431279621624234344027399011687679657 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((3000794601597693705 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8948932486457965944387489371521996342200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(3, 2), (6, 2), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-306771294787898013 : Rat) / 95580200498507084) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2068124108485156447578024358043359151083200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22801202324208861183 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-3556028236266770880291348090390618827150871 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((2369997271055410233780196315133072727983703 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3669736757946079131 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-372312268861031552084156108417948659200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5878049765099575680 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1546019229135016062895828805465763034094400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((4565634877182441879 : Rat) / 5543651628913410872) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((5748970768111201481407041911822920867200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((52360161454792419045 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((617896786923448162366477975033065647352642 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((103228592390875389908577701811305088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-782134374110088934845571486453610159281599 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-141083985721873250580612602297385600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2696580468174137680582935037982294014379313 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-280311804159153982317 : Rat) / 11087303257826821744) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1131580323467343807416598964597672541349375 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((92168386063281598132658662331522400000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((2960359691404068796447144061156951616039127 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-40394717370712573285438893579446137766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2066870285405646046114965399369625052404800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(3, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3150357271167392811221177239993293415425 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((88924011397546254053311302978274812748206 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17589973572100560788740195544373580800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 600 through 699. -/
theorem ep_Q2_008_block_28_0600_0699_valid :
    checkProductSumEq ep_Q2_008_partials_28_0600_0699
      ep_Q2_008_block_28_0600_0699 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
