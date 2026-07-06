/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1300-1399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1300 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 1300 for generator 15. -/
def ep_Q2_024_partial_15_1300 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 15. -/
theorem ep_Q2_024_partial_15_1300_valid :
    mulPoly ep_Q2_024_coefficient_15_1300
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1301 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1301 for generator 15. -/
def ep_Q2_024_partial_15_1301 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 15. -/
theorem ep_Q2_024_partial_15_1301_valid :
    mulPoly ep_Q2_024_coefficient_15_1301
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1302 : Poly :=
[
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (6, 1)]
]

/-- Partial product 1302 for generator 15. -/
def ep_Q2_024_partial_15_1302 : Poly :=
[
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (6, 1)],
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 15. -/
theorem ep_Q2_024_partial_15_1302_valid :
    mulPoly ep_Q2_024_coefficient_15_1302
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1303 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1303 for generator 15. -/
def ep_Q2_024_partial_15_1303 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 15. -/
theorem ep_Q2_024_partial_15_1303_valid :
    mulPoly ep_Q2_024_coefficient_15_1303
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1304 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1304 for generator 15. -/
def ep_Q2_024_partial_15_1304 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 15. -/
theorem ep_Q2_024_partial_15_1304_valid :
    mulPoly ep_Q2_024_coefficient_15_1304
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1305 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1305 for generator 15. -/
def ep_Q2_024_partial_15_1305 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(3, 2), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 15. -/
theorem ep_Q2_024_partial_15_1305_valid :
    mulPoly ep_Q2_024_coefficient_15_1305
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1306 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (9, 2)]
]

/-- Partial product 1306 for generator 15. -/
def ep_Q2_024_partial_15_1306 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (9, 2)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 15. -/
theorem ep_Q2_024_partial_15_1306_valid :
    mulPoly ep_Q2_024_coefficient_15_1306
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1307 : Poly :=
[
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1307 for generator 15. -/
def ep_Q2_024_partial_15_1307 : Poly :=
[
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 15. -/
theorem ep_Q2_024_partial_15_1307_valid :
    mulPoly ep_Q2_024_coefficient_15_1307
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1308 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1308 for generator 15. -/
def ep_Q2_024_partial_15_1308 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 15. -/
theorem ep_Q2_024_partial_15_1308_valid :
    mulPoly ep_Q2_024_coefficient_15_1308
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1309 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (13, 2)]
]

/-- Partial product 1309 for generator 15. -/
def ep_Q2_024_partial_15_1309 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (13, 2)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 15. -/
theorem ep_Q2_024_partial_15_1309_valid :
    mulPoly ep_Q2_024_coefficient_15_1309
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1310 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (14, 1)]
]

/-- Partial product 1310 for generator 15. -/
def ep_Q2_024_partial_15_1310 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (14, 1)],
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 15. -/
theorem ep_Q2_024_partial_15_1310_valid :
    mulPoly ep_Q2_024_coefficient_15_1310
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1311 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (6, 1), (15, 2)]
]

