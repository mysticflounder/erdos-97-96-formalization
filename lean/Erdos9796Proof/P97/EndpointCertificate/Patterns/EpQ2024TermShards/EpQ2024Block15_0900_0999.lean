/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:900-999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0900 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 900 for generator 15. -/
def ep_Q2_024_partial_15_0900 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 15. -/
theorem ep_Q2_024_partial_15_0900_valid :
    mulPoly ep_Q2_024_coefficient_15_0900
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0901 : Poly :=
[
  term ((-2113589838824883 : Rat) / 1162780221153193) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 901 for generator 15. -/
def ep_Q2_024_partial_15_0901 : Poly :=
[
  term ((-4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 15. -/
theorem ep_Q2_024_partial_15_0901_valid :
    mulPoly ep_Q2_024_coefficient_15_0901
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0902 : Poly :=
[
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 902 for generator 15. -/
def ep_Q2_024_partial_15_0902 : Poly :=
[
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 15. -/
theorem ep_Q2_024_partial_15_0902_valid :
    mulPoly ep_Q2_024_coefficient_15_0902
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0903 : Poly :=
[
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 903 for generator 15. -/
def ep_Q2_024_partial_15_0903 : Poly :=
[
  term ((363244002760710 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 15. -/
theorem ep_Q2_024_partial_15_0903_valid :
    mulPoly ep_Q2_024_coefficient_15_0903
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0904 : Poly :=
[
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 3)]
]

/-- Partial product 904 for generator 15. -/
def ep_Q2_024_partial_15_0904 : Poly :=
[
  term ((48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 3)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 15. -/
theorem ep_Q2_024_partial_15_0904_valid :
    mulPoly ep_Q2_024_coefficient_15_0904
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0905 : Poly :=
[
  term ((-56273638672983279363033069646225863144356466757879902863 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 905 for generator 15. -/
def ep_Q2_024_partial_15_0905 : Poly :=
[
  term ((-56273638672983279363033069646225863144356466757879902863 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((56273638672983279363033069646225863144356466757879902863 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 15. -/
theorem ep_Q2_024_partial_15_0905_valid :
    mulPoly ep_Q2_024_coefficient_15_0905
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0906 : Poly :=
[
  term ((6076602153499266 : Rat) / 1162780221153193) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 906 for generator 15. -/
def ep_Q2_024_partial_15_0906 : Poly :=
[
  term ((12153204306998532 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6076602153499266 : Rat) / 1162780221153193) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 15. -/
theorem ep_Q2_024_partial_15_0906_valid :
    mulPoly ep_Q2_024_coefficient_15_0906
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0907 : Poly :=
[
  term ((-3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 907 for generator 15. -/
def ep_Q2_024_partial_15_0907 : Poly :=
[
  term ((-7927195666314199722503393139576614669726528195562845696 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 15. -/
theorem ep_Q2_024_partial_15_0907_valid :
    mulPoly ep_Q2_024_coefficient_15_0907
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0908 : Poly :=
[
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 15. -/
def ep_Q2_024_partial_15_0908 : Poly :=
[
  term ((-13402833302322904 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 15. -/
theorem ep_Q2_024_partial_15_0908_valid :
    mulPoly ep_Q2_024_coefficient_15_0908
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0909 : Poly :=
[
  term ((-352220725969930974002566683494399009507 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 1)]
]

/-- Partial product 909 for generator 15. -/
def ep_Q2_024_partial_15_0909 : Poly :=
[
  term ((-352220725969930974002566683494399009507 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1)],
  term ((352220725969930974002566683494399009507 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 15. -/
theorem ep_Q2_024_partial_15_0909_valid :
    mulPoly ep_Q2_024_coefficient_15_0909
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0910 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 910 for generator 15. -/
def ep_Q2_024_partial_15_0910 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 15. -/
theorem ep_Q2_024_partial_15_0910_valid :
    mulPoly ep_Q2_024_coefficient_15_0910
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0911 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 911 for generator 15. -/
def ep_Q2_024_partial_15_0911 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 15. -/
theorem ep_Q2_024_partial_15_0911_valid :
    mulPoly ep_Q2_024_coefficient_15_0911
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0912 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 912 for generator 15. -/
def ep_Q2_024_partial_15_0912 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 15. -/
theorem ep_Q2_024_partial_15_0912_valid :
    mulPoly ep_Q2_024_coefficient_15_0912
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0913 : Poly :=
[
  term ((116008772557365504869113237034704302136 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 913 for generator 15. -/
def ep_Q2_024_partial_15_0913 : Poly :=
[
  term ((232017545114731009738226474069408604272 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-116008772557365504869113237034704302136 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 15. -/
theorem ep_Q2_024_partial_15_0913_valid :
    mulPoly ep_Q2_024_coefficient_15_0913
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0914 : Poly :=
[
  term ((-2510868004860108572573074234482135013777840344010940153 : Rat) / 94576164623595235780146450593518565844136924398046920) [(2, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 914 for generator 15. -/
def ep_Q2_024_partial_15_0914 : Poly :=
[
  term ((-2510868004860108572573074234482135013777840344010940153 : Rat) / 47288082311797617890073225296759282922068462199023460) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((2510868004860108572573074234482135013777840344010940153 : Rat) / 94576164623595235780146450593518565844136924398046920) [(2, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 15. -/
theorem ep_Q2_024_partial_15_0914_valid :
    mulPoly ep_Q2_024_coefficient_15_0914
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0915 : Poly :=
[
  term ((15806400591970331 : Rat) / 6976681326919158) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 915 for generator 15. -/
def ep_Q2_024_partial_15_0915 : Poly :=
[
  term ((15806400591970331 : Rat) / 3488340663459579) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15806400591970331 : Rat) / 6976681326919158) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 15. -/
theorem ep_Q2_024_partial_15_0915_valid :
    mulPoly ep_Q2_024_coefficient_15_0915
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0916 : Poly :=
[
  term ((2191484164604204075258967954706664472448 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (8, 1), (9, 2)]
]

/-- Partial product 916 for generator 15. -/
def ep_Q2_024_partial_15_0916 : Poly :=
[
  term ((4382968329208408150517935909413328944896 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (8, 1), (9, 2)],
  term ((-2191484164604204075258967954706664472448 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 15. -/
theorem ep_Q2_024_partial_15_0916_valid :
    mulPoly ep_Q2_024_coefficient_15_0916
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0917 : Poly :=
[
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 917 for generator 15. -/
def ep_Q2_024_partial_15_0917 : Poly :=
[
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 15. -/
theorem ep_Q2_024_partial_15_0917_valid :
    mulPoly ep_Q2_024_coefficient_15_0917
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0918 : Poly :=
[
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 918 for generator 15. -/
def ep_Q2_024_partial_15_0918 : Poly :=
[
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 15. -/
theorem ep_Q2_024_partial_15_0918_valid :
    mulPoly ep_Q2_024_coefficient_15_0918
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0919 : Poly :=
[
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 15. -/
def ep_Q2_024_partial_15_0919 : Poly :=
[
  term ((-673691331644400 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 15. -/
theorem ep_Q2_024_partial_15_0919_valid :
    mulPoly ep_Q2_024_coefficient_15_0919
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0920 : Poly :=
[
  term ((691422193343568100604436588798173513077 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (12, 1)]
]

/-- Partial product 920 for generator 15. -/
def ep_Q2_024_partial_15_0920 : Poly :=
[
  term ((1382844386687136201208873177596347026154 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (12, 1)],
  term ((-691422193343568100604436588798173513077 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 15. -/
theorem ep_Q2_024_partial_15_0920_valid :
    mulPoly ep_Q2_024_coefficient_15_0920
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0921 : Poly :=
[
  term ((269618624255195502633985484927549143256 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 921 for generator 15. -/
def ep_Q2_024_partial_15_0921 : Poly :=
[
  term ((539237248510391005267970969855098286512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-269618624255195502633985484927549143256 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 15. -/
theorem ep_Q2_024_partial_15_0921_valid :
    mulPoly ep_Q2_024_coefficient_15_0921
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0922 : Poly :=
[
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 922 for generator 15. -/
def ep_Q2_024_partial_15_0922 : Poly :=
[
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 15. -/
theorem ep_Q2_024_partial_15_0922_valid :
    mulPoly ep_Q2_024_coefficient_15_0922
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0923 : Poly :=
[
  term ((2556195793603410 : Rat) / 1162780221153193) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 923 for generator 15. -/
def ep_Q2_024_partial_15_0923 : Poly :=
[
  term ((5112391587206820 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2556195793603410 : Rat) / 1162780221153193) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 15. -/
theorem ep_Q2_024_partial_15_0923_valid :
    mulPoly ep_Q2_024_coefficient_15_0923
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0924 : Poly :=
[
  term ((-25008877219186256033938864967567404169364150869650186027 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 924 for generator 15. -/
def ep_Q2_024_partial_15_0924 : Poly :=
[
  term ((-25008877219186256033938864967567404169364150869650186027 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((25008877219186256033938864967567404169364150869650186027 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 15. -/
theorem ep_Q2_024_partial_15_0924_valid :
    mulPoly ep_Q2_024_coefficient_15_0924
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0925 : Poly :=
[
  term ((181622001380355 : Rat) / 2325560442306386) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 925 for generator 15. -/
def ep_Q2_024_partial_15_0925 : Poly :=
[
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 2325560442306386) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 15. -/
theorem ep_Q2_024_partial_15_0925_valid :
    mulPoly ep_Q2_024_coefficient_15_0925
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0926 : Poly :=
[
  term ((12142809715337286394673593689946150678 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (13, 2)]
]

/-- Partial product 926 for generator 15. -/
def ep_Q2_024_partial_15_0926 : Poly :=
[
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((-12142809715337286394673593689946150678 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 15. -/
theorem ep_Q2_024_partial_15_0926_valid :
    mulPoly ep_Q2_024_coefficient_15_0926
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0927 : Poly :=
[
  term ((-582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 1), (14, 1)]
]

/-- Partial product 927 for generator 15. -/
def ep_Q2_024_partial_15_0927 : Poly :=
[
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (14, 1)],
  term ((582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 15. -/
theorem ep_Q2_024_partial_15_0927_valid :
    mulPoly ep_Q2_024_coefficient_15_0927
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0928 : Poly :=
[
  term ((52240334726888648264347311479286806005274305669986112369 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 928 for generator 15. -/
def ep_Q2_024_partial_15_0928 : Poly :=
[
  term ((52240334726888648264347311479286806005274305669986112369 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((-52240334726888648264347311479286806005274305669986112369 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 15. -/
theorem ep_Q2_024_partial_15_0928_valid :
    mulPoly ep_Q2_024_coefficient_15_0928
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0929 : Poly :=
[
  term ((8619849591108805 : Rat) / 2325560442306386) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 929 for generator 15. -/
def ep_Q2_024_partial_15_0929 : Poly :=
[
  term ((8619849591108805 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-8619849591108805 : Rat) / 2325560442306386) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 15. -/
theorem ep_Q2_024_partial_15_0929_valid :
    mulPoly ep_Q2_024_coefficient_15_0929
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0930 : Poly :=
[
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 2)]
]

/-- Partial product 930 for generator 15. -/
def ep_Q2_024_partial_15_0930 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 15. -/
theorem ep_Q2_024_partial_15_0930_valid :
    mulPoly ep_Q2_024_coefficient_15_0930
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0931 : Poly :=
[
  term ((-1474250573171662136763398427212989369582 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 931 for generator 15. -/
def ep_Q2_024_partial_15_0931 : Poly :=
[
  term ((-2948501146343324273526796854425978739164 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((1474250573171662136763398427212989369582 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 15. -/
theorem ep_Q2_024_partial_15_0931_valid :
    mulPoly ep_Q2_024_coefficient_15_0931
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0932 : Poly :=
[
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 932 for generator 15. -/
def ep_Q2_024_partial_15_0932 : Poly :=
[
  term ((-439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 15. -/
theorem ep_Q2_024_partial_15_0932_valid :
    mulPoly ep_Q2_024_coefficient_15_0932
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0933 : Poly :=
[
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 933 for generator 15. -/
def ep_Q2_024_partial_15_0933 : Poly :=
[
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 15. -/
theorem ep_Q2_024_partial_15_0933_valid :
    mulPoly ep_Q2_024_coefficient_15_0933
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0934 : Poly :=
[
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 934 for generator 15. -/
def ep_Q2_024_partial_15_0934 : Poly :=
[
  term ((-3530759285383524 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 15. -/
theorem ep_Q2_024_partial_15_0934_valid :
    mulPoly ep_Q2_024_coefficient_15_0934
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0935 : Poly :=
[
  term ((272261630801851585890398842308891380066474848072624436837 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 935 for generator 15. -/
def ep_Q2_024_partial_15_0935 : Poly :=
[
  term ((272261630801851585890398842308891380066474848072624436837 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-272261630801851585890398842308891380066474848072624436837 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 15. -/
theorem ep_Q2_024_partial_15_0935_valid :
    mulPoly ep_Q2_024_coefficient_15_0935
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0936 : Poly :=
[
  term ((-36867640731136237 : Rat) / 6976681326919158) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 936 for generator 15. -/
def ep_Q2_024_partial_15_0936 : Poly :=
[
  term ((-36867640731136237 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((36867640731136237 : Rat) / 6976681326919158) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 15. -/
theorem ep_Q2_024_partial_15_0936_valid :
    mulPoly ep_Q2_024_coefficient_15_0936
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0937 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 937 for generator 15. -/
def ep_Q2_024_partial_15_0937 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 15. -/
theorem ep_Q2_024_partial_15_0937_valid :
    mulPoly ep_Q2_024_coefficient_15_0937
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0938 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 938 for generator 15. -/
def ep_Q2_024_partial_15_0938 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 15. -/
theorem ep_Q2_024_partial_15_0938_valid :
    mulPoly ep_Q2_024_coefficient_15_0938
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0939 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 939 for generator 15. -/
def ep_Q2_024_partial_15_0939 : Poly :=
[
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 15. -/
theorem ep_Q2_024_partial_15_0939_valid :
    mulPoly ep_Q2_024_coefficient_15_0939
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0940 : Poly :=
[
  term ((1969246301471167696903005722874255432968 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 940 for generator 15. -/
def ep_Q2_024_partial_15_0940 : Poly :=
[
  term ((3938492602942335393806011445748510865936 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-1969246301471167696903005722874255432968 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 15. -/
theorem ep_Q2_024_partial_15_0940_valid :
    mulPoly ep_Q2_024_coefficient_15_0940
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0941 : Poly :=
[
  term ((937164302464487755093447994734864220704 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 941 for generator 15. -/
def ep_Q2_024_partial_15_0941 : Poly :=
[
  term ((1874328604928975510186895989469728441408 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-937164302464487755093447994734864220704 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 15. -/
theorem ep_Q2_024_partial_15_0941_valid :
    mulPoly ep_Q2_024_coefficient_15_0941
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0942 : Poly :=
[
  term ((14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 942 for generator 15. -/
def ep_Q2_024_partial_15_0942 : Poly :=
[
  term ((28393035203547033181534834890405869550913424918825034734 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 15. -/
theorem ep_Q2_024_partial_15_0942_valid :
    mulPoly ep_Q2_024_coefficient_15_0942
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0943 : Poly :=
[
  term ((-5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 943 for generator 15. -/
def ep_Q2_024_partial_15_0943 : Poly :=
[
  term ((-10733439429933688 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 15. -/
theorem ep_Q2_024_partial_15_0943_valid :
    mulPoly ep_Q2_024_coefficient_15_0943
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0944 : Poly :=
[
  term ((-125411188093252645883642527405808099285437091398798636633 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 944 for generator 15. -/
def ep_Q2_024_partial_15_0944 : Poly :=
[
  term ((-125411188093252645883642527405808099285437091398798636633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((125411188093252645883642527405808099285437091398798636633 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 15. -/
theorem ep_Q2_024_partial_15_0944_valid :
    mulPoly ep_Q2_024_coefficient_15_0944
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0945 : Poly :=
[
  term ((72911375474888665 : Rat) / 13953362653838316) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 945 for generator 15. -/
def ep_Q2_024_partial_15_0945 : Poly :=
[
  term ((72911375474888665 : Rat) / 6976681326919158) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-72911375474888665 : Rat) / 13953362653838316) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 15. -/
theorem ep_Q2_024_partial_15_0945_valid :
    mulPoly ep_Q2_024_coefficient_15_0945
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0946 : Poly :=
[
  term ((4707728099281208945359286275272609727109 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (9, 2)]
]

/-- Partial product 946 for generator 15. -/
def ep_Q2_024_partial_15_0946 : Poly :=
[
  term ((9415456198562417890718572550545219454218 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (6, 1), (9, 2)],
  term ((-4707728099281208945359286275272609727109 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 15. -/
theorem ep_Q2_024_partial_15_0946_valid :
    mulPoly ep_Q2_024_coefficient_15_0946
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0947 : Poly :=
[
  term ((-820140819764862348992220425754067357198 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (12, 1)]
]

/-- Partial product 947 for generator 15. -/
def ep_Q2_024_partial_15_0947 : Poly :=
[
  term ((-1640281639529724697984440851508134714396 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 2), (12, 1)],
  term ((820140819764862348992220425754067357198 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 15. -/
theorem ep_Q2_024_partial_15_0947_valid :
    mulPoly ep_Q2_024_coefficient_15_0947
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0948 : Poly :=
[
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 948 for generator 15. -/
def ep_Q2_024_partial_15_0948 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 15. -/
theorem ep_Q2_024_partial_15_0948_valid :
    mulPoly ep_Q2_024_coefficient_15_0948
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0949 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (9, 2), (12, 1), (15, 2)]
]

/-- Partial product 949 for generator 15. -/
def ep_Q2_024_partial_15_0949 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 15. -/
theorem ep_Q2_024_partial_15_0949_valid :
    mulPoly ep_Q2_024_coefficient_15_0949
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0950 : Poly :=
[
  term ((-527210767274432 : Rat) / 1162780221153193) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 950 for generator 15. -/
def ep_Q2_024_partial_15_0950 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 15. -/
theorem ep_Q2_024_partial_15_0950_valid :
    mulPoly ep_Q2_024_coefficient_15_0950
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0951 : Poly :=
[
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 951 for generator 15. -/
def ep_Q2_024_partial_15_0951 : Poly :=
[
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 15. -/
theorem ep_Q2_024_partial_15_0951_valid :
    mulPoly ep_Q2_024_coefficient_15_0951
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0952 : Poly :=
[
  term ((5094646267068265 : Rat) / 3488340663459579) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 952 for generator 15. -/
def ep_Q2_024_partial_15_0952 : Poly :=
[
  term ((10189292534136530 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 15. -/
theorem ep_Q2_024_partial_15_0952_valid :
    mulPoly ep_Q2_024_coefficient_15_0952
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0953 : Poly :=
[
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (13, 2)]
]

/-- Partial product 953 for generator 15. -/
def ep_Q2_024_partial_15_0953 : Poly :=
[
  term ((-1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 2), (13, 2)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 15. -/
theorem ep_Q2_024_partial_15_0953_valid :
    mulPoly ep_Q2_024_coefficient_15_0953
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0954 : Poly :=
[
  term ((8227203597110644789992755642975584242193 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (14, 1)]
]

/-- Partial product 954 for generator 15. -/
def ep_Q2_024_partial_15_0954 : Poly :=
[
  term ((16454407194221289579985511285951168484386 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 2), (14, 1)],
  term ((-8227203597110644789992755642975584242193 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 15. -/
theorem ep_Q2_024_partial_15_0954_valid :
    mulPoly ep_Q2_024_coefficient_15_0954
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0955 : Poly :=
[
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 1), (9, 2), (15, 2)]
]

/-- Partial product 955 for generator 15. -/
def ep_Q2_024_partial_15_0955 : Poly :=
[
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (15, 2)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 15. -/
theorem ep_Q2_024_partial_15_0955_valid :
    mulPoly ep_Q2_024_coefficient_15_0955
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0956 : Poly :=
[
  term ((-16856913734998261 : Rat) / 3488340663459579) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 956 for generator 15. -/
def ep_Q2_024_partial_15_0956 : Poly :=
[
  term ((-33713827469996522 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((16856913734998261 : Rat) / 3488340663459579) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 15. -/
theorem ep_Q2_024_partial_15_0956_valid :
    mulPoly ep_Q2_024_coefficient_15_0956
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0957 : Poly :=
[
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 3), (13, 1)]
]

/-- Partial product 957 for generator 15. -/
def ep_Q2_024_partial_15_0957 : Poly :=
[
  term ((-161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 3), (13, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 15. -/
theorem ep_Q2_024_partial_15_0957_valid :
    mulPoly ep_Q2_024_coefficient_15_0957
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0958 : Poly :=
[
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(2, 1), (9, 3), (15, 1)]
]

/-- Partial product 958 for generator 15. -/
def ep_Q2_024_partial_15_0958 : Poly :=
[
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (6, 1), (9, 3), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(2, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 15. -/
theorem ep_Q2_024_partial_15_0958_valid :
    mulPoly ep_Q2_024_coefficient_15_0958
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0959 : Poly :=
[
  term ((-373787112386234 : Rat) / 3488340663459579) [(2, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 959 for generator 15. -/
def ep_Q2_024_partial_15_0959 : Poly :=
[
  term ((-747574224772468 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(2, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 15. -/
theorem ep_Q2_024_partial_15_0959_valid :
    mulPoly ep_Q2_024_coefficient_15_0959
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0960 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 4)]
]

/-- Partial product 960 for generator 15. -/
def ep_Q2_024_partial_15_0960 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 4)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 15. -/
theorem ep_Q2_024_partial_15_0960_valid :
    mulPoly ep_Q2_024_coefficient_15_0960
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0961 : Poly :=
[
  term ((-609052208986979577768070632581164427144 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1)]
]

/-- Partial product 961 for generator 15. -/
def ep_Q2_024_partial_15_0961 : Poly :=
[
  term ((-1218104417973959155536141265162328854288 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1)],
  term ((609052208986979577768070632581164427144 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 15. -/
theorem ep_Q2_024_partial_15_0961_valid :
    mulPoly ep_Q2_024_coefficient_15_0961
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0962 : Poly :=
[
  term ((64290986984796941447914931990336566557255587653994423809 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 962 for generator 15. -/
def ep_Q2_024_partial_15_0962 : Poly :=
[
  term ((64290986984796941447914931990336566557255587653994423809 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-64290986984796941447914931990336566557255587653994423809 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 15. -/
theorem ep_Q2_024_partial_15_0962_valid :
    mulPoly ep_Q2_024_coefficient_15_0962
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0963 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 963 for generator 15. -/
def ep_Q2_024_partial_15_0963 : Poly :=
[
  term ((-363244002760710 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 15. -/
theorem ep_Q2_024_partial_15_0963_valid :
    mulPoly ep_Q2_024_coefficient_15_0963
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0964 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1), (13, 2)]
]

/-- Partial product 964 for generator 15. -/
def ep_Q2_024_partial_15_0964 : Poly :=
[
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 15. -/
theorem ep_Q2_024_partial_15_0964_valid :
    mulPoly ep_Q2_024_coefficient_15_0964
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0965 : Poly :=
[
  term ((549952858623279886185430516086658091149 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1), (14, 1)]
]

/-- Partial product 965 for generator 15. -/
def ep_Q2_024_partial_15_0965 : Poly :=
[
  term ((1099905717246559772370861032173316182298 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-549952858623279886185430516086658091149 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 15. -/
theorem ep_Q2_024_partial_15_0965_valid :
    mulPoly ep_Q2_024_coefficient_15_0965
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0966 : Poly :=
[
  term ((-11451656269022023287361960941626224885055724794126819463 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 966 for generator 15. -/
def ep_Q2_024_partial_15_0966 : Poly :=
[
  term ((-11451656269022023287361960941626224885055724794126819463 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((11451656269022023287361960941626224885055724794126819463 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 15. -/
theorem ep_Q2_024_partial_15_0966_valid :
    mulPoly ep_Q2_024_coefficient_15_0966
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0967 : Poly :=
[
  term ((2904405989736531 : Rat) / 1162780221153193) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 967 for generator 15. -/
def ep_Q2_024_partial_15_0967 : Poly :=
[
  term ((5808811979473062 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2904405989736531 : Rat) / 1162780221153193) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 15. -/
theorem ep_Q2_024_partial_15_0967_valid :
    mulPoly ep_Q2_024_coefficient_15_0967
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0968 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 2)]
]

/-- Partial product 968 for generator 15. -/
def ep_Q2_024_partial_15_0968 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (12, 2)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 15. -/
theorem ep_Q2_024_partial_15_0968_valid :
    mulPoly ep_Q2_024_coefficient_15_0968
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0969 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 969 for generator 15. -/
def ep_Q2_024_partial_15_0969 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 15. -/
theorem ep_Q2_024_partial_15_0969_valid :
    mulPoly ep_Q2_024_coefficient_15_0969
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0970 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (12, 2), (15, 2)]
]

/-- Partial product 970 for generator 15. -/
def ep_Q2_024_partial_15_0970 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (12, 2), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 15. -/
theorem ep_Q2_024_partial_15_0970_valid :
    mulPoly ep_Q2_024_coefficient_15_0970
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0971 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 971 for generator 15. -/
def ep_Q2_024_partial_15_0971 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 15. -/
theorem ep_Q2_024_partial_15_0971_valid :
    mulPoly ep_Q2_024_coefficient_15_0971
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0972 : Poly :=
[
  term ((112967151582938680547148441811729209971442455155447697 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 972 for generator 15. -/
def ep_Q2_024_partial_15_0972 : Poly :=
[
  term ((112967151582938680547148441811729209971442455155447697 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-112967151582938680547148441811729209971442455155447697 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 15. -/
theorem ep_Q2_024_partial_15_0972_valid :
    mulPoly ep_Q2_024_coefficient_15_0972
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0973 : Poly :=
[
  term ((-2000660399310798 : Rat) / 1162780221153193) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 973 for generator 15. -/
def ep_Q2_024_partial_15_0973 : Poly :=
[
  term ((-4001320798621596 : Rat) / 1162780221153193) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2000660399310798 : Rat) / 1162780221153193) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 15. -/
theorem ep_Q2_024_partial_15_0973_valid :
    mulPoly ep_Q2_024_coefficient_15_0973
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0974 : Poly :=
[
  term ((-63975858663202624139008248689357262676493964862522252289 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 974 for generator 15. -/
def ep_Q2_024_partial_15_0974 : Poly :=
[
  term ((-63975858663202624139008248689357262676493964862522252289 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((63975858663202624139008248689357262676493964862522252289 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 15. -/
theorem ep_Q2_024_partial_15_0974_valid :
    mulPoly ep_Q2_024_coefficient_15_0974
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0975 : Poly :=
[
  term ((181622001380355 : Rat) / 2325560442306386) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 975 for generator 15. -/
def ep_Q2_024_partial_15_0975 : Poly :=
[
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 2325560442306386) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 15. -/
theorem ep_Q2_024_partial_15_0975_valid :
    mulPoly ep_Q2_024_coefficient_15_0975
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0976 : Poly :=
[
  term ((12142809715337286394673593689946150678 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2)]
]

/-- Partial product 976 for generator 15. -/
def ep_Q2_024_partial_15_0976 : Poly :=
[
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (13, 2)],
  term ((-12142809715337286394673593689946150678 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 15. -/
theorem ep_Q2_024_partial_15_0976_valid :
    mulPoly ep_Q2_024_coefficient_15_0976
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0977 : Poly :=
[
  term ((22722217012135043140485213256852048400 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (13, 2), (14, 1)]
]

/-- Partial product 977 for generator 15. -/
def ep_Q2_024_partial_15_0977 : Poly :=
[
  term ((45444434024270086280970426513704096800 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((-22722217012135043140485213256852048400 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 15. -/
theorem ep_Q2_024_partial_15_0977_valid :
    mulPoly ep_Q2_024_coefficient_15_0977
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0978 : Poly :=
[
  term ((-1354032167221214965196826186849813754067 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (14, 1)]
]

/-- Partial product 978 for generator 15. -/
def ep_Q2_024_partial_15_0978 : Poly :=
[
  term ((-1354032167221214965196826186849813754067 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (14, 1)],
  term ((1354032167221214965196826186849813754067 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 15. -/
theorem ep_Q2_024_partial_15_0978_valid :
    mulPoly ep_Q2_024_coefficient_15_0978
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0979 : Poly :=
[
  term ((13059328412756167799683482513619663544033761218365756009 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (14, 1), (15, 2)]
]

/-- Partial product 979 for generator 15. -/
def ep_Q2_024_partial_15_0979 : Poly :=
[
  term ((13059328412756167799683482513619663544033761218365756009 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((-13059328412756167799683482513619663544033761218365756009 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 15. -/
theorem ep_Q2_024_partial_15_0979_valid :
    mulPoly ep_Q2_024_coefficient_15_0979
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0980 : Poly :=
[
  term ((-1066547664529894 : Rat) / 1162780221153193) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 980 for generator 15. -/
def ep_Q2_024_partial_15_0980 : Poly :=
[
  term ((-2133095329059788 : Rat) / 1162780221153193) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1066547664529894 : Rat) / 1162780221153193) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 15. -/
theorem ep_Q2_024_partial_15_0980_valid :
    mulPoly ep_Q2_024_coefficient_15_0980
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0981 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 2)]
]

/-- Partial product 981 for generator 15. -/
def ep_Q2_024_partial_15_0981 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (14, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 15. -/
theorem ep_Q2_024_partial_15_0981_valid :
    mulPoly ep_Q2_024_coefficient_15_0981
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0982 : Poly :=
[
  term ((33240472933056869824789334397690153489535913104114462709 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(2, 1), (15, 2)]
]

/-- Partial product 982 for generator 15. -/
def ep_Q2_024_partial_15_0982 : Poly :=
[
  term ((33240472933056869824789334397690153489535913104114462709 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (6, 1), (15, 2)],
  term ((-33240472933056869824789334397690153489535913104114462709 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 15. -/
theorem ep_Q2_024_partial_15_0982_valid :
    mulPoly ep_Q2_024_coefficient_15_0982
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0983 : Poly :=
[
  term ((-2113589838824883 : Rat) / 2325560442306386) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 983 for generator 15. -/
def ep_Q2_024_partial_15_0983 : Poly :=
[
  term ((-2113589838824883 : Rat) / 1162780221153193) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 2325560442306386) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 15. -/
theorem ep_Q2_024_partial_15_0983_valid :
    mulPoly ep_Q2_024_coefficient_15_0983
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0984 : Poly :=
[
  term ((27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 2)]
]

/-- Partial product 984 for generator 15. -/
def ep_Q2_024_partial_15_0984 : Poly :=
[
  term ((-27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 2)],
  term ((54794774110243944184967625465000829738 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 15. -/
theorem ep_Q2_024_partial_15_0984_valid :
    mulPoly ep_Q2_024_coefficient_15_0984
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0985 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (9, 1)]
]

/-- Partial product 985 for generator 15. -/
def ep_Q2_024_partial_15_0985 : Poly :=
[
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 15. -/
theorem ep_Q2_024_partial_15_0985_valid :
    mulPoly ep_Q2_024_coefficient_15_0985
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0986 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1)]
]

/-- Partial product 986 for generator 15. -/
def ep_Q2_024_partial_15_0986 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 15. -/
theorem ep_Q2_024_partial_15_0986_valid :
    mulPoly ep_Q2_024_coefficient_15_0986
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0987 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (13, 1)]
]

/-- Partial product 987 for generator 15. -/
def ep_Q2_024_partial_15_0987 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 15. -/
theorem ep_Q2_024_partial_15_0987_valid :
    mulPoly ep_Q2_024_coefficient_15_0987
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0988 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (15, 1)]
]

/-- Partial product 988 for generator 15. -/
def ep_Q2_024_partial_15_0988 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 15. -/
theorem ep_Q2_024_partial_15_0988_valid :
    mulPoly ep_Q2_024_coefficient_15_0988
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0989 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 989 for generator 15. -/
def ep_Q2_024_partial_15_0989 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 15. -/
theorem ep_Q2_024_partial_15_0989_valid :
    mulPoly ep_Q2_024_coefficient_15_0989
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0990 : Poly :=
[
  term ((94436394451067046656060653807328597532 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1)]
]

/-- Partial product 990 for generator 15. -/
def ep_Q2_024_partial_15_0990 : Poly :=
[
  term ((188872788902134093312121307614657195064 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((-94436394451067046656060653807328597532 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 15. -/
theorem ep_Q2_024_partial_15_0990_valid :
    mulPoly ep_Q2_024_coefficient_15_0990
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0991 : Poly :=
[
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1)]
]

/-- Partial product 991 for generator 15. -/
def ep_Q2_024_partial_15_0991 : Poly :=
[
  term ((2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 15. -/
theorem ep_Q2_024_partial_15_0991_valid :
    mulPoly ep_Q2_024_coefficient_15_0991
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0992 : Poly :=
[
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (15, 1)]
]

/-- Partial product 992 for generator 15. -/
def ep_Q2_024_partial_15_0992 : Poly :=
[
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 15. -/
theorem ep_Q2_024_partial_15_0992_valid :
    mulPoly ep_Q2_024_coefficient_15_0992
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0993 : Poly :=
[
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 993 for generator 15. -/
def ep_Q2_024_partial_15_0993 : Poly :=
[
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 15. -/
theorem ep_Q2_024_partial_15_0993_valid :
    mulPoly ep_Q2_024_coefficient_15_0993
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0994 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1)]
]

/-- Partial product 994 for generator 15. -/
def ep_Q2_024_partial_15_0994 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1), (8, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 15. -/
theorem ep_Q2_024_partial_15_0994_valid :
    mulPoly ep_Q2_024_coefficient_15_0994
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0995 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 995 for generator 15. -/
def ep_Q2_024_partial_15_0995 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 15. -/
theorem ep_Q2_024_partial_15_0995_valid :
    mulPoly ep_Q2_024_coefficient_15_0995
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0996 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 996 for generator 15. -/
def ep_Q2_024_partial_15_0996 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 15. -/
theorem ep_Q2_024_partial_15_0996_valid :
    mulPoly ep_Q2_024_coefficient_15_0996
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0997 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 997 for generator 15. -/
def ep_Q2_024_partial_15_0997 : Poly :=
[
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 15. -/
theorem ep_Q2_024_partial_15_0997_valid :
    mulPoly ep_Q2_024_coefficient_15_0997
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0998 : Poly :=
[
  term ((-2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1)]
]

/-- Partial product 998 for generator 15. -/
def ep_Q2_024_partial_15_0998 : Poly :=
[
  term ((-4913432086816639513447140917883130439336 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 15. -/
theorem ep_Q2_024_partial_15_0998_valid :
    mulPoly ep_Q2_024_coefficient_15_0998
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0999 : Poly :=
[
  term ((-1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (9, 1), (15, 1)]
]

/-- Partial product 999 for generator 15. -/
def ep_Q2_024_partial_15_0999 : Poly :=
[
  term ((-1332660221722390369768035740007759937168019429542401749 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 15. -/
theorem ep_Q2_024_partial_15_0999_valid :
    mulPoly ep_Q2_024_coefficient_15_0999
        ep_Q2_024_generator_15_0900_0999 =
      ep_Q2_024_partial_15_0999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0900_0999 : List Poly :=
[
  ep_Q2_024_partial_15_0900,
  ep_Q2_024_partial_15_0901,
  ep_Q2_024_partial_15_0902,
  ep_Q2_024_partial_15_0903,
  ep_Q2_024_partial_15_0904,
  ep_Q2_024_partial_15_0905,
  ep_Q2_024_partial_15_0906,
  ep_Q2_024_partial_15_0907,
  ep_Q2_024_partial_15_0908,
  ep_Q2_024_partial_15_0909,
  ep_Q2_024_partial_15_0910,
  ep_Q2_024_partial_15_0911,
  ep_Q2_024_partial_15_0912,
  ep_Q2_024_partial_15_0913,
  ep_Q2_024_partial_15_0914,
  ep_Q2_024_partial_15_0915,
  ep_Q2_024_partial_15_0916,
  ep_Q2_024_partial_15_0917,
  ep_Q2_024_partial_15_0918,
  ep_Q2_024_partial_15_0919,
  ep_Q2_024_partial_15_0920,
  ep_Q2_024_partial_15_0921,
  ep_Q2_024_partial_15_0922,
  ep_Q2_024_partial_15_0923,
  ep_Q2_024_partial_15_0924,
  ep_Q2_024_partial_15_0925,
  ep_Q2_024_partial_15_0926,
  ep_Q2_024_partial_15_0927,
  ep_Q2_024_partial_15_0928,
  ep_Q2_024_partial_15_0929,
  ep_Q2_024_partial_15_0930,
  ep_Q2_024_partial_15_0931,
  ep_Q2_024_partial_15_0932,
  ep_Q2_024_partial_15_0933,
  ep_Q2_024_partial_15_0934,
  ep_Q2_024_partial_15_0935,
  ep_Q2_024_partial_15_0936,
  ep_Q2_024_partial_15_0937,
  ep_Q2_024_partial_15_0938,
  ep_Q2_024_partial_15_0939,
  ep_Q2_024_partial_15_0940,
  ep_Q2_024_partial_15_0941,
  ep_Q2_024_partial_15_0942,
  ep_Q2_024_partial_15_0943,
  ep_Q2_024_partial_15_0944,
  ep_Q2_024_partial_15_0945,
  ep_Q2_024_partial_15_0946,
  ep_Q2_024_partial_15_0947,
  ep_Q2_024_partial_15_0948,
  ep_Q2_024_partial_15_0949,
  ep_Q2_024_partial_15_0950,
  ep_Q2_024_partial_15_0951,
  ep_Q2_024_partial_15_0952,
  ep_Q2_024_partial_15_0953,
  ep_Q2_024_partial_15_0954,
  ep_Q2_024_partial_15_0955,
  ep_Q2_024_partial_15_0956,
  ep_Q2_024_partial_15_0957,
  ep_Q2_024_partial_15_0958,
  ep_Q2_024_partial_15_0959,
  ep_Q2_024_partial_15_0960,
  ep_Q2_024_partial_15_0961,
  ep_Q2_024_partial_15_0962,
  ep_Q2_024_partial_15_0963,
  ep_Q2_024_partial_15_0964,
  ep_Q2_024_partial_15_0965,
  ep_Q2_024_partial_15_0966,
  ep_Q2_024_partial_15_0967,
  ep_Q2_024_partial_15_0968,
  ep_Q2_024_partial_15_0969,
  ep_Q2_024_partial_15_0970,
  ep_Q2_024_partial_15_0971,
  ep_Q2_024_partial_15_0972,
  ep_Q2_024_partial_15_0973,
  ep_Q2_024_partial_15_0974,
  ep_Q2_024_partial_15_0975,
  ep_Q2_024_partial_15_0976,
  ep_Q2_024_partial_15_0977,
  ep_Q2_024_partial_15_0978,
  ep_Q2_024_partial_15_0979,
  ep_Q2_024_partial_15_0980,
  ep_Q2_024_partial_15_0981,
  ep_Q2_024_partial_15_0982,
  ep_Q2_024_partial_15_0983,
  ep_Q2_024_partial_15_0984,
  ep_Q2_024_partial_15_0985,
  ep_Q2_024_partial_15_0986,
  ep_Q2_024_partial_15_0987,
  ep_Q2_024_partial_15_0988,
  ep_Q2_024_partial_15_0989,
  ep_Q2_024_partial_15_0990,
  ep_Q2_024_partial_15_0991,
  ep_Q2_024_partial_15_0992,
  ep_Q2_024_partial_15_0993,
  ep_Q2_024_partial_15_0994,
  ep_Q2_024_partial_15_0995,
  ep_Q2_024_partial_15_0996,
  ep_Q2_024_partial_15_0997,
  ep_Q2_024_partial_15_0998,
  ep_Q2_024_partial_15_0999
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0900_0999 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((363244002760710 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 3)],
  term ((-56273638672983279363033069646225863144356466757879902863 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((12153204306998532 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7927195666314199722503393139576614669726528195562845696 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-13402833302322904 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-352220725969930974002566683494399009507 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((232017545114731009738226474069408604272 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-2510868004860108572573074234482135013777840344010940153 : Rat) / 47288082311797617890073225296759282922068462199023460) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((15806400591970331 : Rat) / 3488340663459579) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4382968329208408150517935909413328944896 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (8, 1), (9, 2)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1382844386687136201208873177596347026154 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (12, 1)],
  term ((539237248510391005267970969855098286512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((5112391587206820 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25008877219186256033938864967567404169364150869650186027 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (14, 1)],
  term ((52240334726888648264347311479286806005274305669986112369 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((8619849591108805 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 2)],
  term ((-2948501146343324273526796854425978739164 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3530759285383524 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((272261630801851585890398842308891380066474848072624436837 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-36867640731136237 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3938492602942335393806011445748510865936 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((1874328604928975510186895989469728441408 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((28393035203547033181534834890405869550913424918825034734 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10733439429933688 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125411188093252645883642527405808099285437091398798636633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((72911375474888665 : Rat) / 6976681326919158) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((9415456198562417890718572550545219454218 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (6, 1), (9, 2)],
  term ((-1640281639529724697984440851508134714396 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 2), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((10189292534136530 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 2), (13, 2)],
  term ((16454407194221289579985511285951168484386 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 2), (14, 1)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (15, 2)],
  term ((-33713827469996522 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 3), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (6, 1), (9, 3), (15, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 4)],
  term ((-1218104417973959155536141265162328854288 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1)],
  term ((64290986984796941447914931990336566557255587653994423809 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((1099905717246559772370861032173316182298 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-11451656269022023287361960941626224885055724794126819463 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((5808811979473062 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (12, 2)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (12, 2), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((112967151582938680547148441811729209971442455155447697 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4001320798621596 : Rat) / 1162780221153193) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63975858663202624139008248689357262676493964862522252289 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (13, 2)],
  term ((45444434024270086280970426513704096800 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((-1354032167221214965196826186849813754067 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (14, 1)],
  term ((13059328412756167799683482513619663544033761218365756009 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((-2133095329059788 : Rat) / 1162780221153193) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (14, 2)],
  term ((33240472933056869824789334397690153489535913104114462709 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (6, 1), (15, 2)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 3)],
  term ((56273638672983279363033069646225863144356466757879902863 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-6076602153499266 : Rat) / 1162780221153193) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (7, 1), (15, 1)],
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((352220725969930974002566683494399009507 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-116008772557365504869113237034704302136 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (8, 1), (9, 1), (13, 1)],
  term ((2510868004860108572573074234482135013777840344010940153 : Rat) / 94576164623595235780146450593518565844136924398046920) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-15806400591970331 : Rat) / 6976681326919158) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2191484164604204075258967954706664472448 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (8, 1), (9, 2)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-691422193343568100604436588798173513077 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (12, 1)],
  term ((-269618624255195502633985484927549143256 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2556195793603410 : Rat) / 1162780221153193) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((25008877219186256033938864967567404169364150869650186027 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-181622001380355 : Rat) / 2325560442306386) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12142809715337286394673593689946150678 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (13, 2)],
  term ((582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 1), (14, 1)],
  term ((-52240334726888648264347311479286806005274305669986112369 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 1), (15, 2)],
  term ((-8619849591108805 : Rat) / 2325560442306386) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 2)],
  term ((1474250573171662136763398427212989369582 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-272261630801851585890398842308891380066474848072624436837 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((36867640731136237 : Rat) / 6976681326919158) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1969246301471167696903005722874255432968 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (13, 1)],
  term ((-937164302464487755093447994734864220704 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((125411188093252645883642527405808099285437091398798636633 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 1), (9, 1), (15, 1)],
  term ((-72911375474888665 : Rat) / 13953362653838316) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4707728099281208945359286275272609727109 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (9, 2)],
  term ((820140819764862348992220425754067357198 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (9, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (13, 2)],
  term ((-8227203597110644789992755642975584242193 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (14, 1)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 1), (9, 2), (15, 2)],
  term ((16856913734998261 : Rat) / 3488340663459579) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 3), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(2, 1), (9, 3), (15, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(2, 1), (9, 3), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 4)],
  term ((609052208986979577768070632581164427144 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1)],
  term ((-64290986984796941447914931990336566557255587653994423809 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1), (13, 2)],
  term ((-549952858623279886185430516086658091149 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1), (14, 1)],
  term ((11451656269022023287361960941626224885055724794126819463 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (12, 1), (15, 2)],
  term ((-2904405989736531 : Rat) / 1162780221153193) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 2)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (12, 2), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-112967151582938680547148441811729209971442455155447697 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((2000660399310798 : Rat) / 1162780221153193) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((63975858663202624139008248689357262676493964862522252289 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (13, 1), (15, 1)],
  term ((-181622001380355 : Rat) / 2325560442306386) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12142809715337286394673593689946150678 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2)],
  term ((-22722217012135043140485213256852048400 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (13, 2), (14, 1)],
  term ((1354032167221214965196826186849813754067 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (14, 1)],
  term ((-13059328412756167799683482513619663544033761218365756009 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (14, 1), (15, 2)],
  term ((1066547664529894 : Rat) / 1162780221153193) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 2)],
  term ((-33240472933056869824789334397690153489535913104114462709 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(2, 1), (15, 2)],
  term ((2113589838824883 : Rat) / 2325560442306386) [(2, 1), (15, 2), (16, 1)],
  term ((-27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 2)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (9, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (13, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((54794774110243944184967625465000829738 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1)],
  term ((188872788902134093312121307614657195064 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1), (8, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4913432086816639513447140917883130439336 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((-1332660221722390369768035740007759937168019429542401749 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-94436394451067046656060653807328597532 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (15, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1)],
  term ((1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 900 through 999. -/
theorem ep_Q2_024_block_15_0900_0999_valid :
    checkProductSumEq ep_Q2_024_partials_15_0900_0999
      ep_Q2_024_block_15_0900_0999 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
