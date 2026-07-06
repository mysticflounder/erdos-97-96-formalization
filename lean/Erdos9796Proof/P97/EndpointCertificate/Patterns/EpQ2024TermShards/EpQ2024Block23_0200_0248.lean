/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 23:200-248

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_23_0200_0248 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0200 : Poly :=
[
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 200 for generator 23. -/
def ep_Q2_024_partial_23_0200 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 2), (13, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 3)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 23. -/
theorem ep_Q2_024_partial_23_0200_valid :
    mulPoly ep_Q2_024_coefficient_23_0200
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0201 : Poly :=
[
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 201 for generator 23. -/
def ep_Q2_024_partial_23_0201 : Poly :=
[
  term ((-607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 23. -/
theorem ep_Q2_024_partial_23_0201_valid :
    mulPoly ep_Q2_024_coefficient_23_0201
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0202 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 23. -/
def ep_Q2_024_partial_23_0202 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 23. -/
theorem ep_Q2_024_partial_23_0202_valid :
    mulPoly ep_Q2_024_coefficient_23_0202
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0203 : Poly :=
[
  term ((1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1)]
]

/-- Partial product 203 for generator 23. -/
def ep_Q2_024_partial_23_0203 : Poly :=
[
  term ((3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 2)],
  term ((3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2)],
  term ((-1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 23. -/
theorem ep_Q2_024_partial_23_0203_valid :
    mulPoly ep_Q2_024_coefficient_23_0203
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0204 : Poly :=
[
  term ((-308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (14, 1)]
]

/-- Partial product 204 for generator 23. -/
def ep_Q2_024_partial_23_0204 : Poly :=
[
  term ((-617897363718370228337177347023560251816 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-617897363718370228337177347023560251816 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 2), (14, 1)],
  term ((308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 23. -/
theorem ep_Q2_024_partial_23_0204_valid :
    mulPoly ep_Q2_024_coefficient_23_0204
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0205 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1)]
]

/-- Partial product 205 for generator 23. -/
def ep_Q2_024_partial_23_0205 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 1), (11, 1), (12, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (12, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (13, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 23. -/
theorem ep_Q2_024_partial_23_0205_valid :
    mulPoly ep_Q2_024_coefficient_23_0205
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0206 : Poly :=
[
  term ((-3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 206 for generator 23. -/
def ep_Q2_024_partial_23_0206 : Poly :=
[
  term ((-7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(11, 1), (12, 1), (13, 3)],
  term ((3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(11, 1), (12, 3), (13, 1)],
  term ((-7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 23. -/
theorem ep_Q2_024_partial_23_0206_valid :
    mulPoly ep_Q2_024_coefficient_23_0206
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0207 : Poly :=
[
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 207 for generator 23. -/
def ep_Q2_024_partial_23_0207 : Poly :=
[
  term ((39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 3), (14, 1)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 3), (13, 1), (14, 1)],
  term ((39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 23. -/
theorem ep_Q2_024_partial_23_0207_valid :
    mulPoly ep_Q2_024_coefficient_23_0207
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0208 : Poly :=
[
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 208 for generator 23. -/
def ep_Q2_024_partial_23_0208 : Poly :=
[
  term ((6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 3), (14, 1), (15, 1)],
  term ((6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 23. -/
theorem ep_Q2_024_partial_23_0208_valid :
    mulPoly ep_Q2_024_coefficient_23_0208
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0209 : Poly :=
[
  term ((-2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 23. -/
def ep_Q2_024_partial_23_0209 : Poly :=
[
  term ((-5138367026104072 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5138367026104072 : Rat) / 1162780221153193) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 23. -/
theorem ep_Q2_024_partial_23_0209_valid :
    mulPoly ep_Q2_024_coefficient_23_0209
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0210 : Poly :=
[
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 210 for generator 23. -/
def ep_Q2_024_partial_23_0210 : Poly :=
[
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 3), (15, 1)],
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 23. -/
theorem ep_Q2_024_partial_23_0210_valid :
    mulPoly ep_Q2_024_coefficient_23_0210
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0211 : Poly :=
[
  term ((-3654372084731843 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 23. -/
def ep_Q2_024_partial_23_0211 : Poly :=
[
  term ((-7308744169463686 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3654372084731843 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3654372084731843 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-7308744169463686 : Rat) / 1162780221153193) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 23. -/
theorem ep_Q2_024_partial_23_0211_valid :
    mulPoly ep_Q2_024_coefficient_23_0211
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0212 : Poly :=
[
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 212 for generator 23. -/
def ep_Q2_024_partial_23_0212 : Poly :=
[
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(10, 1), (11, 1), (12, 3), (13, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 3)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 4), (13, 1)],
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(11, 2), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 23. -/
theorem ep_Q2_024_partial_23_0212_valid :
    mulPoly ep_Q2_024_coefficient_23_0212
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0213 : Poly :=
[
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 213 for generator 23. -/
def ep_Q2_024_partial_23_0213 : Poly :=
[
  term ((-7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 4), (15, 1)],
  term ((-7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 23. -/
theorem ep_Q2_024_partial_23_0213_valid :
    mulPoly ep_Q2_024_coefficient_23_0213
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0214 : Poly :=
[
  term ((1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 23. -/
def ep_Q2_024_partial_23_0214 : Poly :=
[
  term ((3517107295139328 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 4), (15, 1), (16, 1)],
  term ((3517107295139328 : Rat) / 1162780221153193) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 23. -/
theorem ep_Q2_024_partial_23_0214_valid :
    mulPoly ep_Q2_024_coefficient_23_0214
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0215 : Poly :=
[
  term ((-110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 1)]
]

/-- Partial product 215 for generator 23. -/
def ep_Q2_024_partial_23_0215 : Poly :=
[
  term ((-221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 2), (13, 1)],
  term ((110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 3)],
  term ((-221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 23. -/
theorem ep_Q2_024_partial_23_0215_valid :
    mulPoly ep_Q2_024_coefficient_23_0215
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0216 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 216 for generator 23. -/
def ep_Q2_024_partial_23_0216 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 3), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 23. -/
theorem ep_Q2_024_partial_23_0216_valid :
    mulPoly ep_Q2_024_coefficient_23_0216
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0217 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 217 for generator 23. -/
def ep_Q2_024_partial_23_0217 : Poly :=
[
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3), (14, 2)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 23. -/
theorem ep_Q2_024_partial_23_0217_valid :
    mulPoly ep_Q2_024_coefficient_23_0217
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0218 : Poly :=
[
  term ((2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 218 for generator 23. -/
def ep_Q2_024_partial_23_0218 : Poly :=
[
  term ((4796472436781460131864501042878907222839008479598572784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (13, 3), (15, 2)],
  term ((4796472436781460131864501042878907222839008479598572784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 23. -/
theorem ep_Q2_024_partial_23_0218_valid :
    mulPoly ep_Q2_024_coefficient_23_0218
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0219 : Poly :=
[
  term ((-1698235349016064 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 219 for generator 23. -/
def ep_Q2_024_partial_23_0219 : Poly :=
[
  term ((-3396470698032128 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1698235349016064 : Rat) / 1162780221153193) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1698235349016064 : Rat) / 1162780221153193) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3396470698032128 : Rat) / 1162780221153193) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 23. -/
theorem ep_Q2_024_partial_23_0219_valid :
    mulPoly ep_Q2_024_coefficient_23_0219
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0220 : Poly :=
[
  term ((75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 220 for generator 23. -/
def ep_Q2_024_partial_23_0220 : Poly :=
[
  term ((150556843096374588081372453778173573184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 4), (15, 1)],
  term ((150556843096374588081372453778173573184 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 23. -/
theorem ep_Q2_024_partial_23_0220_valid :
    mulPoly ep_Q2_024_coefficient_23_0220
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0221 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 221 for generator 23. -/
def ep_Q2_024_partial_23_0221 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 23. -/
theorem ep_Q2_024_partial_23_0221_valid :
    mulPoly ep_Q2_024_coefficient_23_0221
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0222 : Poly :=
[
  term ((1250951611561428 : Rat) / 1162780221153193) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 23. -/
def ep_Q2_024_partial_23_0222 : Poly :=
[
  term ((2501903223122856 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1250951611561428 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1250951611561428 : Rat) / 1162780221153193) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 23. -/
theorem ep_Q2_024_partial_23_0222_valid :
    mulPoly ep_Q2_024_coefficient_23_0222
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0223 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 223 for generator 23. -/
def ep_Q2_024_partial_23_0223 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 23. -/
theorem ep_Q2_024_partial_23_0223_valid :
    mulPoly ep_Q2_024_coefficient_23_0223
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0224 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 23. -/
def ep_Q2_024_partial_23_0224 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 23. -/
theorem ep_Q2_024_partial_23_0224_valid :
    mulPoly ep_Q2_024_coefficient_23_0224
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0225 : Poly :=
[
  term ((473019787198636982643394976670540627451621526123728739 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (15, 1)]
]

/-- Partial product 225 for generator 23. -/
def ep_Q2_024_partial_23_0225 : Poly :=
[
  term ((473019787198636982643394976670540627451621526123728739 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-473019787198636982643394976670540627451621526123728739 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 2), (15, 1)],
  term ((-473019787198636982643394976670540627451621526123728739 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (13, 2), (15, 1)],
  term ((473019787198636982643394976670540627451621526123728739 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 23. -/
theorem ep_Q2_024_partial_23_0225_valid :
    mulPoly ep_Q2_024_coefficient_23_0225
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0226 : Poly :=
[
  term ((1436814438016135 : Rat) / 1162780221153193) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 23. -/
def ep_Q2_024_partial_23_0226 : Poly :=
[
  term ((2873628876032270 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1436814438016135 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1436814438016135 : Rat) / 1162780221153193) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2873628876032270 : Rat) / 1162780221153193) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 23. -/
theorem ep_Q2_024_partial_23_0226_valid :
    mulPoly ep_Q2_024_coefficient_23_0226
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0227 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (15, 3)]
]

/-- Partial product 227 for generator 23. -/
def ep_Q2_024_partial_23_0227 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 2), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 23. -/
theorem ep_Q2_024_partial_23_0227_valid :
    mulPoly ep_Q2_024_coefficient_23_0227
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0228 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 228 for generator 23. -/
def ep_Q2_024_partial_23_0228 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 23. -/
theorem ep_Q2_024_partial_23_0228_valid :
    mulPoly ep_Q2_024_coefficient_23_0228
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0229 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 229 for generator 23. -/
def ep_Q2_024_partial_23_0229 : Poly :=
[
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 3), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 23. -/
theorem ep_Q2_024_partial_23_0229_valid :
    mulPoly ep_Q2_024_coefficient_23_0229
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0230 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (15, 2)]
]

/-- Partial product 230 for generator 23. -/
def ep_Q2_024_partial_23_0230 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 2), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 2), (15, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 23. -/
theorem ep_Q2_024_partial_23_0230_valid :
    mulPoly ep_Q2_024_coefficient_23_0230
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0231 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 23. -/
def ep_Q2_024_partial_23_0231 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((115944433813960 : Rat) / 1162780221153193) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 23. -/
theorem ep_Q2_024_partial_23_0231_valid :
    mulPoly ep_Q2_024_coefficient_23_0231
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0232 : Poly :=
[
  term ((-3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 1)]
]

/-- Partial product 232 for generator 23. -/
def ep_Q2_024_partial_23_0232 : Poly :=
[
  term ((-3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 2)],
  term ((-3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (12, 1), (13, 1)],
  term ((3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 1), (13, 2)],
  term ((3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 23. -/
theorem ep_Q2_024_partial_23_0232_valid :
    mulPoly ep_Q2_024_coefficient_23_0232
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0233 : Poly :=
[
  term ((-4738392410661868035276252644799200817492427640036479217 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 233 for generator 23. -/
def ep_Q2_024_partial_23_0233 : Poly :=
[
  term ((-9476784821323736070552505289598401634984855280072958434 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-9476784821323736070552505289598401634984855280072958434 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((4738392410661868035276252644799200817492427640036479217 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 3), (15, 1)],
  term ((4738392410661868035276252644799200817492427640036479217 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 23. -/
theorem ep_Q2_024_partial_23_0233_valid :
    mulPoly ep_Q2_024_coefficient_23_0233
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0234 : Poly :=
[
  term ((1763425672320508 : Rat) / 1162780221153193) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 23. -/
def ep_Q2_024_partial_23_0234 : Poly :=
[
  term ((3526851344641016 : Rat) / 1162780221153193) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3526851344641016 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1763425672320508 : Rat) / 1162780221153193) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1763425672320508 : Rat) / 1162780221153193) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 23. -/
theorem ep_Q2_024_partial_23_0234_valid :
    mulPoly ep_Q2_024_coefficient_23_0234
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0235 : Poly :=
[
  term ((188261124222715867932827703521770065304 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

/-- Partial product 235 for generator 23. -/
def ep_Q2_024_partial_23_0235 : Poly :=
[
  term ((376522248445431735865655407043540130608 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 2), (13, 2)],
  term ((376522248445431735865655407043540130608 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 3)],
  term ((-188261124222715867932827703521770065304 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 4)],
  term ((-188261124222715867932827703521770065304 : Rat) / 599854728701238648283346764014769633995) [(12, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 23. -/
theorem ep_Q2_024_partial_23_0235_valid :
    mulPoly ep_Q2_024_coefficient_23_0235
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0236 : Poly :=
[
  term ((-4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (15, 2)]
]

/-- Partial product 236 for generator 23. -/
def ep_Q2_024_partial_23_0236 : Poly :=
[
  term ((-8287183632400201720469305978480902741495456361248959444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (15, 2)],
  term ((-8287183632400201720469305978480902741495456361248959444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 2), (15, 2)],
  term ((4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 23. -/
theorem ep_Q2_024_partial_23_0236_valid :
    mulPoly ep_Q2_024_coefficient_23_0236
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0237 : Poly :=
[
  term ((205764632587768 : Rat) / 1162780221153193) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 23. -/
def ep_Q2_024_partial_23_0237 : Poly :=
[
  term ((411529265175536 : Rat) / 1162780221153193) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((411529265175536 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-205764632587768 : Rat) / 1162780221153193) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-205764632587768 : Rat) / 1162780221153193) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 23. -/
theorem ep_Q2_024_partial_23_0237_valid :
    mulPoly ep_Q2_024_coefficient_23_0237
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0238 : Poly :=
[
  term ((20472370927870183374093068199419502539757548073487829 : Rat) / 92999895213201981850477343083626589746734642324746138) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 238 for generator 23. -/
def ep_Q2_024_partial_23_0238 : Poly :=
[
  term ((20472370927870183374093068199419502539757548073487829 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((20472370927870183374093068199419502539757548073487829 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-20472370927870183374093068199419502539757548073487829 : Rat) / 92999895213201981850477343083626589746734642324746138) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-20472370927870183374093068199419502539757548073487829 : Rat) / 92999895213201981850477343083626589746734642324746138) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 23. -/
theorem ep_Q2_024_partial_23_0238_valid :
    mulPoly ep_Q2_024_coefficient_23_0238
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0239 : Poly :=
[
  term ((208491935260238 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 23. -/
def ep_Q2_024_partial_23_0239 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 23. -/
theorem ep_Q2_024_partial_23_0239_valid :
    mulPoly ep_Q2_024_coefficient_23_0239
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0240 : Poly :=
[
  term ((-156774019665174076022183509039541073777418383013254096797 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(13, 1), (15, 1)]
]

/-- Partial product 240 for generator 23. -/
def ep_Q2_024_partial_23_0240 : Poly :=
[
  term ((-156774019665174076022183509039541073777418383013254096797 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-156774019665174076022183509039541073777418383013254096797 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (13, 2), (15, 1)],
  term ((156774019665174076022183509039541073777418383013254096797 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 2), (13, 1), (15, 1)],
  term ((156774019665174076022183509039541073777418383013254096797 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 23. -/
theorem ep_Q2_024_partial_23_0240_valid :
    mulPoly ep_Q2_024_coefficient_23_0240
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0241 : Poly :=
[
  term ((7772305002235767 : Rat) / 4651120884612772) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 23. -/
def ep_Q2_024_partial_23_0241 : Poly :=
[
  term ((7772305002235767 : Rat) / 2325560442306386) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7772305002235767 : Rat) / 2325560442306386) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7772305002235767 : Rat) / 4651120884612772) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7772305002235767 : Rat) / 4651120884612772) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 23. -/
theorem ep_Q2_024_partial_23_0241_valid :
    mulPoly ep_Q2_024_coefficient_23_0241
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0242 : Poly :=
[
  term ((5188197398505124237285967059505686399 : Rat) / 119970945740247729656669352802953926799) [(13, 2)]
]

/-- Partial product 242 for generator 23. -/
def ep_Q2_024_partial_23_0242 : Poly :=
[
  term ((10376394797010248474571934119011372798 : Rat) / 119970945740247729656669352802953926799) [(10, 1), (12, 1), (13, 2)],
  term ((10376394797010248474571934119011372798 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (13, 3)],
  term ((-5188197398505124237285967059505686399 : Rat) / 119970945740247729656669352802953926799) [(12, 2), (13, 2)],
  term ((-5188197398505124237285967059505686399 : Rat) / 119970945740247729656669352802953926799) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 23. -/
theorem ep_Q2_024_partial_23_0242_valid :
    mulPoly ep_Q2_024_coefficient_23_0242
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0243 : Poly :=
[
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 1)]
]

/-- Partial product 243 for generator 23. -/
def ep_Q2_024_partial_23_0243 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3), (14, 1)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (14, 1)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 23. -/
theorem ep_Q2_024_partial_23_0243_valid :
    mulPoly ep_Q2_024_coefficient_23_0243
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0244 : Poly :=
[
  term ((-442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(14, 1)]
]

/-- Partial product 244 for generator 23. -/
def ep_Q2_024_partial_23_0244 : Poly :=
[
  term ((-885562783871876131801287918370833928282 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1), (14, 1)],
  term ((-885562783871876131801287918370833928282 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (14, 1)],
  term ((442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(12, 2), (14, 1)],
  term ((442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 23. -/
theorem ep_Q2_024_partial_23_0244_valid :
    mulPoly ep_Q2_024_coefficient_23_0244
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0245 : Poly :=
[
  term ((-20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 1), (15, 2)]
]

/-- Partial product 245 for generator 23. -/
def ep_Q2_024_partial_23_0245 : Poly :=
[
  term ((-40547030721321616554111454721571653923601004555500799614 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-40547030721321616554111454721571653923601004555500799614 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (14, 1), (15, 2)],
  term ((20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 23. -/
theorem ep_Q2_024_partial_23_0245_valid :
    mulPoly ep_Q2_024_coefficient_23_0245
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0246 : Poly :=
[
  term ((-986892597849932 : Rat) / 1162780221153193) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 246 for generator 23. -/
def ep_Q2_024_partial_23_0246 : Poly :=
[
  term ((-1973785195699864 : Rat) / 1162780221153193) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1973785195699864 : Rat) / 1162780221153193) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((986892597849932 : Rat) / 1162780221153193) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((986892597849932 : Rat) / 1162780221153193) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 23. -/
theorem ep_Q2_024_partial_23_0246_valid :
    mulPoly ep_Q2_024_coefficient_23_0246
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0247 : Poly :=
[
  term ((20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(15, 2)]
]

/-- Partial product 247 for generator 23. -/
def ep_Q2_024_partial_23_0247 : Poly :=
[
  term ((20700641259497920354469748653216109311580716795513273779 : Rat) / 185999790426403963700954686167253179493469284649492276) [(10, 1), (12, 1), (15, 2)],
  term ((20700641259497920354469748653216109311580716795513273779 : Rat) / 185999790426403963700954686167253179493469284649492276) [(11, 1), (13, 1), (15, 2)],
  term ((-20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(12, 2), (15, 2)],
  term ((-20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 23. -/
theorem ep_Q2_024_partial_23_0247_valid :
    mulPoly ep_Q2_024_coefficient_23_0247
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0248 : Poly :=
[
  term ((-11065542580987239 : Rat) / 2325560442306386) [(15, 2), (16, 1)]
]

/-- Partial product 248 for generator 23. -/
def ep_Q2_024_partial_23_0248 : Poly :=
[
  term ((-11065542580987239 : Rat) / 1162780221153193) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11065542580987239 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11065542580987239 : Rat) / 2325560442306386) [(12, 2), (15, 2), (16, 1)],
  term ((11065542580987239 : Rat) / 2325560442306386) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 23. -/
theorem ep_Q2_024_partial_23_0248_valid :
    mulPoly ep_Q2_024_coefficient_23_0248
        ep_Q2_024_generator_23_0200_0248 =
      ep_Q2_024_partial_23_0248 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_23_0200_0248 : List Poly :=
[
  ep_Q2_024_partial_23_0200,
  ep_Q2_024_partial_23_0201,
  ep_Q2_024_partial_23_0202,
  ep_Q2_024_partial_23_0203,
  ep_Q2_024_partial_23_0204,
  ep_Q2_024_partial_23_0205,
  ep_Q2_024_partial_23_0206,
  ep_Q2_024_partial_23_0207,
  ep_Q2_024_partial_23_0208,
  ep_Q2_024_partial_23_0209,
  ep_Q2_024_partial_23_0210,
  ep_Q2_024_partial_23_0211,
  ep_Q2_024_partial_23_0212,
  ep_Q2_024_partial_23_0213,
  ep_Q2_024_partial_23_0214,
  ep_Q2_024_partial_23_0215,
  ep_Q2_024_partial_23_0216,
  ep_Q2_024_partial_23_0217,
  ep_Q2_024_partial_23_0218,
  ep_Q2_024_partial_23_0219,
  ep_Q2_024_partial_23_0220,
  ep_Q2_024_partial_23_0221,
  ep_Q2_024_partial_23_0222,
  ep_Q2_024_partial_23_0223,
  ep_Q2_024_partial_23_0224,
  ep_Q2_024_partial_23_0225,
  ep_Q2_024_partial_23_0226,
  ep_Q2_024_partial_23_0227,
  ep_Q2_024_partial_23_0228,
  ep_Q2_024_partial_23_0229,
  ep_Q2_024_partial_23_0230,
  ep_Q2_024_partial_23_0231,
  ep_Q2_024_partial_23_0232,
  ep_Q2_024_partial_23_0233,
  ep_Q2_024_partial_23_0234,
  ep_Q2_024_partial_23_0235,
  ep_Q2_024_partial_23_0236,
  ep_Q2_024_partial_23_0237,
  ep_Q2_024_partial_23_0238,
  ep_Q2_024_partial_23_0239,
  ep_Q2_024_partial_23_0240,
  ep_Q2_024_partial_23_0241,
  ep_Q2_024_partial_23_0242,
  ep_Q2_024_partial_23_0243,
  ep_Q2_024_partial_23_0244,
  ep_Q2_024_partial_23_0245,
  ep_Q2_024_partial_23_0246,
  ep_Q2_024_partial_23_0247,
  ep_Q2_024_partial_23_0248
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_23_0200_0248 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-617897363718370228337177347023560251816 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 2)],
  term ((3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 2), (13, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-617897363718370228337177347023560251816 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 3)],
  term ((-607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (13, 2)],
  term ((-1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2)],
  term ((308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 2), (14, 1)],
  term ((-1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 3)],
  term ((308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (13, 2), (14, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 1), (11, 1), (12, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (12, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (13, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 2), (13, 1)],
  term ((-221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((4796472436781460131864501042878907222839008479598572784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3396470698032128 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((150556843096374588081372453778173573184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((473019787198636982643394976670540627451621526123728739 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2873628876032270 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5138367026104072 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7308744169463686 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(10, 1), (11, 1), (12, 3), (13, 1)],
  term ((-7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((3517107295139328 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((20472370927870183374093068199419502539757548073487829 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156774019665174076022183509039541073777418383013254096797 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7772305002235767 : Rat) / 2325560442306386) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10376394797010248474571934119011372798 : Rat) / 119970945740247729656669352802953926799) [(10, 1), (12, 1), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-885562783871876131801287918370833928282 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1), (14, 1)],
  term ((-40547030721321616554111454721571653923601004555500799614 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1973785195699864 : Rat) / 1162780221153193) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((20700641259497920354469748653216109311580716795513273779 : Rat) / 185999790426403963700954686167253179493469284649492276) [(10, 1), (12, 1), (15, 2)],
  term ((-11065542580987239 : Rat) / 1162780221153193) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 2)],
  term ((-9476784821323736070552505289598401634984855280072958434 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((3526851344641016 : Rat) / 1162780221153193) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((376522248445431735865655407043540130608 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 2), (13, 2)],
  term ((-8287183632400201720469305978480902741495456361248959444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 2), (15, 2)],
  term ((411529265175536 : Rat) / 1162780221153193) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (12, 1), (13, 1)],
  term ((-8287183632400201720469305978480902741495456361248959444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((411529265175536 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-49038469807109469051122648105982742737448981883087475843 : Rat) / 929998952132019818504773430836265897467346423247461380) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((7181223429372859 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((207682485814189500373671646744097905972 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (12, 1), (13, 3)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 3), (14, 1)],
  term ((110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 2), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((-2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((1698235349016064 : Rat) / 1162780221153193) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((10716627288596662545891182318036085034843260245818093672 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 3)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1250951611561428 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-473019787198636982643394976670540627451621526123728739 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 2), (15, 1)],
  term ((-1436814438016135 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 2), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(11, 1), (12, 3), (13, 1)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 3), (13, 1), (14, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 3), (14, 1), (15, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 3), (15, 1)],
  term ((3654372084731843 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 4), (13, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 4), (15, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 4), (15, 1), (16, 1)],
  term ((-885562783871876131801287918370833928282 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (14, 1)],
  term ((-40547030721321616554111454721571653923601004555500799614 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1973785195699864 : Rat) / 1162780221153193) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((20700641259497920354469748653216109311580716795513273779 : Rat) / 185999790426403963700954686167253179493469284649492276) [(11, 1), (13, 1), (15, 2)],
  term ((-11065542580987239 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-148141761545978169047526269801453890408494749465285514 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-10514670615971423332498019932858810335488108404366770285 : Rat) / 371999580852807927401909372334506358986938569298984552) [(11, 1), (13, 2), (15, 1)],
  term ((4898676126203497 : Rat) / 2325560442306386) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 2), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((383541498466317131729579918191796862964 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3), (14, 2)],
  term ((-2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (13, 3), (15, 2)],
  term ((1698235349016064 : Rat) / 1162780221153193) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 4), (15, 1)],
  term ((6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5138367026104072 : Rat) / 1162780221153193) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7308744169463686 : Rat) / 1162780221153193) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(11, 2), (12, 1), (13, 2)],
  term ((39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 2), (14, 1)],
  term ((-21710042680459189032433720748705520765011213989283709584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((3517107295139328 : Rat) / 1162780221153193) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(11, 2), (12, 2), (13, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 2), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((473019787198636982643394976670540627451621526123728739 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 2), (13, 1), (15, 1)],
  term ((2873628876032270 : Rat) / 1162780221153193) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (13, 2), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 2), (14, 2)],
  term ((6301167067992450575430411323762851258454833699559526299 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 2), (15, 2)],
  term ((-3454442914939108 : Rat) / 1162780221153193) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((63073772690128725085989640086460138688 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 3), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (13, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 2), (15, 1)],
  term ((3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 1), (13, 2)],
  term ((4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 2), (15, 2)],
  term ((-205764632587768 : Rat) / 1162780221153193) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((4738392410661868035276252644799200817492427640036479217 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 3), (15, 1)],
  term ((-1763425672320508 : Rat) / 1162780221153193) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-188261124222715867932827703521770065304 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 4)],
  term ((-20472370927870183374093068199419502539757548073487829 : Rat) / 92999895213201981850477343083626589746734642324746138) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((156774019665174076022183509039541073777418383013254096797 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 2), (13, 1), (15, 1)],
  term ((-7772305002235767 : Rat) / 4651120884612772) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5188197398505124237285967059505686399 : Rat) / 119970945740247729656669352802953926799) [(12, 2), (13, 2)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (14, 1)],
  term ((442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(12, 2), (14, 1)],
  term ((20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (14, 1), (15, 2)],
  term ((986892597849932 : Rat) / 1162780221153193) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(12, 2), (15, 2)],
  term ((11065542580987239 : Rat) / 2325560442306386) [(12, 2), (15, 2), (16, 1)],
  term ((3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 3)],
  term ((4738392410661868035276252644799200817492427640036479217 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 3), (13, 1), (15, 1)],
  term ((-1763425672320508 : Rat) / 1162780221153193) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-188261124222715867932827703521770065304 : Rat) / 599854728701238648283346764014769633995) [(12, 3), (13, 2)],
  term ((4143591816200100860234652989240451370747728180624479722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 3), (15, 2)],
  term ((-205764632587768 : Rat) / 1162780221153193) [(12, 3), (15, 2), (16, 1)],
  term ((442781391935938065900643959185416964141 : Rat) / 1799564186103715944850040292044308901985) [(13, 2), (14, 1)],
  term ((20273515360660808277055727360785826961800502277750399807 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (14, 1), (15, 2)],
  term ((986892597849932 : Rat) / 1162780221153193) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-20700641259497920354469748653216109311580716795513273779 : Rat) / 371999580852807927401909372334506358986938569298984552) [(13, 2), (15, 2)],
  term ((11065542580987239 : Rat) / 2325560442306386) [(13, 2), (15, 2), (16, 1)],
  term ((-20472370927870183374093068199419502539757548073487829 : Rat) / 92999895213201981850477343083626589746734642324746138) [(13, 3), (14, 1), (15, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((156774019665174076022183509039541073777418383013254096797 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(13, 3), (15, 1)],
  term ((-7772305002235767 : Rat) / 4651120884612772) [(13, 3), (15, 1), (16, 1)],
  term ((-5188197398505124237285967059505686399 : Rat) / 119970945740247729656669352802953926799) [(13, 4)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 200 through 248. -/
theorem ep_Q2_024_block_23_0200_0248_valid :
    checkProductSumEq ep_Q2_024_partials_23_0200_0248
      ep_Q2_024_block_23_0200_0248 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
