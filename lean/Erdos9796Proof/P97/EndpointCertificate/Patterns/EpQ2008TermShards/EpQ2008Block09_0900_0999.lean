/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:900-999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0900 : Poly :=
[
  term ((62554836379172966607 : Rat) / 11087303257826821744) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 900 for generator 9. -/
def ep_Q2_008_partial_09_0900 : Poly :=
[
  term ((62554836379172966607 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-62554836379172966607 : Rat) / 11087303257826821744) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 9. -/
theorem ep_Q2_008_partial_09_0900_valid :
    mulPoly ep_Q2_008_coefficient_09_0900
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0901 : Poly :=
[
  term ((-2100732665413044334359506443020729561600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 901 for generator 9. -/
def ep_Q2_008_partial_09_0901 : Poly :=
[
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((2100732665413044334359506443020729561600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 9. -/
theorem ep_Q2_008_partial_09_0901_valid :
    mulPoly ep_Q2_008_coefficient_09_0901
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0902 : Poly :=
[
  term ((-2579766108764853581226883753304734084045683 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 902 for generator 9. -/
def ep_Q2_008_partial_09_0902 : Poly :=
[
  term ((-2579766108764853581226883753304734084045683 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2579766108764853581226883753304734084045683 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 9. -/
theorem ep_Q2_008_partial_09_0902_valid :
    mulPoly ep_Q2_008_coefficient_09_0902
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0903 : Poly :=
[
  term ((40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 4), (16, 1)]
]

/-- Partial product 903 for generator 9. -/
def ep_Q2_008_partial_09_0903 : Poly :=
[
  term ((80784914751761107956335945918015514307200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 9. -/
theorem ep_Q2_008_partial_09_0903_valid :
    mulPoly ep_Q2_008_coefficient_09_0903
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0904 : Poly :=
[
  term ((5036284380365407729 : Rat) / 2771825814456705436) [(6, 1), (16, 1)]
]

/-- Partial product 904 for generator 9. -/
def ep_Q2_008_partial_09_0904 : Poly :=
[
  term ((5036284380365407729 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (16, 1)],
  term ((-5036284380365407729 : Rat) / 2771825814456705436) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 9. -/
theorem ep_Q2_008_partial_09_0904_valid :
    mulPoly ep_Q2_008_coefficient_09_0904
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0905 : Poly :=
[
  term ((374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 905 for generator 9. -/
def ep_Q2_008_partial_09_0905 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 9. -/
theorem ep_Q2_008_partial_09_0905_valid :
    mulPoly ep_Q2_008_coefficient_09_0905
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0906 : Poly :=
[
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 906 for generator 9. -/
def ep_Q2_008_partial_09_0906 : Poly :=
[
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 9. -/
theorem ep_Q2_008_partial_09_0906_valid :
    mulPoly ep_Q2_008_coefficient_09_0906
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0907 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 907 for generator 9. -/
def ep_Q2_008_partial_09_0907 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 9. -/
theorem ep_Q2_008_partial_09_0907_valid :
    mulPoly ep_Q2_008_coefficient_09_0907
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0908 : Poly :=
[
  term ((197156973790214464695742476025914626879989 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 9. -/
def ep_Q2_008_partial_09_0908 : Poly :=
[
  term ((197156973790214464695742476025914626879989 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-197156973790214464695742476025914626879989 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 9. -/
theorem ep_Q2_008_partial_09_0908_valid :
    mulPoly ep_Q2_008_coefficient_09_0908
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0909 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 909 for generator 9. -/
def ep_Q2_008_partial_09_0909 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 9. -/
theorem ep_Q2_008_partial_09_0909_valid :
    mulPoly ep_Q2_008_coefficient_09_0909
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0910 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 910 for generator 9. -/
def ep_Q2_008_partial_09_0910 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 9. -/
theorem ep_Q2_008_partial_09_0910_valid :
    mulPoly ep_Q2_008_coefficient_09_0910
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0911 : Poly :=
[
  term ((4244765494801986000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 911 for generator 9. -/
def ep_Q2_008_partial_09_0911 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 9. -/
theorem ep_Q2_008_partial_09_0911_valid :
    mulPoly ep_Q2_008_coefficient_09_0911
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0912 : Poly :=
[
  term ((2138463824825831481761922030461018486400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 912 for generator 9. -/
def ep_Q2_008_partial_09_0912 : Poly :=
[
  term ((4276927649651662963523844060922036972800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2138463824825831481761922030461018486400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 9. -/
theorem ep_Q2_008_partial_09_0912_valid :
    mulPoly ep_Q2_008_coefficient_09_0912
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0913 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 913 for generator 9. -/
def ep_Q2_008_partial_09_0913 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 9. -/
theorem ep_Q2_008_partial_09_0913_valid :
    mulPoly ep_Q2_008_coefficient_09_0913
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0914 : Poly :=
[
  term ((11911384284348060000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 914 for generator 9. -/
def ep_Q2_008_partial_09_0914 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 9. -/
theorem ep_Q2_008_partial_09_0914_valid :
    mulPoly ep_Q2_008_coefficient_09_0914
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0915 : Poly :=
[
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 915 for generator 9. -/
def ep_Q2_008_partial_09_0915 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 9. -/
theorem ep_Q2_008_partial_09_0915_valid :
    mulPoly ep_Q2_008_coefficient_09_0915
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0916 : Poly :=
[
  term ((-85190996300630286291972058323856124416575 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 916 for generator 9. -/
def ep_Q2_008_partial_09_0916 : Poly :=
[
  term ((-85190996300630286291972058323856124416575 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((85190996300630286291972058323856124416575 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 9. -/
theorem ep_Q2_008_partial_09_0916_valid :
    mulPoly ep_Q2_008_coefficient_09_0916
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0917 : Poly :=
[
  term ((-23820232855230000 : Rat) / 692956453614176359) [(6, 2), (11, 2), (16, 1)]
]

/-- Partial product 917 for generator 9. -/
def ep_Q2_008_partial_09_0917 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 9. -/
theorem ep_Q2_008_partial_09_0917_valid :
    mulPoly ep_Q2_008_coefficient_09_0917
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0918 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 918 for generator 9. -/
def ep_Q2_008_partial_09_0918 : Poly :=
[
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 9. -/
theorem ep_Q2_008_partial_09_0918_valid :
    mulPoly ep_Q2_008_coefficient_09_0918
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0919 : Poly :=
[
  term ((-2693196095107305970356650126160980971943313 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 9. -/
def ep_Q2_008_partial_09_0919 : Poly :=
[
  term ((-2693196095107305970356650126160980971943313 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((2693196095107305970356650126160980971943313 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 9. -/
theorem ep_Q2_008_partial_09_0919_valid :
    mulPoly ep_Q2_008_coefficient_09_0919
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0920 : Poly :=
[
  term ((17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 920 for generator 9. -/
def ep_Q2_008_partial_09_0920 : Poly :=
[
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 9. -/
theorem ep_Q2_008_partial_09_0920_valid :
    mulPoly ep_Q2_008_coefficient_09_0920
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0921 : Poly :=
[
  term ((-2827094575080504877389767939517676071000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (15, 2), (16, 1)]
]

/-- Partial product 921 for generator 9. -/
def ep_Q2_008_partial_09_0921 : Poly :=
[
  term ((-5654189150161009754779535879035352142000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((2827094575080504877389767939517676071000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 9. -/
theorem ep_Q2_008_partial_09_0921_valid :
    mulPoly ep_Q2_008_coefficient_09_0921
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0922 : Poly :=
[
  term ((536810985436078593 : Rat) / 1385912907228352718) [(6, 2), (16, 1)]
]

/-- Partial product 922 for generator 9. -/
def ep_Q2_008_partial_09_0922 : Poly :=
[
  term ((536810985436078593 : Rat) / 692956453614176359) [(2, 1), (6, 2), (16, 1)],
  term ((-536810985436078593 : Rat) / 1385912907228352718) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 9. -/
theorem ep_Q2_008_partial_09_0922_valid :
    mulPoly ep_Q2_008_coefficient_09_0922
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0923 : Poly :=
[
  term ((6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 923 for generator 9. -/
def ep_Q2_008_partial_09_0923 : Poly :=
[
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 9. -/
theorem ep_Q2_008_partial_09_0923_valid :
    mulPoly ep_Q2_008_coefficient_09_0923
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0924 : Poly :=
[
  term ((-7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 924 for generator 9. -/
def ep_Q2_008_partial_09_0924 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 9. -/
theorem ep_Q2_008_partial_09_0924_valid :
    mulPoly ep_Q2_008_coefficient_09_0924
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0925 : Poly :=
[
  term ((-11720797822035450 : Rat) / 692956453614176359) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 925 for generator 9. -/
def ep_Q2_008_partial_09_0925 : Poly :=
[
  term ((-23441595644070900 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((11720797822035450 : Rat) / 692956453614176359) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 9. -/
theorem ep_Q2_008_partial_09_0925_valid :
    mulPoly ep_Q2_008_coefficient_09_0925
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0926 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 926 for generator 9. -/
def ep_Q2_008_partial_09_0926 : Poly :=
[
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 9. -/
theorem ep_Q2_008_partial_09_0926_valid :
    mulPoly ep_Q2_008_coefficient_09_0926
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0927 : Poly :=
[
  term ((203578093336142124692953855957591200000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 927 for generator 9. -/
def ep_Q2_008_partial_09_0927 : Poly :=
[
  term ((407156186672284249385907711915182400000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203578093336142124692953855957591200000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 9. -/
theorem ep_Q2_008_partial_09_0927_valid :
    mulPoly ep_Q2_008_coefficient_09_0927
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0928 : Poly :=
[
  term ((1350607202891541000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 928 for generator 9. -/
def ep_Q2_008_partial_09_0928 : Poly :=
[
  term ((2701214405783082000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1350607202891541000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 9. -/
theorem ep_Q2_008_partial_09_0928_valid :
    mulPoly ep_Q2_008_coefficient_09_0928
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0929 : Poly :=
[
  term ((14095430747573597842287813225695354041875 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 929 for generator 9. -/
def ep_Q2_008_partial_09_0929 : Poly :=
[
  term ((14095430747573597842287813225695354041875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14095430747573597842287813225695354041875 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 9. -/
theorem ep_Q2_008_partial_09_0929_valid :
    mulPoly ep_Q2_008_coefficient_09_0929
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0930 : Poly :=
[
  term ((2064944907243875648226205373613873696000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 930 for generator 9. -/
def ep_Q2_008_partial_09_0930 : Poly :=
[
  term ((4129889814487751296452410747227747392000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2064944907243875648226205373613873696000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 9. -/
theorem ep_Q2_008_partial_09_0930_valid :
    mulPoly ep_Q2_008_coefficient_09_0930
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0931 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 931 for generator 9. -/
def ep_Q2_008_partial_09_0931 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 9. -/
theorem ep_Q2_008_partial_09_0931_valid :
    mulPoly ep_Q2_008_coefficient_09_0931
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0932 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 932 for generator 9. -/
def ep_Q2_008_partial_09_0932 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 9. -/
theorem ep_Q2_008_partial_09_0932_valid :
    mulPoly ep_Q2_008_coefficient_09_0932
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0933 : Poly :=
[
  term ((2043023310276787125 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 933 for generator 9. -/
def ep_Q2_008_partial_09_0933 : Poly :=
[
  term ((2043023310276787125 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2043023310276787125 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 9. -/
theorem ep_Q2_008_partial_09_0933_valid :
    mulPoly ep_Q2_008_coefficient_09_0933
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0934 : Poly :=
[
  term ((-95967581761754383858659831279086080178400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 934 for generator 9. -/
def ep_Q2_008_partial_09_0934 : Poly :=
[
  term ((-191935163523508767717319662558172160356800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((95967581761754383858659831279086080178400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 9. -/
theorem ep_Q2_008_partial_09_0934_valid :
    mulPoly ep_Q2_008_coefficient_09_0934
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0935 : Poly :=
[
  term ((29858120355967511621633232207113376000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 935 for generator 9. -/
def ep_Q2_008_partial_09_0935 : Poly :=
[
  term ((59716240711935023243266464414226752000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-29858120355967511621633232207113376000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 9. -/
theorem ep_Q2_008_partial_09_0935_valid :
    mulPoly ep_Q2_008_coefficient_09_0935
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0936 : Poly :=
[
  term ((-65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 936 for generator 9. -/
def ep_Q2_008_partial_09_0936 : Poly :=
[
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 9. -/
theorem ep_Q2_008_partial_09_0936_valid :
    mulPoly ep_Q2_008_coefficient_09_0936
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0937 : Poly :=
[
  term ((10720245855913254000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 937 for generator 9. -/
def ep_Q2_008_partial_09_0937 : Poly :=
[
  term ((21440491711826508000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-10720245855913254000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 9. -/
theorem ep_Q2_008_partial_09_0937_valid :
    mulPoly ep_Q2_008_coefficient_09_0937
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0938 : Poly :=
[
  term ((887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 938 for generator 9. -/
def ep_Q2_008_partial_09_0938 : Poly :=
[
  term ((1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 9. -/
theorem ep_Q2_008_partial_09_0938_valid :
    mulPoly ep_Q2_008_coefficient_09_0938
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0939 : Poly :=
[
  term ((-2382660944541147258413929859536475182125 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 939 for generator 9. -/
def ep_Q2_008_partial_09_0939 : Poly :=
[
  term ((-2382660944541147258413929859536475182125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2382660944541147258413929859536475182125 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 9. -/
theorem ep_Q2_008_partial_09_0939_valid :
    mulPoly ep_Q2_008_coefficient_09_0939
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0940 : Poly :=
[
  term ((-7919595848260702125 : Rat) / 5543651628913410872) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 940 for generator 9. -/
def ep_Q2_008_partial_09_0940 : Poly :=
[
  term ((-7919595848260702125 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((7919595848260702125 : Rat) / 5543651628913410872) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 9. -/
theorem ep_Q2_008_partial_09_0940_valid :
    mulPoly ep_Q2_008_coefficient_09_0940
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0941 : Poly :=
[
  term ((88286811238529659802701816320159190800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 941 for generator 9. -/
def ep_Q2_008_partial_09_0941 : Poly :=
[
  term ((176573622477059319605403632640318381600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88286811238529659802701816320159190800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 9. -/
theorem ep_Q2_008_partial_09_0941_valid :
    mulPoly ep_Q2_008_coefficient_09_0941
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0942 : Poly :=
[
  term ((-18919723418674427157 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 942 for generator 9. -/
def ep_Q2_008_partial_09_0942 : Poly :=
[
  term ((-18919723418674427157 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((18919723418674427157 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 9. -/
theorem ep_Q2_008_partial_09_0942_valid :
    mulPoly ep_Q2_008_coefficient_09_0942
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0943 : Poly :=
[
  term ((-632322629537619243736104676982718196113945 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 943 for generator 9. -/
def ep_Q2_008_partial_09_0943 : Poly :=
[
  term ((-632322629537619243736104676982718196113945 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((632322629537619243736104676982718196113945 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 9. -/
theorem ep_Q2_008_partial_09_0943_valid :
    mulPoly ep_Q2_008_coefficient_09_0943
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0944 : Poly :=
[
  term ((-13825257909492239719898799349728360000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 944 for generator 9. -/
def ep_Q2_008_partial_09_0944 : Poly :=
[
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((13825257909492239719898799349728360000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 9. -/
theorem ep_Q2_008_partial_09_0944_valid :
    mulPoly ep_Q2_008_coefficient_09_0944
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0945 : Poly :=
[
  term ((-934071915154356040519529527822342713180387 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 945 for generator 9. -/
def ep_Q2_008_partial_09_0945 : Poly :=
[
  term ((-934071915154356040519529527822342713180387 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((934071915154356040519529527822342713180387 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 9. -/
theorem ep_Q2_008_partial_09_0945_valid :
    mulPoly ep_Q2_008_coefficient_09_0945
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0946 : Poly :=
[
  term ((75575417658089672817461846421266400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 946 for generator 9. -/
def ep_Q2_008_partial_09_0946 : Poly :=
[
  term ((151150835316179345634923692842532800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-75575417658089672817461846421266400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 9. -/
theorem ep_Q2_008_partial_09_0946_valid :
    mulPoly ep_Q2_008_coefficient_09_0946
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0947 : Poly :=
[
  term ((1297158052355908055173951526928957484701 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 947 for generator 9. -/
def ep_Q2_008_partial_09_0947 : Poly :=
[
  term ((1297158052355908055173951526928957484701 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1297158052355908055173951526928957484701 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 9. -/
theorem ep_Q2_008_partial_09_0947_valid :
    mulPoly ep_Q2_008_coefficient_09_0947
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0948 : Poly :=
[
  term ((374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 948 for generator 9. -/
def ep_Q2_008_partial_09_0948 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 9. -/
theorem ep_Q2_008_partial_09_0948_valid :
    mulPoly ep_Q2_008_coefficient_09_0948
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0949 : Poly :=
[
  term ((-1352526240858442317 : Rat) / 44349213031307286976) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 949 for generator 9. -/
def ep_Q2_008_partial_09_0949 : Poly :=
[
  term ((-1352526240858442317 : Rat) / 22174606515653643488) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1352526240858442317 : Rat) / 44349213031307286976) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 9. -/
theorem ep_Q2_008_partial_09_0949_valid :
    mulPoly ep_Q2_008_coefficient_09_0949
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0950 : Poly :=
[
  term ((-631805415721164778226195378332482673688757 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 950 for generator 9. -/
def ep_Q2_008_partial_09_0950 : Poly :=
[
  term ((-631805415721164778226195378332482673688757 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((631805415721164778226195378332482673688757 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 9. -/
theorem ep_Q2_008_partial_09_0950_valid :
    mulPoly ep_Q2_008_coefficient_09_0950
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0951 : Poly :=
[
  term ((222156309607798328785008733437524233006515 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 951 for generator 9. -/
def ep_Q2_008_partial_09_0951 : Poly :=
[
  term ((222156309607798328785008733437524233006515 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-222156309607798328785008733437524233006515 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 9. -/
theorem ep_Q2_008_partial_09_0951_valid :
    mulPoly ep_Q2_008_coefficient_09_0951
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0952 : Poly :=
[
  term ((-17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 952 for generator 9. -/
def ep_Q2_008_partial_09_0952 : Poly :=
[
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 9. -/
theorem ep_Q2_008_partial_09_0952_valid :
    mulPoly ep_Q2_008_coefficient_09_0952
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0953 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 4), (16, 1)]
]

/-- Partial product 953 for generator 9. -/
def ep_Q2_008_partial_09_0953 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 9. -/
theorem ep_Q2_008_partial_09_0953_valid :
    mulPoly ep_Q2_008_coefficient_09_0953
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0954 : Poly :=
[
  term ((2554572896850671361 : Rat) / 11087303257826821744) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 954 for generator 9. -/
def ep_Q2_008_partial_09_0954 : Poly :=
[
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (13, 3), (16, 1)],
  term ((-2554572896850671361 : Rat) / 11087303257826821744) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 9. -/
theorem ep_Q2_008_partial_09_0954_valid :
    mulPoly ep_Q2_008_coefficient_09_0954
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0955 : Poly :=
[
  term ((3225893512214855934643053181603284000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 955 for generator 9. -/
def ep_Q2_008_partial_09_0955 : Poly :=
[
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-3225893512214855934643053181603284000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 9. -/
theorem ep_Q2_008_partial_09_0955_valid :
    mulPoly ep_Q2_008_coefficient_09_0955
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0956 : Poly :=
[
  term ((4971695171707786133592469748330311512084825 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 956 for generator 9. -/
def ep_Q2_008_partial_09_0956 : Poly :=
[
  term ((4971695171707786133592469748330311512084825 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4971695171707786133592469748330311512084825 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 9. -/
theorem ep_Q2_008_partial_09_0956_valid :
    mulPoly ep_Q2_008_coefficient_09_0956
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0957 : Poly :=
[
  term ((197162773065207311440683128127186665097589 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 957 for generator 9. -/
def ep_Q2_008_partial_09_0957 : Poly :=
[
  term ((197162773065207311440683128127186665097589 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-197162773065207311440683128127186665097589 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 9. -/
theorem ep_Q2_008_partial_09_0957_valid :
    mulPoly ep_Q2_008_coefficient_09_0957
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0958 : Poly :=
[
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 958 for generator 9. -/
def ep_Q2_008_partial_09_0958 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4244765494801986000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 9. -/
theorem ep_Q2_008_partial_09_0958_valid :
    mulPoly ep_Q2_008_coefficient_09_0958
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0959 : Poly :=
[
  term ((-2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 959 for generator 9. -/
def ep_Q2_008_partial_09_0959 : Poly :=
[
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 9. -/
theorem ep_Q2_008_partial_09_0959_valid :
    mulPoly ep_Q2_008_coefficient_09_0959
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0960 : Poly :=
[
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 960 for generator 9. -/
def ep_Q2_008_partial_09_0960 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 9. -/
theorem ep_Q2_008_partial_09_0960_valid :
    mulPoly ep_Q2_008_coefficient_09_0960
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0961 : Poly :=
[
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 961 for generator 9. -/
def ep_Q2_008_partial_09_0961 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 9. -/
theorem ep_Q2_008_partial_09_0961_valid :
    mulPoly ep_Q2_008_coefficient_09_0961
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0962 : Poly :=
[
  term ((25891905370046625 : Rat) / 2771825814456705436) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 962 for generator 9. -/
def ep_Q2_008_partial_09_0962 : Poly :=
[
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 2771825814456705436) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 9. -/
theorem ep_Q2_008_partial_09_0962_valid :
    mulPoly ep_Q2_008_coefficient_09_0962
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0963 : Poly :=
[
  term ((639133319734967353963029970835030400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 963 for generator 9. -/
def ep_Q2_008_partial_09_0963 : Poly :=
[
  term ((1278266639469934707926059941670060800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-639133319734967353963029970835030400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 9. -/
theorem ep_Q2_008_partial_09_0963_valid :
    mulPoly ep_Q2_008_coefficient_09_0963
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0964 : Poly :=
[
  term ((-380763187764576574220733424731696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 964 for generator 9. -/
def ep_Q2_008_partial_09_0964 : Poly :=
[
  term ((-761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((380763187764576574220733424731696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 9. -/
theorem ep_Q2_008_partial_09_0964_valid :
    mulPoly ep_Q2_008_coefficient_09_0964
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0965 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 965 for generator 9. -/
def ep_Q2_008_partial_09_0965 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 9. -/
theorem ep_Q2_008_partial_09_0965_valid :
    mulPoly ep_Q2_008_coefficient_09_0965
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0966 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 966 for generator 9. -/
def ep_Q2_008_partial_09_0966 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 9. -/
theorem ep_Q2_008_partial_09_0966_valid :
    mulPoly ep_Q2_008_coefficient_09_0966
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0967 : Poly :=
[
  term ((-45830923077788731646457412221086400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 967 for generator 9. -/
def ep_Q2_008_partial_09_0967 : Poly :=
[
  term ((-91661846155577463292914824442172800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((45830923077788731646457412221086400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 9. -/
theorem ep_Q2_008_partial_09_0967_valid :
    mulPoly ep_Q2_008_coefficient_09_0967
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0968 : Poly :=
[
  term ((6287873216020438449 : Rat) / 2771825814456705436) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 968 for generator 9. -/
def ep_Q2_008_partial_09_0968 : Poly :=
[
  term ((6287873216020438449 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((-6287873216020438449 : Rat) / 2771825814456705436) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 9. -/
theorem ep_Q2_008_partial_09_0968_valid :
    mulPoly ep_Q2_008_coefficient_09_0968
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0969 : Poly :=
[
  term ((2604839036181394639762329934369130107854909 : Rat) / 674830407405318061502963313035932218791992) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 969 for generator 9. -/
def ep_Q2_008_partial_09_0969 : Poly :=
[
  term ((2604839036181394639762329934369130107854909 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2604839036181394639762329934369130107854909 : Rat) / 674830407405318061502963313035932218791992) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 9. -/
theorem ep_Q2_008_partial_09_0969_valid :
    mulPoly ep_Q2_008_coefficient_09_0969
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0970 : Poly :=
[
  term ((16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 970 for generator 9. -/
def ep_Q2_008_partial_09_0970 : Poly :=
[
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 9. -/
theorem ep_Q2_008_partial_09_0970_valid :
    mulPoly ep_Q2_008_coefficient_09_0970
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0971 : Poly :=
[
  term ((-17389182775901891176116171826843110883200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 971 for generator 9. -/
def ep_Q2_008_partial_09_0971 : Poly :=
[
  term ((-34778365551803782352232343653686221766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((17389182775901891176116171826843110883200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 9. -/
theorem ep_Q2_008_partial_09_0971_valid :
    mulPoly ep_Q2_008_coefficient_09_0971
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0972 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 972 for generator 9. -/
def ep_Q2_008_partial_09_0972 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 9. -/
theorem ep_Q2_008_partial_09_0972_valid :
    mulPoly ep_Q2_008_coefficient_09_0972
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0973 : Poly :=
[
  term ((3284450867379434607 : Rat) / 2771825814456705436) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 973 for generator 9. -/
def ep_Q2_008_partial_09_0973 : Poly :=
[
  term ((3284450867379434607 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((-3284450867379434607 : Rat) / 2771825814456705436) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 9. -/
theorem ep_Q2_008_partial_09_0973_valid :
    mulPoly ep_Q2_008_coefficient_09_0973
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0974 : Poly :=
[
  term ((16679154235202422197863397018778094400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 974 for generator 9. -/
def ep_Q2_008_partial_09_0974 : Poly :=
[
  term ((33358308470404844395726794037556188800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-16679154235202422197863397018778094400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 9. -/
theorem ep_Q2_008_partial_09_0974_valid :
    mulPoly ep_Q2_008_coefficient_09_0974
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0975 : Poly :=
[
  term ((10097160053075446956578424538168677094800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 975 for generator 9. -/
def ep_Q2_008_partial_09_0975 : Poly :=
[
  term ((20194320106150893913156849076337354189600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-10097160053075446956578424538168677094800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 9. -/
theorem ep_Q2_008_partial_09_0975_valid :
    mulPoly ep_Q2_008_coefficient_09_0975
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0976 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 4), (16, 1)]
]

/-- Partial product 976 for generator 9. -/
def ep_Q2_008_partial_09_0976 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (15, 4), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 9. -/
theorem ep_Q2_008_partial_09_0976_valid :
    mulPoly ep_Q2_008_coefficient_09_0976
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0977 : Poly :=
[
  term ((-24587041284884823693 : Rat) / 11087303257826821744) [(7, 2), (16, 1)]
]

/-- Partial product 977 for generator 9. -/
def ep_Q2_008_partial_09_0977 : Poly :=
[
  term ((-24587041284884823693 : Rat) / 5543651628913410872) [(2, 1), (7, 2), (16, 1)],
  term ((24587041284884823693 : Rat) / 11087303257826821744) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 9. -/
theorem ep_Q2_008_partial_09_0977_valid :
    mulPoly ep_Q2_008_coefficient_09_0977
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0978 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 978 for generator 9. -/
def ep_Q2_008_partial_09_0978 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 9. -/
theorem ep_Q2_008_partial_09_0978_valid :
    mulPoly ep_Q2_008_coefficient_09_0978
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0979 : Poly :=
[
  term ((31368451427259380109053615473344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 979 for generator 9. -/
def ep_Q2_008_partial_09_0979 : Poly :=
[
  term ((62736902854518760218107230946688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-31368451427259380109053615473344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 9. -/
theorem ep_Q2_008_partial_09_0979_valid :
    mulPoly ep_Q2_008_coefficient_09_0979
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0980 : Poly :=
[
  term ((-407903180914677849765015113283758400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 980 for generator 9. -/
def ep_Q2_008_partial_09_0980 : Poly :=
[
  term ((-815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((407903180914677849765015113283758400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 9. -/
theorem ep_Q2_008_partial_09_0980_valid :
    mulPoly ep_Q2_008_coefficient_09_0980
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0981 : Poly :=
[
  term ((-222094170047318778704165009041728051636915 : Rat) / 168707601851329515375740828258983054697998) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 981 for generator 9. -/
def ep_Q2_008_partial_09_0981 : Poly :=
[
  term ((-222094170047318778704165009041728051636915 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((222094170047318778704165009041728051636915 : Rat) / 168707601851329515375740828258983054697998) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 9. -/
theorem ep_Q2_008_partial_09_0981_valid :
    mulPoly ep_Q2_008_coefficient_09_0981
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0982 : Poly :=
[
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 982 for generator 9. -/
def ep_Q2_008_partial_09_0982 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 9. -/
theorem ep_Q2_008_partial_09_0982_valid :
    mulPoly ep_Q2_008_coefficient_09_0982
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0983 : Poly :=
[
  term ((-197162616180317801959381422481997803814389 : Rat) / 674830407405318061502963313035932218791992) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 983 for generator 9. -/
def ep_Q2_008_partial_09_0983 : Poly :=
[
  term ((-197162616180317801959381422481997803814389 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((197162616180317801959381422481997803814389 : Rat) / 674830407405318061502963313035932218791992) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 9. -/
theorem ep_Q2_008_partial_09_0983_valid :
    mulPoly ep_Q2_008_coefficient_09_0983
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0984 : Poly :=
[
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 984 for generator 9. -/
def ep_Q2_008_partial_09_0984 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 9. -/
theorem ep_Q2_008_partial_09_0984_valid :
    mulPoly ep_Q2_008_coefficient_09_0984
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0985 : Poly :=
[
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (15, 2), (16, 1)]
]

/-- Partial product 985 for generator 9. -/
def ep_Q2_008_partial_09_0985 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)],
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 9. -/
theorem ep_Q2_008_partial_09_0985_valid :
    mulPoly ep_Q2_008_coefficient_09_0985
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0986 : Poly :=
[
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 986 for generator 9. -/
def ep_Q2_008_partial_09_0986 : Poly :=
[
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 9. -/
theorem ep_Q2_008_partial_09_0986_valid :
    mulPoly ep_Q2_008_coefficient_09_0986
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0987 : Poly :=
[
  term ((234997830172389375 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 987 for generator 9. -/
def ep_Q2_008_partial_09_0987 : Poly :=
[
  term ((234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 9. -/
theorem ep_Q2_008_partial_09_0987_valid :
    mulPoly ep_Q2_008_coefficient_09_0987
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0988 : Poly :=
[
  term ((-9401705205466248492946354933213778960175 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 988 for generator 9. -/
def ep_Q2_008_partial_09_0988 : Poly :=
[
  term ((-9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9401705205466248492946354933213778960175 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 9. -/
theorem ep_Q2_008_partial_09_0988_valid :
    mulPoly ep_Q2_008_coefficient_09_0988
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0989 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 989 for generator 9. -/
def ep_Q2_008_partial_09_0989 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 9. -/
theorem ep_Q2_008_partial_09_0989_valid :
    mulPoly ep_Q2_008_coefficient_09_0989
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0990 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 990 for generator 9. -/
def ep_Q2_008_partial_09_0990 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 9. -/
theorem ep_Q2_008_partial_09_0990_valid :
    mulPoly ep_Q2_008_coefficient_09_0990
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0991 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 991 for generator 9. -/
def ep_Q2_008_partial_09_0991 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 9. -/
theorem ep_Q2_008_partial_09_0991_valid :
    mulPoly ep_Q2_008_coefficient_09_0991
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0992 : Poly :=
[
  term ((1593290228901889761065399365995951571875 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 992 for generator 9. -/
def ep_Q2_008_partial_09_0992 : Poly :=
[
  term ((1593290228901889761065399365995951571875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1593290228901889761065399365995951571875 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 9. -/
theorem ep_Q2_008_partial_09_0992_valid :
    mulPoly ep_Q2_008_coefficient_09_0992
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0993 : Poly :=
[
  term ((-7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 993 for generator 9. -/
def ep_Q2_008_partial_09_0993 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 9. -/
theorem ep_Q2_008_partial_09_0993_valid :
    mulPoly ep_Q2_008_coefficient_09_0993
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0994 : Poly :=
[
  term ((-3183574121101489500 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 994 for generator 9. -/
def ep_Q2_008_partial_09_0994 : Poly :=
[
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3183574121101489500 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 9. -/
theorem ep_Q2_008_partial_09_0994_valid :
    mulPoly ep_Q2_008_coefficient_09_0994
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0995 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 995 for generator 9. -/
def ep_Q2_008_partial_09_0995 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 9. -/
theorem ep_Q2_008_partial_09_0995_valid :
    mulPoly ep_Q2_008_coefficient_09_0995
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0996 : Poly :=
[
  term ((-1259813979283863497159077562513693594311875 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 996 for generator 9. -/
def ep_Q2_008_partial_09_0996 : Poly :=
[
  term ((-1259813979283863497159077562513693594311875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1259813979283863497159077562513693594311875 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 9. -/
theorem ep_Q2_008_partial_09_0996_valid :
    mulPoly ep_Q2_008_coefficient_09_0996
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0997 : Poly :=
[
  term ((516909321843418868019260241799653966882000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 997 for generator 9. -/
def ep_Q2_008_partial_09_0997 : Poly :=
[
  term ((1033818643686837736038520483599307933764000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-516909321843418868019260241799653966882000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 9. -/
theorem ep_Q2_008_partial_09_0997_valid :
    mulPoly ep_Q2_008_coefficient_09_0997
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0998 : Poly :=
[
  term ((-266113930420728389730651142961941171200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 998 for generator 9. -/
def ep_Q2_008_partial_09_0998 : Poly :=
[
  term ((-532227860841456779461302285923882342400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((266113930420728389730651142961941171200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 9. -/
theorem ep_Q2_008_partial_09_0998_valid :
    mulPoly ep_Q2_008_coefficient_09_0998
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0999 : Poly :=
[
  term ((-156731268718749375 : Rat) / 692956453614176359) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 999 for generator 9. -/
def ep_Q2_008_partial_09_0999 : Poly :=
[
  term ((-313462537437498750 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (16, 1)],
  term ((156731268718749375 : Rat) / 692956453614176359) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 9. -/
theorem ep_Q2_008_partial_09_0999_valid :
    mulPoly ep_Q2_008_coefficient_09_0999
        ep_Q2_008_generator_09_0900_0999 =
      ep_Q2_008_partial_09_0999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0900_0999 : List Poly :=
[
  ep_Q2_008_partial_09_0900,
  ep_Q2_008_partial_09_0901,
  ep_Q2_008_partial_09_0902,
  ep_Q2_008_partial_09_0903,
  ep_Q2_008_partial_09_0904,
  ep_Q2_008_partial_09_0905,
  ep_Q2_008_partial_09_0906,
  ep_Q2_008_partial_09_0907,
  ep_Q2_008_partial_09_0908,
  ep_Q2_008_partial_09_0909,
  ep_Q2_008_partial_09_0910,
  ep_Q2_008_partial_09_0911,
  ep_Q2_008_partial_09_0912,
  ep_Q2_008_partial_09_0913,
  ep_Q2_008_partial_09_0914,
  ep_Q2_008_partial_09_0915,
  ep_Q2_008_partial_09_0916,
  ep_Q2_008_partial_09_0917,
  ep_Q2_008_partial_09_0918,
  ep_Q2_008_partial_09_0919,
  ep_Q2_008_partial_09_0920,
  ep_Q2_008_partial_09_0921,
  ep_Q2_008_partial_09_0922,
  ep_Q2_008_partial_09_0923,
  ep_Q2_008_partial_09_0924,
  ep_Q2_008_partial_09_0925,
  ep_Q2_008_partial_09_0926,
  ep_Q2_008_partial_09_0927,
  ep_Q2_008_partial_09_0928,
  ep_Q2_008_partial_09_0929,
  ep_Q2_008_partial_09_0930,
  ep_Q2_008_partial_09_0931,
  ep_Q2_008_partial_09_0932,
  ep_Q2_008_partial_09_0933,
  ep_Q2_008_partial_09_0934,
  ep_Q2_008_partial_09_0935,
  ep_Q2_008_partial_09_0936,
  ep_Q2_008_partial_09_0937,
  ep_Q2_008_partial_09_0938,
  ep_Q2_008_partial_09_0939,
  ep_Q2_008_partial_09_0940,
  ep_Q2_008_partial_09_0941,
  ep_Q2_008_partial_09_0942,
  ep_Q2_008_partial_09_0943,
  ep_Q2_008_partial_09_0944,
  ep_Q2_008_partial_09_0945,
  ep_Q2_008_partial_09_0946,
  ep_Q2_008_partial_09_0947,
  ep_Q2_008_partial_09_0948,
  ep_Q2_008_partial_09_0949,
  ep_Q2_008_partial_09_0950,
  ep_Q2_008_partial_09_0951,
  ep_Q2_008_partial_09_0952,
  ep_Q2_008_partial_09_0953,
  ep_Q2_008_partial_09_0954,
  ep_Q2_008_partial_09_0955,
  ep_Q2_008_partial_09_0956,
  ep_Q2_008_partial_09_0957,
  ep_Q2_008_partial_09_0958,
  ep_Q2_008_partial_09_0959,
  ep_Q2_008_partial_09_0960,
  ep_Q2_008_partial_09_0961,
  ep_Q2_008_partial_09_0962,
  ep_Q2_008_partial_09_0963,
  ep_Q2_008_partial_09_0964,
  ep_Q2_008_partial_09_0965,
  ep_Q2_008_partial_09_0966,
  ep_Q2_008_partial_09_0967,
  ep_Q2_008_partial_09_0968,
  ep_Q2_008_partial_09_0969,
  ep_Q2_008_partial_09_0970,
  ep_Q2_008_partial_09_0971,
  ep_Q2_008_partial_09_0972,
  ep_Q2_008_partial_09_0973,
  ep_Q2_008_partial_09_0974,
  ep_Q2_008_partial_09_0975,
  ep_Q2_008_partial_09_0976,
  ep_Q2_008_partial_09_0977,
  ep_Q2_008_partial_09_0978,
  ep_Q2_008_partial_09_0979,
  ep_Q2_008_partial_09_0980,
  ep_Q2_008_partial_09_0981,
  ep_Q2_008_partial_09_0982,
  ep_Q2_008_partial_09_0983,
  ep_Q2_008_partial_09_0984,
  ep_Q2_008_partial_09_0985,
  ep_Q2_008_partial_09_0986,
  ep_Q2_008_partial_09_0987,
  ep_Q2_008_partial_09_0988,
  ep_Q2_008_partial_09_0989,
  ep_Q2_008_partial_09_0990,
  ep_Q2_008_partial_09_0991,
  ep_Q2_008_partial_09_0992,
  ep_Q2_008_partial_09_0993,
  ep_Q2_008_partial_09_0994,
  ep_Q2_008_partial_09_0995,
  ep_Q2_008_partial_09_0996,
  ep_Q2_008_partial_09_0997,
  ep_Q2_008_partial_09_0998,
  ep_Q2_008_partial_09_0999
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0900_0999 : Poly :=
[
  term ((62554836379172966607 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2579766108764853581226883753304734084045683 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((80784914751761107956335945918015514307200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((5036284380365407729 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (16, 1)],
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((197156973790214464695742476025914626879989 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (7, 2), (15, 2), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4276927649651662963523844060922036972800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-85190996300630286291972058323856124416575 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2693196095107305970356650126160980971943313 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5654189150161009754779535879035352142000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((536810985436078593 : Rat) / 692956453614176359) [(2, 1), (6, 2), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((407156186672284249385907711915182400000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2701214405783082000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((14095430747573597842287813225695354041875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4129889814487751296452410747227747392000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2043023310276787125 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-191935163523508767717319662558172160356800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((59716240711935023243266464414226752000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((21440491711826508000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2382660944541147258413929859536475182125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7919595848260702125 : Rat) / 2771825814456705436) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((176573622477059319605403632640318381600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18919723418674427157 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-632322629537619243736104676982718196113945 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-934071915154356040519529527822342713180387 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((151150835316179345634923692842532800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1297158052355908055173951526928957484701 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1352526240858442317 : Rat) / 22174606515653643488) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-631805415721164778226195378332482673688757 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((222156309607798328785008733437524233006515 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (13, 3), (16, 1)],
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((4971695171707786133592469748330311512084825 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((197162773065207311440683128127186665097589 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1278266639469934707926059941670060800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-91661846155577463292914824442172800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((6287873216020438449 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((2604839036181394639762329934369130107854909 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-34778365551803782352232343653686221766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((3284450867379434607 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((33358308470404844395726794037556188800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((20194320106150893913156849076337354189600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (15, 4), (16, 1)],
  term ((-24587041284884823693 : Rat) / 5543651628913410872) [(2, 1), (7, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((62736902854518760218107230946688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-222094170047318778704165009041728051636915 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((-197162616180317801959381422481997803814389 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)],
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 2771825814456705436) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1593290228901889761065399365995951571875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1259813979283863497159077562513693594311875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1033818643686837736038520483599307933764000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-532227860841456779461302285923882342400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-313462537437498750 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (16, 1)],
  term ((-62554836379172966607 : Rat) / 11087303257826821744) [(6, 1), (13, 2), (16, 1)],
  term ((2100732665413044334359506443020729561600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((2579766108764853581226883753304734084045683 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (15, 2), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 4), (16, 1)],
  term ((-5036284380365407729 : Rat) / 2771825814456705436) [(6, 1), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197156973790214464695742476025914626879989 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2138463824825831481761922030461018486400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((85190996300630286291972058323856124416575 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(6, 2), (11, 2), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((2693196095107305970356650126160980971943313 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((2827094575080504877389767939517676071000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (15, 2), (16, 1)],
  term ((-536810985436078593 : Rat) / 1385912907228352718) [(6, 2), (16, 1)],
  term ((-6514498986756547990174523390642918400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((11720797822035450 : Rat) / 692956453614176359) [(7, 1), (9, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-203578093336142124692953855957591200000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1350607202891541000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-14095430747573597842287813225695354041875 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2064944907243875648226205373613873696000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2043023310276787125 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((95967581761754383858659831279086080178400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29858120355967511621633232207113376000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10720245855913254000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((2382660944541147258413929859536475182125 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((7919595848260702125 : Rat) / 5543651628913410872) [(7, 1), (11, 1), (16, 1)],
  term ((-88286811238529659802701816320159190800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((18919723418674427157 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((632322629537619243736104676982718196113945 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((13825257909492239719898799349728360000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((934071915154356040519529527822342713180387 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75575417658089672817461846421266400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1297158052355908055173951526928957484701 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((1352526240858442317 : Rat) / 44349213031307286976) [(7, 1), (13, 1), (16, 1)],
  term ((631805415721164778226195378332482673688757 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-222156309607798328785008733437524233006515 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-2554572896850671361 : Rat) / 11087303257826821744) [(7, 1), (13, 3), (16, 1)],
  term ((-3225893512214855934643053181603284000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-4971695171707786133592469748330311512084825 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)],
  term ((-197162773065207311440683128127186665097589 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (15, 3), (16, 1)],
  term ((4244765494801986000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-25891905370046625 : Rat) / 2771825814456705436) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-639133319734967353963029970835030400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((380763187764576574220733424731696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((45830923077788731646457412221086400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6287873216020438449 : Rat) / 2771825814456705436) [(7, 2), (12, 1), (16, 1)],
  term ((-2604839036181394639762329934369130107854909 : Rat) / 674830407405318061502963313035932218791992) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((17389182775901891176116171826843110883200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-3284450867379434607 : Rat) / 2771825814456705436) [(7, 2), (13, 2), (16, 1)],
  term ((-16679154235202422197863397018778094400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-10097160053075446956578424538168677094800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 4), (16, 1)],
  term ((24587041284884823693 : Rat) / 11087303257826821744) [(7, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-31368451427259380109053615473344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((407903180914677849765015113283758400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((222094170047318778704165009041728051636915 : Rat) / 168707601851329515375740828258983054697998) [(7, 3), (13, 2), (15, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)],
  term ((197162616180317801959381422481997803814389 : Rat) / 674830407405318061502963313035932218791992) [(7, 3), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 2), (15, 2), (16, 1)],
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (15, 2), (16, 1)],
  term ((234997830172389375 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (16, 1)],
  term ((9401705205466248492946354933213778960175 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(9, 1), (13, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1593290228901889761065399365995951571875 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (15, 1), (16, 1)],
  term ((7211590875067853645831163630020016702600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 3), (16, 1)],
  term ((3183574121101489500 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (16, 1)],
  term ((1259813979283863497159077562513693594311875 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-516909321843418868019260241799653966882000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((266113930420728389730651142961941171200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((156731268718749375 : Rat) / 692956453614176359) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 900 through 999. -/
theorem ep_Q2_008_block_09_0900_0999_valid :
    checkProductSumEq ep_Q2_008_partials_09_0900_0999
      ep_Q2_008_block_09_0900_0999 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
