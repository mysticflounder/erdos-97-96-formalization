/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0400 : Poly :=
[
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (15, 3)]
]

/-- Partial product 400 for generator 15. -/
def ep_Q2_024_partial_15_0400 : Poly :=
[
  term ((30218434513036630647433378446774573268634657606399219032 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 15. -/
theorem ep_Q2_024_partial_15_0400_valid :
    mulPoly ep_Q2_024_coefficient_15_0400
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0401 : Poly :=
[
  term ((-2130221066942416 : Rat) / 1162780221153193) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 401 for generator 15. -/
def ep_Q2_024_partial_15_0401 : Poly :=
[
  term ((-4260442133884832 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 15. -/
theorem ep_Q2_024_partial_15_0401_valid :
    mulPoly ep_Q2_024_coefficient_15_0401
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0402 : Poly :=
[
  term ((61402103278414588949002297186947189547 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2)]
]

/-- Partial product 402 for generator 15. -/
def ep_Q2_024_partial_15_0402 : Poly :=
[
  term ((122804206556829177898004594373894379094 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2)],
  term ((-61402103278414588949002297186947189547 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 15. -/
theorem ep_Q2_024_partial_15_0402_valid :
    mulPoly ep_Q2_024_coefficient_15_0402
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0403 : Poly :=
[
  term ((-6785098621000421429523857119423485666832 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 403 for generator 15. -/
def ep_Q2_024_partial_15_0403 : Poly :=
[
  term ((-13570197242000842859047714238846971333664 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((6785098621000421429523857119423485666832 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 15. -/
theorem ep_Q2_024_partial_15_0403_valid :
    mulPoly ep_Q2_024_coefficient_15_0403
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0404 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 2)]
]

/-- Partial product 404 for generator 15. -/
def ep_Q2_024_partial_15_0404 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 15. -/
theorem ep_Q2_024_partial_15_0404_valid :
    mulPoly ep_Q2_024_coefficient_15_0404
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0405 : Poly :=
[
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 2), (15, 2)]
]

/-- Partial product 405 for generator 15. -/
def ep_Q2_024_partial_15_0405 : Poly :=
[
  term ((-23061024265323965508051252258804260276981972566592055112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 15. -/
theorem ep_Q2_024_partial_15_0405_valid :
    mulPoly ep_Q2_024_coefficient_15_0405
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0406 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 406 for generator 15. -/
def ep_Q2_024_partial_15_0406 : Poly :=
[
  term ((301322371177440 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 15. -/
theorem ep_Q2_024_partial_15_0406_valid :
    mulPoly ep_Q2_024_coefficient_15_0406
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0407 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 3), (15, 1)]
]

/-- Partial product 407 for generator 15. -/
def ep_Q2_024_partial_15_0407 : Poly :=
[
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 3), (15, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 15. -/
theorem ep_Q2_024_partial_15_0407_valid :
    mulPoly ep_Q2_024_coefficient_15_0407
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0408 : Poly :=
[
  term ((-853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1), (14, 1)]
]

/-- Partial product 408 for generator 15. -/
def ep_Q2_024_partial_15_0408 : Poly :=
[
  term ((-853492242690111599427956437383942032069 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (14, 1)],
  term ((853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 15. -/
theorem ep_Q2_024_partial_15_0408_valid :
    mulPoly ep_Q2_024_coefficient_15_0408
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0409 : Poly :=
[
  term ((51698933009934061797361542365561147199814620993416825861 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 409 for generator 15. -/
def ep_Q2_024_partial_15_0409 : Poly :=
[
  term ((51698933009934061797361542365561147199814620993416825861 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-51698933009934061797361542365561147199814620993416825861 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 15. -/
theorem ep_Q2_024_partial_15_0409_valid :
    mulPoly ep_Q2_024_coefficient_15_0409
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0410 : Poly :=
[
  term ((-139695870987039889 : Rat) / 6976681326919158) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 410 for generator 15. -/
def ep_Q2_024_partial_15_0410 : Poly :=
[
  term ((-139695870987039889 : Rat) / 3488340663459579) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((139695870987039889 : Rat) / 6976681326919158) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 15. -/
theorem ep_Q2_024_partial_15_0410_valid :
    mulPoly ep_Q2_024_coefficient_15_0410
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0411 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (14, 2), (15, 2)]
]

/-- Partial product 411 for generator 15. -/
def ep_Q2_024_partial_15_0411 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 15. -/
theorem ep_Q2_024_partial_15_0411_valid :
    mulPoly ep_Q2_024_coefficient_15_0411
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0412 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 412 for generator 15. -/
def ep_Q2_024_partial_15_0412 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 15. -/
theorem ep_Q2_024_partial_15_0412_valid :
    mulPoly ep_Q2_024_coefficient_15_0412
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0413 : Poly :=
[
  term ((1083189271810614859300480165671590384882885436473620011277 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (15, 2)]
]

/-- Partial product 413 for generator 15. -/
def ep_Q2_024_partial_15_0413 : Poly :=
[
  term ((1083189271810614859300480165671590384882885436473620011277 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (6, 1), (15, 2)],
  term ((-1083189271810614859300480165671590384882885436473620011277 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 15. -/
theorem ep_Q2_024_partial_15_0413_valid :
    mulPoly ep_Q2_024_coefficient_15_0413
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0414 : Poly :=
[
  term ((60025162259000265 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 414 for generator 15. -/
def ep_Q2_024_partial_15_0414 : Poly :=
[
  term ((60025162259000265 : Rat) / 2325560442306386) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-60025162259000265 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 15. -/
theorem ep_Q2_024_partial_15_0414_valid :
    mulPoly ep_Q2_024_coefficient_15_0414
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0415 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 415 for generator 15. -/
def ep_Q2_024_partial_15_0415 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 15. -/
theorem ep_Q2_024_partial_15_0415_valid :
    mulPoly ep_Q2_024_coefficient_15_0415
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0416 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 2), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 416 for generator 15. -/
def ep_Q2_024_partial_15_0416 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 2), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 15. -/
theorem ep_Q2_024_partial_15_0416_valid :
    mulPoly ep_Q2_024_coefficient_15_0416
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0417 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 417 for generator 15. -/
def ep_Q2_024_partial_15_0417 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 15. -/
theorem ep_Q2_024_partial_15_0417_valid :
    mulPoly ep_Q2_024_coefficient_15_0417
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0418 : Poly :=
[
  term ((-3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 2), (3, 1), (13, 1)]
]

/-- Partial product 418 for generator 15. -/
def ep_Q2_024_partial_15_0418 : Poly :=
[
  term ((-6659286221410605625377359683362613300424 : Rat) / 1799564186103715944850040292044308901985) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 2), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 15. -/
theorem ep_Q2_024_partial_15_0418_valid :
    mulPoly ep_Q2_024_coefficient_15_0418
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0419 : Poly :=
[
  term ((-112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (3, 1), (15, 1)]
]

/-- Partial product 419 for generator 15. -/
def ep_Q2_024_partial_15_0419 : Poly :=
[
  term ((-112925877134122375318482939998583635371844772388621857119 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 15. -/
theorem ep_Q2_024_partial_15_0419_valid :
    mulPoly ep_Q2_024_coefficient_15_0419
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0420 : Poly :=
[
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 15. -/
def ep_Q2_024_partial_15_0420 : Poly :=
[
  term ((36885281294131109 : Rat) / 3488340663459579) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 15. -/
theorem ep_Q2_024_partial_15_0420_valid :
    mulPoly ep_Q2_024_coefficient_15_0420
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0421 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1)]
]

/-- Partial product 421 for generator 15. -/
def ep_Q2_024_partial_15_0421 : Poly :=
[
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (6, 1), (9, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 15. -/
theorem ep_Q2_024_partial_15_0421_valid :
    mulPoly ep_Q2_024_coefficient_15_0421
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0422 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (13, 1)]
]

/-- Partial product 422 for generator 15. -/
def ep_Q2_024_partial_15_0422 : Poly :=
[
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (6, 1), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 15. -/
theorem ep_Q2_024_partial_15_0422_valid :
    mulPoly ep_Q2_024_coefficient_15_0422
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0423 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (15, 1)]
]

/-- Partial product 423 for generator 15. -/
def ep_Q2_024_partial_15_0423 : Poly :=
[
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (6, 1), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 15. -/
theorem ep_Q2_024_partial_15_0423_valid :
    mulPoly ep_Q2_024_coefficient_15_0423
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0424 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 15. -/
def ep_Q2_024_partial_15_0424 : Poly :=
[
  term ((1709530353079456 : Rat) / 1162780221153193) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 15. -/
theorem ep_Q2_024_partial_15_0424_valid :
    mulPoly ep_Q2_024_coefficient_15_0424
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0425 : Poly :=
[
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1)]
]

/-- Partial product 425 for generator 15. -/
def ep_Q2_024_partial_15_0425 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 15. -/
theorem ep_Q2_024_partial_15_0425_valid :
    mulPoly ep_Q2_024_coefficient_15_0425
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0426 : Poly :=
[
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (13, 1)]
]

/-- Partial product 426 for generator 15. -/
def ep_Q2_024_partial_15_0426 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 15. -/
theorem ep_Q2_024_partial_15_0426_valid :
    mulPoly ep_Q2_024_coefficient_15_0426
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0427 : Poly :=
[
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (15, 1)]
]

/-- Partial product 427 for generator 15. -/
def ep_Q2_024_partial_15_0427 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 15. -/
theorem ep_Q2_024_partial_15_0427_valid :
    mulPoly ep_Q2_024_coefficient_15_0427
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0428 : Poly :=
[
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 15. -/
def ep_Q2_024_partial_15_0428 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 15. -/
theorem ep_Q2_024_partial_15_0428_valid :
    mulPoly ep_Q2_024_coefficient_15_0428
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0429 : Poly :=
[
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (11, 1)]
]

/-- Partial product 429 for generator 15. -/
def ep_Q2_024_partial_15_0429 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 15. -/
theorem ep_Q2_024_partial_15_0429_valid :
    mulPoly ep_Q2_024_coefficient_15_0429
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0430 : Poly :=
[
  term ((215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (13, 1)]
]

/-- Partial product 430 for generator 15. -/
def ep_Q2_024_partial_15_0430 : Poly :=
[
  term ((430326068874390043767614115526342046144 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 15. -/
theorem ep_Q2_024_partial_15_0430_valid :
    mulPoly ep_Q2_024_coefficient_15_0430
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0431 : Poly :=
[
  term ((71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (9, 1), (15, 1)]
]

/-- Partial product 431 for generator 15. -/
def ep_Q2_024_partial_15_0431 : Poly :=
[
  term ((71468851862135219280772996134182424817310949427353054879 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 15. -/
theorem ep_Q2_024_partial_15_0431_valid :
    mulPoly ep_Q2_024_coefficient_15_0431
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0432 : Poly :=
[
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 15. -/
def ep_Q2_024_partial_15_0432 : Poly :=
[
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 15. -/
theorem ep_Q2_024_partial_15_0432_valid :
    mulPoly ep_Q2_024_coefficient_15_0432
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0433 : Poly :=
[
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 2)]
]

/-- Partial product 433 for generator 15. -/
def ep_Q2_024_partial_15_0433 : Poly :=
[
  term ((-93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 2)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 15. -/
theorem ep_Q2_024_partial_15_0433_valid :
    mulPoly ep_Q2_024_coefficient_15_0433
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0434 : Poly :=
[
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (11, 1), (13, 1)]
]

/-- Partial product 434 for generator 15. -/
def ep_Q2_024_partial_15_0434 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 15. -/
theorem ep_Q2_024_partial_15_0434_valid :
    mulPoly ep_Q2_024_coefficient_15_0434
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0435 : Poly :=
[
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (11, 1), (15, 1)]
]

/-- Partial product 435 for generator 15. -/
def ep_Q2_024_partial_15_0435 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 15. -/
theorem ep_Q2_024_partial_15_0435_valid :
    mulPoly ep_Q2_024_coefficient_15_0435
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0436 : Poly :=
[
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 15. -/
def ep_Q2_024_partial_15_0436 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 15. -/
theorem ep_Q2_024_partial_15_0436_valid :
    mulPoly ep_Q2_024_coefficient_15_0436
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0437 : Poly :=
[
  term ((-72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (13, 1), (15, 1)]
]

/-- Partial product 437 for generator 15. -/
def ep_Q2_024_partial_15_0437 : Poly :=
[
  term ((-72157377400783269951842257442992766033230702678758901343 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 15. -/
theorem ep_Q2_024_partial_15_0437_valid :
    mulPoly ep_Q2_024_coefficient_15_0437
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0438 : Poly :=
[
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 15. -/
def ep_Q2_024_partial_15_0438 : Poly :=
[
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 15. -/
theorem ep_Q2_024_partial_15_0438_valid :
    mulPoly ep_Q2_024_coefficient_15_0438
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0439 : Poly :=
[
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (13, 2)]
]

/-- Partial product 439 for generator 15. -/
def ep_Q2_024_partial_15_0439 : Poly :=
[
  term ((-336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (13, 2)],
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 15. -/
theorem ep_Q2_024_partial_15_0439_valid :
    mulPoly ep_Q2_024_coefficient_15_0439
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0440 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 2), (15, 2)]
]

/-- Partial product 440 for generator 15. -/
def ep_Q2_024_partial_15_0440 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 2), (6, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 15. -/
theorem ep_Q2_024_partial_15_0440_valid :
    mulPoly ep_Q2_024_coefficient_15_0440
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0441 : Poly :=
[
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 441 for generator 15. -/
def ep_Q2_024_partial_15_0441 : Poly :=
[
  term ((19703340389129022 : Rat) / 1162780221153193) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 15. -/
theorem ep_Q2_024_partial_15_0441_valid :
    mulPoly ep_Q2_024_coefficient_15_0441
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0442 : Poly :=
[
  term ((4458447591231309742478111612051208159724 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 442 for generator 15. -/
def ep_Q2_024_partial_15_0442 : Poly :=
[
  term ((-4458447591231309742478111612051208159724 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 1), (3, 1)],
  term ((8916895182462619484956223224102416319448 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 1), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 15. -/
theorem ep_Q2_024_partial_15_0442_valid :
    mulPoly ep_Q2_024_coefficient_15_0442
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0443 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (4, 1)]
]

/-- Partial product 443 for generator 15. -/
def ep_Q2_024_partial_15_0443 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 15. -/
theorem ep_Q2_024_partial_15_0443_valid :
    mulPoly ep_Q2_024_coefficient_15_0443
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0444 : Poly :=
[
  term ((219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 444 for generator 15. -/
def ep_Q2_024_partial_15_0444 : Poly :=
[
  term ((439165574351317027328597678950990790048 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 15. -/
theorem ep_Q2_024_partial_15_0444_valid :
    mulPoly ep_Q2_024_coefficient_15_0444
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0445 : Poly :=
[
  term ((239557969093557419701986954358899683744 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 445 for generator 15. -/
def ep_Q2_024_partial_15_0445 : Poly :=
[
  term ((479115938187114839403973908717799367488 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((-239557969093557419701986954358899683744 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 15. -/
theorem ep_Q2_024_partial_15_0445_valid :
    mulPoly ep_Q2_024_coefficient_15_0445
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0446 : Poly :=
[
  term ((-3272323414058240097925754625078017381426119322987837336 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 446 for generator 15. -/
def ep_Q2_024_partial_15_0446 : Poly :=
[
  term ((-6544646828116480195851509250156034762852238645975674672 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((3272323414058240097925754625078017381426119322987837336 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 15. -/
theorem ep_Q2_024_partial_15_0446_valid :
    mulPoly ep_Q2_024_coefficient_15_0446
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0447 : Poly :=
[
  term ((2262672637792 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 15. -/
def ep_Q2_024_partial_15_0447 : Poly :=
[
  term ((4525345275584 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2262672637792 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 15. -/
theorem ep_Q2_024_partial_15_0447_valid :
    mulPoly ep_Q2_024_coefficient_15_0447
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0448 : Poly :=
[
  term ((1620586959648382208593090305836806223528 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (8, 1)]
]

/-- Partial product 448 for generator 15. -/
def ep_Q2_024_partial_15_0448 : Poly :=
[
  term ((3241173919296764417186180611673612447056 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (6, 1), (8, 1)],
  term ((-1620586959648382208593090305836806223528 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 15. -/
theorem ep_Q2_024_partial_15_0448_valid :
    mulPoly ep_Q2_024_coefficient_15_0448
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0449 : Poly :=
[
  term ((-976010060432586342410706137554027972336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 449 for generator 15. -/
def ep_Q2_024_partial_15_0449 : Poly :=
[
  term ((-1952020120865172684821412275108055944672 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((976010060432586342410706137554027972336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 15. -/
theorem ep_Q2_024_partial_15_0449_valid :
    mulPoly ep_Q2_024_coefficient_15_0449
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0450 : Poly :=
[
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 450 for generator 15. -/
def ep_Q2_024_partial_15_0450 : Poly :=
[
  term ((27130320051483874779001434360058490581240592138093573014 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 15. -/
theorem ep_Q2_024_partial_15_0450_valid :
    mulPoly ep_Q2_024_coefficient_15_0450
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0451 : Poly :=
[
  term ((-9718464922042084 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 15. -/
def ep_Q2_024_partial_15_0451 : Poly :=
[
  term ((-19436929844084168 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 15. -/
theorem ep_Q2_024_partial_15_0451_valid :
    mulPoly ep_Q2_024_coefficient_15_0451
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0452 : Poly :=
[
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (9, 2)]
]

/-- Partial product 452 for generator 15. -/
def ep_Q2_024_partial_15_0452 : Poly :=
[
  term ((-1640925836848218604613933742224210947456 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 2)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 15. -/
theorem ep_Q2_024_partial_15_0452_valid :
    mulPoly ep_Q2_024_coefficient_15_0452
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0453 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (12, 1)]
]

/-- Partial product 453 for generator 15. -/
def ep_Q2_024_partial_15_0453 : Poly :=
[
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 15. -/
theorem ep_Q2_024_partial_15_0453_valid :
    mulPoly ep_Q2_024_coefficient_15_0453
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0454 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 454 for generator 15. -/
def ep_Q2_024_partial_15_0454 : Poly :=
[
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 15. -/
theorem ep_Q2_024_partial_15_0454_valid :
    mulPoly ep_Q2_024_coefficient_15_0454
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0455 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 455 for generator 15. -/
def ep_Q2_024_partial_15_0455 : Poly :=
[
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 15. -/
theorem ep_Q2_024_partial_15_0455_valid :
    mulPoly ep_Q2_024_coefficient_15_0455
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0456 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 456 for generator 15. -/
def ep_Q2_024_partial_15_0456 : Poly :=
[
  term ((-2108843069097728 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 15. -/
theorem ep_Q2_024_partial_15_0456_valid :
    mulPoly ep_Q2_024_coefficient_15_0456
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0457 : Poly :=
[
  term ((174387597396569679045385362785627677503893371381937419019 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 457 for generator 15. -/
def ep_Q2_024_partial_15_0457 : Poly :=
[
  term ((174387597396569679045385362785627677503893371381937419019 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-174387597396569679045385362785627677503893371381937419019 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 15. -/
theorem ep_Q2_024_partial_15_0457_valid :
    mulPoly ep_Q2_024_coefficient_15_0457
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0458 : Poly :=
[
  term ((-6091495827975490 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 15. -/
def ep_Q2_024_partial_15_0458 : Poly :=
[
  term ((-12182991655950980 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6091495827975490 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 15. -/
theorem ep_Q2_024_partial_15_0458_valid :
    mulPoly ep_Q2_024_coefficient_15_0458
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0459 : Poly :=
[
  term ((499694450953716221344605121206446959576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (13, 2)]
]

/-- Partial product 459 for generator 15. -/
def ep_Q2_024_partial_15_0459 : Poly :=
[
  term ((999388901907432442689210242412893919152 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 2)],
  term ((-499694450953716221344605121206446959576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 15. -/
theorem ep_Q2_024_partial_15_0459_valid :
    mulPoly ep_Q2_024_coefficient_15_0459
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0460 : Poly :=
[
  term ((757365405969484992085502101483311879674 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (14, 1)]
]

/-- Partial product 460 for generator 15. -/
def ep_Q2_024_partial_15_0460 : Poly :=
[
  term ((1514730811938969984171004202966623759348 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((-757365405969484992085502101483311879674 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 15. -/
theorem ep_Q2_024_partial_15_0460_valid :
    mulPoly ep_Q2_024_coefficient_15_0460
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0461 : Poly :=
[
  term ((70401968402328451832893051496183231462484150674916090649 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 1), (3, 1), (15, 2)]
]

/-- Partial product 461 for generator 15. -/
def ep_Q2_024_partial_15_0461 : Poly :=
[
  term ((70401968402328451832893051496183231462484150674916090649 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2)],
  term ((-70401968402328451832893051496183231462484150674916090649 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 1), (3, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 15. -/
theorem ep_Q2_024_partial_15_0461_valid :
    mulPoly ep_Q2_024_coefficient_15_0461
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0462 : Poly :=
[
  term ((-18575363071029062 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 462 for generator 15. -/
def ep_Q2_024_partial_15_0462 : Poly :=
[
  term ((-37150726142058124 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((18575363071029062 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 15. -/
theorem ep_Q2_024_partial_15_0462_valid :
    mulPoly ep_Q2_024_coefficient_15_0462
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0463 : Poly :=
[
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (4, 1), (13, 1)]
]

/-- Partial product 463 for generator 15. -/
def ep_Q2_024_partial_15_0463 : Poly :=
[
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 15. -/
theorem ep_Q2_024_partial_15_0463_valid :
    mulPoly ep_Q2_024_coefficient_15_0463
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0464 : Poly :=
[
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (4, 1), (15, 1)]
]

/-- Partial product 464 for generator 15. -/
def ep_Q2_024_partial_15_0464 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 15. -/
theorem ep_Q2_024_partial_15_0464_valid :
    mulPoly ep_Q2_024_coefficient_15_0464
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0465 : Poly :=
[
  term ((673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 15. -/
def ep_Q2_024_partial_15_0465 : Poly :=
[
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 15. -/
theorem ep_Q2_024_partial_15_0465_valid :
    mulPoly ep_Q2_024_coefficient_15_0465
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0466 : Poly :=
[
  term ((-3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (5, 1)]
]

/-- Partial product 466 for generator 15. -/
def ep_Q2_024_partial_15_0466 : Poly :=
[
  term ((3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (5, 1)],
  term ((-7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 15. -/
theorem ep_Q2_024_partial_15_0466_valid :
    mulPoly ep_Q2_024_coefficient_15_0466
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0467 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 467 for generator 15. -/
def ep_Q2_024_partial_15_0467 : Poly :=
[
  term ((-186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 15. -/
theorem ep_Q2_024_partial_15_0467_valid :
    mulPoly ep_Q2_024_coefficient_15_0467
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0468 : Poly :=
[
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (14, 1)]
]

/-- Partial product 468 for generator 15. -/
def ep_Q2_024_partial_15_0468 : Poly :=
[
  term ((-976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 15. -/
theorem ep_Q2_024_partial_15_0468_valid :
    mulPoly ep_Q2_024_coefficient_15_0468
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0469 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (5, 1), (15, 2)]
]

/-- Partial product 469 for generator 15. -/
def ep_Q2_024_partial_15_0469 : Poly :=
[
  term ((-17864461639187578218700168943739902602175097017053879744 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 15. -/
theorem ep_Q2_024_partial_15_0469_valid :
    mulPoly ep_Q2_024_coefficient_15_0469
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0470 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 470 for generator 15. -/
def ep_Q2_024_partial_15_0470 : Poly :=
[
  term ((3593020435436800 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 15. -/
theorem ep_Q2_024_partial_15_0470_valid :
    mulPoly ep_Q2_024_coefficient_15_0470
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0471 : Poly :=
[
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 1), (13, 1)]
]

/-- Partial product 471 for generator 15. -/
def ep_Q2_024_partial_15_0471 : Poly :=
[
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 15. -/
theorem ep_Q2_024_partial_15_0471_valid :
    mulPoly ep_Q2_024_coefficient_15_0471
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0472 : Poly :=
[
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (6, 1), (15, 1)]
]

/-- Partial product 472 for generator 15. -/
def ep_Q2_024_partial_15_0472 : Poly :=
[
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 15. -/
theorem ep_Q2_024_partial_15_0472_valid :
    mulPoly ep_Q2_024_coefficient_15_0472
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0473 : Poly :=
[
  term ((-336845665822200 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 15. -/
def ep_Q2_024_partial_15_0473 : Poly :=
[
  term ((336845665822200 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 15. -/
theorem ep_Q2_024_partial_15_0473_valid :
    mulPoly ep_Q2_024_coefficient_15_0473
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0474 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 474 for generator 15. -/
def ep_Q2_024_partial_15_0474 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 15. -/
theorem ep_Q2_024_partial_15_0474_valid :
    mulPoly ep_Q2_024_coefficient_15_0474
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0475 : Poly :=
[
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (14, 1)]
]

/-- Partial product 475 for generator 15. -/
def ep_Q2_024_partial_15_0475 : Poly :=
[
  term ((2074172699534206160586060347251907595136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 15. -/
theorem ep_Q2_024_partial_15_0475_valid :
    mulPoly ep_Q2_024_coefficient_15_0475
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0476 : Poly :=
[
  term ((-3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (9, 1)]
]

/-- Partial product 476 for generator 15. -/
def ep_Q2_024_partial_15_0476 : Poly :=
[
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (8, 1), (9, 1)],
  term ((3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 15. -/
theorem ep_Q2_024_partial_15_0476_valid :
    mulPoly ep_Q2_024_coefficient_15_0476
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0477 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 477 for generator 15. -/
def ep_Q2_024_partial_15_0477 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 15. -/
theorem ep_Q2_024_partial_15_0477_valid :
    mulPoly ep_Q2_024_coefficient_15_0477
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0478 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 478 for generator 15. -/
def ep_Q2_024_partial_15_0478 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 15. -/
theorem ep_Q2_024_partial_15_0478_valid :
    mulPoly ep_Q2_024_coefficient_15_0478
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0479 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 15. -/
def ep_Q2_024_partial_15_0479 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 15. -/
theorem ep_Q2_024_partial_15_0479_valid :
    mulPoly ep_Q2_024_coefficient_15_0479
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0480 : Poly :=
[
  term ((1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (13, 1)]
]

/-- Partial product 480 for generator 15. -/
def ep_Q2_024_partial_15_0480 : Poly :=
[
  term ((3506438538395687096763046348480623904592 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term ((-1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 15. -/
theorem ep_Q2_024_partial_15_0480_valid :
    mulPoly ep_Q2_024_coefficient_15_0480
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0481 : Poly :=
[
  term ((406959173303590965933668180009610581344072929996809673689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 481 for generator 15. -/
def ep_Q2_024_partial_15_0481 : Poly :=
[
  term ((406959173303590965933668180009610581344072929996809673689 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((-406959173303590965933668180009610581344072929996809673689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 15. -/
theorem ep_Q2_024_partial_15_0481_valid :
    mulPoly ep_Q2_024_coefficient_15_0481
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0482 : Poly :=
[
  term ((72016831223309599 : Rat) / 6976681326919158) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 482 for generator 15. -/
def ep_Q2_024_partial_15_0482 : Poly :=
[
  term ((72016831223309599 : Rat) / 3488340663459579) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-72016831223309599 : Rat) / 6976681326919158) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 15. -/
theorem ep_Q2_024_partial_15_0482_valid :
    mulPoly ep_Q2_024_coefficient_15_0482
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0483 : Poly :=
[
  term ((-2928816495609070882668065114807612315926 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 483 for generator 15. -/
def ep_Q2_024_partial_15_0483 : Poly :=
[
  term ((-5857632991218141765336130229615224631852 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((2928816495609070882668065114807612315926 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 15. -/
theorem ep_Q2_024_partial_15_0483_valid :
    mulPoly ep_Q2_024_coefficient_15_0483
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0484 : Poly :=
[
  term ((7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (12, 1)]
]

/-- Partial product 484 for generator 15. -/
def ep_Q2_024_partial_15_0484 : Poly :=
[
  term ((14106225718338129896009340832025179000352 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (12, 1)],
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 15. -/
theorem ep_Q2_024_partial_15_0484_valid :
    mulPoly ep_Q2_024_coefficient_15_0484
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0485 : Poly :=
[
  term ((-21877021813487229219976157300405467744 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 485 for generator 15. -/
def ep_Q2_024_partial_15_0485 : Poly :=
[
  term ((-43754043626974458439952314600810935488 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((21877021813487229219976157300405467744 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 15. -/
theorem ep_Q2_024_partial_15_0485_valid :
    mulPoly ep_Q2_024_coefficient_15_0485
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0486 : Poly :=
[
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (14, 1)]
]

/-- Partial product 486 for generator 15. -/
def ep_Q2_024_partial_15_0486 : Poly :=
[
  term ((-4056273048307645354412530146604063118008 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 15. -/
theorem ep_Q2_024_partial_15_0486_valid :
    mulPoly ep_Q2_024_coefficient_15_0486
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0487 : Poly :=
[
  term ((-13059328412756167799683482513619663544033761218365756009 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (9, 1), (15, 2)]
]

/-- Partial product 487 for generator 15. -/
def ep_Q2_024_partial_15_0487 : Poly :=
[
  term ((-26118656825512335599366965027239327088067522436731512018 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (6, 1), (9, 1), (15, 2)],
  term ((13059328412756167799683482513619663544033761218365756009 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 15. -/
theorem ep_Q2_024_partial_15_0487_valid :
    mulPoly ep_Q2_024_coefficient_15_0487
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0488 : Poly :=
[
  term ((2133095329059788 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 488 for generator 15. -/
def ep_Q2_024_partial_15_0488 : Poly :=
[
  term ((4266190658119576 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2133095329059788 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 15. -/
theorem ep_Q2_024_partial_15_0488_valid :
    mulPoly ep_Q2_024_coefficient_15_0488
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0489 : Poly :=
[
  term ((-3491039794406487438228321855480051349442 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 489 for generator 15. -/
def ep_Q2_024_partial_15_0489 : Poly :=
[
  term ((-6982079588812974876456643710960102698884 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1)],
  term ((3491039794406487438228321855480051349442 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 15. -/
theorem ep_Q2_024_partial_15_0489_valid :
    mulPoly ep_Q2_024_coefficient_15_0489
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0490 : Poly :=
[
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 490 for generator 15. -/
def ep_Q2_024_partial_15_0490 : Poly :=
[
  term ((439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 15. -/
theorem ep_Q2_024_partial_15_0490_valid :
    mulPoly ep_Q2_024_coefficient_15_0490
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0491 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 491 for generator 15. -/
def ep_Q2_024_partial_15_0491 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 15. -/
theorem ep_Q2_024_partial_15_0491_valid :
    mulPoly ep_Q2_024_coefficient_15_0491
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0492 : Poly :=
[
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 15. -/
def ep_Q2_024_partial_15_0492 : Poly :=
[
  term ((3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 15. -/
theorem ep_Q2_024_partial_15_0492_valid :
    mulPoly ep_Q2_024_coefficient_15_0492
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0493 : Poly :=
[
  term ((-271652775508323708133156340156543770392367610052539440723 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 493 for generator 15. -/
def ep_Q2_024_partial_15_0493 : Poly :=
[
  term ((-271652775508323708133156340156543770392367610052539440723 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((271652775508323708133156340156543770392367610052539440723 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 15. -/
theorem ep_Q2_024_partial_15_0493_valid :
    mulPoly ep_Q2_024_coefficient_15_0493
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0494 : Poly :=
[
  term ((-143992363065739487 : Rat) / 6976681326919158) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 15. -/
def ep_Q2_024_partial_15_0494 : Poly :=
[
  term ((-143992363065739487 : Rat) / 3488340663459579) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((143992363065739487 : Rat) / 6976681326919158) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 15. -/
theorem ep_Q2_024_partial_15_0494_valid :
    mulPoly ep_Q2_024_coefficient_15_0494
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0495 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 2), (13, 1)]
]

/-- Partial product 495 for generator 15. -/
def ep_Q2_024_partial_15_0495 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (12, 2), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 15. -/
theorem ep_Q2_024_partial_15_0495_valid :
    mulPoly ep_Q2_024_coefficient_15_0495
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0496 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (12, 2), (15, 1)]
]

/-- Partial product 496 for generator 15. -/
def ep_Q2_024_partial_15_0496 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 15. -/
theorem ep_Q2_024_partial_15_0496_valid :
    mulPoly ep_Q2_024_coefficient_15_0496
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0497 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 497 for generator 15. -/
def ep_Q2_024_partial_15_0497 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 15. -/
theorem ep_Q2_024_partial_15_0497_valid :
    mulPoly ep_Q2_024_coefficient_15_0497
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0498 : Poly :=
[
  term ((364016830513503375824083636539578030008 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 498 for generator 15. -/
def ep_Q2_024_partial_15_0498 : Poly :=
[
  term ((728033661027006751648167273079156060016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-364016830513503375824083636539578030008 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 15. -/
theorem ep_Q2_024_partial_15_0498_valid :
    mulPoly ep_Q2_024_coefficient_15_0498
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0499 : Poly :=
[
  term ((346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

/-- Partial product 499 for generator 15. -/
def ep_Q2_024_partial_15_0499 : Poly :=
[
  term ((693149333427189174185131041977358325136 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 15. -/
theorem ep_Q2_024_partial_15_0499_valid :
    mulPoly ep_Q2_024_coefficient_15_0499
        ep_Q2_024_generator_15_0400_0499 =
      ep_Q2_024_partial_15_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0400_0499 : List Poly :=
[
  ep_Q2_024_partial_15_0400,
  ep_Q2_024_partial_15_0401,
  ep_Q2_024_partial_15_0402,
  ep_Q2_024_partial_15_0403,
  ep_Q2_024_partial_15_0404,
  ep_Q2_024_partial_15_0405,
  ep_Q2_024_partial_15_0406,
  ep_Q2_024_partial_15_0407,
  ep_Q2_024_partial_15_0408,
  ep_Q2_024_partial_15_0409,
  ep_Q2_024_partial_15_0410,
  ep_Q2_024_partial_15_0411,
  ep_Q2_024_partial_15_0412,
  ep_Q2_024_partial_15_0413,
  ep_Q2_024_partial_15_0414,
  ep_Q2_024_partial_15_0415,
  ep_Q2_024_partial_15_0416,
  ep_Q2_024_partial_15_0417,
  ep_Q2_024_partial_15_0418,
  ep_Q2_024_partial_15_0419,
  ep_Q2_024_partial_15_0420,
  ep_Q2_024_partial_15_0421,
  ep_Q2_024_partial_15_0422,
  ep_Q2_024_partial_15_0423,
  ep_Q2_024_partial_15_0424,
  ep_Q2_024_partial_15_0425,
  ep_Q2_024_partial_15_0426,
  ep_Q2_024_partial_15_0427,
  ep_Q2_024_partial_15_0428,
  ep_Q2_024_partial_15_0429,
  ep_Q2_024_partial_15_0430,
  ep_Q2_024_partial_15_0431,
  ep_Q2_024_partial_15_0432,
  ep_Q2_024_partial_15_0433,
  ep_Q2_024_partial_15_0434,
  ep_Q2_024_partial_15_0435,
  ep_Q2_024_partial_15_0436,
  ep_Q2_024_partial_15_0437,
  ep_Q2_024_partial_15_0438,
  ep_Q2_024_partial_15_0439,
  ep_Q2_024_partial_15_0440,
  ep_Q2_024_partial_15_0441,
  ep_Q2_024_partial_15_0442,
  ep_Q2_024_partial_15_0443,
  ep_Q2_024_partial_15_0444,
  ep_Q2_024_partial_15_0445,
  ep_Q2_024_partial_15_0446,
  ep_Q2_024_partial_15_0447,
  ep_Q2_024_partial_15_0448,
  ep_Q2_024_partial_15_0449,
  ep_Q2_024_partial_15_0450,
  ep_Q2_024_partial_15_0451,
  ep_Q2_024_partial_15_0452,
  ep_Q2_024_partial_15_0453,
  ep_Q2_024_partial_15_0454,
  ep_Q2_024_partial_15_0455,
  ep_Q2_024_partial_15_0456,
  ep_Q2_024_partial_15_0457,
  ep_Q2_024_partial_15_0458,
  ep_Q2_024_partial_15_0459,
  ep_Q2_024_partial_15_0460,
  ep_Q2_024_partial_15_0461,
  ep_Q2_024_partial_15_0462,
  ep_Q2_024_partial_15_0463,
  ep_Q2_024_partial_15_0464,
  ep_Q2_024_partial_15_0465,
  ep_Q2_024_partial_15_0466,
  ep_Q2_024_partial_15_0467,
  ep_Q2_024_partial_15_0468,
  ep_Q2_024_partial_15_0469,
  ep_Q2_024_partial_15_0470,
  ep_Q2_024_partial_15_0471,
  ep_Q2_024_partial_15_0472,
  ep_Q2_024_partial_15_0473,
  ep_Q2_024_partial_15_0474,
  ep_Q2_024_partial_15_0475,
  ep_Q2_024_partial_15_0476,
  ep_Q2_024_partial_15_0477,
  ep_Q2_024_partial_15_0478,
  ep_Q2_024_partial_15_0479,
  ep_Q2_024_partial_15_0480,
  ep_Q2_024_partial_15_0481,
  ep_Q2_024_partial_15_0482,
  ep_Q2_024_partial_15_0483,
  ep_Q2_024_partial_15_0484,
  ep_Q2_024_partial_15_0485,
  ep_Q2_024_partial_15_0486,
  ep_Q2_024_partial_15_0487,
  ep_Q2_024_partial_15_0488,
  ep_Q2_024_partial_15_0489,
  ep_Q2_024_partial_15_0490,
  ep_Q2_024_partial_15_0491,
  ep_Q2_024_partial_15_0492,
  ep_Q2_024_partial_15_0493,
  ep_Q2_024_partial_15_0494,
  ep_Q2_024_partial_15_0495,
  ep_Q2_024_partial_15_0496,
  ep_Q2_024_partial_15_0497,
  ep_Q2_024_partial_15_0498,
  ep_Q2_024_partial_15_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0400_0499 : Poly :=
[
  term ((30218434513036630647433378446774573268634657606399219032 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((-4260442133884832 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((122804206556829177898004594373894379094 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2)],
  term ((-13570197242000842859047714238846971333664 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2), (14, 2)],
  term ((-23061024265323965508051252258804260276981972566592055112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((301322371177440 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 3), (15, 1)],
  term ((-853492242690111599427956437383942032069 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (14, 1)],
  term ((51698933009934061797361542365561147199814620993416825861 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-139695870987039889 : Rat) / 3488340663459579) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((1083189271810614859300480165671590384882885436473620011277 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (6, 1), (15, 2)],
  term ((60025162259000265 : Rat) / 2325560442306386) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (15, 3)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-61402103278414588949002297186947189547 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2)],
  term ((6785098621000421429523857119423485666832 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 2)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 2), (15, 2)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 3), (15, 1)],
  term ((853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1), (14, 1)],
  term ((-51698933009934061797361542365561147199814620993416825861 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (14, 1), (15, 2)],
  term ((139695870987039889 : Rat) / 6976681326919158) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (14, 2), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1083189271810614859300480165671590384882885436473620011277 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (15, 2)],
  term ((-60025162259000265 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6659286221410605625377359683362613300424 : Rat) / 1799564186103715944850040292044308901985) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-112925877134122375318482939998583635371844772388621857119 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((36885281294131109 : Rat) / 3488340663459579) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 2), (3, 1), (13, 1)],
  term ((112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (3, 1), (15, 1)],
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (6, 1), (9, 1)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (6, 1), (13, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (6, 1), (15, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((430326068874390043767614115526342046144 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((71468851862135219280772996134182424817310949427353054879 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 2)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72157377400783269951842257442992766033230702678758901343 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (13, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 2), (6, 1), (15, 2)],
  term ((19703340389129022 : Rat) / 1162780221153193) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (13, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (15, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (11, 1)],
  term ((-215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (13, 1)],
  term ((-71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (9, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 2)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (11, 1), (13, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (11, 1), (15, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (13, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (13, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 2), (15, 2), (16, 1)],
  term ((-4458447591231309742478111612051208159724 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 1), (3, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1)],
  term ((439165574351317027328597678950990790048 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((479115938187114839403973908717799367488 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((-6544646828116480195851509250156034762852238645975674672 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((4525345275584 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (9, 1)],
  term ((-239557969093557419701986954358899683744 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)],
  term ((3272323414058240097925754625078017381426119322987837336 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((-2262672637792 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((8916895182462619484956223224102416319448 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((3241173919296764417186180611673612447056 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (6, 1), (8, 1)],
  term ((-1952020120865172684821412275108055944672 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((27130320051483874779001434360058490581240592138093573014 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-19436929844084168 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1640925836848218604613933742224210947456 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 2)],
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1)],
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((-2108843069097728 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((174387597396569679045385362785627677503893371381937419019 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-12182991655950980 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((999388901907432442689210242412893919152 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 2)],
  term ((1514730811938969984171004202966623759348 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((70401968402328451832893051496183231462484150674916090649 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2)],
  term ((-37150726142058124 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1620586959648382208593090305836806223528 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (8, 1)],
  term ((976010060432586342410706137554027972336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-174387597396569679045385362785627677503893371381937419019 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((6091495827975490 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-499694450953716221344605121206446959576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((-757365405969484992085502101483311879674 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-70401968402328451832893051496183231462484150674916090649 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((18575363071029062 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (5, 1)],
  term ((-7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (5, 1), (6, 1)],
  term ((-186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((-17864461639187578218700168943739902602175097017053879744 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2)],
  term ((3593020435436800 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((2074172699534206160586060347251907595136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (8, 1), (9, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3506438538395687096763046348480623904592 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term ((406959173303590965933668180009610581344072929996809673689 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((72016831223309599 : Rat) / 3488340663459579) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5857632991218141765336130229615224631852 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((14106225718338129896009340832025179000352 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (12, 1)],
  term ((-43754043626974458439952314600810935488 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4056273048307645354412530146604063118008 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((-26118656825512335599366965027239327088067522436731512018 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (6, 1), (9, 1), (15, 2)],
  term ((4266190658119576 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6982079588812974876456643710960102698884 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1)],
  term ((439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-271652775508323708133156340156543770392367610052539440723 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((-143992363065739487 : Rat) / 3488340663459579) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((675601903660285985345432854218156858512 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((693149333427189174185131041977358325136 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (13, 1)],
  term ((-406959173303590965933668180009610581344072929996809673689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-72016831223309599 : Rat) / 6976681326919158) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((2928816495609070882668065114807612315926 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)],
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (12, 1)],
  term ((21877021813487229219976157300405467744 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((13059328412756167799683482513619663544033761218365756009 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-2133095329059788 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((3491039794406487438228321855480051349442 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (12, 1), (13, 1)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((271652775508323708133156340156543770392367610052539440723 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((143992363065739487 : Rat) / 6976681326919158) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-364016830513503375824083636539578030008 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (13, 1)],
  term ((-346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 400 through 499. -/
theorem ep_Q2_024_block_15_0400_0499_valid :
    checkProductSumEq ep_Q2_024_partials_15_0400_0499
      ep_Q2_024_block_15_0400_0499 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