/-- Partial product 1311 for generator 15. -/
def ep_Q2_024_partial_15_1311 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (6, 1), (15, 2)],
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 15. -/
theorem ep_Q2_024_partial_15_1311_valid :
    mulPoly ep_Q2_024_coefficient_15_1311
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1312 : Poly :=
[
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1312 for generator 15. -/
def ep_Q2_024_partial_15_1312 : Poly :=
[
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((8526632792004408 : Rat) / 1162780221153193) [(3, 2), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 15. -/
theorem ep_Q2_024_partial_15_1312_valid :
    mulPoly ep_Q2_024_coefficient_15_1312
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1313 : Poly :=
[
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 1)]
]

/-- Partial product 1313 for generator 15. -/
def ep_Q2_024_partial_15_1313 : Poly :=
[
  term ((-21828176908544582351077704092327537882272 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (6, 1), (8, 1)],
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 15. -/
theorem ep_Q2_024_partial_15_1313_valid :
    mulPoly ep_Q2_024_coefficient_15_1313
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1314 : Poly :=
[
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1314 for generator 15. -/
def ep_Q2_024_partial_15_1314 : Poly :=
[
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 15. -/
theorem ep_Q2_024_partial_15_1314_valid :
    mulPoly ep_Q2_024_coefficient_15_1314
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1315 : Poly :=
[
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1315 for generator 15. -/
def ep_Q2_024_partial_15_1315 : Poly :=
[
  term ((-451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 15. -/
theorem ep_Q2_024_partial_15_1315_valid :
    mulPoly ep_Q2_024_coefficient_15_1315
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1316 : Poly :=
[
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1316 for generator 15. -/
def ep_Q2_024_partial_15_1316 : Poly :=
[
  term ((-1495148449544936 : Rat) / 3488340663459579) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 15. -/
theorem ep_Q2_024_partial_15_1316_valid :
    mulPoly ep_Q2_024_coefficient_15_1316
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1317 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 2)]
]

/-- Partial product 1317 for generator 15. -/
def ep_Q2_024_partial_15_1317 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (8, 1), (9, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 15. -/
theorem ep_Q2_024_partial_15_1317_valid :
    mulPoly ep_Q2_024_coefficient_15_1317
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1318 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1)]
]

/-- Partial product 1318 for generator 15. -/
def ep_Q2_024_partial_15_1318 : Poly :=
[
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (8, 1), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 15. -/
theorem ep_Q2_024_partial_15_1318_valid :
    mulPoly ep_Q2_024_coefficient_15_1318
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1319 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1319 for generator 15. -/
def ep_Q2_024_partial_15_1319 : Poly :=
[
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 15. -/
theorem ep_Q2_024_partial_15_1319_valid :
    mulPoly ep_Q2_024_coefficient_15_1319
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1320 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1320 for generator 15. -/
def ep_Q2_024_partial_15_1320 : Poly :=
[
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 15. -/
theorem ep_Q2_024_partial_15_1320_valid :
    mulPoly ep_Q2_024_coefficient_15_1320
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1321 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1321 for generator 15. -/
def ep_Q2_024_partial_15_1321 : Poly :=
[
  term ((-2108843069097728 : Rat) / 1162780221153193) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 15. -/
theorem ep_Q2_024_partial_15_1321_valid :
    mulPoly ep_Q2_024_coefficient_15_1321
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1322 : Poly :=
[
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1322 for generator 15. -/
def ep_Q2_024_partial_15_1322 : Poly :=
[
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 15. -/
theorem ep_Q2_024_partial_15_1322_valid :
    mulPoly ep_Q2_024_coefficient_15_1322
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1323 : Poly :=
[
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1323 for generator 15. -/
def ep_Q2_024_partial_15_1323 : Poly :=
[
  term ((-10375057428886340 : Rat) / 3488340663459579) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 15. -/
theorem ep_Q2_024_partial_15_1323_valid :
    mulPoly ep_Q2_024_coefficient_15_1323
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1324 : Poly :=
[
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (13, 2)]
]

/-- Partial product 1324 for generator 15. -/
def ep_Q2_024_partial_15_1324 : Poly :=
[
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (6, 1), (8, 1), (13, 2)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 15. -/
theorem ep_Q2_024_partial_15_1324_valid :
    mulPoly ep_Q2_024_coefficient_15_1324
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1325 : Poly :=
[
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (14, 1)]
]

/-- Partial product 1325 for generator 15. -/
def ep_Q2_024_partial_15_1325 : Poly :=
[
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (6, 1), (8, 1), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 15. -/
theorem ep_Q2_024_partial_15_1325_valid :
    mulPoly ep_Q2_024_coefficient_15_1325
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1326 : Poly :=
[
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 1), (15, 2)]
]

/-- Partial product 1326 for generator 15. -/
def ep_Q2_024_partial_15_1326 : Poly :=
[
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (6, 1), (8, 1), (15, 2)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 15. -/
theorem ep_Q2_024_partial_15_1326_valid :
    mulPoly ep_Q2_024_coefficient_15_1326
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1327 : Poly :=
[
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1327 for generator 15. -/
def ep_Q2_024_partial_15_1327 : Poly :=
[
  term ((-88310522894084572 : Rat) / 3488340663459579) [(3, 2), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 15. -/
theorem ep_Q2_024_partial_15_1327_valid :
    mulPoly ep_Q2_024_coefficient_15_1327
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1328 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 2)]
]

/-- Partial product 1328 for generator 15. -/
def ep_Q2_024_partial_15_1328 : Poly :=
[
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (6, 1), (8, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 15. -/
theorem ep_Q2_024_partial_15_1328_valid :
    mulPoly ep_Q2_024_coefficient_15_1328
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1329 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 1329 for generator 15. -/
def ep_Q2_024_partial_15_1329 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 15. -/
theorem ep_Q2_024_partial_15_1329_valid :
    mulPoly ep_Q2_024_coefficient_15_1329
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1330 : Poly :=
[
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 1330 for generator 15. -/
def ep_Q2_024_partial_15_1330 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 15. -/
theorem ep_Q2_024_partial_15_1330_valid :
    mulPoly ep_Q2_024_coefficient_15_1330
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1331 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1331 for generator 15. -/
def ep_Q2_024_partial_15_1331 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 15. -/
theorem ep_Q2_024_partial_15_1331_valid :
    mulPoly ep_Q2_024_coefficient_15_1331
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1332 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2)]
]

/-- Partial product 1332 for generator 15. -/
def ep_Q2_024_partial_15_1332 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (9, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 15. -/
theorem ep_Q2_024_partial_15_1332_valid :
    mulPoly ep_Q2_024_coefficient_15_1332
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1333 : Poly :=
[
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 1333 for generator 15. -/
def ep_Q2_024_partial_15_1333 : Poly :=
[
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 15. -/
theorem ep_Q2_024_partial_15_1333_valid :
    mulPoly ep_Q2_024_coefficient_15_1333
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1334 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1334 for generator 15. -/
def ep_Q2_024_partial_15_1334 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 15. -/
theorem ep_Q2_024_partial_15_1334_valid :
    mulPoly ep_Q2_024_coefficient_15_1334
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1335 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (13, 2)]
]

/-- Partial product 1335 for generator 15. -/
def ep_Q2_024_partial_15_1335 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (13, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 15. -/
theorem ep_Q2_024_partial_15_1335_valid :
    mulPoly ep_Q2_024_coefficient_15_1335
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1336 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (14, 1)]
]

/-- Partial product 1336 for generator 15. -/
def ep_Q2_024_partial_15_1336 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 15. -/
theorem ep_Q2_024_partial_15_1336_valid :
    mulPoly ep_Q2_024_coefficient_15_1336
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1337 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (15, 2)]
]

/-- Partial product 1337 for generator 15. -/
def ep_Q2_024_partial_15_1337 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (6, 1), (15, 2)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 15. -/
theorem ep_Q2_024_partial_15_1337_valid :
    mulPoly ep_Q2_024_coefficient_15_1337
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1338 : Poly :=
[
  term ((2131658198001102 : Rat) / 1162780221153193) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 1338 for generator 15. -/
def ep_Q2_024_partial_15_1338 : Poly :=
[
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-2131658198001102 : Rat) / 1162780221153193) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 15. -/
theorem ep_Q2_024_partial_15_1338_valid :
    mulPoly ep_Q2_024_coefficient_15_1338
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1339 : Poly :=
[
  term ((3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1)]
]

/-- Partial product 1339 for generator 15. -/
def ep_Q2_024_partial_15_1339 : Poly :=
[
  term ((-3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 15. -/
theorem ep_Q2_024_partial_15_1339_valid :
    mulPoly ep_Q2_024_coefficient_15_1339
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1340 : Poly :=
[
  term ((1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 1), (9, 1)]
]

/-- Partial product 1340 for generator 15. -/
def ep_Q2_024_partial_15_1340 : Poly :=
[
  term ((-1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 1), (9, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 15. -/
theorem ep_Q2_024_partial_15_1340_valid :
    mulPoly ep_Q2_024_coefficient_15_1340
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1341 : Poly :=
[
  term ((26900353520077055184201294711364917904 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1341 for generator 15. -/
def ep_Q2_024_partial_15_1341 : Poly :=
[
  term ((-26900353520077055184201294711364917904 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 15. -/
theorem ep_Q2_024_partial_15_1341_valid :
    mulPoly ep_Q2_024_coefficient_15_1341
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1342 : Poly :=
[
  term ((-269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 1342 for generator 15. -/
def ep_Q2_024_partial_15_1342 : Poly :=
[
  term ((269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 15. -/
theorem ep_Q2_024_partial_15_1342_valid :
    mulPoly ep_Q2_024_coefficient_15_1342
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1343 : Poly :=
[
  term ((291048775366036 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1343 for generator 15. -/
def ep_Q2_024_partial_15_1343 : Poly :=
[
  term ((-291048775366036 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((582097550732072 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 15. -/
theorem ep_Q2_024_partial_15_1343_valid :
    mulPoly ep_Q2_024_coefficient_15_1343
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1344 : Poly :=
[
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1)]
]

/-- Partial product 1344 for generator 15. -/
def ep_Q2_024_partial_15_1344 : Poly :=
[
  term ((217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (7, 1)],
  term ((-108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 15. -/
theorem ep_Q2_024_partial_15_1344_valid :
    mulPoly ep_Q2_024_coefficient_15_1344
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1345 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 1345 for generator 15. -/
def ep_Q2_024_partial_15_1345 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 15. -/
theorem ep_Q2_024_partial_15_1345_valid :
    mulPoly ep_Q2_024_coefficient_15_1345
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1346 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 1346 for generator 15. -/
def ep_Q2_024_partial_15_1346 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 15. -/
theorem ep_Q2_024_partial_15_1346_valid :
    mulPoly ep_Q2_024_coefficient_15_1346
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1347 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

/-- Partial product 1347 for generator 15. -/
def ep_Q2_024_partial_15_1347 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (6, 1), (7, 1), (15, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 15. -/
theorem ep_Q2_024_partial_15_1347_valid :
    mulPoly ep_Q2_024_coefficient_15_1347
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1348 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1348 for generator 15. -/
def ep_Q2_024_partial_15_1348 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 15. -/
theorem ep_Q2_024_partial_15_1348_valid :
    mulPoly ep_Q2_024_coefficient_15_1348
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1349 : Poly :=
[
  term ((1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (9, 1)]
]

/-- Partial product 1349 for generator 15. -/
def ep_Q2_024_partial_15_1349 : Poly :=
[
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 1), (9, 1)],
  term ((-1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 15. -/
theorem ep_Q2_024_partial_15_1349_valid :
    mulPoly ep_Q2_024_coefficient_15_1349
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1350 : Poly :=
[
  term ((-2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (9, 1), (12, 1)]
]

/-- Partial product 1350 for generator 15. -/
def ep_Q2_024_partial_15_1350 : Poly :=
[
  term ((-5188478469540100254489206030911932864 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 15. -/
theorem ep_Q2_024_partial_15_1350_valid :
    mulPoly ep_Q2_024_coefficient_15_1350
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1351 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (14, 1)]
]

/-- Partial product 1351 for generator 15. -/
def ep_Q2_024_partial_15_1351 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 15. -/
theorem ep_Q2_024_partial_15_1351_valid :
    mulPoly ep_Q2_024_coefficient_15_1351
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1352 : Poly :=
[
  term ((-53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1352 for generator 15. -/
def ep_Q2_024_partial_15_1352 : Poly :=
[
  term ((-107601414080308220736805178845459671616 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 15. -/
theorem ep_Q2_024_partial_15_1352_valid :
    mulPoly ep_Q2_024_coefficient_15_1352
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1353 : Poly :=
[
  term ((539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 1353 for generator 15. -/
def ep_Q2_024_partial_15_1353 : Poly :=
[
  term ((1079970261628433324890092431772776014932122798642557580 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 15. -/
theorem ep_Q2_024_partial_15_1353_valid :
    mulPoly ep_Q2_024_coefficient_15_1353
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1354 : Poly :=
[
  term ((-582097550732072 : Rat) / 1162780221153193) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1354 for generator 15. -/
def ep_Q2_024_partial_15_1354 : Poly :=
[
  term ((-1164195101464144 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((582097550732072 : Rat) / 1162780221153193) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 15. -/
theorem ep_Q2_024_partial_15_1354_valid :
    mulPoly ep_Q2_024_coefficient_15_1354
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1355 : Poly :=
[
  term ((-516665427785425950724536967099245172678 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 1355 for generator 15. -/
def ep_Q2_024_partial_15_1355 : Poly :=
[
  term ((-1033330855570851901449073934198490345356 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((516665427785425950724536967099245172678 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 15. -/
theorem ep_Q2_024_partial_15_1355_valid :
    mulPoly ep_Q2_024_coefficient_15_1355
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1356 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 1356 for generator 15. -/
def ep_Q2_024_partial_15_1356 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 15. -/
theorem ep_Q2_024_partial_15_1356_valid :
    mulPoly ep_Q2_024_coefficient_15_1356
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1357 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1357 for generator 15. -/
def ep_Q2_024_partial_15_1357 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 15. -/
theorem ep_Q2_024_partial_15_1357_valid :
    mulPoly ep_Q2_024_coefficient_15_1357
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1358 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1358 for generator 15. -/
def ep_Q2_024_partial_15_1358 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 15. -/
theorem ep_Q2_024_partial_15_1358_valid :
    mulPoly ep_Q2_024_coefficient_15_1358
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1359 : Poly :=
[
  term ((-269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 1359 for generator 15. -/
def ep_Q2_024_partial_15_1359 : Poly :=
[
  term ((-539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 15. -/
theorem ep_Q2_024_partial_15_1359_valid :
    mulPoly ep_Q2_024_coefficient_15_1359
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1360 : Poly :=
[
  term ((291048775366036 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1360 for generator 15. -/
def ep_Q2_024_partial_15_1360 : Poly :=
[
  term ((582097550732072 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-291048775366036 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 15. -/
theorem ep_Q2_024_partial_15_1360_valid :
    mulPoly ep_Q2_024_coefficient_15_1360
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1361 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1361 for generator 15. -/
def ep_Q2_024_partial_15_1361 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 15. -/
theorem ep_Q2_024_partial_15_1361_valid :
    mulPoly ep_Q2_024_coefficient_15_1361
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1362 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1362 for generator 15. -/
def ep_Q2_024_partial_15_1362 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 15. -/
theorem ep_Q2_024_partial_15_1362_valid :
    mulPoly ep_Q2_024_coefficient_15_1362
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1363 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1363 for generator 15. -/
def ep_Q2_024_partial_15_1363 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 15. -/
theorem ep_Q2_024_partial_15_1363_valid :
    mulPoly ep_Q2_024_coefficient_15_1363
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1364 : Poly :=
[
  term ((470578246711291611544275879884239168204 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1364 for generator 15. -/
def ep_Q2_024_partial_15_1364 : Poly :=
[
  term ((-470578246711291611544275879884239168204 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((941156493422583223088551759768478336408 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 15. -/
theorem ep_Q2_024_partial_15_1364_valid :
    mulPoly ep_Q2_024_coefficient_15_1364
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1365 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1365 for generator 15. -/
def ep_Q2_024_partial_15_1365 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 15. -/
theorem ep_Q2_024_partial_15_1365_valid :
    mulPoly ep_Q2_024_coefficient_15_1365
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1366 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1366 for generator 15. -/
def ep_Q2_024_partial_15_1366 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 15. -/
theorem ep_Q2_024_partial_15_1366_valid :
    mulPoly ep_Q2_024_coefficient_15_1366
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1367 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1367 for generator 15. -/
def ep_Q2_024_partial_15_1367 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 15. -/
theorem ep_Q2_024_partial_15_1367_valid :
    mulPoly ep_Q2_024_coefficient_15_1367
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1368 : Poly :=
[
  term ((-6289502436940074535188430125590427385172082179910735206 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1368 for generator 15. -/
def ep_Q2_024_partial_15_1368 : Poly :=
[
  term ((6289502436940074535188430125590427385172082179910735206 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-12579004873880149070376860251180854770344164359821470412 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 15. -/
theorem ep_Q2_024_partial_15_1368_valid :
    mulPoly ep_Q2_024_coefficient_15_1368
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1369 : Poly :=
[
  term ((2308564073931048 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1369 for generator 15. -/
def ep_Q2_024_partial_15_1369 : Poly :=
[
  term ((-2308564073931048 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4617128147862096 : Rat) / 1162780221153193) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 15. -/
theorem ep_Q2_024_partial_15_1369_valid :
    mulPoly ep_Q2_024_coefficient_15_1369
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1370 : Poly :=
[
  term ((23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2)]
]

/-- Partial product 1370 for generator 15. -/
def ep_Q2_024_partial_15_1370 : Poly :=
[
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2)],
  term ((46678861401359310500844275806047276456 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 15. -/
theorem ep_Q2_024_partial_15_1370_valid :
    mulPoly ep_Q2_024_coefficient_15_1370
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1371 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1371 for generator 15. -/
def ep_Q2_024_partial_15_1371 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 15. -/
theorem ep_Q2_024_partial_15_1371_valid :
    mulPoly ep_Q2_024_coefficient_15_1371
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1372 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1372 for generator 15. -/
def ep_Q2_024_partial_15_1372 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 15. -/
theorem ep_Q2_024_partial_15_1372_valid :
    mulPoly ep_Q2_024_coefficient_15_1372
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1373 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (13, 2)]
]

/-- Partial product 1373 for generator 15. -/
def ep_Q2_024_partial_15_1373 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 15. -/
theorem ep_Q2_024_partial_15_1373_valid :
    mulPoly ep_Q2_024_coefficient_15_1373
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1374 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1374 for generator 15. -/
def ep_Q2_024_partial_15_1374 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 15. -/
theorem ep_Q2_024_partial_15_1374_valid :
    mulPoly ep_Q2_024_coefficient_15_1374
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1375 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1375 for generator 15. -/
def ep_Q2_024_partial_15_1375 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 15. -/
theorem ep_Q2_024_partial_15_1375_valid :
    mulPoly ep_Q2_024_coefficient_15_1375
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1376 : Poly :=
[
  term ((113104087763856644028892959730313494497457666703225433 : Rat) / 3940673525983134824172768774729940243505705183251955) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1376 for generator 15. -/
def ep_Q2_024_partial_15_1376 : Poly :=
[
  term ((-113104087763856644028892959730313494497457666703225433 : Rat) / 3940673525983134824172768774729940243505705183251955) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((226208175527713288057785919460626988994915333406450866 : Rat) / 3940673525983134824172768774729940243505705183251955) [(4, 1), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 15. -/
theorem ep_Q2_024_partial_15_1376_valid :
    mulPoly ep_Q2_024_coefficient_15_1376
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1377 : Poly :=
[
  term ((-2599612849297084 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1377 for generator 15. -/
def ep_Q2_024_partial_15_1377 : Poly :=
[
  term ((2599612849297084 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5199225698594168 : Rat) / 1162780221153193) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 15. -/
theorem ep_Q2_024_partial_15_1377_valid :
    mulPoly ep_Q2_024_coefficient_15_1377
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1378 : Poly :=
[
  term ((-231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (13, 2)]
]

/-- Partial product 1378 for generator 15. -/
def ep_Q2_024_partial_15_1378 : Poly :=
[
  term ((231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (13, 2)],
  term ((-463036733782994152780588859844036280432 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 15. -/
theorem ep_Q2_024_partial_15_1378_valid :
    mulPoly ep_Q2_024_coefficient_15_1378
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1379 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2), (14, 1)]
]

/-- Partial product 1379 for generator 15. -/
def ep_Q2_024_partial_15_1379 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 15. -/
theorem ep_Q2_024_partial_15_1379_valid :
    mulPoly ep_Q2_024_coefficient_15_1379
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1380 : Poly :=
[
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (6, 1), (15, 2)]
]

/-- Partial product 1380 for generator 15. -/
def ep_Q2_024_partial_15_1380 : Poly :=
[
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (6, 1), (15, 2)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 15. -/
theorem ep_Q2_024_partial_15_1380_valid :
    mulPoly ep_Q2_024_coefficient_15_1380
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1381 : Poly :=
[
  term ((69367473696382 : Rat) / 1162780221153193) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1381 for generator 15. -/
def ep_Q2_024_partial_15_1381 : Poly :=
[
  term ((-69367473696382 : Rat) / 1162780221153193) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((138734947392764 : Rat) / 1162780221153193) [(4, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 15. -/
theorem ep_Q2_024_partial_15_1381_valid :
    mulPoly ep_Q2_024_coefficient_15_1381
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1382 : Poly :=
[
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 1), (9, 1)]
]

/-- Partial product 1382 for generator 15. -/
def ep_Q2_024_partial_15_1382 : Poly :=
[
  term ((-46678861401359310500844275806047276456 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 15. -/
theorem ep_Q2_024_partial_15_1382_valid :
    mulPoly ep_Q2_024_coefficient_15_1382
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1383 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1383 for generator 15. -/
def ep_Q2_024_partial_15_1383 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 15. -/
theorem ep_Q2_024_partial_15_1383_valid :
    mulPoly ep_Q2_024_coefficient_15_1383
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1384 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1384 for generator 15. -/
def ep_Q2_024_partial_15_1384 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 15. -/
theorem ep_Q2_024_partial_15_1384_valid :
    mulPoly ep_Q2_024_coefficient_15_1384
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1385 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1385 for generator 15. -/
def ep_Q2_024_partial_15_1385 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 15. -/
theorem ep_Q2_024_partial_15_1385_valid :
    mulPoly ep_Q2_024_coefficient_15_1385
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1386 : Poly :=
[
  term ((-560053333074105953249876816209229831128 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1386 for generator 15. -/
def ep_Q2_024_partial_15_1386 : Poly :=
[
  term ((-1120106666148211906499753632418459662256 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((560053333074105953249876816209229831128 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 15. -/
theorem ep_Q2_024_partial_15_1386_valid :
    mulPoly ep_Q2_024_coefficient_15_1386
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1387 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1387 for generator 15. -/
def ep_Q2_024_partial_15_1387 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 15. -/
theorem ep_Q2_024_partial_15_1387_valid :
    mulPoly ep_Q2_024_coefficient_15_1387
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1388 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1388 for generator 15. -/
def ep_Q2_024_partial_15_1388 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 15. -/
theorem ep_Q2_024_partial_15_1388_valid :
    mulPoly ep_Q2_024_coefficient_15_1388
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1389 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1389 for generator 15. -/
def ep_Q2_024_partial_15_1389 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 15. -/
theorem ep_Q2_024_partial_15_1389_valid :
    mulPoly ep_Q2_024_coefficient_15_1389
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1390 : Poly :=
[
  term ((16950738277632669235907957041581641602334364284459640166 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1390 for generator 15. -/
def ep_Q2_024_partial_15_1390 : Poly :=
[
  term ((33901476555265338471815914083163283204668728568919280332 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-16950738277632669235907957041581641602334364284459640166 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 15. -/
theorem ep_Q2_024_partial_15_1390_valid :
    mulPoly ep_Q2_024_coefficient_15_1390
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1391 : Poly :=
[
  term ((-2308564073931048 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1391 for generator 15. -/
def ep_Q2_024_partial_15_1391 : Poly :=
[
  term ((-4617128147862096 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((2308564073931048 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 15. -/
theorem ep_Q2_024_partial_15_1391_valid :
    mulPoly ep_Q2_024_coefficient_15_1391
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1392 : Poly :=
[
  term ((-4989775577910540278422482334820426036338 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 1392 for generator 15. -/
def ep_Q2_024_partial_15_1392 : Poly :=
[
  term ((-9979551155821080556844964669640852072676 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((4989775577910540278422482334820426036338 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 15. -/
theorem ep_Q2_024_partial_15_1392_valid :
    mulPoly ep_Q2_024_coefficient_15_1392
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1393 : Poly :=
[
  term ((-10368234526829404614199122825743806068 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 1393 for generator 15. -/
def ep_Q2_024_partial_15_1393 : Poly :=
[
  term ((-20736469053658809228398245651487612136 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((10368234526829404614199122825743806068 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 15. -/
theorem ep_Q2_024_partial_15_1393_valid :
    mulPoly ep_Q2_024_coefficient_15_1393
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1394 : Poly :=
[
  term ((-211521401206999550421840072298411011488 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1394 for generator 15. -/
def ep_Q2_024_partial_15_1394 : Poly :=
[
  term ((-423042802413999100843680144596822022976 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((211521401206999550421840072298411011488 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 15. -/
theorem ep_Q2_024_partial_15_1394_valid :
    mulPoly ep_Q2_024_coefficient_15_1394
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1395 : Poly :=
[
  term ((1854992224541387738844138495977070579392 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1395 for generator 15. -/
def ep_Q2_024_partial_15_1395 : Poly :=
[
  term ((3709984449082775477688276991954141158784 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-1854992224541387738844138495977070579392 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 15. -/
theorem ep_Q2_024_partial_15_1395_valid :
    mulPoly ep_Q2_024_coefficient_15_1395
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1396 : Poly :=
[
  term ((3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 1396 for generator 15. -/
def ep_Q2_024_partial_15_1396 : Poly :=
[
  term ((6915135619643297929387116909828524067851506949280013118 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 15. -/
theorem ep_Q2_024_partial_15_1396_valid :
    mulPoly ep_Q2_024_coefficient_15_1396
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1397 : Poly :=
[
  term ((-1196701779202068 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1397 for generator 15. -/
def ep_Q2_024_partial_15_1397 : Poly :=
[
  term ((-2393403558404136 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1196701779202068 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 15. -/
theorem ep_Q2_024_partial_15_1397_valid :
    mulPoly ep_Q2_024_coefficient_15_1397
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1398 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 2), (15, 1)]
]

/-- Partial product 1398 for generator 15. -/
def ep_Q2_024_partial_15_1398 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (9, 2), (15, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 15. -/
theorem ep_Q2_024_partial_15_1398_valid :
    mulPoly ep_Q2_024_coefficient_15_1398
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1399 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1399 for generator 15. -/
def ep_Q2_024_partial_15_1399 : Poly :=
[
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 15. -/
theorem ep_Q2_024_partial_15_1399_valid :
    mulPoly ep_Q2_024_coefficient_15_1399
        ep_Q2_024_generator_15_1300_1399 =
      ep_Q2_024_partial_15_1399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1300_1399 : List Poly :=
[
  ep_Q2_024_partial_15_1300,
  ep_Q2_024_partial_15_1301,
  ep_Q2_024_partial_15_1302,
  ep_Q2_024_partial_15_1303,
  ep_Q2_024_partial_15_1304,
  ep_Q2_024_partial_15_1305,
  ep_Q2_024_partial_15_1306,
  ep_Q2_024_partial_15_1307,
  ep_Q2_024_partial_15_1308,
  ep_Q2_024_partial_15_1309,
  ep_Q2_024_partial_15_1310,
  ep_Q2_024_partial_15_1311,
  ep_Q2_024_partial_15_1312,
  ep_Q2_024_partial_15_1313,
  ep_Q2_024_partial_15_1314,
  ep_Q2_024_partial_15_1315,
  ep_Q2_024_partial_15_1316,
  ep_Q2_024_partial_15_1317,
  ep_Q2_024_partial_15_1318,
  ep_Q2_024_partial_15_1319,
  ep_Q2_024_partial_15_1320,
  ep_Q2_024_partial_15_1321,
  ep_Q2_024_partial_15_1322,
  ep_Q2_024_partial_15_1323,
  ep_Q2_024_partial_15_1324,
  ep_Q2_024_partial_15_1325,
  ep_Q2_024_partial_15_1326,
  ep_Q2_024_partial_15_1327,
  ep_Q2_024_partial_15_1328,
  ep_Q2_024_partial_15_1329,
  ep_Q2_024_partial_15_1330,
  ep_Q2_024_partial_15_1331,
  ep_Q2_024_partial_15_1332,
  ep_Q2_024_partial_15_1333,
  ep_Q2_024_partial_15_1334,
  ep_Q2_024_partial_15_1335,
  ep_Q2_024_partial_15_1336,
  ep_Q2_024_partial_15_1337,
  ep_Q2_024_partial_15_1338,
  ep_Q2_024_partial_15_1339,
  ep_Q2_024_partial_15_1340,
  ep_Q2_024_partial_15_1341,
  ep_Q2_024_partial_15_1342,
  ep_Q2_024_partial_15_1343,
  ep_Q2_024_partial_15_1344,
  ep_Q2_024_partial_15_1345,
  ep_Q2_024_partial_15_1346,
  ep_Q2_024_partial_15_1347,
  ep_Q2_024_partial_15_1348,
  ep_Q2_024_partial_15_1349,
  ep_Q2_024_partial_15_1350,
  ep_Q2_024_partial_15_1351,
  ep_Q2_024_partial_15_1352,
  ep_Q2_024_partial_15_1353,
  ep_Q2_024_partial_15_1354,
  ep_Q2_024_partial_15_1355,
  ep_Q2_024_partial_15_1356,
  ep_Q2_024_partial_15_1357,
  ep_Q2_024_partial_15_1358,
  ep_Q2_024_partial_15_1359,
  ep_Q2_024_partial_15_1360,
  ep_Q2_024_partial_15_1361,
  ep_Q2_024_partial_15_1362,
  ep_Q2_024_partial_15_1363,
  ep_Q2_024_partial_15_1364,
  ep_Q2_024_partial_15_1365,
  ep_Q2_024_partial_15_1366,
  ep_Q2_024_partial_15_1367,
  ep_Q2_024_partial_15_1368,
  ep_Q2_024_partial_15_1369,
  ep_Q2_024_partial_15_1370,
  ep_Q2_024_partial_15_1371,
  ep_Q2_024_partial_15_1372,
  ep_Q2_024_partial_15_1373,
  ep_Q2_024_partial_15_1374,
  ep_Q2_024_partial_15_1375,
  ep_Q2_024_partial_15_1376,
  ep_Q2_024_partial_15_1377,
  ep_Q2_024_partial_15_1378,
  ep_Q2_024_partial_15_1379,
  ep_Q2_024_partial_15_1380,
  ep_Q2_024_partial_15_1381,
  ep_Q2_024_partial_15_1382,
  ep_Q2_024_partial_15_1383,
  ep_Q2_024_partial_15_1384,
  ep_Q2_024_partial_15_1385,
  ep_Q2_024_partial_15_1386,
  ep_Q2_024_partial_15_1387,
  ep_Q2_024_partial_15_1388,
  ep_Q2_024_partial_15_1389,
  ep_Q2_024_partial_15_1390,
  ep_Q2_024_partial_15_1391,
  ep_Q2_024_partial_15_1392,
  ep_Q2_024_partial_15_1393,
  ep_Q2_024_partial_15_1394,
  ep_Q2_024_partial_15_1395,
  ep_Q2_024_partial_15_1396,
  ep_Q2_024_partial_15_1397,
  ep_Q2_024_partial_15_1398,
  ep_Q2_024_partial_15_1399
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1300_1399 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (6, 1)],
  term ((-21828176908544582351077704092327537882272 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (6, 1), (8, 1)],
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 3488340663459579) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (8, 1), (9, 2)],
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 1), (8, 1), (12, 1)],
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2108843069097728 : Rat) / 1162780221153193) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-10375057428886340 : Rat) / 3488340663459579) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (6, 1), (8, 1), (13, 2)],
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (6, 1), (8, 1), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (6, 1), (8, 1), (15, 2)],
  term ((-88310522894084572 : Rat) / 3488340663459579) [(3, 2), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (6, 1), (8, 2)],
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (6, 2)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 2), (9, 1), (13, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 2), (9, 1), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(3, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 2), (9, 2)],
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (6, 2), (13, 2)],
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (6, 2), (14, 1)],
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (6, 2), (15, 2)],
  term ((8526632792004408 : Rat) / 1162780221153193) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 1), (15, 2)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 2)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2)],
  term ((-5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (13, 1), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (14, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (15, 2)],
  term ((-2131658198001102 : Rat) / 1162780221153193) [(3, 2), (15, 2), (16, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1)],
  term ((217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (7, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (6, 1), (7, 1), (15, 2)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 1), (9, 1)],
  term ((-5188478469540100254489206030911932864 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-107601414080308220736805178845459671616 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((1079970261628433324890092431772776014932122798642557580 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1164195101464144 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1167832623171237177370080407755314934876 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((291048775366036 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (6, 2), (9, 1)],
  term ((53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (6, 2), (13, 1)],
  term ((-539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (6, 2), (15, 1)],
  term ((582097550732072 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (9, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (5, 1), (9, 1), (12, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term ((53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (12, 1), (15, 1)],
  term ((582097550732072 : Rat) / 1162780221153193) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((516665427785425950724536967099245172678 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (5, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (5, 1), (15, 1)],
  term ((-291048775366036 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1)],
  term ((-46678861401359310500844275806047276456 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1120106666148211906499753632418459662256 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((33901476555265338471815914083163283204668728568919280332 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-4617128147862096 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9979551155821080556844964669640852072676 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-20736469053658809228398245651487612136 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-423042802413999100843680144596822022976 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((3709984449082775477688276991954141158784 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((6915135619643297929387116909828524067851506949280013118 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-2393403558404136 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (9, 2), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-470578246711291611544275879884239168204 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6289502436940074535188430125590427385172082179910735206 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-2308564073931048 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113104087763856644028892959730313494497457666703225433 : Rat) / 3940673525983134824172768774729940243505705183251955) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((2599612849297084 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (6, 1), (15, 2)],
  term ((-69367473696382 : Rat) / 1162780221153193) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((941156493422583223088551759768478336408 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (9, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 2), (9, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12579004873880149070376860251180854770344164359821470412 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((4617128147862096 : Rat) / 1162780221153193) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((46678861401359310500844275806047276456 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 2), (9, 2)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (12, 1), (13, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((226208175527713288057785919460626988994915333406450866 : Rat) / 3940673525983134824172768774729940243505705183251955) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((-5199225698594168 : Rat) / 1162780221153193) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-463036733782994152780588859844036280432 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 2), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 2), (13, 2), (14, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 2), (15, 2)],
  term ((138734947392764 : Rat) / 1162780221153193) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 1), (9, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((560053333074105953249876816209229831128 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16950738277632669235907957041581641602334364284459640166 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((2308564073931048 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((4989775577910540278422482334820426036338 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (7, 1), (9, 1)],
  term ((10368234526829404614199122825743806068 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1), (12, 1)],
  term ((211521401206999550421840072298411011488 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1854992224541387738844138495977070579392 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((1196701779202068 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 2), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1300 through 1399. -/
theorem ep_Q2_024_block_15_1300_1399_valid :
    checkProductSumEq ep_Q2_024_partials_15_1300_1399
      ep_Q2_024_block_15_1300_1399 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
