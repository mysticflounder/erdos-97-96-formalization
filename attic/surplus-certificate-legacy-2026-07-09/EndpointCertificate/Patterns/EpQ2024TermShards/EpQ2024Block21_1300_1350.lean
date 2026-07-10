/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:1300-1350

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_1300_1350 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1300 : Poly :=
[
  term ((3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1300 for generator 21. -/
def ep_Q2_024_partial_21_1300 : Poly :=
[
  term ((7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 21. -/
theorem ep_Q2_024_partial_21_1300_valid :
    mulPoly ep_Q2_024_coefficient_21_1300
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1301 : Poly :=
[
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1301 for generator 21. -/
def ep_Q2_024_partial_21_1301 : Poly :=
[
  term ((-39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 21. -/
theorem ep_Q2_024_partial_21_1301_valid :
    mulPoly ep_Q2_024_coefficient_21_1301
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1302 : Poly :=
[
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1302 for generator 21. -/
def ep_Q2_024_partial_21_1302 : Poly :=
[
  term ((-6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 21. -/
theorem ep_Q2_024_partial_21_1302_valid :
    mulPoly ep_Q2_024_coefficient_21_1302
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1303 : Poly :=
[
  term ((2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1303 for generator 21. -/
def ep_Q2_024_partial_21_1303 : Poly :=
[
  term ((5138367026104072 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 21. -/
theorem ep_Q2_024_partial_21_1303_valid :
    mulPoly ep_Q2_024_coefficient_21_1303
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1304 : Poly :=
[
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1304 for generator 21. -/
def ep_Q2_024_partial_21_1304 : Poly :=
[
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 21. -/
theorem ep_Q2_024_partial_21_1304_valid :
    mulPoly ep_Q2_024_coefficient_21_1304
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1305 : Poly :=
[
  term ((3654372084731843 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1305 for generator 21. -/
def ep_Q2_024_partial_21_1305 : Poly :=
[
  term ((7308744169463686 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3654372084731843 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 21. -/
theorem ep_Q2_024_partial_21_1305_valid :
    mulPoly ep_Q2_024_coefficient_21_1305
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1306 : Poly :=
[
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 3), (13, 1)]
]

/-- Partial product 1306 for generator 21. -/
def ep_Q2_024_partial_21_1306 : Poly :=
[
  term ((-54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(10, 1), (11, 1), (12, 3), (13, 1)],
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 21. -/
theorem ep_Q2_024_partial_21_1306_valid :
    mulPoly ep_Q2_024_coefficient_21_1306
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1307 : Poly :=
[
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 3), (15, 1)]
]

/-- Partial product 1307 for generator 21. -/
def ep_Q2_024_partial_21_1307 : Poly :=
[
  term ((7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 21. -/
theorem ep_Q2_024_partial_21_1307_valid :
    mulPoly ep_Q2_024_coefficient_21_1307
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1308 : Poly :=
[
  term ((-1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 1308 for generator 21. -/
def ep_Q2_024_partial_21_1308 : Poly :=
[
  term ((-3517107295139328 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 21. -/
theorem ep_Q2_024_partial_21_1308_valid :
    mulPoly ep_Q2_024_coefficient_21_1308
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1309 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1309 for generator 21. -/
def ep_Q2_024_partial_21_1309 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 21. -/
theorem ep_Q2_024_partial_21_1309_valid :
    mulPoly ep_Q2_024_coefficient_21_1309
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1310 : Poly :=
[
  term ((28986108453490 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1310 for generator 21. -/
def ep_Q2_024_partial_21_1310 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 21. -/
theorem ep_Q2_024_partial_21_1310_valid :
    mulPoly ep_Q2_024_coefficient_21_1310
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1311 : Poly :=
[
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1311 for generator 21. -/
def ep_Q2_024_partial_21_1311 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 21. -/
theorem ep_Q2_024_partial_21_1311_valid :
    mulPoly ep_Q2_024_coefficient_21_1311
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1312 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1312 for generator 21. -/
def ep_Q2_024_partial_21_1312 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 21. -/
theorem ep_Q2_024_partial_21_1312_valid :
    mulPoly ep_Q2_024_coefficient_21_1312
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1313 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 1313 for generator 21. -/
def ep_Q2_024_partial_21_1313 : Poly :=
[
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 21. -/
theorem ep_Q2_024_partial_21_1313_valid :
    mulPoly ep_Q2_024_coefficient_21_1313
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1314 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1314 for generator 21. -/
def ep_Q2_024_partial_21_1314 : Poly :=
[
  term ((-115944433813960 : Rat) / 1162780221153193) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 21. -/
theorem ep_Q2_024_partial_21_1314_valid :
    mulPoly ep_Q2_024_coefficient_21_1314
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1315 : Poly :=
[
  term ((-899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) [(12, 1)]
]

/-- Partial product 1315 for generator 21. -/
def ep_Q2_024_partial_21_1315 : Poly :=
[
  term ((-899577984319840560871887548779244872903 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1)],
  term ((899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 21. -/
theorem ep_Q2_024_partial_21_1315_valid :
    mulPoly ep_Q2_024_coefficient_21_1315
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1316 : Poly :=
[
  term ((1402858606193003795293795081130444602766350605177283648 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1316 for generator 21. -/
def ep_Q2_024_partial_21_1316 : Poly :=
[
  term ((2805717212386007590587590162260889205532701210354567296 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1402858606193003795293795081130444602766350605177283648 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 21. -/
theorem ep_Q2_024_partial_21_1316_valid :
    mulPoly ep_Q2_024_coefficient_21_1316
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1317 : Poly :=
[
  term ((-1493083691786256 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1317 for generator 21. -/
def ep_Q2_024_partial_21_1317 : Poly :=
[
  term ((-2986167383572512 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1493083691786256 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 21. -/
theorem ep_Q2_024_partial_21_1317_valid :
    mulPoly ep_Q2_024_coefficient_21_1317
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1318 : Poly :=
[
  term ((125063519979080333921499785119550105707411144023731761461 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1318 for generator 21. -/
def ep_Q2_024_partial_21_1318 : Poly :=
[
  term ((125063519979080333921499785119550105707411144023731761461 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-125063519979080333921499785119550105707411144023731761461 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 21. -/
theorem ep_Q2_024_partial_21_1318_valid :
    mulPoly ep_Q2_024_coefficient_21_1318
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1319 : Poly :=
[
  term ((-15081049171699453 : Rat) / 4651120884612772) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1319 for generator 21. -/
def ep_Q2_024_partial_21_1319 : Poly :=
[
  term ((-15081049171699453 : Rat) / 2325560442306386) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15081049171699453 : Rat) / 4651120884612772) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 21. -/
theorem ep_Q2_024_partial_21_1319_valid :
    mulPoly ep_Q2_024_coefficient_21_1319
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1320 : Poly :=
[
  term ((-356886077305283504187781248636003131621 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

/-- Partial product 1320 for generator 21. -/
def ep_Q2_024_partial_21_1320 : Poly :=
[
  term ((-713772154610567008375562497272006263242 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2)],
  term ((356886077305283504187781248636003131621 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 21. -/
theorem ep_Q2_024_partial_21_1320_valid :
    mulPoly ep_Q2_024_coefficient_21_1320
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1321 : Poly :=
[
  term ((8823602961713967795360406154610523816 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1321 for generator 21. -/
def ep_Q2_024_partial_21_1321 : Poly :=
[
  term ((17647205923427935590720812309221047632 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-8823602961713967795360406154610523816 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 21. -/
theorem ep_Q2_024_partial_21_1321_valid :
    mulPoly ep_Q2_024_coefficient_21_1321
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1322 : Poly :=
[
  term ((442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (14, 1)]
]

/-- Partial product 1322 for generator 21. -/
def ep_Q2_024_partial_21_1322 : Poly :=
[
  term ((885562783871876131801287918370833928282 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1), (14, 1)],
  term ((-442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 21. -/
theorem ep_Q2_024_partial_21_1322_valid :
    mulPoly ep_Q2_024_coefficient_21_1322
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1323 : Poly :=
[
  term ((20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1323 for generator 21. -/
def ep_Q2_024_partial_21_1323 : Poly :=
[
  term ((40547030721321616554111454721571653923601004555500799614 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 21. -/
theorem ep_Q2_024_partial_21_1323_valid :
    mulPoly ep_Q2_024_coefficient_21_1323
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1324 : Poly :=
[
  term ((986892597849932 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1324 for generator 21. -/
def ep_Q2_024_partial_21_1324 : Poly :=
[
  term ((1973785195699864 : Rat) / 1162780221153193) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-986892597849932 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 21. -/
theorem ep_Q2_024_partial_21_1324_valid :
    mulPoly ep_Q2_024_coefficient_21_1324
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1325 : Poly :=
[
  term ((-20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(12, 1), (15, 2)]
]

/-- Partial product 1325 for generator 21. -/
def ep_Q2_024_partial_21_1325 : Poly :=
[
  term ((-20700641259497920354469748653216109311580716795513273779 : Rat) / 185999790426403963700954686167253179493469284649492276) [(10, 1), (12, 1), (15, 2)],
  term ((20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 21. -/
theorem ep_Q2_024_partial_21_1325_valid :
    mulPoly ep_Q2_024_coefficient_21_1325
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1326 : Poly :=
[
  term ((11065542580987239 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1326 for generator 21. -/
def ep_Q2_024_partial_21_1326 : Poly :=
[
  term ((11065542580987239 : Rat) / 1162780221153193) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11065542580987239 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 21. -/
theorem ep_Q2_024_partial_21_1326_valid :
    mulPoly ep_Q2_024_coefficient_21_1326
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1327 : Poly :=
[
  term ((3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)]
]

/-- Partial product 1327 for generator 21. -/
def ep_Q2_024_partial_21_1327 : Poly :=
[
  term ((3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 2)],
  term ((-3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 21. -/
theorem ep_Q2_024_partial_21_1327_valid :
    mulPoly ep_Q2_024_coefficient_21_1327
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1328 : Poly :=
[
  term ((-663687363464395493242464799233703360607925217337761747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1328 for generator 21. -/
def ep_Q2_024_partial_21_1328 : Poly :=
[
  term ((-1327374726928790986484929598467406721215850434675523494 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((663687363464395493242464799233703360607925217337761747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 21. -/
theorem ep_Q2_024_partial_21_1328_valid :
    mulPoly ep_Q2_024_coefficient_21_1328
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1329 : Poly :=
[
  term ((-884148848535676 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1329 for generator 21. -/
def ep_Q2_024_partial_21_1329 : Poly :=
[
  term ((-1768297697071352 : Rat) / 1162780221153193) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((884148848535676 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 21. -/
theorem ep_Q2_024_partial_21_1329_valid :
    mulPoly ep_Q2_024_coefficient_21_1329
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1330 : Poly :=
[
  term ((17584558770739660517560042664784307136 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)]
]

/-- Partial product 1330 for generator 21. -/
def ep_Q2_024_partial_21_1330 : Poly :=
[
  term ((35169117541479321035120085329568614272 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 2), (13, 2)],
  term ((-17584558770739660517560042664784307136 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 21. -/
theorem ep_Q2_024_partial_21_1330_valid :
    mulPoly ep_Q2_024_coefficient_21_1330
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1331 : Poly :=
[
  term ((4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (15, 2)]
]

/-- Partial product 1331 for generator 21. -/
def ep_Q2_024_partial_21_1331 : Poly :=
[
  term ((8287183632400201720469305978480902741495456361248959444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (15, 2)],
  term ((-4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 21. -/
theorem ep_Q2_024_partial_21_1331_valid :
    mulPoly ep_Q2_024_coefficient_21_1331
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1332 : Poly :=
[
  term ((-205764632587768 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1332 for generator 21. -/
def ep_Q2_024_partial_21_1332 : Poly :=
[
  term ((-411529265175536 : Rat) / 1162780221153193) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((205764632587768 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 21. -/
theorem ep_Q2_024_partial_21_1332_valid :
    mulPoly ep_Q2_024_coefficient_21_1332
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1333 : Poly :=
[
  term ((2630935571061860204683141042587004946833587022868345873 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1333 for generator 21. -/
def ep_Q2_024_partial_21_1333 : Poly :=
[
  term ((2630935571061860204683141042587004946833587022868345873 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2630935571061860204683141042587004946833587022868345873 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 21. -/
theorem ep_Q2_024_partial_21_1333_valid :
    mulPoly ep_Q2_024_coefficient_21_1333
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1334 : Poly :=
[
  term ((625475805780714 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1334 for generator 21. -/
def ep_Q2_024_partial_21_1334 : Poly :=
[
  term ((1250951611561428 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-625475805780714 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 21. -/
theorem ep_Q2_024_partial_21_1334_valid :
    mulPoly ep_Q2_024_coefficient_21_1334
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1335 : Poly :=
[
  term ((-622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1335 for generator 21. -/
def ep_Q2_024_partial_21_1335 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 21. -/
theorem ep_Q2_024_partial_21_1335_valid :
    mulPoly ep_Q2_024_coefficient_21_1335
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1336 : Poly :=
[
  term ((156138474323308 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1336 for generator 21. -/
def ep_Q2_024_partial_21_1336 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-156138474323308 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 21. -/
theorem ep_Q2_024_partial_21_1336_valid :
    mulPoly ep_Q2_024_coefficient_21_1336
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1337 : Poly :=
[
  term ((269572619290367145925693031522732522232016406550237283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(13, 1), (15, 1)]
]

/-- Partial product 1337 for generator 21. -/
def ep_Q2_024_partial_21_1337 : Poly :=
[
  term ((269572619290367145925693031522732522232016406550237283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (13, 1), (15, 1)],
  term ((-269572619290367145925693031522732522232016406550237283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 21. -/
theorem ep_Q2_024_partial_21_1337_valid :
    mulPoly ep_Q2_024_coefficient_21_1337
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1338 : Poly :=
[
  term ((1436814438016135 : Rat) / 2325560442306386) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1338 for generator 21. -/
def ep_Q2_024_partial_21_1338 : Poly :=
[
  term ((1436814438016135 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1436814438016135 : Rat) / 2325560442306386) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 21. -/
theorem ep_Q2_024_partial_21_1338_valid :
    mulPoly ep_Q2_024_coefficient_21_1338
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1339 : Poly :=
[
  term ((-622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 3)]
]

/-- Partial product 1339 for generator 21. -/
def ep_Q2_024_partial_21_1339 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (15, 3)],
  term ((622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 21. -/
theorem ep_Q2_024_partial_21_1339_valid :
    mulPoly ep_Q2_024_coefficient_21_1339
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1340 : Poly :=
[
  term ((156138474323308 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1340 for generator 21. -/
def ep_Q2_024_partial_21_1340 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-156138474323308 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 21. -/
theorem ep_Q2_024_partial_21_1340_valid :
    mulPoly ep_Q2_024_coefficient_21_1340
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1341 : Poly :=
[
  term ((-55276587413544314892786707932789999829 : Rat) / 199951576233746216094448921338256544665) [(13, 2)]
]

/-- Partial product 1341 for generator 21. -/
def ep_Q2_024_partial_21_1341 : Poly :=
[
  term ((-110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2)],
  term ((55276587413544314892786707932789999829 : Rat) / 199951576233746216094448921338256544665) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 21. -/
theorem ep_Q2_024_partial_21_1341_valid :
    mulPoly ep_Q2_024_coefficient_21_1341
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1342 : Poly :=
[
  term ((1060843780828011690178037117696406736 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 1)]
]

/-- Partial product 1342 for generator 21. -/
def ep_Q2_024_partial_21_1342 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2), (14, 1)],
  term ((-1060843780828011690178037117696406736 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 21. -/
theorem ep_Q2_024_partial_21_1342_valid :
    mulPoly ep_Q2_024_coefficient_21_1342
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1343 : Poly :=
[
  term ((-6496927284261146960489421757747003796 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)]
]

/-- Partial product 1343 for generator 21. -/
def ep_Q2_024_partial_21_1343 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 2), (14, 2)],
  term ((6496927284261146960489421757747003796 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 21. -/
theorem ep_Q2_024_partial_21_1343_valid :
    mulPoly ep_Q2_024_coefficient_21_1343
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1344 : Poly :=
[
  term ((1199118109195365032966125260719726805709752119899643196 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 2), (15, 2)]
]

/-- Partial product 1344 for generator 21. -/
def ep_Q2_024_partial_21_1344 : Poly :=
[
  term ((2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (13, 2), (15, 2)],
  term ((-1199118109195365032966125260719726805709752119899643196 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 21. -/
theorem ep_Q2_024_partial_21_1344_valid :
    mulPoly ep_Q2_024_coefficient_21_1344
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1345 : Poly :=
[
  term ((-849117674508032 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1345 for generator 21. -/
def ep_Q2_024_partial_21_1345 : Poly :=
[
  term ((-1698235349016064 : Rat) / 1162780221153193) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((849117674508032 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 21. -/
theorem ep_Q2_024_partial_21_1345_valid :
    mulPoly ep_Q2_024_coefficient_21_1345
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1346 : Poly :=
[
  term ((37639210774093647020343113444543393296 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 1)]
]

/-- Partial product 1346 for generator 21. -/
def ep_Q2_024_partial_21_1346 : Poly :=
[
  term ((75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 3), (15, 1)],
  term ((-37639210774093647020343113444543393296 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 21. -/
theorem ep_Q2_024_partial_21_1346_valid :
    mulPoly ep_Q2_024_coefficient_21_1346
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1347 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(14, 1), (15, 2)]
]

/-- Partial product 1347 for generator 21. -/
def ep_Q2_024_partial_21_1347 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (14, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 21. -/
theorem ep_Q2_024_partial_21_1347_valid :
    mulPoly ep_Q2_024_coefficient_21_1347
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1348 : Poly :=
[
  term ((28986108453490 : Rat) / 1162780221153193) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1348 for generator 21. -/
def ep_Q2_024_partial_21_1348 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 21. -/
theorem ep_Q2_024_partial_21_1348_valid :
    mulPoly ep_Q2_024_coefficient_21_1348
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1349 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(15, 2)]
]

/-- Partial product 1349 for generator 21. -/
def ep_Q2_024_partial_21_1349 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 21. -/
theorem ep_Q2_024_partial_21_1349_valid :
    mulPoly ep_Q2_024_coefficient_21_1349
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1350 : Poly :=
[
  term ((-14493054226745 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

/-- Partial product 1350 for generator 21. -/
def ep_Q2_024_partial_21_1350 : Poly :=
[
  term ((-28986108453490 : Rat) / 1162780221153193) [(10, 1), (15, 2), (16, 1)],
  term ((14493054226745 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 21. -/
theorem ep_Q2_024_partial_21_1350_valid :
    mulPoly ep_Q2_024_coefficient_21_1350
        ep_Q2_024_generator_21_1300_1350 =
      ep_Q2_024_partial_21_1350 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_1300_1350 : List Poly :=
[
  ep_Q2_024_partial_21_1300,
  ep_Q2_024_partial_21_1301,
  ep_Q2_024_partial_21_1302,
  ep_Q2_024_partial_21_1303,
  ep_Q2_024_partial_21_1304,
  ep_Q2_024_partial_21_1305,
  ep_Q2_024_partial_21_1306,
  ep_Q2_024_partial_21_1307,
  ep_Q2_024_partial_21_1308,
  ep_Q2_024_partial_21_1309,
  ep_Q2_024_partial_21_1310,
  ep_Q2_024_partial_21_1311,
  ep_Q2_024_partial_21_1312,
  ep_Q2_024_partial_21_1313,
  ep_Q2_024_partial_21_1314,
  ep_Q2_024_partial_21_1315,
  ep_Q2_024_partial_21_1316,
  ep_Q2_024_partial_21_1317,
  ep_Q2_024_partial_21_1318,
  ep_Q2_024_partial_21_1319,
  ep_Q2_024_partial_21_1320,
  ep_Q2_024_partial_21_1321,
  ep_Q2_024_partial_21_1322,
  ep_Q2_024_partial_21_1323,
  ep_Q2_024_partial_21_1324,
  ep_Q2_024_partial_21_1325,
  ep_Q2_024_partial_21_1326,
  ep_Q2_024_partial_21_1327,
  ep_Q2_024_partial_21_1328,
  ep_Q2_024_partial_21_1329,
  ep_Q2_024_partial_21_1330,
  ep_Q2_024_partial_21_1331,
  ep_Q2_024_partial_21_1332,
  ep_Q2_024_partial_21_1333,
  ep_Q2_024_partial_21_1334,
  ep_Q2_024_partial_21_1335,
  ep_Q2_024_partial_21_1336,
  ep_Q2_024_partial_21_1337,
  ep_Q2_024_partial_21_1338,
  ep_Q2_024_partial_21_1339,
  ep_Q2_024_partial_21_1340,
  ep_Q2_024_partial_21_1341,
  ep_Q2_024_partial_21_1342,
  ep_Q2_024_partial_21_1343,
  ep_Q2_024_partial_21_1344,
  ep_Q2_024_partial_21_1345,
  ep_Q2_024_partial_21_1346,
  ep_Q2_024_partial_21_1347,
  ep_Q2_024_partial_21_1348,
  ep_Q2_024_partial_21_1349,
  ep_Q2_024_partial_21_1350
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_1300_1350 : Poly :=
[
  term ((7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((5138367026104072 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((7308744169463686 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(10, 1), (11, 1), (12, 3), (13, 1)],
  term ((7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((-3517107295139328 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-899577984319840560871887548779244872903 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1)],
  term ((2805717212386007590587590162260889205532701210354567296 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2986167383572512 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((125063519979080333921499785119550105707411144023731761461 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-15081049171699453 : Rat) / 2325560442306386) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-713772154610567008375562497272006263242 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2)],
  term ((17647205923427935590720812309221047632 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((885562783871876131801287918370833928282 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1), (14, 1)],
  term ((40547030721321616554111454721571653923601004555500799614 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1973785195699864 : Rat) / 1162780221153193) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20700641259497920354469748653216109311580716795513273779 : Rat) / 185999790426403963700954686167253179493469284649492276) [(10, 1), (12, 1), (15, 2)],
  term ((11065542580987239 : Rat) / 1162780221153193) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 2)],
  term ((-1327374726928790986484929598467406721215850434675523494 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1768297697071352 : Rat) / 1162780221153193) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((35169117541479321035120085329568614272 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 2), (13, 2)],
  term ((8287183632400201720469305978480902741495456361248959444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (15, 2)],
  term ((-411529265175536 : Rat) / 1162780221153193) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((2630935571061860204683141042587004946833587022868345873 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((269572619290367145925693031522732522232016406550237283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (13, 1), (15, 1)],
  term ((1436814438016135 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (15, 3)],
  term ((312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 2), (14, 2)],
  term ((2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (13, 2), (15, 2)],
  term ((-1698235349016064 : Rat) / 1162780221153193) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 3), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (14, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (15, 2)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(10, 1), (15, 2), (16, 1)],
  term ((-3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(11, 1), (12, 2), (13, 1)],
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 2), (15, 1)],
  term ((-3654372084731843 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 3), (13, 1)],
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 3), (15, 1)],
  term ((1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (13, 1), (15, 2)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 2), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) [(12, 1)],
  term ((-1402858606193003795293795081130444602766350605177283648 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1493083691786256 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125063519979080333921499785119550105707411144023731761461 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(12, 1), (13, 1), (15, 1)],
  term ((15081049171699453 : Rat) / 4651120884612772) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((356886077305283504187781248636003131621 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)],
  term ((-8823602961713967795360406154610523816 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 1)],
  term ((-442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (14, 1)],
  term ((-20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (14, 1), (15, 2)],
  term ((-986892597849932 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(12, 1), (15, 2)],
  term ((-11065542580987239 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)],
  term ((-3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)],
  term ((663687363464395493242464799233703360607925217337761747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (13, 1), (15, 1)],
  term ((884148848535676 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17584558770739660517560042664784307136 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)],
  term ((-4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (15, 2)],
  term ((205764632587768 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)],
  term ((-2630935571061860204683141042587004946833587022868345873 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 1), (15, 1)],
  term ((-625475805780714 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)],
  term ((-156138474323308 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-269572619290367145925693031522732522232016406550237283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(13, 1), (15, 1)],
  term ((-1436814438016135 : Rat) / 2325560442306386) [(13, 1), (15, 1), (16, 1)],
  term ((622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 3)],
  term ((-156138474323308 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)],
  term ((55276587413544314892786707932789999829 : Rat) / 199951576233746216094448921338256544665) [(13, 2)],
  term ((-1060843780828011690178037117696406736 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 1)],
  term ((6496927284261146960489421757747003796 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)],
  term ((-1199118109195365032966125260719726805709752119899643196 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 2), (15, 2)],
  term ((849117674508032 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)],
  term ((-37639210774093647020343113444543393296 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(14, 1), (15, 2)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(14, 1), (15, 2), (16, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(15, 2)],
  term ((14493054226745 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 1300 through 1350. -/
theorem ep_Q2_024_block_21_1300_1350_valid :
    checkProductSumEq ep_Q2_024_partials_21_1300_1350
      ep_Q2_024_block_21_1300_1350 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
