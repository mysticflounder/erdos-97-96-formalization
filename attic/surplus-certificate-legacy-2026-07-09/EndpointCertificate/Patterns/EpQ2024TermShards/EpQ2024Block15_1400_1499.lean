/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1400-1499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1400_1499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1400 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1400 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 1400 for generator 15. -/
def ep_Q2_024_partial_15_1400 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 15. -/
theorem ep_Q2_024_partial_15_1400_valid :
    mulPoly ep_Q2_024_coefficient_15_1400
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1401 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1401 for generator 15. -/
def ep_Q2_024_partial_15_1401 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 15. -/
theorem ep_Q2_024_partial_15_1401_valid :
    mulPoly ep_Q2_024_coefficient_15_1401
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1402 : Poly :=
[
  term ((-10280823052565572887325534501561765112 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1402 for generator 15. -/
def ep_Q2_024_partial_15_1402 : Poly :=
[
  term ((-20561646105131145774651069003123530224 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((10280823052565572887325534501561765112 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 15. -/
theorem ep_Q2_024_partial_15_1402_valid :
    mulPoly ep_Q2_024_coefficient_15_1402
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1403 : Poly :=
[
  term ((11185259866277267980850535618630616928 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1403 for generator 15. -/
def ep_Q2_024_partial_15_1403 : Poly :=
[
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11185259866277267980850535618630616928 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 15. -/
theorem ep_Q2_024_partial_15_1403_valid :
    mulPoly ep_Q2_024_coefficient_15_1403
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1404 : Poly :=
[
  term ((355631692640035670351658506123728773843417393517094606 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1404 for generator 15. -/
def ep_Q2_024_partial_15_1404 : Poly :=
[
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-355631692640035670351658506123728773843417393517094606 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 15. -/
theorem ep_Q2_024_partial_15_1404_valid :
    mulPoly ep_Q2_024_coefficient_15_1404
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1405 : Poly :=
[
  term ((972215954849240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1405 for generator 15. -/
def ep_Q2_024_partial_15_1405 : Poly :=
[
  term ((1944431909698480 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-972215954849240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 15. -/
theorem ep_Q2_024_partial_15_1405_valid :
    mulPoly ep_Q2_024_coefficient_15_1405
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1406 : Poly :=
[
  term ((-7376264067406160054898520103635249183983525740333971607 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1406 for generator 15. -/
def ep_Q2_024_partial_15_1406 : Poly :=
[
  term ((-7376264067406160054898520103635249183983525740333971607 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((7376264067406160054898520103635249183983525740333971607 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 15. -/
theorem ep_Q2_024_partial_15_1406_valid :
    mulPoly ep_Q2_024_coefficient_15_1406
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1407 : Poly :=
[
  term ((26443357374430 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1407 for generator 15. -/
def ep_Q2_024_partial_15_1407 : Poly :=
[
  term ((52886714748860 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26443357374430 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 15. -/
theorem ep_Q2_024_partial_15_1407_valid :
    mulPoly ep_Q2_024_coefficient_15_1407
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1408 : Poly :=
[
  term ((-49443379481365271670385687527306239024 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1408 for generator 15. -/
def ep_Q2_024_partial_15_1408 : Poly :=
[
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((49443379481365271670385687527306239024 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 15. -/
theorem ep_Q2_024_partial_15_1408_valid :
    mulPoly ep_Q2_024_coefficient_15_1408
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1409 : Poly :=
[
  term ((68858061514298373482298339194079539760000592020054602 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1409 for generator 15. -/
def ep_Q2_024_partial_15_1409 : Poly :=
[
  term ((137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-68858061514298373482298339194079539760000592020054602 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 15. -/
theorem ep_Q2_024_partial_15_1409_valid :
    mulPoly ep_Q2_024_coefficient_15_1409
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1410 : Poly :=
[
  term ((634601730629656 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1410 for generator 15. -/
def ep_Q2_024_partial_15_1410 : Poly :=
[
  term ((1269203461259312 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-634601730629656 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 15. -/
theorem ep_Q2_024_partial_15_1410_valid :
    mulPoly ep_Q2_024_coefficient_15_1410
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1411 : Poly :=
[
  term ((3968814763318546321540572022879193983789 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 1411 for generator 15. -/
def ep_Q2_024_partial_15_1411 : Poly :=
[
  term ((7937629526637092643081144045758387967578 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-3968814763318546321540572022879193983789 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 15. -/
theorem ep_Q2_024_partial_15_1411_valid :
    mulPoly ep_Q2_024_coefficient_15_1411
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1412 : Poly :=
[
  term ((-1445454531078855412768214433133664174552 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1412 for generator 15. -/
def ep_Q2_024_partial_15_1412 : Poly :=
[
  term ((-2890909062157710825536428866267328349104 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((1445454531078855412768214433133664174552 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 15. -/
theorem ep_Q2_024_partial_15_1412_valid :
    mulPoly ep_Q2_024_coefficient_15_1412
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1413 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (13, 1), (14, 2)]
]

/-- Partial product 1413 for generator 15. -/
def ep_Q2_024_partial_15_1413 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 15. -/
theorem ep_Q2_024_partial_15_1413_valid :
    mulPoly ep_Q2_024_coefficient_15_1413
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1414 : Poly :=
[
  term ((3553593261571679216937023777244864581052582870631540538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 1414 for generator 15. -/
def ep_Q2_024_partial_15_1414 : Poly :=
[
  term ((7107186523143358433874047554489729162105165741263081076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-3553593261571679216937023777244864581052582870631540538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 15. -/
theorem ep_Q2_024_partial_15_1414_valid :
    mulPoly ep_Q2_024_coefficient_15_1414
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1415 : Poly :=
[
  term ((373796961635240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1415 for generator 15. -/
def ep_Q2_024_partial_15_1415 : Poly :=
[
  term ((747593923270480 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-373796961635240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 15. -/
theorem ep_Q2_024_partial_15_1415_valid :
    mulPoly ep_Q2_024_coefficient_15_1415
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1416 : Poly :=
[
  term ((-63775931330131935472819972858349802896 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 1416 for generator 15. -/
def ep_Q2_024_partial_15_1416 : Poly :=
[
  term ((-127551862660263870945639945716699605792 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((63775931330131935472819972858349802896 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 15. -/
theorem ep_Q2_024_partial_15_1416_valid :
    mulPoly ep_Q2_024_coefficient_15_1416
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1417 : Poly :=
[
  term ((43266964463909816872323623038545391525791519399996960331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1417 for generator 15. -/
def ep_Q2_024_partial_15_1417 : Poly :=
[
  term ((43266964463909816872323623038545391525791519399996960331 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-43266964463909816872323623038545391525791519399996960331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 15. -/
theorem ep_Q2_024_partial_15_1417_valid :
    mulPoly ep_Q2_024_coefficient_15_1417
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1418 : Poly :=
[
  term ((-5435369503792962 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1418 for generator 15. -/
def ep_Q2_024_partial_15_1418 : Poly :=
[
  term ((-10870739007585924 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5435369503792962 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 15. -/
theorem ep_Q2_024_partial_15_1418_valid :
    mulPoly ep_Q2_024_coefficient_15_1418
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1419 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (7, 1), (14, 2), (15, 1)]
]

/-- Partial product 1419 for generator 15. -/
def ep_Q2_024_partial_15_1419 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 15. -/
theorem ep_Q2_024_partial_15_1419_valid :
    mulPoly ep_Q2_024_coefficient_15_1419
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1420 : Poly :=
[
  term ((1250951611561428 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1420 for generator 15. -/
def ep_Q2_024_partial_15_1420 : Poly :=
[
  term ((2501903223122856 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1250951611561428 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 15. -/
theorem ep_Q2_024_partial_15_1420_valid :
    mulPoly ep_Q2_024_coefficient_15_1420
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1421 : Poly :=
[
  term ((-8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 1421 for generator 15. -/
def ep_Q2_024_partial_15_1421 : Poly :=
[
  term ((-8701879192366389091177240959372835299408749675119996827 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 15. -/
theorem ep_Q2_024_partial_15_1421_valid :
    mulPoly ep_Q2_024_coefficient_15_1421
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1422 : Poly :=
[
  term ((2772838151047862 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1422 for generator 15. -/
def ep_Q2_024_partial_15_1422 : Poly :=
[
  term ((5545676302095724 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2772838151047862 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 15. -/
theorem ep_Q2_024_partial_15_1422_valid :
    mulPoly ep_Q2_024_coefficient_15_1422
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1423 : Poly :=
[
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (15, 3)]
]

/-- Partial product 1423 for generator 15. -/
def ep_Q2_024_partial_15_1423 : Poly :=
[
  term ((-10876130589817032904121532417289354534777173727755099974 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (15, 3)],
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 15. -/
theorem ep_Q2_024_partial_15_1423_valid :
    mulPoly ep_Q2_024_coefficient_15_1423
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1424 : Poly :=
[
  term ((2676908167036388 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 1424 for generator 15. -/
def ep_Q2_024_partial_15_1424 : Poly :=
[
  term ((5353816334072776 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-2676908167036388 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 15. -/
theorem ep_Q2_024_partial_15_1424_valid :
    mulPoly ep_Q2_024_coefficient_15_1424
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1425 : Poly :=
[
  term ((-2262186041481186780752495353724733372893 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (8, 1)]
]

/-- Partial product 1425 for generator 15. -/
def ep_Q2_024_partial_15_1425 : Poly :=
[
  term ((-4524372082962373561504990707449466745786 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (8, 1)],
  term ((2262186041481186780752495353724733372893 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 15. -/
theorem ep_Q2_024_partial_15_1425_valid :
    mulPoly ep_Q2_024_coefficient_15_1425
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1426 : Poly :=
[
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1426 for generator 15. -/
def ep_Q2_024_partial_15_1426 : Poly :=
[
  term ((-42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 15. -/
theorem ep_Q2_024_partial_15_1426_valid :
    mulPoly ep_Q2_024_coefficient_15_1426
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1427 : Poly :=
[
  term ((-679040660139258870048400642080439908392 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1427 for generator 15. -/
def ep_Q2_024_partial_15_1427 : Poly :=
[
  term ((-1358081320278517740096801284160879816784 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((679040660139258870048400642080439908392 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 15. -/
theorem ep_Q2_024_partial_15_1427_valid :
    mulPoly ep_Q2_024_coefficient_15_1427
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1428 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1428 for generator 15. -/
def ep_Q2_024_partial_15_1428 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 15. -/
theorem ep_Q2_024_partial_15_1428_valid :
    mulPoly ep_Q2_024_coefficient_15_1428
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1429 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1429 for generator 15. -/
def ep_Q2_024_partial_15_1429 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 15. -/
theorem ep_Q2_024_partial_15_1429_valid :
    mulPoly ep_Q2_024_coefficient_15_1429
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1430 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1430 for generator 15. -/
def ep_Q2_024_partial_15_1430 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 15. -/
theorem ep_Q2_024_partial_15_1430_valid :
    mulPoly ep_Q2_024_coefficient_15_1430
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1431 : Poly :=
[
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1431 for generator 15. -/
def ep_Q2_024_partial_15_1431 : Poly :=
[
  term ((-720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 15. -/
theorem ep_Q2_024_partial_15_1431_valid :
    mulPoly ep_Q2_024_coefficient_15_1431
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1432 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1432 for generator 15. -/
def ep_Q2_024_partial_15_1432 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 15. -/
theorem ep_Q2_024_partial_15_1432_valid :
    mulPoly ep_Q2_024_coefficient_15_1432
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1433 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1433 for generator 15. -/
def ep_Q2_024_partial_15_1433 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 15. -/
theorem ep_Q2_024_partial_15_1433_valid :
    mulPoly ep_Q2_024_coefficient_15_1433
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1434 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1434 for generator 15. -/
def ep_Q2_024_partial_15_1434 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 15. -/
theorem ep_Q2_024_partial_15_1434_valid :
    mulPoly ep_Q2_024_coefficient_15_1434
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1435 : Poly :=
[
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1435 for generator 15. -/
def ep_Q2_024_partial_15_1435 : Poly :=
[
  term ((22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 15. -/
theorem ep_Q2_024_partial_15_1435_valid :
    mulPoly ep_Q2_024_coefficient_15_1435
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1436 : Poly :=
[
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1436 for generator 15. -/
def ep_Q2_024_partial_15_1436 : Poly :=
[
  term ((-3952343015357688 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1976171507678844 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 15. -/
theorem ep_Q2_024_partial_15_1436_valid :
    mulPoly ep_Q2_024_coefficient_15_1436
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1437 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1437 for generator 15. -/
def ep_Q2_024_partial_15_1437 : Poly :=
[
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 15. -/
theorem ep_Q2_024_partial_15_1437_valid :
    mulPoly ep_Q2_024_coefficient_15_1437
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1438 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1438 for generator 15. -/
def ep_Q2_024_partial_15_1438 : Poly :=
[
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 15. -/
theorem ep_Q2_024_partial_15_1438_valid :
    mulPoly ep_Q2_024_coefficient_15_1438
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1439 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1439 for generator 15. -/
def ep_Q2_024_partial_15_1439 : Poly :=
[
  term ((7729311995353440 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 15. -/
theorem ep_Q2_024_partial_15_1439_valid :
    mulPoly ep_Q2_024_coefficient_15_1439
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1440 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1440 for generator 15. -/
def ep_Q2_024_partial_15_1440 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 15. -/
theorem ep_Q2_024_partial_15_1440_valid :
    mulPoly ep_Q2_024_coefficient_15_1440
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1441 : Poly :=
[
  term ((-12739330803657906290527885340579005100727545032727482469 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1441 for generator 15. -/
def ep_Q2_024_partial_15_1441 : Poly :=
[
  term ((-25478661607315812581055770681158010201455090065454964938 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((12739330803657906290527885340579005100727545032727482469 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 15. -/
theorem ep_Q2_024_partial_15_1441_valid :
    mulPoly ep_Q2_024_coefficient_15_1441
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1442 : Poly :=
[
  term ((2410029203335036 : Rat) / 1162780221153193) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1442 for generator 15. -/
def ep_Q2_024_partial_15_1442 : Poly :=
[
  term ((4820058406670072 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2410029203335036 : Rat) / 1162780221153193) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 15. -/
theorem ep_Q2_024_partial_15_1442_valid :
    mulPoly ep_Q2_024_coefficient_15_1442
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1443 : Poly :=
[
  term ((116726730298643736878329101750289920304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (13, 2)]
]

/-- Partial product 1443 for generator 15. -/
def ep_Q2_024_partial_15_1443 : Poly :=
[
  term ((233453460597287473756658203500579840608 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (13, 2)],
  term ((-116726730298643736878329101750289920304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 15. -/
theorem ep_Q2_024_partial_15_1443_valid :
    mulPoly ep_Q2_024_coefficient_15_1443
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1444 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1444 for generator 15. -/
def ep_Q2_024_partial_15_1444 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 15. -/
theorem ep_Q2_024_partial_15_1444_valid :
    mulPoly ep_Q2_024_coefficient_15_1444
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1445 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1445 for generator 15. -/
def ep_Q2_024_partial_15_1445 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 15. -/
theorem ep_Q2_024_partial_15_1445_valid :
    mulPoly ep_Q2_024_coefficient_15_1445
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1446 : Poly :=
[
  term ((60137369247604957340998423498385429007336647701038742393 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 1), (15, 2)]
]

/-- Partial product 1446 for generator 15. -/
def ep_Q2_024_partial_15_1446 : Poly :=
[
  term ((60137369247604957340998423498385429007336647701038742393 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-60137369247604957340998423498385429007336647701038742393 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 15. -/
theorem ep_Q2_024_partial_15_1446_valid :
    mulPoly ep_Q2_024_coefficient_15_1446
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1447 : Poly :=
[
  term ((-3917398609210002 : Rat) / 1162780221153193) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1447 for generator 15. -/
def ep_Q2_024_partial_15_1447 : Poly :=
[
  term ((-7834797218420004 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((3917398609210002 : Rat) / 1162780221153193) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 15. -/
theorem ep_Q2_024_partial_15_1447_valid :
    mulPoly ep_Q2_024_coefficient_15_1447
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1448 : Poly :=
[
  term ((-330627102629755939184289953604350493592 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1448 for generator 15. -/
def ep_Q2_024_partial_15_1448 : Poly :=
[
  term ((-661254205259511878368579907208700987184 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((330627102629755939184289953604350493592 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 15. -/
theorem ep_Q2_024_partial_15_1448_valid :
    mulPoly ep_Q2_024_coefficient_15_1448
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1449 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1449 for generator 15. -/
def ep_Q2_024_partial_15_1449 : Poly :=
[
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 15. -/
theorem ep_Q2_024_partial_15_1449_valid :
    mulPoly ep_Q2_024_coefficient_15_1449
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1450 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1450 for generator 15. -/
def ep_Q2_024_partial_15_1450 : Poly :=
[
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 15. -/
theorem ep_Q2_024_partial_15_1450_valid :
    mulPoly ep_Q2_024_coefficient_15_1450
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1451 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1451 for generator 15. -/
def ep_Q2_024_partial_15_1451 : Poly :=
[
  term ((-7729311995353440 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 15. -/
theorem ep_Q2_024_partial_15_1451_valid :
    mulPoly ep_Q2_024_coefficient_15_1451
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1452 : Poly :=
[
  term ((20146071050270105782610123374334266145485527156693332783 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1452 for generator 15. -/
def ep_Q2_024_partial_15_1452 : Poly :=
[
  term ((40292142100540211565220246748668532290971054313386665566 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-20146071050270105782610123374334266145485527156693332783 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 15. -/
theorem ep_Q2_024_partial_15_1452_valid :
    mulPoly ep_Q2_024_coefficient_15_1452
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1453 : Poly :=
[
  term ((-4572770891853876 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1453 for generator 15. -/
def ep_Q2_024_partial_15_1453 : Poly :=
[
  term ((-9145541783707752 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4572770891853876 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 15. -/
theorem ep_Q2_024_partial_15_1453_valid :
    mulPoly ep_Q2_024_coefficient_15_1453
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1454 : Poly :=
[
  term ((13313753647951698730555325382953579528 : Rat) / 10167029300020994038700792610419824305) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 1454 for generator 15. -/
def ep_Q2_024_partial_15_1454 : Poly :=
[
  term ((26627507295903397461110650765907159056 : Rat) / 10167029300020994038700792610419824305) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-13313753647951698730555325382953579528 : Rat) / 10167029300020994038700792610419824305) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 15. -/
theorem ep_Q2_024_partial_15_1454_valid :
    mulPoly ep_Q2_024_coefficient_15_1454
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1455 : Poly :=
[
  term ((-104621399059214988111142631595096342808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1455 for generator 15. -/
def ep_Q2_024_partial_15_1455 : Poly :=
[
  term ((-209242798118429976222285263190192685616 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((104621399059214988111142631595096342808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 15. -/
theorem ep_Q2_024_partial_15_1455_valid :
    mulPoly ep_Q2_024_coefficient_15_1455
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1455 := by
  native_decide

/-- Coefficient term 1456 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1456 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 1456 for generator 15. -/
def ep_Q2_024_partial_15_1456 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1456 for generator 15. -/
theorem ep_Q2_024_partial_15_1456_valid :
    mulPoly ep_Q2_024_coefficient_15_1456
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1456 := by
  native_decide

/-- Coefficient term 1457 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1457 : Poly :=
[
  term ((-96079471466288185577432755413167255794760784903026790308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1457 for generator 15. -/
def ep_Q2_024_partial_15_1457 : Poly :=
[
  term ((-192158942932576371154865510826334511589521569806053580616 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((96079471466288185577432755413167255794760784903026790308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1457 for generator 15. -/
theorem ep_Q2_024_partial_15_1457_valid :
    mulPoly ep_Q2_024_coefficient_15_1457
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1457 := by
  native_decide

/-- Coefficient term 1458 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1458 : Poly :=
[
  term ((6986496036122272 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1458 for generator 15. -/
def ep_Q2_024_partial_15_1458 : Poly :=
[
  term ((13972992072244544 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6986496036122272 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1458 for generator 15. -/
theorem ep_Q2_024_partial_15_1458_valid :
    mulPoly ep_Q2_024_coefficient_15_1458
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1458 := by
  native_decide

/-- Coefficient term 1459 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1459 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 1459 for generator 15. -/
def ep_Q2_024_partial_15_1459 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1459 for generator 15. -/
theorem ep_Q2_024_partial_15_1459_valid :
    mulPoly ep_Q2_024_coefficient_15_1459
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1459 := by
  native_decide

/-- Coefficient term 1460 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1460 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1460 for generator 15. -/
def ep_Q2_024_partial_15_1460 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1460 for generator 15. -/
theorem ep_Q2_024_partial_15_1460_valid :
    mulPoly ep_Q2_024_coefficient_15_1460
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1460 := by
  native_decide

/-- Coefficient term 1461 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1461 : Poly :=
[
  term ((-7737611790754231589169124187735302277137149415383187427 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 1461 for generator 15. -/
def ep_Q2_024_partial_15_1461 : Poly :=
[
  term ((-7737611790754231589169124187735302277137149415383187427 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((7737611790754231589169124187735302277137149415383187427 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1461 for generator 15. -/
theorem ep_Q2_024_partial_15_1461_valid :
    mulPoly ep_Q2_024_coefficient_15_1461
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1461 := by
  native_decide

/-- Coefficient term 1462 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1462 : Poly :=
[
  term ((1033239860437145 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1462 for generator 15. -/
def ep_Q2_024_partial_15_1462 : Poly :=
[
  term ((2066479720874290 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1033239860437145 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1462 for generator 15. -/
theorem ep_Q2_024_partial_15_1462_valid :
    mulPoly ep_Q2_024_coefficient_15_1462
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1462 := by
  native_decide

/-- Coefficient term 1463 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1463 : Poly :=
[
  term ((6386845054328388818077196023632263546 : Rat) / 3389009766673664679566930870139941435) [(4, 1), (9, 2)]
]

/-- Partial product 1463 for generator 15. -/
def ep_Q2_024_partial_15_1463 : Poly :=
[
  term ((12773690108656777636154392047264527092 : Rat) / 3389009766673664679566930870139941435) [(4, 1), (6, 1), (9, 2)],
  term ((-6386845054328388818077196023632263546 : Rat) / 3389009766673664679566930870139941435) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1463 for generator 15. -/
theorem ep_Q2_024_partial_15_1463_valid :
    mulPoly ep_Q2_024_coefficient_15_1463
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1463 := by
  native_decide

/-- Coefficient term 1464 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1464 : Poly :=
[
  term ((21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 1)]
]

/-- Partial product 1464 for generator 15. -/
def ep_Q2_024_partial_15_1464 : Poly :=
[
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1464 for generator 15. -/
theorem ep_Q2_024_partial_15_1464_valid :
    mulPoly ep_Q2_024_coefficient_15_1464
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1464 := by
  native_decide

/-- Coefficient term 1465 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1465 : Poly :=
[
  term ((667763550255896533198199580855153885752 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (14, 1)]
]

/-- Partial product 1465 for generator 15. -/
def ep_Q2_024_partial_15_1465 : Poly :=
[
  term ((1335527100511793066396399161710307771504 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((-667763550255896533198199580855153885752 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1465 for generator 15. -/
theorem ep_Q2_024_partial_15_1465_valid :
    mulPoly ep_Q2_024_coefficient_15_1465
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1465 := by
  native_decide

/-- Coefficient term 1466 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1466 : Poly :=
[
  term ((360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1466 for generator 15. -/
def ep_Q2_024_partial_15_1466 : Poly :=
[
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1466 for generator 15. -/
theorem ep_Q2_024_partial_15_1466_valid :
    mulPoly ep_Q2_024_coefficient_15_1466
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1466 := by
  native_decide

/-- Coefficient term 1467 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1467 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1467 for generator 15. -/
def ep_Q2_024_partial_15_1467 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1467 for generator 15. -/
theorem ep_Q2_024_partial_15_1467_valid :
    mulPoly ep_Q2_024_coefficient_15_1467
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1467 := by
  native_decide

/-- Coefficient term 1468 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1468 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1468 for generator 15. -/
def ep_Q2_024_partial_15_1468 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1468 for generator 15. -/
theorem ep_Q2_024_partial_15_1468_valid :
    mulPoly ep_Q2_024_coefficient_15_1468
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1468 := by
  native_decide

/-- Coefficient term 1469 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1469 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1469 for generator 15. -/
def ep_Q2_024_partial_15_1469 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1469 for generator 15. -/
theorem ep_Q2_024_partial_15_1469_valid :
    mulPoly ep_Q2_024_coefficient_15_1469
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1469 := by
  native_decide

/-- Coefficient term 1470 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1470 : Poly :=
[
  term ((-11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1470 for generator 15. -/
def ep_Q2_024_partial_15_1470 : Poly :=
[
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1470 for generator 15. -/
theorem ep_Q2_024_partial_15_1470_valid :
    mulPoly ep_Q2_024_coefficient_15_1470
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1470 := by
  native_decide

/-- Coefficient term 1471 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1471 : Poly :=
[
  term ((1976171507678844 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1471 for generator 15. -/
def ep_Q2_024_partial_15_1471 : Poly :=
[
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1471 for generator 15. -/
theorem ep_Q2_024_partial_15_1471_valid :
    mulPoly ep_Q2_024_coefficient_15_1471
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1471 := by
  native_decide

/-- Coefficient term 1472 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1472 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1472 for generator 15. -/
def ep_Q2_024_partial_15_1472 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1472 for generator 15. -/
theorem ep_Q2_024_partial_15_1472_valid :
    mulPoly ep_Q2_024_coefficient_15_1472
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1472 := by
  native_decide

/-- Coefficient term 1473 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1473 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1473 for generator 15. -/
def ep_Q2_024_partial_15_1473 : Poly :=
[
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1473 for generator 15. -/
theorem ep_Q2_024_partial_15_1473_valid :
    mulPoly ep_Q2_024_coefficient_15_1473
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1473 := by
  native_decide

/-- Coefficient term 1474 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1474 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1474 for generator 15. -/
def ep_Q2_024_partial_15_1474 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1474 for generator 15. -/
theorem ep_Q2_024_partial_15_1474_valid :
    mulPoly ep_Q2_024_coefficient_15_1474
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1474 := by
  native_decide

/-- Coefficient term 1475 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1475 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 1475 for generator 15. -/
def ep_Q2_024_partial_15_1475 : Poly :=
[
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1475 for generator 15. -/
theorem ep_Q2_024_partial_15_1475_valid :
    mulPoly ep_Q2_024_coefficient_15_1475
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1475 := by
  native_decide

/-- Coefficient term 1476 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1476 : Poly :=
[
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1476 for generator 15. -/
def ep_Q2_024_partial_15_1476 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1476 for generator 15. -/
theorem ep_Q2_024_partial_15_1476_valid :
    mulPoly ep_Q2_024_coefficient_15_1476
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1476 := by
  native_decide

/-- Coefficient term 1477 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1477 : Poly :=
[
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1477 for generator 15. -/
def ep_Q2_024_partial_15_1477 : Poly :=
[
  term ((-32353000969407719280652367219495481640248766956944768212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1477 for generator 15. -/
theorem ep_Q2_024_partial_15_1477_valid :
    mulPoly ep_Q2_024_coefficient_15_1477
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1477 := by
  native_decide

/-- Coefficient term 1478 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1478 : Poly :=
[
  term ((-115944433813960 : Rat) / 1162780221153193) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1478 for generator 15. -/
def ep_Q2_024_partial_15_1478 : Poly :=
[
  term ((-231888867627920 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((115944433813960 : Rat) / 1162780221153193) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1478 for generator 15. -/
theorem ep_Q2_024_partial_15_1478_valid :
    mulPoly ep_Q2_024_coefficient_15_1478
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1478 := by
  native_decide

/-- Coefficient term 1479 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1479 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1479 for generator 15. -/
def ep_Q2_024_partial_15_1479 : Poly :=
[
  term ((-349932281624983451981531254766853737984 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1479 for generator 15. -/
theorem ep_Q2_024_partial_15_1479_valid :
    mulPoly ep_Q2_024_coefficient_15_1479
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1479 := by
  native_decide

/-- Coefficient term 1480 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1480 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1480 for generator 15. -/
def ep_Q2_024_partial_15_1480 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1480 for generator 15. -/
theorem ep_Q2_024_partial_15_1480_valid :
    mulPoly ep_Q2_024_coefficient_15_1480
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1480 := by
  native_decide

/-- Coefficient term 1481 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1481 : Poly :=
[
  term ((28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1481 for generator 15. -/
def ep_Q2_024_partial_15_1481 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1481 for generator 15. -/
theorem ep_Q2_024_partial_15_1481_valid :
    mulPoly ep_Q2_024_coefficient_15_1481
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1481 := by
  native_decide

/-- Coefficient term 1482 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1482 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 1482 for generator 15. -/
def ep_Q2_024_partial_15_1482 : Poly :=
[
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1482 for generator 15. -/
theorem ep_Q2_024_partial_15_1482_valid :
    mulPoly ep_Q2_024_coefficient_15_1482
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1482 := by
  native_decide

/-- Coefficient term 1483 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1483 : Poly :=
[
  term ((1285435248402469940784180192740628729596 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 1)]
]

/-- Partial product 1483 for generator 15. -/
def ep_Q2_024_partial_15_1483 : Poly :=
[
  term ((2570870496804939881568360385481257459192 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (12, 1)],
  term ((-1285435248402469940784180192740628729596 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1483 for generator 15. -/
theorem ep_Q2_024_partial_15_1483_valid :
    mulPoly ep_Q2_024_coefficient_15_1483
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1483 := by
  native_decide

/-- Coefficient term 1484 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1484 : Poly :=
[
  term ((-711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1484 for generator 15. -/
def ep_Q2_024_partial_15_1484 : Poly :=
[
  term ((-1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1484 for generator 15. -/
theorem ep_Q2_024_partial_15_1484_valid :
    mulPoly ep_Q2_024_coefficient_15_1484
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1484 := by
  native_decide

/-- Coefficient term 1485 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1485 : Poly :=
[
  term ((-1944431909698480 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1485 for generator 15. -/
def ep_Q2_024_partial_15_1485 : Poly :=
[
  term ((-3888863819396960 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1944431909698480 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1485 for generator 15. -/
theorem ep_Q2_024_partial_15_1485_valid :
    mulPoly ep_Q2_024_coefficient_15_1485
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1485 := by
  native_decide

/-- Coefficient term 1486 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1486 : Poly :=
[
  term ((8063898504424238884569171799497664147903524932986084388 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1486 for generator 15. -/
def ep_Q2_024_partial_15_1486 : Poly :=
[
  term ((16127797008848477769138343598995328295807049865972168776 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8063898504424238884569171799497664147903524932986084388 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1486 for generator 15. -/
theorem ep_Q2_024_partial_15_1486_valid :
    mulPoly ep_Q2_024_coefficient_15_1486
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1486 := by
  native_decide

/-- Coefficient term 1487 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1487 : Poly :=
[
  term ((-1834888302781408 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1487 for generator 15. -/
def ep_Q2_024_partial_15_1487 : Poly :=
[
  term ((-3669776605562816 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1834888302781408 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1487 for generator 15. -/
theorem ep_Q2_024_partial_15_1487_valid :
    mulPoly ep_Q2_024_coefficient_15_1487
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1487 := by
  native_decide

/-- Coefficient term 1488 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1488 : Poly :=
[
  term ((-345800471110681062779175177624656054872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (13, 2)]
]

/-- Partial product 1488 for generator 15. -/
def ep_Q2_024_partial_15_1488 : Poly :=
[
  term ((-691600942221362125558350355249312109744 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((345800471110681062779175177624656054872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1488 for generator 15. -/
theorem ep_Q2_024_partial_15_1488_valid :
    mulPoly ep_Q2_024_coefficient_15_1488
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1488 := by
  native_decide

/-- Coefficient term 1489 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1489 : Poly :=
[
  term ((-22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1489 for generator 15. -/
def ep_Q2_024_partial_15_1489 : Poly :=
[
  term ((-44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1489 for generator 15. -/
theorem ep_Q2_024_partial_15_1489_valid :
    mulPoly ep_Q2_024_coefficient_15_1489
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1489 := by
  native_decide

/-- Coefficient term 1490 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1490 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (14, 1)]
]

/-- Partial product 1490 for generator 15. -/
def ep_Q2_024_partial_15_1490 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1490 for generator 15. -/
theorem ep_Q2_024_partial_15_1490_valid :
    mulPoly ep_Q2_024_coefficient_15_1490
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1490 := by
  native_decide

/-- Coefficient term 1491 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1491 : Poly :=
[
  term ((77719725719794732511416506959742889924020399109555486 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 1491 for generator 15. -/
def ep_Q2_024_partial_15_1491 : Poly :=
[
  term ((155439451439589465022833013919485779848040798219110972 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-77719725719794732511416506959742889924020399109555486 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1491 for generator 15. -/
theorem ep_Q2_024_partial_15_1491_valid :
    mulPoly ep_Q2_024_coefficient_15_1491
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1491 := by
  native_decide

/-- Coefficient term 1492 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1492 : Poly :=
[
  term ((2188891025158680 : Rat) / 1162780221153193) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1492 for generator 15. -/
def ep_Q2_024_partial_15_1492 : Poly :=
[
  term ((4377782050317360 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2188891025158680 : Rat) / 1162780221153193) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1492 for generator 15. -/
theorem ep_Q2_024_partial_15_1492_valid :
    mulPoly ep_Q2_024_coefficient_15_1492
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1492 := by
  native_decide

/-- Coefficient term 1493 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1493 : Poly :=
[
  term ((-137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1493 for generator 15. -/
def ep_Q2_024_partial_15_1493 : Poly :=
[
  term ((-275432246057193493929193356776318159040002368080218408 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1493 for generator 15. -/
theorem ep_Q2_024_partial_15_1493_valid :
    mulPoly ep_Q2_024_coefficient_15_1493
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1493 := by
  native_decide

/-- Coefficient term 1494 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1494 : Poly :=
[
  term ((-1269203461259312 : Rat) / 1162780221153193) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1494 for generator 15. -/
def ep_Q2_024_partial_15_1494 : Poly :=
[
  term ((-2538406922518624 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1494 for generator 15. -/
theorem ep_Q2_024_partial_15_1494_valid :
    mulPoly ep_Q2_024_coefficient_15_1494
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1494 := by
  native_decide

/-- Coefficient term 1495 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1495 : Poly :=
[
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 2), (13, 2)]
]

/-- Partial product 1495 for generator 15. -/
def ep_Q2_024_partial_15_1495 : Poly :=
[
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 2), (13, 2)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1495 for generator 15. -/
theorem ep_Q2_024_partial_15_1495_valid :
    mulPoly ep_Q2_024_coefficient_15_1495
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1495 := by
  native_decide

/-- Coefficient term 1496 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1496 : Poly :=
[
  term ((-28719513251443658658538243540693618304456057655644593921 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1496 for generator 15. -/
def ep_Q2_024_partial_15_1496 : Poly :=
[
  term ((-57439026502887317317076487081387236608912115311289187842 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((28719513251443658658538243540693618304456057655644593921 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1496 for generator 15. -/
theorem ep_Q2_024_partial_15_1496_valid :
    mulPoly ep_Q2_024_coefficient_15_1496
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1496 := by
  native_decide

/-- Coefficient term 1497 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1497 : Poly :=
[
  term ((10288869172608556 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1497 for generator 15. -/
def ep_Q2_024_partial_15_1497 : Poly :=
[
  term ((20577738345217112 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10288869172608556 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1497 for generator 15. -/
theorem ep_Q2_024_partial_15_1497_valid :
    mulPoly ep_Q2_024_coefficient_15_1497
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1497 := by
  native_decide

/-- Coefficient term 1498 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1498 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1498 for generator 15. -/
def ep_Q2_024_partial_15_1498 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1498 for generator 15. -/
theorem ep_Q2_024_partial_15_1498_valid :
    mulPoly ep_Q2_024_coefficient_15_1498
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1498 := by
  native_decide

/-- Coefficient term 1499 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1499 : Poly :=
[
  term ((-2501903223122856 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1499 for generator 15. -/
def ep_Q2_024_partial_15_1499 : Poly :=
[
  term ((-5003806446245712 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1499 for generator 15. -/
theorem ep_Q2_024_partial_15_1499_valid :
    mulPoly ep_Q2_024_coefficient_15_1499
        ep_Q2_024_generator_15_1400_1499 =
      ep_Q2_024_partial_15_1499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1400_1499 : List Poly :=
[
  ep_Q2_024_partial_15_1400,
  ep_Q2_024_partial_15_1401,
  ep_Q2_024_partial_15_1402,
  ep_Q2_024_partial_15_1403,
  ep_Q2_024_partial_15_1404,
  ep_Q2_024_partial_15_1405,
  ep_Q2_024_partial_15_1406,
  ep_Q2_024_partial_15_1407,
  ep_Q2_024_partial_15_1408,
  ep_Q2_024_partial_15_1409,
  ep_Q2_024_partial_15_1410,
  ep_Q2_024_partial_15_1411,
  ep_Q2_024_partial_15_1412,
  ep_Q2_024_partial_15_1413,
  ep_Q2_024_partial_15_1414,
  ep_Q2_024_partial_15_1415,
  ep_Q2_024_partial_15_1416,
  ep_Q2_024_partial_15_1417,
  ep_Q2_024_partial_15_1418,
  ep_Q2_024_partial_15_1419,
  ep_Q2_024_partial_15_1420,
  ep_Q2_024_partial_15_1421,
  ep_Q2_024_partial_15_1422,
  ep_Q2_024_partial_15_1423,
  ep_Q2_024_partial_15_1424,
  ep_Q2_024_partial_15_1425,
  ep_Q2_024_partial_15_1426,
  ep_Q2_024_partial_15_1427,
  ep_Q2_024_partial_15_1428,
  ep_Q2_024_partial_15_1429,
  ep_Q2_024_partial_15_1430,
  ep_Q2_024_partial_15_1431,
  ep_Q2_024_partial_15_1432,
  ep_Q2_024_partial_15_1433,
  ep_Q2_024_partial_15_1434,
  ep_Q2_024_partial_15_1435,
  ep_Q2_024_partial_15_1436,
  ep_Q2_024_partial_15_1437,
  ep_Q2_024_partial_15_1438,
  ep_Q2_024_partial_15_1439,
  ep_Q2_024_partial_15_1440,
  ep_Q2_024_partial_15_1441,
  ep_Q2_024_partial_15_1442,
  ep_Q2_024_partial_15_1443,
  ep_Q2_024_partial_15_1444,
  ep_Q2_024_partial_15_1445,
  ep_Q2_024_partial_15_1446,
  ep_Q2_024_partial_15_1447,
  ep_Q2_024_partial_15_1448,
  ep_Q2_024_partial_15_1449,
  ep_Q2_024_partial_15_1450,
  ep_Q2_024_partial_15_1451,
  ep_Q2_024_partial_15_1452,
  ep_Q2_024_partial_15_1453,
  ep_Q2_024_partial_15_1454,
  ep_Q2_024_partial_15_1455,
  ep_Q2_024_partial_15_1456,
  ep_Q2_024_partial_15_1457,
  ep_Q2_024_partial_15_1458,
  ep_Q2_024_partial_15_1459,
  ep_Q2_024_partial_15_1460,
  ep_Q2_024_partial_15_1461,
  ep_Q2_024_partial_15_1462,
  ep_Q2_024_partial_15_1463,
  ep_Q2_024_partial_15_1464,
  ep_Q2_024_partial_15_1465,
  ep_Q2_024_partial_15_1466,
  ep_Q2_024_partial_15_1467,
  ep_Q2_024_partial_15_1468,
  ep_Q2_024_partial_15_1469,
  ep_Q2_024_partial_15_1470,
  ep_Q2_024_partial_15_1471,
  ep_Q2_024_partial_15_1472,
  ep_Q2_024_partial_15_1473,
  ep_Q2_024_partial_15_1474,
  ep_Q2_024_partial_15_1475,
  ep_Q2_024_partial_15_1476,
  ep_Q2_024_partial_15_1477,
  ep_Q2_024_partial_15_1478,
  ep_Q2_024_partial_15_1479,
  ep_Q2_024_partial_15_1480,
  ep_Q2_024_partial_15_1481,
  ep_Q2_024_partial_15_1482,
  ep_Q2_024_partial_15_1483,
  ep_Q2_024_partial_15_1484,
  ep_Q2_024_partial_15_1485,
  ep_Q2_024_partial_15_1486,
  ep_Q2_024_partial_15_1487,
  ep_Q2_024_partial_15_1488,
  ep_Q2_024_partial_15_1489,
  ep_Q2_024_partial_15_1490,
  ep_Q2_024_partial_15_1491,
  ep_Q2_024_partial_15_1492,
  ep_Q2_024_partial_15_1493,
  ep_Q2_024_partial_15_1494,
  ep_Q2_024_partial_15_1495,
  ep_Q2_024_partial_15_1496,
  ep_Q2_024_partial_15_1497,
  ep_Q2_024_partial_15_1498,
  ep_Q2_024_partial_15_1499
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1400_1499 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20561646105131145774651069003123530224 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1944431909698480 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7376264067406160054898520103635249183983525740333971607 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((52886714748860 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((7937629526637092643081144045758387967578 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-2890909062157710825536428866267328349104 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2)],
  term ((7107186523143358433874047554489729162105165741263081076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((747593923270480 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-127551862660263870945639945716699605792 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((43266964463909816872323623038545391525791519399996960331 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-10870739007585924 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8701879192366389091177240959372835299408749675119996827 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((5545676302095724 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-10876130589817032904121532417289354534777173727755099974 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (7, 1), (15, 3)],
  term ((5353816334072776 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-4524372082962373561504990707449466745786 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (8, 1)],
  term ((-42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1358081320278517740096801284160879816784 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3952343015357688 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((7729311995353440 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-25478661607315812581055770681158010201455090065454964938 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((4820058406670072 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((233453460597287473756658203500579840608 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (13, 2)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((60137369247604957340998423498385429007336647701038742393 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-7834797218420004 : Rat) / 1162780221153193) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-661254205259511878368579907208700987184 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((40292142100540211565220246748668532290971054313386665566 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-9145541783707752 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((26627507295903397461110650765907159056 : Rat) / 10167029300020994038700792610419824305) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-209242798118429976222285263190192685616 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-192158942932576371154865510826334511589521569806053580616 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((13972992072244544 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7737611790754231589169124187735302277137149415383187427 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((2066479720874290 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((12773690108656777636154392047264527092 : Rat) / 3389009766673664679566930870139941435) [(4, 1), (6, 1), (9, 2)],
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((1335527100511793066396399161710307771504 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-32353000969407719280652367219495481640248766956944768212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-231888867627920 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-349932281624983451981531254766853737984 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((2570870496804939881568360385481257459192 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (12, 1)],
  term ((-1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3888863819396960 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16127797008848477769138343598995328295807049865972168776 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3669776605562816 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-691600942221362125558350355249312109744 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((-44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((155439451439589465022833013919485779848040798219110972 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((4377782050317360 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-275432246057193493929193356776318159040002368080218408 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2538406922518624 : Rat) / 1162780221153193) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 2), (13, 2)],
  term ((-57439026502887317317076487081387236608912115311289187842 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((20577738345217112 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5003806446245712 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((10280823052565572887325534501561765112 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-11185259866277267980850535618630616928 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-355631692640035670351658506123728773843417393517094606 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-972215954849240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7376264067406160054898520103635249183983525740333971607 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-26443357374430 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((49443379481365271670385687527306239024 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((-68858061514298373482298339194079539760000592020054602 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-634601730629656 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3968814763318546321540572022879193983789 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (7, 1), (13, 1)],
  term ((1445454531078855412768214433133664174552 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((-3553593261571679216937023777244864581052582870631540538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-373796961635240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((63775931330131935472819972858349802896 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-43266964463909816872323623038545391525791519399996960331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((5435369503792962 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-1250951611561428 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (15, 1)],
  term ((-2772838151047862 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (15, 3)],
  term ((-2676908167036388 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((2262186041481186780752495353724733372893 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (8, 1)],
  term ((21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((679040660139258870048400642080439908392 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((1976171507678844 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((12739330803657906290527885340579005100727545032727482469 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-2410029203335036 : Rat) / 1162780221153193) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-116726730298643736878329101750289920304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (13, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-60137369247604957340998423498385429007336647701038742393 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 1), (15, 2)],
  term ((3917398609210002 : Rat) / 1162780221153193) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((330627102629755939184289953604350493592 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20146071050270105782610123374334266145485527156693332783 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((4572770891853876 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13313753647951698730555325382953579528 : Rat) / 10167029300020994038700792610419824305) [(4, 1), (9, 1), (13, 1)],
  term ((104621399059214988111142631595096342808 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((96079471466288185577432755413167255794760784903026790308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6986496036122272 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((7737611790754231589169124187735302277137149415383187427 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(4, 1), (9, 1), (15, 1)],
  term ((-1033239860437145 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6386845054328388818077196023632263546 : Rat) / 3389009766673664679566930870139941435) [(4, 1), (9, 2)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 1)],
  term ((-667763550255896533198199580855153885752 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (14, 1)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (11, 1), (13, 1)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (15, 1)],
  term ((-1285435248402469940784180192740628729596 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 1)],
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1944431909698480 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8063898504424238884569171799497664147903524932986084388 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((1834888302781408 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((345800471110681062779175177624656054872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (13, 2)],
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (14, 1)],
  term ((-77719725719794732511416506959742889924020399109555486 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (12, 1), (15, 2)],
  term ((-2188891025158680 : Rat) / 1162780221153193) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 2), (13, 2)],
  term ((28719513251443658658538243540693618304456057655644593921 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10288869172608556 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1400 through 1499. -/
theorem ep_Q2_024_block_15_1400_1499_valid :
    checkProductSumEq ep_Q2_024_partials_15_1400_1499
      ep_Q2_024_block_15_1400_1499 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
