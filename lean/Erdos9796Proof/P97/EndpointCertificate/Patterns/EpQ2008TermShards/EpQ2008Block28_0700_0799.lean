/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 28:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_28_0700_0799 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 700 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0700 : Poly :=
[
  term ((-439874095089306267324661067509219200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 700 for generator 28. -/
def ep_Q2_008_partial_28_0700 : Poly :=
[
  term ((-879748190178612534649322135018438400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((439874095089306267324661067509219200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-879748190178612534649322135018438400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((439874095089306267324661067509219200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 28. -/
theorem ep_Q2_008_partial_28_0700_valid :
    mulPoly ep_Q2_008_coefficient_28_0700
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0701 : Poly :=
[
  term ((1419910393478283936 : Rat) / 692956453614176359) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 701 for generator 28. -/
def ep_Q2_008_partial_28_0701 : Poly :=
[
  term ((2839820786956567872 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1419910393478283936 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((2839820786956567872 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1419910393478283936 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 28. -/
theorem ep_Q2_008_partial_28_0701_valid :
    mulPoly ep_Q2_008_coefficient_28_0701
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0702 : Poly :=
[
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 702 for generator 28. -/
def ep_Q2_008_partial_28_0702 : Poly :=
[
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 28. -/
theorem ep_Q2_008_partial_28_0702_valid :
    mulPoly ep_Q2_008_coefficient_28_0702
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0703 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (12, 2), (16, 1)]
]

/-- Partial product 703 for generator 28. -/
def ep_Q2_008_partial_28_0703 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (12, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 2), (7, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 28. -/
theorem ep_Q2_008_partial_28_0703_valid :
    mulPoly ep_Q2_008_coefficient_28_0703
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0704 : Poly :=
[
  term ((-2416811419662252310367617600850093229896097 : Rat) / 168707601851329515375740828258983054697998) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 704 for generator 28. -/
def ep_Q2_008_partial_28_0704 : Poly :=
[
  term ((-2416811419662252310367617600850093229896097 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2416811419662252310367617600850093229896097 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2416811419662252310367617600850093229896097 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((2416811419662252310367617600850093229896097 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 28. -/
theorem ep_Q2_008_partial_28_0704_valid :
    mulPoly ep_Q2_008_coefficient_28_0704
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0705 : Poly :=
[
  term ((-1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 705 for generator 28. -/
def ep_Q2_008_partial_28_0705 : Poly :=
[
  term ((-2992460513795946123118710470905305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2992460513795946123118710470905305600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 28. -/
theorem ep_Q2_008_partial_28_0705_valid :
    mulPoly ep_Q2_008_coefficient_28_0705
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0706 : Poly :=
[
  term ((-374386510936123221736649495568910086313830 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 706 for generator 28. -/
def ep_Q2_008_partial_28_0706 : Poly :=
[
  term ((-748773021872246443473298991137820172627660 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((374386510936123221736649495568910086313830 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-748773021872246443473298991137820172627660 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((374386510936123221736649495568910086313830 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 28. -/
theorem ep_Q2_008_partial_28_0706_valid :
    mulPoly ep_Q2_008_coefficient_28_0706
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0707 : Poly :=
[
  term ((-4014328837908197853 : Rat) / 2771825814456705436) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 707 for generator 28. -/
def ep_Q2_008_partial_28_0707 : Poly :=
[
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(2, 2), (7, 2), (13, 2), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(3, 2), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 28. -/
theorem ep_Q2_008_partial_28_0707_valid :
    mulPoly ep_Q2_008_coefficient_28_0707
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0708 : Poly :=
[
  term ((-19464750133357521564180674406840643200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 708 for generator 28. -/
def ep_Q2_008_partial_28_0708 : Poly :=
[
  term ((-38929500266715043128361348813681286400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((19464750133357521564180674406840643200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-38929500266715043128361348813681286400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((19464750133357521564180674406840643200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 28. -/
theorem ep_Q2_008_partial_28_0708_valid :
    mulPoly ep_Q2_008_coefficient_28_0708
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0709 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 709 for generator 28. -/
def ep_Q2_008_partial_28_0709 : Poly :=
[
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 4), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 28. -/
theorem ep_Q2_008_partial_28_0709_valid :
    mulPoly ep_Q2_008_coefficient_28_0709
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0710 : Poly :=
[
  term ((-277925001064648804653610375791593180015989 : Rat) / 168707601851329515375740828258983054697998) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 710 for generator 28. -/
def ep_Q2_008_partial_28_0710 : Poly :=
[
  term ((-277925001064648804653610375791593180015989 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((277925001064648804653610375791593180015989 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((-277925001064648804653610375791593180015989 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((277925001064648804653610375791593180015989 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 28. -/
theorem ep_Q2_008_partial_28_0710_valid :
    mulPoly ep_Q2_008_coefficient_28_0710
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0711 : Poly :=
[
  term ((-28204011884843133863 : Rat) / 11087303257826821744) [(7, 2), (16, 1)]
]

/-- Partial product 711 for generator 28. -/
def ep_Q2_008_partial_28_0711 : Poly :=
[
  term ((-28204011884843133863 : Rat) / 5543651628913410872) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((28204011884843133863 : Rat) / 11087303257826821744) [(2, 2), (7, 2), (16, 1)],
  term ((-28204011884843133863 : Rat) / 5543651628913410872) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((28204011884843133863 : Rat) / 11087303257826821744) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 28. -/
theorem ep_Q2_008_partial_28_0711_valid :
    mulPoly ep_Q2_008_coefficient_28_0711
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0712 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 712 for generator 28. -/
def ep_Q2_008_partial_28_0712 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 28. -/
theorem ep_Q2_008_partial_28_0712_valid :
    mulPoly ep_Q2_008_coefficient_28_0712
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0713 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 713 for generator 28. -/
def ep_Q2_008_partial_28_0713 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (10, 1), (15, 2), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 28. -/
theorem ep_Q2_008_partial_28_0713_valid :
    mulPoly ep_Q2_008_coefficient_28_0713
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0714 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 714 for generator 28. -/
def ep_Q2_008_partial_28_0714 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 28. -/
theorem ep_Q2_008_partial_28_0714_valid :
    mulPoly ep_Q2_008_coefficient_28_0714
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0715 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 715 for generator 28. -/
def ep_Q2_008_partial_28_0715 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 28. -/
theorem ep_Q2_008_partial_28_0715_valid :
    mulPoly ep_Q2_008_coefficient_28_0715
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0716 : Poly :=
[
  term ((-53245590298202080828887145578144000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 716 for generator 28. -/
def ep_Q2_008_partial_28_0716 : Poly :=
[
  term ((-106491180596404161657774291156288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((53245590298202080828887145578144000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-106491180596404161657774291156288000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (15, 2), (16, 1)],
  term ((53245590298202080828887145578144000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 28. -/
theorem ep_Q2_008_partial_28_0716_valid :
    mulPoly ep_Q2_008_coefficient_28_0716
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0717 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 717 for generator 28. -/
def ep_Q2_008_partial_28_0717 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 28. -/
theorem ep_Q2_008_partial_28_0717_valid :
    mulPoly ep_Q2_008_coefficient_28_0717
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0718 : Poly :=
[
  term ((2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 718 for generator 28. -/
def ep_Q2_008_partial_28_0718 : Poly :=
[
  term ((4075520247881852823124352212364352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((4075520247881852823124352212364352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (15, 3), (16, 1)],
  term ((-2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 28. -/
theorem ep_Q2_008_partial_28_0718_valid :
    mulPoly ep_Q2_008_coefficient_28_0718
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0719 : Poly :=
[
  term ((444225147202788133143838022314513500553830 : Rat) / 84353800925664757687870414129491527348999) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 719 for generator 28. -/
def ep_Q2_008_partial_28_0719 : Poly :=
[
  term ((888450294405576266287676044629027001107660 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-444225147202788133143838022314513500553830 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((888450294405576266287676044629027001107660 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-444225147202788133143838022314513500553830 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 28. -/
theorem ep_Q2_008_partial_28_0719_valid :
    mulPoly ep_Q2_008_coefficient_28_0719
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0720 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 720 for generator 28. -/
def ep_Q2_008_partial_28_0720 : Poly :=
[
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 2), (15, 4), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 28. -/
theorem ep_Q2_008_partial_28_0720_valid :
    mulPoly ep_Q2_008_coefficient_28_0720
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0721 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 721 for generator 28. -/
def ep_Q2_008_partial_28_0721 : Poly :=
[
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 3), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 28. -/
theorem ep_Q2_008_partial_28_0721_valid :
    mulPoly ep_Q2_008_coefficient_28_0721
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0722 : Poly :=
[
  term ((197162993719151868326246829430726867756789 : Rat) / 168707601851329515375740828258983054697998) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 722 for generator 28. -/
def ep_Q2_008_partial_28_0722 : Poly :=
[
  term ((197162993719151868326246829430726867756789 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-197162993719151868326246829430726867756789 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((197162993719151868326246829430726867756789 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-197162993719151868326246829430726867756789 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 28. -/
theorem ep_Q2_008_partial_28_0722_valid :
    mulPoly ep_Q2_008_coefficient_28_0722
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0723 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (15, 3), (16, 1)]
]

/-- Partial product 723 for generator 28. -/
def ep_Q2_008_partial_28_0723 : Poly :=
[
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (14, 1), (15, 3), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (15, 3), (16, 1)],
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (15, 4), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 28. -/
theorem ep_Q2_008_partial_28_0723_valid :
    mulPoly ep_Q2_008_coefficient_28_0723
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0724 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 724 for generator 28. -/
def ep_Q2_008_partial_28_0724 : Poly :=
[
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (13, 2), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 28. -/
theorem ep_Q2_008_partial_28_0724_valid :
    mulPoly ep_Q2_008_coefficient_28_0724
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0725 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (15, 2), (16, 1)]
]

/-- Partial product 725 for generator 28. -/
def ep_Q2_008_partial_28_0725 : Poly :=
[
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (14, 1), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (15, 2), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (15, 3), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 28. -/
theorem ep_Q2_008_partial_28_0725_valid :
    mulPoly ep_Q2_008_coefficient_28_0725
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0726 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 726 for generator 28. -/
def ep_Q2_008_partial_28_0726 : Poly :=
[
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 28. -/
theorem ep_Q2_008_partial_28_0726_valid :
    mulPoly ep_Q2_008_coefficient_28_0726
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0727 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 727 for generator 28. -/
def ep_Q2_008_partial_28_0727 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 28. -/
theorem ep_Q2_008_partial_28_0727_valid :
    mulPoly ep_Q2_008_coefficient_28_0727
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0728 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 728 for generator 28. -/
def ep_Q2_008_partial_28_0728 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 28. -/
theorem ep_Q2_008_partial_28_0728_valid :
    mulPoly ep_Q2_008_coefficient_28_0728
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0729 : Poly :=
[
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 729 for generator 28. -/
def ep_Q2_008_partial_28_0729 : Poly :=
[
  term ((1969850932679345625 : Rat) / 1385912907228352718) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 1385912907228352718) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 28. -/
theorem ep_Q2_008_partial_28_0729_valid :
    mulPoly ep_Q2_008_coefficient_28_0729
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0730 : Poly :=
[
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 730 for generator 28. -/
def ep_Q2_008_partial_28_0730 : Poly :=
[
  term ((1387039924178296875 : Rat) / 2771825814456705436) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 2771825814456705436) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 28. -/
theorem ep_Q2_008_partial_28_0730_valid :
    mulPoly ep_Q2_008_coefficient_28_0730
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0731 : Poly :=
[
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 731 for generator 28. -/
def ep_Q2_008_partial_28_0731 : Poly :=
[
  term ((-2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 28. -/
theorem ep_Q2_008_partial_28_0731_valid :
    mulPoly ep_Q2_008_coefficient_28_0731
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0732 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 732 for generator 28. -/
def ep_Q2_008_partial_28_0732 : Poly :=
[
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 28. -/
theorem ep_Q2_008_partial_28_0732_valid :
    mulPoly ep_Q2_008_coefficient_28_0732
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0733 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 733 for generator 28. -/
def ep_Q2_008_partial_28_0733 : Poly :=
[
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (8, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (8, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 28. -/
theorem ep_Q2_008_partial_28_0733_valid :
    mulPoly ep_Q2_008_coefficient_28_0733
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0734 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 734 for generator 28. -/
def ep_Q2_008_partial_28_0734 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 28. -/
theorem ep_Q2_008_partial_28_0734_valid :
    mulPoly ep_Q2_008_coefficient_28_0734
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0735 : Poly :=
[
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 735 for generator 28. -/
def ep_Q2_008_partial_28_0735 : Poly :=
[
  term ((29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 28. -/
theorem ep_Q2_008_partial_28_0735_valid :
    mulPoly ep_Q2_008_coefficient_28_0735
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0736 : Poly :=
[
  term ((-35162393466106350 : Rat) / 692956453614176359) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 736 for generator 28. -/
def ep_Q2_008_partial_28_0736 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(3, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 28. -/
theorem ep_Q2_008_partial_28_0736_valid :
    mulPoly ep_Q2_008_coefficient_28_0736
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0737 : Poly :=
[
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 737 for generator 28. -/
def ep_Q2_008_partial_28_0737 : Poly :=
[
  term ((3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 28. -/
theorem ep_Q2_008_partial_28_0737_valid :
    mulPoly ep_Q2_008_coefficient_28_0737
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0738 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 738 for generator 28. -/
def ep_Q2_008_partial_28_0738 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 28. -/
theorem ep_Q2_008_partial_28_0738_valid :
    mulPoly ep_Q2_008_coefficient_28_0738
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0739 : Poly :=
[
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 739 for generator 28. -/
def ep_Q2_008_partial_28_0739 : Poly :=
[
  term ((52553723233734477915 : Rat) / 2771825814456705436) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 2771825814456705436) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 28. -/
theorem ep_Q2_008_partial_28_0739_valid :
    mulPoly ep_Q2_008_coefficient_28_0739
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0740 : Poly :=
[
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 740 for generator 28. -/
def ep_Q2_008_partial_28_0740 : Poly :=
[
  term ((-51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 28. -/
theorem ep_Q2_008_partial_28_0740_valid :
    mulPoly ep_Q2_008_coefficient_28_0740
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0741 : Poly :=
[
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 741 for generator 28. -/
def ep_Q2_008_partial_28_0741 : Poly :=
[
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 28. -/
theorem ep_Q2_008_partial_28_0741_valid :
    mulPoly ep_Q2_008_coefficient_28_0741
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0742 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 742 for generator 28. -/
def ep_Q2_008_partial_28_0742 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 28. -/
theorem ep_Q2_008_partial_28_0742_valid :
    mulPoly ep_Q2_008_coefficient_28_0742
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0743 : Poly :=
[
  term ((-15881322831892412733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 743 for generator 28. -/
def ep_Q2_008_partial_28_0743 : Poly :=
[
  term ((-15881322831892412733 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((15881322831892412733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-15881322831892412733 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((15881322831892412733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 28. -/
theorem ep_Q2_008_partial_28_0743_valid :
    mulPoly ep_Q2_008_coefficient_28_0743
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0744 : Poly :=
[
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 744 for generator 28. -/
def ep_Q2_008_partial_28_0744 : Poly :=
[
  term ((-1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 28. -/
theorem ep_Q2_008_partial_28_0744_valid :
    mulPoly ep_Q2_008_coefficient_28_0744
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0745 : Poly :=
[
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 745 for generator 28. -/
def ep_Q2_008_partial_28_0745 : Poly :=
[
  term ((4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 28. -/
theorem ep_Q2_008_partial_28_0745_valid :
    mulPoly ep_Q2_008_coefficient_28_0745
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0746 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 746 for generator 28. -/
def ep_Q2_008_partial_28_0746 : Poly :=
[
  term ((38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 28. -/
theorem ep_Q2_008_partial_28_0746_valid :
    mulPoly ep_Q2_008_coefficient_28_0746
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0747 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 747 for generator 28. -/
def ep_Q2_008_partial_28_0747 : Poly :=
[
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 28. -/
theorem ep_Q2_008_partial_28_0747_valid :
    mulPoly ep_Q2_008_coefficient_28_0747
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0748 : Poly :=
[
  term ((3506071811842334277 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 748 for generator 28. -/
def ep_Q2_008_partial_28_0748 : Poly :=
[
  term ((3506071811842334277 : Rat) / 692956453614176359) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3506071811842334277 : Rat) / 1385912907228352718) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((3506071811842334277 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3506071811842334277 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 28. -/
theorem ep_Q2_008_partial_28_0748_valid :
    mulPoly ep_Q2_008_coefficient_28_0748
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0749 : Poly :=
[
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 749 for generator 28. -/
def ep_Q2_008_partial_28_0749 : Poly :=
[
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 28. -/
theorem ep_Q2_008_partial_28_0749_valid :
    mulPoly ep_Q2_008_coefficient_28_0749
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0750 : Poly :=
[
  term ((-4034630996474220027 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 750 for generator 28. -/
def ep_Q2_008_partial_28_0750 : Poly :=
[
  term ((-4034630996474220027 : Rat) / 692956453614176359) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((4034630996474220027 : Rat) / 1385912907228352718) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4034630996474220027 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4034630996474220027 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 28. -/
theorem ep_Q2_008_partial_28_0750_valid :
    mulPoly ep_Q2_008_coefficient_28_0750
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0751 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 751 for generator 28. -/
def ep_Q2_008_partial_28_0751 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 28. -/
theorem ep_Q2_008_partial_28_0751_valid :
    mulPoly ep_Q2_008_coefficient_28_0751
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0752 : Poly :=
[
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 752 for generator 28. -/
def ep_Q2_008_partial_28_0752 : Poly :=
[
  term ((-52553723233734477915 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-52553723233734477915 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 28. -/
theorem ep_Q2_008_partial_28_0752_valid :
    mulPoly ep_Q2_008_coefficient_28_0752
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0753 : Poly :=
[
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 753 for generator 28. -/
def ep_Q2_008_partial_28_0753 : Poly :=
[
  term ((51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 28. -/
theorem ep_Q2_008_partial_28_0753_valid :
    mulPoly ep_Q2_008_coefficient_28_0753
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0754 : Poly :=
[
  term ((-22792332464008052612001643765323974454525 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 754 for generator 28. -/
def ep_Q2_008_partial_28_0754 : Poly :=
[
  term ((-22792332464008052612001643765323974454525 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((22792332464008052612001643765323974454525 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22792332464008052612001643765323974454525 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((22792332464008052612001643765323974454525 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 28. -/
theorem ep_Q2_008_partial_28_0754_valid :
    mulPoly ep_Q2_008_coefficient_28_0754
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0755 : Poly :=
[
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 755 for generator 28. -/
def ep_Q2_008_partial_28_0755 : Poly :=
[
  term ((-29862402581498066970159229540295982703650 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-29862402581498066970159229540295982703650 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 28. -/
theorem ep_Q2_008_partial_28_0755_valid :
    mulPoly ep_Q2_008_coefficient_28_0755
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0756 : Poly :=
[
  term ((-6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 756 for generator 28. -/
def ep_Q2_008_partial_28_0756 : Poly :=
[
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 28. -/
theorem ep_Q2_008_partial_28_0756_valid :
    mulPoly ep_Q2_008_coefficient_28_0756
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0757 : Poly :=
[
  term ((12281583263330851983 : Rat) / 5543651628913410872) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 757 for generator 28. -/
def ep_Q2_008_partial_28_0757 : Poly :=
[
  term ((12281583263330851983 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12281583263330851983 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((12281583263330851983 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12281583263330851983 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 28. -/
theorem ep_Q2_008_partial_28_0757_valid :
    mulPoly ep_Q2_008_coefficient_28_0757
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0758 : Poly :=
[
  term ((475397551862277137197702059375751622400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 758 for generator 28. -/
def ep_Q2_008_partial_28_0758 : Poly :=
[
  term ((950795103724554274395404118751503244800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-475397551862277137197702059375751622400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((950795103724554274395404118751503244800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-475397551862277137197702059375751622400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 28. -/
theorem ep_Q2_008_partial_28_0758_valid :
    mulPoly ep_Q2_008_coefficient_28_0758
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0759 : Poly :=
[
  term ((9836837899235590569873262129113126893325 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 759 for generator 28. -/
def ep_Q2_008_partial_28_0759 : Poly :=
[
  term ((9836837899235590569873262129113126893325 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9836837899235590569873262129113126893325 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((9836837899235590569873262129113126893325 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-9836837899235590569873262129113126893325 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 28. -/
theorem ep_Q2_008_partial_28_0759_valid :
    mulPoly ep_Q2_008_coefficient_28_0759
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0760 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 28. -/
def ep_Q2_008_partial_28_0760 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 28. -/
theorem ep_Q2_008_partial_28_0760_valid :
    mulPoly ep_Q2_008_coefficient_28_0760
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0761 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 761 for generator 28. -/
def ep_Q2_008_partial_28_0761 : Poly :=
[
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 28. -/
theorem ep_Q2_008_partial_28_0761_valid :
    mulPoly ep_Q2_008_coefficient_28_0761
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0762 : Poly :=
[
  term ((-7461680854172397750 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 762 for generator 28. -/
def ep_Q2_008_partial_28_0762 : Poly :=
[
  term ((-14923361708344795500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14923361708344795500 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 28. -/
theorem ep_Q2_008_partial_28_0762_valid :
    mulPoly ep_Q2_008_coefficient_28_0762
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0763 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 763 for generator 28. -/
def ep_Q2_008_partial_28_0763 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 28. -/
theorem ep_Q2_008_partial_28_0763_valid :
    mulPoly ep_Q2_008_coefficient_28_0763
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0764 : Poly :=
[
  term ((3889714471092129375 : Rat) / 1385912907228352718) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 764 for generator 28. -/
def ep_Q2_008_partial_28_0764 : Poly :=
[
  term ((3889714471092129375 : Rat) / 692956453614176359) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3889714471092129375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 28. -/
theorem ep_Q2_008_partial_28_0764_valid :
    mulPoly ep_Q2_008_coefficient_28_0764
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0765 : Poly :=
[
  term ((128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 765 for generator 28. -/
def ep_Q2_008_partial_28_0765 : Poly :=
[
  term ((257776134452838352987051476276204772224600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((257776134452838352987051476276204772224600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 28. -/
theorem ep_Q2_008_partial_28_0765_valid :
    mulPoly ep_Q2_008_coefficient_28_0765
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0766 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 766 for generator 28. -/
def ep_Q2_008_partial_28_0766 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 28. -/
theorem ep_Q2_008_partial_28_0766_valid :
    mulPoly ep_Q2_008_coefficient_28_0766
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0767 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 767 for generator 28. -/
def ep_Q2_008_partial_28_0767 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 28. -/
theorem ep_Q2_008_partial_28_0767_valid :
    mulPoly ep_Q2_008_coefficient_28_0767
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0768 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 768 for generator 28. -/
def ep_Q2_008_partial_28_0768 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (10, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 28. -/
theorem ep_Q2_008_partial_28_0768_valid :
    mulPoly ep_Q2_008_coefficient_28_0768
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0769 : Poly :=
[
  term ((-2852319299798034868518038339474748038321400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 769 for generator 28. -/
def ep_Q2_008_partial_28_0769 : Poly :=
[
  term ((-5704638599596069737036076678949496076642800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2852319299798034868518038339474748038321400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5704638599596069737036076678949496076642800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2852319299798034868518038339474748038321400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 28. -/
theorem ep_Q2_008_partial_28_0769_valid :
    mulPoly ep_Q2_008_coefficient_28_0769
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0770 : Poly :=
[
  term ((-15855689783583275517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 770 for generator 28. -/
def ep_Q2_008_partial_28_0770 : Poly :=
[
  term ((-15855689783583275517 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-15855689783583275517 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(3, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 28. -/
theorem ep_Q2_008_partial_28_0770_valid :
    mulPoly ep_Q2_008_coefficient_28_0770
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0771 : Poly :=
[
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (16, 1)]
]

/-- Partial product 771 for generator 28. -/
def ep_Q2_008_partial_28_0771 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 28. -/
theorem ep_Q2_008_partial_28_0771_valid :
    mulPoly ep_Q2_008_coefficient_28_0771
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0772 : Poly :=
[
  term ((-12412695149071948148877607119068103267903621 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 772 for generator 28. -/
def ep_Q2_008_partial_28_0772 : Poly :=
[
  term ((-12412695149071948148877607119068103267903621 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12412695149071948148877607119068103267903621 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12412695149071948148877607119068103267903621 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((12412695149071948148877607119068103267903621 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 28. -/
theorem ep_Q2_008_partial_28_0772_valid :
    mulPoly ep_Q2_008_coefficient_28_0772
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0773 : Poly :=
[
  term ((-46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 773 for generator 28. -/
def ep_Q2_008_partial_28_0773 : Poly :=
[
  term ((-92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 28. -/
theorem ep_Q2_008_partial_28_0773_valid :
    mulPoly ep_Q2_008_coefficient_28_0773
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0774 : Poly :=
[
  term ((69038763040192774958364471691962019474800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 774 for generator 28. -/
def ep_Q2_008_partial_28_0774 : Poly :=
[
  term ((138077526080385549916728943383924038949600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-69038763040192774958364471691962019474800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((138077526080385549916728943383924038949600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-69038763040192774958364471691962019474800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 28. -/
theorem ep_Q2_008_partial_28_0774_valid :
    mulPoly ep_Q2_008_coefficient_28_0774
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0775 : Poly :=
[
  term ((-13165974220555668321 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 775 for generator 28. -/
def ep_Q2_008_partial_28_0775 : Poly :=
[
  term ((-13165974220555668321 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((-13165974220555668321 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 28. -/
theorem ep_Q2_008_partial_28_0775_valid :
    mulPoly ep_Q2_008_coefficient_28_0775
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0776 : Poly :=
[
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 776 for generator 28. -/
def ep_Q2_008_partial_28_0776 : Poly :=
[
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 28. -/
theorem ep_Q2_008_partial_28_0776_valid :
    mulPoly ep_Q2_008_coefficient_28_0776
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0777 : Poly :=
[
  term ((34327773674773779441991552787233221513975 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 777 for generator 28. -/
def ep_Q2_008_partial_28_0777 : Poly :=
[
  term ((34327773674773779441991552787233221513975 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34327773674773779441991552787233221513975 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((34327773674773779441991552787233221513975 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-34327773674773779441991552787233221513975 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 28. -/
theorem ep_Q2_008_partial_28_0777_valid :
    mulPoly ep_Q2_008_coefficient_28_0777
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0778 : Poly :=
[
  term ((-16586411016603148983 : Rat) / 5543651628913410872) [(10, 1), (16, 1)]
]

/-- Partial product 778 for generator 28. -/
def ep_Q2_008_partial_28_0778 : Poly :=
[
  term ((-16586411016603148983 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((16586411016603148983 : Rat) / 5543651628913410872) [(2, 2), (10, 1), (16, 1)],
  term ((-16586411016603148983 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((16586411016603148983 : Rat) / 5543651628913410872) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 28. -/
theorem ep_Q2_008_partial_28_0778_valid :
    mulPoly ep_Q2_008_coefficient_28_0778
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0779 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 779 for generator 28. -/
def ep_Q2_008_partial_28_0779 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (10, 2), (13, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 28. -/
theorem ep_Q2_008_partial_28_0779_valid :
    mulPoly ep_Q2_008_coefficient_28_0779
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0780 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (16, 1)]
]

/-- Partial product 780 for generator 28. -/
def ep_Q2_008_partial_28_0780 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(2, 2), (10, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(3, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 28. -/
theorem ep_Q2_008_partial_28_0780_valid :
    mulPoly ep_Q2_008_coefficient_28_0780
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0781 : Poly :=
[
  term ((-77477494344685842367800251448715294470000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 781 for generator 28. -/
def ep_Q2_008_partial_28_0781 : Poly :=
[
  term ((-154954988689371684735600502897430588940000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((77477494344685842367800251448715294470000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154954988689371684735600502897430588940000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((77477494344685842367800251448715294470000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 28. -/
theorem ep_Q2_008_partial_28_0781_valid :
    mulPoly ep_Q2_008_coefficient_28_0781
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0782 : Poly :=
[
  term ((35074757888084953017 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 782 for generator 28. -/
def ep_Q2_008_partial_28_0782 : Poly :=
[
  term ((35074757888084953017 : Rat) / 1385912907228352718) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35074757888084953017 : Rat) / 2771825814456705436) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((35074757888084953017 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35074757888084953017 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 28. -/
theorem ep_Q2_008_partial_28_0782_valid :
    mulPoly ep_Q2_008_coefficient_28_0782
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0783 : Poly :=
[
  term ((-8141051427259240882005638631937680699331200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 783 for generator 28. -/
def ep_Q2_008_partial_28_0783 : Poly :=
[
  term ((-16282102854518481764011277263875361398662400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((8141051427259240882005638631937680699331200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16282102854518481764011277263875361398662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((8141051427259240882005638631937680699331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 28. -/
theorem ep_Q2_008_partial_28_0783_valid :
    mulPoly ep_Q2_008_coefficient_28_0783
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0784 : Poly :=
[
  term ((-5522057541227067898903918623285196492800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 784 for generator 28. -/
def ep_Q2_008_partial_28_0784 : Poly :=
[
  term ((-11044115082454135797807837246570392985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((5522057541227067898903918623285196492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-11044115082454135797807837246570392985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((5522057541227067898903918623285196492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 28. -/
theorem ep_Q2_008_partial_28_0784_valid :
    mulPoly ep_Q2_008_coefficient_28_0784
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0785 : Poly :=
[
  term ((1076747461744116767154942872973397923955221 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 785 for generator 28. -/
def ep_Q2_008_partial_28_0785 : Poly :=
[
  term ((1076747461744116767154942872973397923955221 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1076747461744116767154942872973397923955221 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1076747461744116767154942872973397923955221 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1076747461744116767154942872973397923955221 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 28. -/
theorem ep_Q2_008_partial_28_0785_valid :
    mulPoly ep_Q2_008_coefficient_28_0785
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0786 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 786 for generator 28. -/
def ep_Q2_008_partial_28_0786 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 28. -/
theorem ep_Q2_008_partial_28_0786_valid :
    mulPoly ep_Q2_008_coefficient_28_0786
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0787 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 787 for generator 28. -/
def ep_Q2_008_partial_28_0787 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 28. -/
theorem ep_Q2_008_partial_28_0787_valid :
    mulPoly ep_Q2_008_coefficient_28_0787
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0788 : Poly :=
[
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 788 for generator 28. -/
def ep_Q2_008_partial_28_0788 : Poly :=
[
  term ((2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 28. -/
theorem ep_Q2_008_partial_28_0788_valid :
    mulPoly ep_Q2_008_coefficient_28_0788
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0789 : Poly :=
[
  term ((-8282761697297082447916410983734832112000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 789 for generator 28. -/
def ep_Q2_008_partial_28_0789 : Poly :=
[
  term ((-16565523394594164895832821967469664224000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8282761697297082447916410983734832112000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16565523394594164895832821967469664224000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((8282761697297082447916410983734832112000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 28. -/
theorem ep_Q2_008_partial_28_0789_valid :
    mulPoly ep_Q2_008_coefficient_28_0789
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0790 : Poly :=
[
  term ((-91514058279736822875 : Rat) / 11087303257826821744) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 790 for generator 28. -/
def ep_Q2_008_partial_28_0790 : Poly :=
[
  term ((-91514058279736822875 : Rat) / 5543651628913410872) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((91514058279736822875 : Rat) / 11087303257826821744) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-91514058279736822875 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((91514058279736822875 : Rat) / 11087303257826821744) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 28. -/
theorem ep_Q2_008_partial_28_0790_valid :
    mulPoly ep_Q2_008_coefficient_28_0790
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0791 : Poly :=
[
  term ((-7097166133577070631586139612681484510833900 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 791 for generator 28. -/
def ep_Q2_008_partial_28_0791 : Poly :=
[
  term ((-14194332267154141263172279225362969021667800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7097166133577070631586139612681484510833900 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14194332267154141263172279225362969021667800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((7097166133577070631586139612681484510833900 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 28. -/
theorem ep_Q2_008_partial_28_0791_valid :
    mulPoly ep_Q2_008_coefficient_28_0791
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0792 : Poly :=
[
  term ((-4930408518952739195449927342218925440000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 792 for generator 28. -/
def ep_Q2_008_partial_28_0792 : Poly :=
[
  term ((-9860817037905478390899854684437850880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((4930408518952739195449927342218925440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9860817037905478390899854684437850880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((4930408518952739195449927342218925440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 28. -/
theorem ep_Q2_008_partial_28_0792_valid :
    mulPoly ep_Q2_008_coefficient_28_0792
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0793 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 793 for generator 28. -/
def ep_Q2_008_partial_28_0793 : Poly :=
[
  term ((38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 3), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 28. -/
theorem ep_Q2_008_partial_28_0793_valid :
    mulPoly ep_Q2_008_coefficient_28_0793
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0794 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 794 for generator 28. -/
def ep_Q2_008_partial_28_0794 : Poly :=
[
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 28. -/
theorem ep_Q2_008_partial_28_0794_valid :
    mulPoly ep_Q2_008_coefficient_28_0794
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0795 : Poly :=
[
  term ((371821088892966904039676680598109510403125 : Rat) / 168707601851329515375740828258983054697998) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 795 for generator 28. -/
def ep_Q2_008_partial_28_0795 : Poly :=
[
  term ((371821088892966904039676680598109510403125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371821088892966904039676680598109510403125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((371821088892966904039676680598109510403125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-371821088892966904039676680598109510403125 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 28. -/
theorem ep_Q2_008_partial_28_0795_valid :
    mulPoly ep_Q2_008_coefficient_28_0795
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0796 : Poly :=
[
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 796 for generator 28. -/
def ep_Q2_008_partial_28_0796 : Poly :=
[
  term ((-269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 28. -/
theorem ep_Q2_008_partial_28_0796_valid :
    mulPoly ep_Q2_008_coefficient_28_0796
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0797 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 797 for generator 28. -/
def ep_Q2_008_partial_28_0797 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 28. -/
theorem ep_Q2_008_partial_28_0797_valid :
    mulPoly ep_Q2_008_coefficient_28_0797
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0798 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 798 for generator 28. -/
def ep_Q2_008_partial_28_0798 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 28. -/
theorem ep_Q2_008_partial_28_0798_valid :
    mulPoly ep_Q2_008_coefficient_28_0798
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0799 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 799 for generator 28. -/
def ep_Q2_008_partial_28_0799 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 28. -/
theorem ep_Q2_008_partial_28_0799_valid :
    mulPoly ep_Q2_008_coefficient_28_0799
        ep_Q2_008_generator_28_0700_0799 =
      ep_Q2_008_partial_28_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_28_0700_0799 : List Poly :=
[
  ep_Q2_008_partial_28_0700,
  ep_Q2_008_partial_28_0701,
  ep_Q2_008_partial_28_0702,
  ep_Q2_008_partial_28_0703,
  ep_Q2_008_partial_28_0704,
  ep_Q2_008_partial_28_0705,
  ep_Q2_008_partial_28_0706,
  ep_Q2_008_partial_28_0707,
  ep_Q2_008_partial_28_0708,
  ep_Q2_008_partial_28_0709,
  ep_Q2_008_partial_28_0710,
  ep_Q2_008_partial_28_0711,
  ep_Q2_008_partial_28_0712,
  ep_Q2_008_partial_28_0713,
  ep_Q2_008_partial_28_0714,
  ep_Q2_008_partial_28_0715,
  ep_Q2_008_partial_28_0716,
  ep_Q2_008_partial_28_0717,
  ep_Q2_008_partial_28_0718,
  ep_Q2_008_partial_28_0719,
  ep_Q2_008_partial_28_0720,
  ep_Q2_008_partial_28_0721,
  ep_Q2_008_partial_28_0722,
  ep_Q2_008_partial_28_0723,
  ep_Q2_008_partial_28_0724,
  ep_Q2_008_partial_28_0725,
  ep_Q2_008_partial_28_0726,
  ep_Q2_008_partial_28_0727,
  ep_Q2_008_partial_28_0728,
  ep_Q2_008_partial_28_0729,
  ep_Q2_008_partial_28_0730,
  ep_Q2_008_partial_28_0731,
  ep_Q2_008_partial_28_0732,
  ep_Q2_008_partial_28_0733,
  ep_Q2_008_partial_28_0734,
  ep_Q2_008_partial_28_0735,
  ep_Q2_008_partial_28_0736,
  ep_Q2_008_partial_28_0737,
  ep_Q2_008_partial_28_0738,
  ep_Q2_008_partial_28_0739,
  ep_Q2_008_partial_28_0740,
  ep_Q2_008_partial_28_0741,
  ep_Q2_008_partial_28_0742,
  ep_Q2_008_partial_28_0743,
  ep_Q2_008_partial_28_0744,
  ep_Q2_008_partial_28_0745,
  ep_Q2_008_partial_28_0746,
  ep_Q2_008_partial_28_0747,
  ep_Q2_008_partial_28_0748,
  ep_Q2_008_partial_28_0749,
  ep_Q2_008_partial_28_0750,
  ep_Q2_008_partial_28_0751,
  ep_Q2_008_partial_28_0752,
  ep_Q2_008_partial_28_0753,
  ep_Q2_008_partial_28_0754,
  ep_Q2_008_partial_28_0755,
  ep_Q2_008_partial_28_0756,
  ep_Q2_008_partial_28_0757,
  ep_Q2_008_partial_28_0758,
  ep_Q2_008_partial_28_0759,
  ep_Q2_008_partial_28_0760,
  ep_Q2_008_partial_28_0761,
  ep_Q2_008_partial_28_0762,
  ep_Q2_008_partial_28_0763,
  ep_Q2_008_partial_28_0764,
  ep_Q2_008_partial_28_0765,
  ep_Q2_008_partial_28_0766,
  ep_Q2_008_partial_28_0767,
  ep_Q2_008_partial_28_0768,
  ep_Q2_008_partial_28_0769,
  ep_Q2_008_partial_28_0770,
  ep_Q2_008_partial_28_0771,
  ep_Q2_008_partial_28_0772,
  ep_Q2_008_partial_28_0773,
  ep_Q2_008_partial_28_0774,
  ep_Q2_008_partial_28_0775,
  ep_Q2_008_partial_28_0776,
  ep_Q2_008_partial_28_0777,
  ep_Q2_008_partial_28_0778,
  ep_Q2_008_partial_28_0779,
  ep_Q2_008_partial_28_0780,
  ep_Q2_008_partial_28_0781,
  ep_Q2_008_partial_28_0782,
  ep_Q2_008_partial_28_0783,
  ep_Q2_008_partial_28_0784,
  ep_Q2_008_partial_28_0785,
  ep_Q2_008_partial_28_0786,
  ep_Q2_008_partial_28_0787,
  ep_Q2_008_partial_28_0788,
  ep_Q2_008_partial_28_0789,
  ep_Q2_008_partial_28_0790,
  ep_Q2_008_partial_28_0791,
  ep_Q2_008_partial_28_0792,
  ep_Q2_008_partial_28_0793,
  ep_Q2_008_partial_28_0794,
  ep_Q2_008_partial_28_0795,
  ep_Q2_008_partial_28_0796,
  ep_Q2_008_partial_28_0797,
  ep_Q2_008_partial_28_0798,
  ep_Q2_008_partial_28_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_28_0700_0799 : Poly :=
[
  term ((-879748190178612534649322135018438400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2839820786956567872 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 2), (14, 1), (16, 1)],
  term ((-2416811419662252310367617600850093229896097 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2992460513795946123118710470905305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-748773021872246443473298991137820172627660 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-38929500266715043128361348813681286400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-277925001064648804653610375791593180015989 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-28204011884843133863 : Rat) / 5543651628913410872) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-106491180596404161657774291156288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4075520247881852823124352212364352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((888450294405576266287676044629027001107660 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((197162993719151868326246829430726867756789 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (14, 1), (15, 3), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (14, 1), (15, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 1385912907228352718) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 2771825814456705436) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (8, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 2771825814456705436) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15881322831892412733 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3506071811842334277 : Rat) / 692956453614176359) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4034630996474220027 : Rat) / 692956453614176359) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22792332464008052612001643765323974454525 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29862402581498066970159229540295982703650 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12281583263330851983 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((950795103724554274395404118751503244800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9836837899235590569873262129113126893325 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-14923361708344795500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3889714471092129375 : Rat) / 692956453614176359) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((257776134452838352987051476276204772224600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (10, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-5704638599596069737036076678949496076642800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15855689783583275517 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12412695149071948148877607119068103267903621 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((138077526080385549916728943383924038949600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-13165974220555668321 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((34327773674773779441991552787233221513975 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16586411016603148983 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((-154954988689371684735600502897430588940000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((35074757888084953017 : Rat) / 1385912907228352718) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16282102854518481764011277263875361398662400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11044115082454135797807837246570392985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1076747461744116767154942872973397923955221 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16565523394594164895832821967469664224000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-91514058279736822875 : Rat) / 5543651628913410872) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14194332267154141263172279225362969021667800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9860817037905478390899854684437850880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((371821088892966904039676680598109510403125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((439874095089306267324661067509219200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1419910393478283936 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (12, 2), (16, 1)],
  term ((2416811419662252310367617600850093229896097 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((374386510936123221736649495568910086313830 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(2, 2), (7, 2), (13, 2), (16, 1)],
  term ((19464750133357521564180674406840643200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((277925001064648804653610375791593180015989 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((28204011884843133863 : Rat) / 11087303257826821744) [(2, 2), (7, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((53245590298202080828887145578144000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-444225147202788133143838022314513500553830 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((-197162993719151868326246829430726867756789 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((15881322831892412733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3506071811842334277 : Rat) / 1385912907228352718) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((4034630996474220027 : Rat) / 1385912907228352718) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((22792332464008052612001643765323974454525 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12281583263330851983 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-475397551862277137197702059375751622400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9836837899235590569873262129113126893325 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((2852319299798034868518038339474748038321400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 2), (16, 1)],
  term ((12412695149071948148877607119068103267903621 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-69038763040192774958364471691962019474800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-34327773674773779441991552787233221513975 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((16586411016603148983 : Rat) / 5543651628913410872) [(2, 2), (10, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (10, 2), (13, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(2, 2), (10, 2), (16, 1)],
  term ((77477494344685842367800251448715294470000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35074757888084953017 : Rat) / 2771825814456705436) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8141051427259240882005638631937680699331200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5522057541227067898903918623285196492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1076747461744116767154942872973397923955221 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8282761697297082447916410983734832112000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((91514058279736822875 : Rat) / 11087303257826821744) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((7097166133577070631586139612681484510833900 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4930408518952739195449927342218925440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-371821088892966904039676680598109510403125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2839820786956567872 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-879748190178612534649322135018438400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2416811419662252310367617600850093229896097 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2992460513795946123118710470905305600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-748773021872246443473298991137820172627660 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-38929500266715043128361348813681286400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 4), (16, 1)],
  term ((-28204011884843133863 : Rat) / 5543651628913410872) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-277925001064648804653610375791593180015989 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (10, 1), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-106491180596404161657774291156288000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 2), (15, 2), (16, 1)],
  term ((4075520247881852823124352212364352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (15, 3), (16, 1)],
  term ((888450294405576266287676044629027001107660 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 2), (15, 4), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 3), (15, 3), (16, 1)],
  term ((197162993719151868326246829430726867756789 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (15, 4), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (13, 2), (15, 3), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (15, 3), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 1385912907228352718) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 2771825814456705436) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (8, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 2771825814456705436) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((-51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15881322831892412733 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((3506071811842334277 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4034630996474220027 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-52553723233734477915 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-22792332464008052612001643765323974454525 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-29862402581498066970159229540295982703650 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((12281583263330851983 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((950795103724554274395404118751503244800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((9836837899235590569873262129113126893325 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-14923361708344795500 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3889714471092129375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((257776134452838352987051476276204772224600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-5704638599596069737036076678949496076642800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15855689783583275517 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12412695149071948148877607119068103267903621 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-13165974220555668321 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((138077526080385549916728943383924038949600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-16586411016603148983 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((34327773674773779441991552787233221513975 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((35074757888084953017 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-154954988689371684735600502897430588940000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16282102854518481764011277263875361398662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11044115082454135797807837246570392985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((1076747461744116767154942872973397923955221 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-91514058279736822875 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16565523394594164895832821967469664224000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14194332267154141263172279225362969021667800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-9860817037905478390899854684437850880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((371821088892966904039676680598109510403125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((439874095089306267324661067509219200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1419910393478283936 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 2), (7, 2), (12, 2), (16, 1)],
  term ((2416811419662252310367617600850093229896097 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((374386510936123221736649495568910086313830 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(3, 2), (7, 2), (13, 2), (16, 1)],
  term ((19464750133357521564180674406840643200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((277925001064648804653610375791593180015989 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((28204011884843133863 : Rat) / 11087303257826821744) [(3, 2), (7, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((53245590298202080828887145578144000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-444225147202788133143838022314513500553830 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((-197162993719151868326246829430726867756789 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 4), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (13, 2), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((15881322831892412733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3506071811842334277 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((4034630996474220027 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((22792332464008052612001643765323974454525 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12281583263330851983 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-475397551862277137197702059375751622400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9836837899235590569873262129113126893325 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((2852319299798034868518038339474748038321400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((12412695149071948148877607119068103267903621 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-69038763040192774958364471691962019474800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-34327773674773779441991552787233221513975 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((16586411016603148983 : Rat) / 5543651628913410872) [(3, 2), (10, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (10, 2), (13, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(3, 2), (10, 2), (16, 1)],
  term ((77477494344685842367800251448715294470000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35074757888084953017 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8141051427259240882005638631937680699331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5522057541227067898903918623285196492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1076747461744116767154942872973397923955221 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8282761697297082447916410983734832112000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((91514058279736822875 : Rat) / 11087303257826821744) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((7097166133577070631586139612681484510833900 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4930408518952739195449927342218925440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-371821088892966904039676680598109510403125 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 700 through 799. -/
theorem ep_Q2_008_block_28_0700_0799_valid :
    checkProductSumEq ep_Q2_008_partials_28_0700_0799
      ep_Q2_008_block_28_0700_0799 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
