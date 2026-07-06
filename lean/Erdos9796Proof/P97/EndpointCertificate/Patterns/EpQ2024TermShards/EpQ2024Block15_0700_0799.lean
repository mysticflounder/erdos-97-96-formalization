/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0700 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 3), (15, 1)]
]

/-- Partial product 700 for generator 15. -/
def ep_Q2_024_partial_15_0700 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (6, 1), (12, 3), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 15. -/
theorem ep_Q2_024_partial_15_0700_valid :
    mulPoly ep_Q2_024_coefficient_15_0700
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0701 : Poly :=
[
  term ((-5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 701 for generator 15. -/
def ep_Q2_024_partial_15_0701 : Poly :=
[
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 15. -/
theorem ep_Q2_024_partial_15_0701_valid :
    mulPoly ep_Q2_024_coefficient_15_0701
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0702 : Poly :=
[
  term ((370315927423382885391950958321325355729 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (13, 1)]
]

/-- Partial product 702 for generator 15. -/
def ep_Q2_024_partial_15_0702 : Poly :=
[
  term ((370315927423382885391950958321325355729 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1)],
  term ((-370315927423382885391950958321325355729 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 15. -/
theorem ep_Q2_024_partial_15_0702_valid :
    mulPoly ep_Q2_024_coefficient_15_0702
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0703 : Poly :=
[
  term ((-1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 703 for generator 15. -/
def ep_Q2_024_partial_15_0703 : Poly :=
[
  term ((-2481346288346526588270837002331912378436 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 15. -/
theorem ep_Q2_024_partial_15_0703_valid :
    mulPoly ep_Q2_024_coefficient_15_0703
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0704 : Poly :=
[
  term ((-2128620369344284153808329397490462196754710909787227916 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 704 for generator 15. -/
def ep_Q2_024_partial_15_0704 : Poly :=
[
  term ((-4257240738688568307616658794980924393509421819574455832 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((2128620369344284153808329397490462196754710909787227916 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 15. -/
theorem ep_Q2_024_partial_15_0704_valid :
    mulPoly ep_Q2_024_coefficient_15_0704
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0705 : Poly :=
[
  term ((1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 705 for generator 15. -/
def ep_Q2_024_partial_15_0705 : Poly :=
[
  term ((2463931916166432 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 15. -/
theorem ep_Q2_024_partial_15_0705_valid :
    mulPoly ep_Q2_024_coefficient_15_0705
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0706 : Poly :=
[
  term ((2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 706 for generator 15. -/
def ep_Q2_024_partial_15_0706 : Poly :=
[
  term ((5196140706424565759545785675052583399584 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 15. -/
theorem ep_Q2_024_partial_15_0706_valid :
    mulPoly ep_Q2_024_coefficient_15_0706
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0707 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 3)]
]

/-- Partial product 707 for generator 15. -/
def ep_Q2_024_partial_15_0707 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 3)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 15. -/
theorem ep_Q2_024_partial_15_0707_valid :
    mulPoly ep_Q2_024_coefficient_15_0707
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0708 : Poly :=
[
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 708 for generator 15. -/
def ep_Q2_024_partial_15_0708 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 15. -/
theorem ep_Q2_024_partial_15_0708_valid :
    mulPoly ep_Q2_024_coefficient_15_0708
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0709 : Poly :=
[
  term ((-224563777214800 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 709 for generator 15. -/
def ep_Q2_024_partial_15_0709 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((224563777214800 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 15. -/
theorem ep_Q2_024_partial_15_0709_valid :
    mulPoly ep_Q2_024_coefficient_15_0709
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0710 : Poly :=
[
  term ((2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 710 for generator 15. -/
def ep_Q2_024_partial_15_0710 : Poly :=
[
  term ((4633881870105264614105561717474528149133005252184189608 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 15. -/
theorem ep_Q2_024_partial_15_0710_valid :
    mulPoly ep_Q2_024_coefficient_15_0710
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0711 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 711 for generator 15. -/
def ep_Q2_024_partial_15_0711 : Poly :=
[
  term ((-301322371177440 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 15. -/
theorem ep_Q2_024_partial_15_0711_valid :
    mulPoly ep_Q2_024_coefficient_15_0711
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0712 : Poly :=
[
  term ((11651501637049059178385426413555378112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 712 for generator 15. -/
def ep_Q2_024_partial_15_0712 : Poly :=
[
  term ((23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-11651501637049059178385426413555378112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 15. -/
theorem ep_Q2_024_partial_15_0712_valid :
    mulPoly ep_Q2_024_coefficient_15_0712
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0713 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 1)]
]

/-- Partial product 713 for generator 15. -/
def ep_Q2_024_partial_15_0713 : Poly :=
[
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 3), (14, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 15. -/
theorem ep_Q2_024_partial_15_0713_valid :
    mulPoly ep_Q2_024_coefficient_15_0713
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0714 : Poly :=
[
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 714 for generator 15. -/
def ep_Q2_024_partial_15_0714 : Poly :=
[
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 15. -/
theorem ep_Q2_024_partial_15_0714_valid :
    mulPoly ep_Q2_024_coefficient_15_0714
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0715 : Poly :=
[
  term ((-46761063904070125 : Rat) / 4651120884612772) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 715 for generator 15. -/
def ep_Q2_024_partial_15_0715 : Poly :=
[
  term ((-46761063904070125 : Rat) / 2325560442306386) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((46761063904070125 : Rat) / 4651120884612772) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 15. -/
theorem ep_Q2_024_partial_15_0715_valid :
    mulPoly ep_Q2_024_coefficient_15_0715
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0716 : Poly :=
[
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 716 for generator 15. -/
def ep_Q2_024_partial_15_0716 : Poly :=
[
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 15. -/
theorem ep_Q2_024_partial_15_0716_valid :
    mulPoly ep_Q2_024_coefficient_15_0716
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0717 : Poly :=
[
  term ((138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 717 for generator 15. -/
def ep_Q2_024_partial_15_0717 : Poly :=
[
  term ((138348488323751089 : Rat) / 3488340663459579) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 15. -/
theorem ep_Q2_024_partial_15_0717_valid :
    mulPoly ep_Q2_024_coefficient_15_0717
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0718 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 3), (15, 1)]
]

/-- Partial product 718 for generator 15. -/
def ep_Q2_024_partial_15_0718 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 15. -/
theorem ep_Q2_024_partial_15_0718_valid :
    mulPoly ep_Q2_024_coefficient_15_0718
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0719 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 719 for generator 15. -/
def ep_Q2_024_partial_15_0719 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 15. -/
theorem ep_Q2_024_partial_15_0719_valid :
    mulPoly ep_Q2_024_coefficient_15_0719
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0720 : Poly :=
[
  term ((-14930111000563771909392666589219249207504651660907005579 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (15, 1)]
]

/-- Partial product 720 for generator 15. -/
def ep_Q2_024_partial_15_0720 : Poly :=
[
  term ((-14930111000563771909392666589219249207504651660907005579 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (15, 1)],
  term ((14930111000563771909392666589219249207504651660907005579 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 15. -/
theorem ep_Q2_024_partial_15_0720_valid :
    mulPoly ep_Q2_024_coefficient_15_0720
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0721 : Poly :=
[
  term ((1157026536845104 : Rat) / 1162780221153193) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 721 for generator 15. -/
def ep_Q2_024_partial_15_0721 : Poly :=
[
  term ((2314053073690208 : Rat) / 1162780221153193) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1157026536845104 : Rat) / 1162780221153193) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 15. -/
theorem ep_Q2_024_partial_15_0721_valid :
    mulPoly ep_Q2_024_coefficient_15_0721
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0722 : Poly :=
[
  term ((-6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (2, 1)]
]

/-- Partial product 722 for generator 15. -/
def ep_Q2_024_partial_15_0722 : Poly :=
[
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (2, 1)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (2, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 15. -/
theorem ep_Q2_024_partial_15_0722_valid :
    mulPoly ep_Q2_024_coefficient_15_0722
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0723 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (4, 1)]
]

/-- Partial product 723 for generator 15. -/
def ep_Q2_024_partial_15_0723 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (4, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 15. -/
theorem ep_Q2_024_partial_15_0723_valid :
    mulPoly ep_Q2_024_coefficient_15_0723
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0724 : Poly :=
[
  term ((-109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (9, 1)]
]

/-- Partial product 724 for generator 15. -/
def ep_Q2_024_partial_15_0724 : Poly :=
[
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (6, 1), (9, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 15. -/
theorem ep_Q2_024_partial_15_0724_valid :
    mulPoly ep_Q2_024_coefficient_15_0724
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0725 : Poly :=
[
  term ((-154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (13, 1)]
]

/-- Partial product 725 for generator 15. -/
def ep_Q2_024_partial_15_0725 : Poly :=
[
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (6, 1), (13, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 15. -/
theorem ep_Q2_024_partial_15_0725_valid :
    mulPoly ep_Q2_024_coefficient_15_0725
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0726 : Poly :=
[
  term ((4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (2, 1), (5, 1), (15, 1)]
]

/-- Partial product 726 for generator 15. -/
def ep_Q2_024_partial_15_0726 : Poly :=
[
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 15. -/
theorem ep_Q2_024_partial_15_0726_valid :
    mulPoly ep_Q2_024_coefficient_15_0726
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0727 : Poly :=
[
  term ((2019942658614304 : Rat) / 3488340663459579) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 727 for generator 15. -/
def ep_Q2_024_partial_15_0727 : Poly :=
[
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 2), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 15. -/
theorem ep_Q2_024_partial_15_0727_valid :
    mulPoly ep_Q2_024_coefficient_15_0727
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0728 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (8, 1)]
]

/-- Partial product 728 for generator 15. -/
def ep_Q2_024_partial_15_0728 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (6, 1), (8, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 15. -/
theorem ep_Q2_024_partial_15_0728_valid :
    mulPoly ep_Q2_024_coefficient_15_0728
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0729 : Poly :=
[
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (9, 1), (13, 1)]
]

/-- Partial product 729 for generator 15. -/
def ep_Q2_024_partial_15_0729 : Poly :=
[
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 15. -/
theorem ep_Q2_024_partial_15_0729_valid :
    mulPoly ep_Q2_024_coefficient_15_0729
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0730 : Poly :=
[
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 730 for generator 15. -/
def ep_Q2_024_partial_15_0730 : Poly :=
[
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 15. -/
theorem ep_Q2_024_partial_15_0730_valid :
    mulPoly ep_Q2_024_coefficient_15_0730
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0731 : Poly :=
[
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 731 for generator 15. -/
def ep_Q2_024_partial_15_0731 : Poly :=
[
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 15. -/
theorem ep_Q2_024_partial_15_0731_valid :
    mulPoly ep_Q2_024_coefficient_15_0731
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0732 : Poly :=
[
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (9, 2)]
]

/-- Partial product 732 for generator 15. -/
def ep_Q2_024_partial_15_0732 : Poly :=
[
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (6, 1), (9, 2)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 15. -/
theorem ep_Q2_024_partial_15_0732_valid :
    mulPoly ep_Q2_024_coefficient_15_0732
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0733 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (12, 1)]
]

/-- Partial product 733 for generator 15. -/
def ep_Q2_024_partial_15_0733 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (6, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 15. -/
theorem ep_Q2_024_partial_15_0733_valid :
    mulPoly ep_Q2_024_coefficient_15_0733
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0734 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 734 for generator 15. -/
def ep_Q2_024_partial_15_0734 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 15. -/
theorem ep_Q2_024_partial_15_0734_valid :
    mulPoly ep_Q2_024_coefficient_15_0734
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0735 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 1), (12, 1), (15, 2)]
]

/-- Partial product 735 for generator 15. -/
def ep_Q2_024_partial_15_0735 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 15. -/
theorem ep_Q2_024_partial_15_0735_valid :
    mulPoly ep_Q2_024_coefficient_15_0735
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0736 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 736 for generator 15. -/
def ep_Q2_024_partial_15_0736 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 15. -/
theorem ep_Q2_024_partial_15_0736_valid :
    mulPoly ep_Q2_024_coefficient_15_0736
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0737 : Poly :=
[
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

/-- Partial product 737 for generator 15. -/
def ep_Q2_024_partial_15_0737 : Poly :=
[
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 15. -/
theorem ep_Q2_024_partial_15_0737_valid :
    mulPoly ep_Q2_024_coefficient_15_0737
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0738 : Poly :=
[
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 738 for generator 15. -/
def ep_Q2_024_partial_15_0738 : Poly :=
[
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 15. -/
theorem ep_Q2_024_partial_15_0738_valid :
    mulPoly ep_Q2_024_coefficient_15_0738
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0739 : Poly :=
[
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 1), (13, 2)]
]

/-- Partial product 739 for generator 15. -/
def ep_Q2_024_partial_15_0739 : Poly :=
[
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 1), (6, 1), (13, 2)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 15. -/
theorem ep_Q2_024_partial_15_0739_valid :
    mulPoly ep_Q2_024_coefficient_15_0739
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0740 : Poly :=
[
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (14, 1)]
]

/-- Partial product 740 for generator 15. -/
def ep_Q2_024_partial_15_0740 : Poly :=
[
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 15. -/
theorem ep_Q2_024_partial_15_0740_valid :
    mulPoly ep_Q2_024_coefficient_15_0740
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0741 : Poly :=
[
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 1), (15, 2)]
]

/-- Partial product 741 for generator 15. -/
def ep_Q2_024_partial_15_0741 : Poly :=
[
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (15, 2)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 15. -/
theorem ep_Q2_024_partial_15_0741_valid :
    mulPoly ep_Q2_024_coefficient_15_0741
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0742 : Poly :=
[
  term ((4066964546991649 : Rat) / 3488340663459579) [(1, 2), (2, 1), (15, 2), (16, 1)]
]

/-- Partial product 742 for generator 15. -/
def ep_Q2_024_partial_15_0742 : Poly :=
[
  term ((8133929093983298 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 2), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 15. -/
theorem ep_Q2_024_partial_15_0742_valid :
    mulPoly ep_Q2_024_coefficient_15_0742
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0743 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 2)]
]

/-- Partial product 743 for generator 15. -/
def ep_Q2_024_partial_15_0743 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 15. -/
theorem ep_Q2_024_partial_15_0743_valid :
    mulPoly ep_Q2_024_coefficient_15_0743
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0744 : Poly :=
[
  term ((474126838180308352184970268942469465357 : Rat) / 1199709457402477296566693528029539267990) [(2, 1)]
]

/-- Partial product 744 for generator 15. -/
def ep_Q2_024_partial_15_0744 : Poly :=
[
  term ((-474126838180308352184970268942469465357 : Rat) / 1199709457402477296566693528029539267990) [(2, 1)],
  term ((474126838180308352184970268942469465357 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 15. -/
theorem ep_Q2_024_partial_15_0744_valid :
    mulPoly ep_Q2_024_coefficient_15_0744
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0745 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (4, 1), (9, 1)]
]

/-- Partial product 745 for generator 15. -/
def ep_Q2_024_partial_15_0745 : Poly :=
[
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 15. -/
theorem ep_Q2_024_partial_15_0745_valid :
    mulPoly ep_Q2_024_coefficient_15_0745
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0746 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 746 for generator 15. -/
def ep_Q2_024_partial_15_0746 : Poly :=
[
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 15. -/
theorem ep_Q2_024_partial_15_0746_valid :
    mulPoly ep_Q2_024_coefficient_15_0746
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0747 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 747 for generator 15. -/
def ep_Q2_024_partial_15_0747 : Poly :=
[
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 15. -/
theorem ep_Q2_024_partial_15_0747_valid :
    mulPoly ep_Q2_024_coefficient_15_0747
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0748 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 748 for generator 15. -/
def ep_Q2_024_partial_15_0748 : Poly :=
[
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 15. -/
theorem ep_Q2_024_partial_15_0748_valid :
    mulPoly ep_Q2_024_coefficient_15_0748
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0749 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 749 for generator 15. -/
def ep_Q2_024_partial_15_0749 : Poly :=
[
  term ((413883074046464 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 15. -/
theorem ep_Q2_024_partial_15_0749_valid :
    mulPoly ep_Q2_024_coefficient_15_0749
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0750 : Poly :=
[
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 750 for generator 15. -/
def ep_Q2_024_partial_15_0750 : Poly :=
[
  term ((6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 15. -/
theorem ep_Q2_024_partial_15_0750_valid :
    mulPoly ep_Q2_024_coefficient_15_0750
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0751 : Poly :=
[
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 751 for generator 15. -/
def ep_Q2_024_partial_15_0751 : Poly :=
[
  term ((6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 15. -/
theorem ep_Q2_024_partial_15_0751_valid :
    mulPoly ep_Q2_024_coefficient_15_0751
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0752 : Poly :=
[
  term ((-1243911894777184 : Rat) / 3488340663459579) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 752 for generator 15. -/
def ep_Q2_024_partial_15_0752 : Poly :=
[
  term ((-2487823789554368 : Rat) / 3488340663459579) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 15. -/
theorem ep_Q2_024_partial_15_0752_valid :
    mulPoly ep_Q2_024_coefficient_15_0752
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0753 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (9, 2)]
]

/-- Partial product 753 for generator 15. -/
def ep_Q2_024_partial_15_0753 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 15. -/
theorem ep_Q2_024_partial_15_0753_valid :
    mulPoly ep_Q2_024_coefficient_15_0753
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0754 : Poly :=
[
  term ((-83733671567034898728732787461685022132 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (9, 1)]
]

/-- Partial product 754 for generator 15. -/
def ep_Q2_024_partial_15_0754 : Poly :=
[
  term ((83733671567034898728732787461685022132 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-167467343134069797457465574923370044264 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 15. -/
theorem ep_Q2_024_partial_15_0754_valid :
    mulPoly ep_Q2_024_coefficient_15_0754
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0755 : Poly :=
[
  term ((-1109385824438654667857169094847372299448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (13, 1)]
]

/-- Partial product 755 for generator 15. -/
def ep_Q2_024_partial_15_0755 : Poly :=
[
  term ((1109385824438654667857169094847372299448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-2218771648877309335714338189694744598896 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 15. -/
theorem ep_Q2_024_partial_15_0755_valid :
    mulPoly ep_Q2_024_coefficient_15_0755
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0756 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 756 for generator 15. -/
def ep_Q2_024_partial_15_0756 : Poly :=
[
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 15. -/
theorem ep_Q2_024_partial_15_0756_valid :
    mulPoly ep_Q2_024_coefficient_15_0756
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0757 : Poly :=
[
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 757 for generator 15. -/
def ep_Q2_024_partial_15_0757 : Poly :=
[
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((10293679972596530 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 15. -/
theorem ep_Q2_024_partial_15_0757_valid :
    mulPoly ep_Q2_024_coefficient_15_0757
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0758 : Poly :=
[
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 758 for generator 15. -/
def ep_Q2_024_partial_15_0758 : Poly :=
[
  term ((-113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 15. -/
theorem ep_Q2_024_partial_15_0758_valid :
    mulPoly ep_Q2_024_coefficient_15_0758
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0759 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1)]
]

/-- Partial product 759 for generator 15. -/
def ep_Q2_024_partial_15_0759 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 15. -/
theorem ep_Q2_024_partial_15_0759_valid :
    mulPoly ep_Q2_024_coefficient_15_0759
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0760 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 760 for generator 15. -/
def ep_Q2_024_partial_15_0760 : Poly :=
[
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 15. -/
theorem ep_Q2_024_partial_15_0760_valid :
    mulPoly ep_Q2_024_coefficient_15_0760
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0761 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 761 for generator 15. -/
def ep_Q2_024_partial_15_0761 : Poly :=
[
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 15. -/
theorem ep_Q2_024_partial_15_0761_valid :
    mulPoly ep_Q2_024_coefficient_15_0761
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0762 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 762 for generator 15. -/
def ep_Q2_024_partial_15_0762 : Poly :=
[
  term ((2990296899089872 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 15. -/
theorem ep_Q2_024_partial_15_0762_valid :
    mulPoly ep_Q2_024_coefficient_15_0762
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0763 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 2)]
]

/-- Partial product 763 for generator 15. -/
def ep_Q2_024_partial_15_0763 : Poly :=
[
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 2)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 15. -/
theorem ep_Q2_024_partial_15_0763_valid :
    mulPoly ep_Q2_024_coefficient_15_0763
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0764 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (12, 1)]
]

/-- Partial product 764 for generator 15. -/
def ep_Q2_024_partial_15_0764 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 15. -/
theorem ep_Q2_024_partial_15_0764_valid :
    mulPoly ep_Q2_024_coefficient_15_0764
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0765 : Poly :=
[
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 765 for generator 15. -/
def ep_Q2_024_partial_15_0765 : Poly :=
[
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 15. -/
theorem ep_Q2_024_partial_15_0765_valid :
    mulPoly ep_Q2_024_coefficient_15_0765
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0766 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 766 for generator 15. -/
def ep_Q2_024_partial_15_0766 : Poly :=
[
  term ((301322371177440 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 15. -/
theorem ep_Q2_024_partial_15_0766_valid :
    mulPoly ep_Q2_024_coefficient_15_0766
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0767 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (7, 1), (13, 2)]
]

/-- Partial product 767 for generator 15. -/
def ep_Q2_024_partial_15_0767 : Poly :=
[
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 15. -/
theorem ep_Q2_024_partial_15_0767_valid :
    mulPoly ep_Q2_024_coefficient_15_0767
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0768 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (14, 1)]
]

/-- Partial product 768 for generator 15. -/
def ep_Q2_024_partial_15_0768 : Poly :=
[
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 15. -/
theorem ep_Q2_024_partial_15_0768_valid :
    mulPoly ep_Q2_024_coefficient_15_0768
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0769 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (7, 1), (15, 2)]
]

/-- Partial product 769 for generator 15. -/
def ep_Q2_024_partial_15_0769 : Poly :=
[
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 15. -/
theorem ep_Q2_024_partial_15_0769_valid :
    mulPoly ep_Q2_024_coefficient_15_0769
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0770 : Poly :=
[
  term ((-4263316396002204 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 770 for generator 15. -/
def ep_Q2_024_partial_15_0770 : Poly :=
[
  term ((-8526632792004408 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 15. -/
theorem ep_Q2_024_partial_15_0770_valid :
    mulPoly ep_Q2_024_coefficient_15_0770
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0771 : Poly :=
[
  term ((28471675426746403610453160022603286552 : Rat) / 30501087900062982116102377831259472915) [(2, 1), (3, 1), (8, 1), (9, 1)]
]

/-- Partial product 771 for generator 15. -/
def ep_Q2_024_partial_15_0771 : Poly :=
[
  term ((56943350853492807220906320045206573104 : Rat) / 30501087900062982116102377831259472915) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((-28471675426746403610453160022603286552 : Rat) / 30501087900062982116102377831259472915) [(2, 1), (3, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 15. -/
theorem ep_Q2_024_partial_15_0771_valid :
    mulPoly ep_Q2_024_coefficient_15_0771
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0772 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (11, 1)]
]

/-- Partial product 772 for generator 15. -/
def ep_Q2_024_partial_15_0772 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 15. -/
theorem ep_Q2_024_partial_15_0772_valid :
    mulPoly ep_Q2_024_coefficient_15_0772
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0773 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 773 for generator 15. -/
def ep_Q2_024_partial_15_0773 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 15. -/
theorem ep_Q2_024_partial_15_0773_valid :
    mulPoly ep_Q2_024_coefficient_15_0773
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0774 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 774 for generator 15. -/
def ep_Q2_024_partial_15_0774 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 15. -/
theorem ep_Q2_024_partial_15_0774_valid :
    mulPoly ep_Q2_024_coefficient_15_0774
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0775 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 775 for generator 15. -/
def ep_Q2_024_partial_15_0775 : Poly :=
[
  term ((-2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 15. -/
theorem ep_Q2_024_partial_15_0775_valid :
    mulPoly ep_Q2_024_coefficient_15_0775
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0776 : Poly :=
[
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (8, 1), (13, 1)]
]

/-- Partial product 776 for generator 15. -/
def ep_Q2_024_partial_15_0776 : Poly :=
[
  term ((3504485659930053500775475367129999833064 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 15. -/
theorem ep_Q2_024_partial_15_0776_valid :
    mulPoly ep_Q2_024_coefficient_15_0776
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0777 : Poly :=
[
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (8, 1), (15, 1)]
]

/-- Partial product 777 for generator 15. -/
def ep_Q2_024_partial_15_0777 : Poly :=
[
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 15. -/
theorem ep_Q2_024_partial_15_0777_valid :
    mulPoly ep_Q2_024_coefficient_15_0777
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0778 : Poly :=
[
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 778 for generator 15. -/
def ep_Q2_024_partial_15_0778 : Poly :=
[
  term ((-1932218386597130 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 15. -/
theorem ep_Q2_024_partial_15_0778_valid :
    mulPoly ep_Q2_024_coefficient_15_0778
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0779 : Poly :=
[
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 779 for generator 15. -/
def ep_Q2_024_partial_15_0779 : Poly :=
[
  term ((21828176908544582351077704092327537882272 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 15. -/
theorem ep_Q2_024_partial_15_0779_valid :
    mulPoly ep_Q2_024_coefficient_15_0779
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0780 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 1), (12, 1)]
]

/-- Partial product 780 for generator 15. -/
def ep_Q2_024_partial_15_0780 : Poly :=
[
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 15. -/
theorem ep_Q2_024_partial_15_0780_valid :
    mulPoly ep_Q2_024_coefficient_15_0780
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0781 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 781 for generator 15. -/
def ep_Q2_024_partial_15_0781 : Poly :=
[
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 15. -/
theorem ep_Q2_024_partial_15_0781_valid :
    mulPoly ep_Q2_024_coefficient_15_0781
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0782 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 782 for generator 15. -/
def ep_Q2_024_partial_15_0782 : Poly :=
[
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 15. -/
theorem ep_Q2_024_partial_15_0782_valid :
    mulPoly ep_Q2_024_coefficient_15_0782
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0783 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 783 for generator 15. -/
def ep_Q2_024_partial_15_0783 : Poly :=
[
  term ((2108843069097728 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 15. -/
theorem ep_Q2_024_partial_15_0783_valid :
    mulPoly ep_Q2_024_coefficient_15_0783
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0784 : Poly :=
[
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 784 for generator 15. -/
def ep_Q2_024_partial_15_0784 : Poly :=
[
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 15. -/
theorem ep_Q2_024_partial_15_0784_valid :
    mulPoly ep_Q2_024_coefficient_15_0784
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0785 : Poly :=
[
  term ((5187528714443170 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 785 for generator 15. -/
def ep_Q2_024_partial_15_0785 : Poly :=
[
  term ((10375057428886340 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 15. -/
theorem ep_Q2_024_partial_15_0785_valid :
    mulPoly ep_Q2_024_coefficient_15_0785
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0786 : Poly :=
[
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (9, 1), (13, 2)]
]

/-- Partial product 786 for generator 15. -/
def ep_Q2_024_partial_15_0786 : Poly :=
[
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 2)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 15. -/
theorem ep_Q2_024_partial_15_0786_valid :
    mulPoly ep_Q2_024_coefficient_15_0786
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0787 : Poly :=
[
  term ((-215705372194503699964327780659346795282 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 787 for generator 15. -/
def ep_Q2_024_partial_15_0787 : Poly :=
[
  term ((-431410744389007399928655561318693590564 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((215705372194503699964327780659346795282 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 15. -/
theorem ep_Q2_024_partial_15_0787_valid :
    mulPoly ep_Q2_024_coefficient_15_0787
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0788 : Poly :=
[
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 788 for generator 15. -/
def ep_Q2_024_partial_15_0788 : Poly :=
[
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 15. -/
theorem ep_Q2_024_partial_15_0788_valid :
    mulPoly ep_Q2_024_coefficient_15_0788
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0789 : Poly :=
[
  term ((44155261447042286 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 789 for generator 15. -/
def ep_Q2_024_partial_15_0789 : Poly :=
[
  term ((88310522894084572 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 15. -/
theorem ep_Q2_024_partial_15_0789_valid :
    mulPoly ep_Q2_024_coefficient_15_0789
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0790 : Poly :=
[
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 2), (13, 1)]
]

/-- Partial product 790 for generator 15. -/
def ep_Q2_024_partial_15_0790 : Poly :=
[
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 2), (13, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 15. -/
theorem ep_Q2_024_partial_15_0790_valid :
    mulPoly ep_Q2_024_coefficient_15_0790
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0791 : Poly :=
[
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (3, 1), (9, 2), (15, 1)]
]

/-- Partial product 791 for generator 15. -/
def ep_Q2_024_partial_15_0791 : Poly :=
[
  term ((451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 15. -/
theorem ep_Q2_024_partial_15_0791_valid :
    mulPoly ep_Q2_024_coefficient_15_0791
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0792 : Poly :=
[
  term ((747574224772468 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 792 for generator 15. -/
def ep_Q2_024_partial_15_0792 : Poly :=
[
  term ((1495148449544936 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 15. -/
theorem ep_Q2_024_partial_15_0792_valid :
    mulPoly ep_Q2_024_coefficient_15_0792
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0793 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 3)]
]

/-- Partial product 793 for generator 15. -/
def ep_Q2_024_partial_15_0793 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 3)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 15. -/
theorem ep_Q2_024_partial_15_0793_valid :
    mulPoly ep_Q2_024_coefficient_15_0793
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0794 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (8, 1)]
]

/-- Partial product 794 for generator 15. -/
def ep_Q2_024_partial_15_0794 : Poly :=
[
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (6, 1), (8, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 15. -/
theorem ep_Q2_024_partial_15_0794_valid :
    mulPoly ep_Q2_024_coefficient_15_0794
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0795 : Poly :=
[
  term ((728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1)]
]

/-- Partial product 795 for generator 15. -/
def ep_Q2_024_partial_15_0795 : Poly :=
[
  term ((-728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1)],
  term ((1456153465828963514683780388294727653932 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 15. -/
theorem ep_Q2_024_partial_15_0795_valid :
    mulPoly ep_Q2_024_coefficient_15_0795
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0796 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (9, 1)]
]

/-- Partial product 796 for generator 15. -/
def ep_Q2_024_partial_15_0796 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 15. -/
theorem ep_Q2_024_partial_15_0796_valid :
    mulPoly ep_Q2_024_coefficient_15_0796
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0797 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (13, 1)]
]

/-- Partial product 797 for generator 15. -/
def ep_Q2_024_partial_15_0797 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 15. -/
theorem ep_Q2_024_partial_15_0797_valid :
    mulPoly ep_Q2_024_coefficient_15_0797
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0798 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (5, 1), (15, 1)]
]

/-- Partial product 798 for generator 15. -/
def ep_Q2_024_partial_15_0798 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 15. -/
theorem ep_Q2_024_partial_15_0798_valid :
    mulPoly ep_Q2_024_coefficient_15_0798
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0799 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 799 for generator 15. -/
def ep_Q2_024_partial_15_0799 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 15. -/
theorem ep_Q2_024_partial_15_0799_valid :
    mulPoly ep_Q2_024_coefficient_15_0799
        ep_Q2_024_generator_15_0700_0799 =
      ep_Q2_024_partial_15_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0700_0799 : List Poly :=
[
  ep_Q2_024_partial_15_0700,
  ep_Q2_024_partial_15_0701,
  ep_Q2_024_partial_15_0702,
  ep_Q2_024_partial_15_0703,
  ep_Q2_024_partial_15_0704,
  ep_Q2_024_partial_15_0705,
  ep_Q2_024_partial_15_0706,
  ep_Q2_024_partial_15_0707,
  ep_Q2_024_partial_15_0708,
  ep_Q2_024_partial_15_0709,
  ep_Q2_024_partial_15_0710,
  ep_Q2_024_partial_15_0711,
  ep_Q2_024_partial_15_0712,
  ep_Q2_024_partial_15_0713,
  ep_Q2_024_partial_15_0714,
  ep_Q2_024_partial_15_0715,
  ep_Q2_024_partial_15_0716,
  ep_Q2_024_partial_15_0717,
  ep_Q2_024_partial_15_0718,
  ep_Q2_024_partial_15_0719,
  ep_Q2_024_partial_15_0720,
  ep_Q2_024_partial_15_0721,
  ep_Q2_024_partial_15_0722,
  ep_Q2_024_partial_15_0723,
  ep_Q2_024_partial_15_0724,
  ep_Q2_024_partial_15_0725,
  ep_Q2_024_partial_15_0726,
  ep_Q2_024_partial_15_0727,
  ep_Q2_024_partial_15_0728,
  ep_Q2_024_partial_15_0729,
  ep_Q2_024_partial_15_0730,
  ep_Q2_024_partial_15_0731,
  ep_Q2_024_partial_15_0732,
  ep_Q2_024_partial_15_0733,
  ep_Q2_024_partial_15_0734,
  ep_Q2_024_partial_15_0735,
  ep_Q2_024_partial_15_0736,
  ep_Q2_024_partial_15_0737,
  ep_Q2_024_partial_15_0738,
  ep_Q2_024_partial_15_0739,
  ep_Q2_024_partial_15_0740,
  ep_Q2_024_partial_15_0741,
  ep_Q2_024_partial_15_0742,
  ep_Q2_024_partial_15_0743,
  ep_Q2_024_partial_15_0744,
  ep_Q2_024_partial_15_0745,
  ep_Q2_024_partial_15_0746,
  ep_Q2_024_partial_15_0747,
  ep_Q2_024_partial_15_0748,
  ep_Q2_024_partial_15_0749,
  ep_Q2_024_partial_15_0750,
  ep_Q2_024_partial_15_0751,
  ep_Q2_024_partial_15_0752,
  ep_Q2_024_partial_15_0753,
  ep_Q2_024_partial_15_0754,
  ep_Q2_024_partial_15_0755,
  ep_Q2_024_partial_15_0756,
  ep_Q2_024_partial_15_0757,
  ep_Q2_024_partial_15_0758,
  ep_Q2_024_partial_15_0759,
  ep_Q2_024_partial_15_0760,
  ep_Q2_024_partial_15_0761,
  ep_Q2_024_partial_15_0762,
  ep_Q2_024_partial_15_0763,
  ep_Q2_024_partial_15_0764,
  ep_Q2_024_partial_15_0765,
  ep_Q2_024_partial_15_0766,
  ep_Q2_024_partial_15_0767,
  ep_Q2_024_partial_15_0768,
  ep_Q2_024_partial_15_0769,
  ep_Q2_024_partial_15_0770,
  ep_Q2_024_partial_15_0771,
  ep_Q2_024_partial_15_0772,
  ep_Q2_024_partial_15_0773,
  ep_Q2_024_partial_15_0774,
  ep_Q2_024_partial_15_0775,
  ep_Q2_024_partial_15_0776,
  ep_Q2_024_partial_15_0777,
  ep_Q2_024_partial_15_0778,
  ep_Q2_024_partial_15_0779,
  ep_Q2_024_partial_15_0780,
  ep_Q2_024_partial_15_0781,
  ep_Q2_024_partial_15_0782,
  ep_Q2_024_partial_15_0783,
  ep_Q2_024_partial_15_0784,
  ep_Q2_024_partial_15_0785,
  ep_Q2_024_partial_15_0786,
  ep_Q2_024_partial_15_0787,
  ep_Q2_024_partial_15_0788,
  ep_Q2_024_partial_15_0789,
  ep_Q2_024_partial_15_0790,
  ep_Q2_024_partial_15_0791,
  ep_Q2_024_partial_15_0792,
  ep_Q2_024_partial_15_0793,
  ep_Q2_024_partial_15_0794,
  ep_Q2_024_partial_15_0795,
  ep_Q2_024_partial_15_0796,
  ep_Q2_024_partial_15_0797,
  ep_Q2_024_partial_15_0798,
  ep_Q2_024_partial_15_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0700_0799 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (6, 1), (12, 3), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((370315927423382885391950958321325355729 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1)],
  term ((-2481346288346526588270837002331912378436 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-4257240738688568307616658794980924393509421819574455832 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((2463931916166432 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5196140706424565759545785675052583399584 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 3)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((4633881870105264614105561717474528149133005252184189608 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 3), (14, 1)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-46761063904070125 : Rat) / 2325560442306386) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((138348488323751089 : Rat) / 3488340663459579) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((-14930111000563771909392666589219249207504651660907005579 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (15, 1)],
  term ((2314053073690208 : Rat) / 1162780221153193) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 3), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-370315927423382885391950958321325355729 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (13, 1)],
  term ((1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 1)],
  term ((2128620369344284153808329397490462196754710909787227916 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 3)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 2)],
  term ((224563777214800 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11651501637049059178385426413555378112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 2), (15, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 1)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (14, 1), (15, 1)],
  term ((46761063904070125 : Rat) / 4651120884612772) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 2), (15, 1)],
  term ((-138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 3), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((14930111000563771909392666589219249207504651660907005579 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (15, 1)],
  term ((-1157026536845104 : Rat) / 1162780221153193) [(1, 1), (15, 1), (16, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (2, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (4, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (4, 1), (6, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (6, 1), (9, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (6, 1), (13, 1)],
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (2, 1), (5, 1), (6, 1), (15, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 2), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (9, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (5, 1), (13, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (2, 1), (6, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (6, 1), (8, 1)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (6, 1), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (6, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 1), (6, 1), (13, 2)],
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (15, 2)],
  term ((8133929093983298 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (8, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (9, 2)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (2, 1), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 1), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 1), (13, 2)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (14, 1)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 1), (15, 2)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 2), (6, 1)],
  term ((-474126838180308352184970268942469465357 : Rat) / 1199709457402477296566693528029539267990) [(2, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (4, 1), (9, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-2487823789554368 : Rat) / 3488340663459579) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (9, 2)],
  term ((-113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1)],
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-8526632792004408 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((56943350853492807220906320045206573104 : Rat) / 30501087900062982116102377831259472915) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3504485659930053500775475367129999833064 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-1932218386597130 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((24088986040854524616753489353793033479836 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((2108843069097728 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((10375057428886340 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 2)],
  term ((-431410744389007399928655561318693590564 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((88310522894084572 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 2), (13, 1)],
  term ((451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1)],
  term ((1495148449544936 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 3)],
  term ((1109385824438654667857169094847372299448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-167467343134069797457465574923370044264 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((-2218771648877309335714338189694744598896 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((10293679972596530 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (7, 1), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-28471675426746403610453160022603286552 : Rat) / 30501087900062982116102377831259472915) [(2, 1), (3, 1), (8, 1), (9, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (8, 1), (13, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (3, 1), (9, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (9, 1), (13, 2)],
  term ((215705372194503699964327780659346795282 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 2), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (3, 1), (9, 2), (15, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 3)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (6, 1), (8, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (8, 1)],
  term ((-728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1456153465828963514683780388294727653932 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1)],
  term ((474126838180308352184970268942469465357 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 700 through 799. -/
theorem ep_Q2_024_block_15_0700_0799_valid :
    checkProductSumEq ep_Q2_024_partials_15_0700_0799
      ep_Q2_024_block_15_0700_0799 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
