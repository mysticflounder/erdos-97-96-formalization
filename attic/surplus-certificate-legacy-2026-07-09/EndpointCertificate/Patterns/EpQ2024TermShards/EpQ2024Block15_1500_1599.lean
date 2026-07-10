/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1500-1599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1500_1599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1500 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1500 : Poly :=
[
  term ((830763292133812818418397766030499689482481032489340154 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 1500 for generator 15. -/
def ep_Q2_024_partial_15_1500 : Poly :=
[
  term ((1661526584267625636836795532060999378964962064978680308 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-830763292133812818418397766030499689482481032489340154 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1500 for generator 15. -/
theorem ep_Q2_024_partial_15_1500_valid :
    mulPoly ep_Q2_024_coefficient_15_1500
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1500 := by
  native_decide

/-- Coefficient term 1501 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1501 : Poly :=
[
  term ((-1528567195345320 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1501 for generator 15. -/
def ep_Q2_024_partial_15_1501 : Poly :=
[
  term ((-3057134390690640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1528567195345320 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1501 for generator 15. -/
theorem ep_Q2_024_partial_15_1501_valid :
    mulPoly ep_Q2_024_coefficient_15_1501
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1501 := by
  native_decide

/-- Coefficient term 1502 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1502 : Poly :=
[
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (13, 1), (15, 3)]
]

/-- Partial product 1502 for generator 15. -/
def ep_Q2_024_partial_15_1502 : Poly :=
[
  term ((-2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1502 for generator 15. -/
theorem ep_Q2_024_partial_15_1502_valid :
    mulPoly ep_Q2_024_coefficient_15_1502
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1502 := by
  native_decide

/-- Coefficient term 1503 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1503 : Poly :=
[
  term ((-3223595267130360 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1503 for generator 15. -/
def ep_Q2_024_partial_15_1503 : Poly :=
[
  term ((-6447190534260720 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1503 for generator 15. -/
theorem ep_Q2_024_partial_15_1503_valid :
    mulPoly ep_Q2_024_coefficient_15_1503
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1503 := by
  native_decide

/-- Coefficient term 1504 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1504 : Poly :=
[
  term ((892350249968485499233287174033990047468 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2)]
]

/-- Partial product 1504 for generator 15. -/
def ep_Q2_024_partial_15_1504 : Poly :=
[
  term ((1784700499936970998466574348067980094936 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2)],
  term ((-892350249968485499233287174033990047468 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1504 for generator 15. -/
theorem ep_Q2_024_partial_15_1504_valid :
    mulPoly ep_Q2_024_coefficient_15_1504
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1504 := by
  native_decide

/-- Coefficient term 1505 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1505 : Poly :=
[
  term ((-213480746081072694878061323051209415416 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2), (14, 1)]
]

/-- Partial product 1505 for generator 15. -/
def ep_Q2_024_partial_15_1505 : Poly :=
[
  term ((-426961492162145389756122646102418830832 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((213480746081072694878061323051209415416 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1505 for generator 15. -/
theorem ep_Q2_024_partial_15_1505_valid :
    mulPoly ep_Q2_024_coefficient_15_1505
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1505 := by
  native_decide

/-- Coefficient term 1506 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1506 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2), (14, 2)]
]

/-- Partial product 1506 for generator 15. -/
def ep_Q2_024_partial_15_1506 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1506 for generator 15. -/
theorem ep_Q2_024_partial_15_1506_valid :
    mulPoly ep_Q2_024_coefficient_15_1506
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1506 := by
  native_decide

/-- Coefficient term 1507 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1507 : Poly :=
[
  term ((884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (13, 2), (15, 2)]
]

/-- Partial product 1507 for generator 15. -/
def ep_Q2_024_partial_15_1507 : Poly :=
[
  term ((1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (13, 2), (15, 2)],
  term ((-884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1507 for generator 15. -/
theorem ep_Q2_024_partial_15_1507_valid :
    mulPoly ep_Q2_024_coefficient_15_1507
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1507 := by
  native_decide

/-- Coefficient term 1508 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1508 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1508 for generator 15. -/
def ep_Q2_024_partial_15_1508 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1508 for generator 15. -/
theorem ep_Q2_024_partial_15_1508_valid :
    mulPoly ep_Q2_024_coefficient_15_1508
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1508 := by
  native_decide

/-- Coefficient term 1509 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1509 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 3), (15, 1)]
]

/-- Partial product 1509 for generator 15. -/
def ep_Q2_024_partial_15_1509 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 3), (15, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1509 for generator 15. -/
theorem ep_Q2_024_partial_15_1509_valid :
    mulPoly ep_Q2_024_coefficient_15_1509
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1509 := by
  native_decide

/-- Coefficient term 1510 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1510 : Poly :=
[
  term ((-7087785686235751936798239069025403817139 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (14, 1)]
]

/-- Partial product 1510 for generator 15. -/
def ep_Q2_024_partial_15_1510 : Poly :=
[
  term ((-14175571372471503873596478138050807634278 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (14, 1)],
  term ((7087785686235751936798239069025403817139 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1510 for generator 15. -/
theorem ep_Q2_024_partial_15_1510_valid :
    mulPoly ep_Q2_024_coefficient_15_1510
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1510 := by
  native_decide

/-- Coefficient term 1511 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1511 : Poly :=
[
  term ((4501527601236185614590413621142097067819054673927203411 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 1511 for generator 15. -/
def ep_Q2_024_partial_15_1511 : Poly :=
[
  term ((9003055202472371229180827242284194135638109347854406822 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-4501527601236185614590413621142097067819054673927203411 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1511 for generator 15. -/
theorem ep_Q2_024_partial_15_1511_valid :
    mulPoly ep_Q2_024_coefficient_15_1511
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1511 := by
  native_decide

/-- Coefficient term 1512 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1512 : Poly :=
[
  term ((2380610982748636 : Rat) / 1162780221153193) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1512 for generator 15. -/
def ep_Q2_024_partial_15_1512 : Poly :=
[
  term ((4761221965497272 : Rat) / 1162780221153193) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2380610982748636 : Rat) / 1162780221153193) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1512 for generator 15. -/
theorem ep_Q2_024_partial_15_1512_valid :
    mulPoly ep_Q2_024_coefficient_15_1512
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1512 := by
  native_decide

/-- Coefficient term 1513 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1513 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 2)]
]

/-- Partial product 1513 for generator 15. -/
def ep_Q2_024_partial_15_1513 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (14, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1513 for generator 15. -/
theorem ep_Q2_024_partial_15_1513_valid :
    mulPoly ep_Q2_024_coefficient_15_1513
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1513 := by
  native_decide

/-- Coefficient term 1514 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1514 : Poly :=
[
  term ((1711312918950382848177493600470342328074887058101785652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (15, 2)]
]

/-- Partial product 1514 for generator 15. -/
def ep_Q2_024_partial_15_1514 : Poly :=
[
  term ((3422625837900765696354987200940684656149774116203571304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (15, 2)],
  term ((-1711312918950382848177493600470342328074887058101785652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1514 for generator 15. -/
theorem ep_Q2_024_partial_15_1514_valid :
    mulPoly ep_Q2_024_coefficient_15_1514
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1514 := by
  native_decide

/-- Coefficient term 1515 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1515 : Poly :=
[
  term ((-5148661000059712 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 1515 for generator 15. -/
def ep_Q2_024_partial_15_1515 : Poly :=
[
  term ((-10297322000119424 : Rat) / 1162780221153193) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((5148661000059712 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1515 for generator 15. -/
theorem ep_Q2_024_partial_15_1515_valid :
    mulPoly ep_Q2_024_coefficient_15_1515
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1515 := by
  native_decide

/-- Coefficient term 1516 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1516 : Poly :=
[
  term ((108527865897635204440923906776011627033 : Rat) / 399903152467492432188897842676513089330) [(4, 2)]
]

/-- Partial product 1516 for generator 15. -/
def ep_Q2_024_partial_15_1516 : Poly :=
[
  term ((-108527865897635204440923906776011627033 : Rat) / 399903152467492432188897842676513089330) [(4, 2)],
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1516 for generator 15. -/
theorem ep_Q2_024_partial_15_1516_valid :
    mulPoly ep_Q2_024_coefficient_15_1516
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1516 := by
  native_decide

/-- Coefficient term 1517 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1517 : Poly :=
[
  term ((-1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (7, 1), (9, 1)]
]

/-- Partial product 1517 for generator 15. -/
def ep_Q2_024_partial_15_1517 : Poly :=
[
  term ((-2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1517 for generator 15. -/
theorem ep_Q2_024_partial_15_1517_valid :
    mulPoly ep_Q2_024_coefficient_15_1517
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1517 := by
  native_decide

/-- Coefficient term 1518 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1518 : Poly :=
[
  term ((-26900353520077055184201294711364917904 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (7, 1), (13, 1)]
]

/-- Partial product 1518 for generator 15. -/
def ep_Q2_024_partial_15_1518 : Poly :=
[
  term ((-53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((26900353520077055184201294711364917904 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1518 for generator 15. -/
theorem ep_Q2_024_partial_15_1518_valid :
    mulPoly ep_Q2_024_coefficient_15_1518
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1518 := by
  native_decide

/-- Coefficient term 1519 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1519 : Poly :=
[
  term ((269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (7, 1), (15, 1)]
]

/-- Partial product 1519 for generator 15. -/
def ep_Q2_024_partial_15_1519 : Poly :=
[
  term ((539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1519 for generator 15. -/
theorem ep_Q2_024_partial_15_1519_valid :
    mulPoly ep_Q2_024_coefficient_15_1519
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1519 := by
  native_decide

/-- Coefficient term 1520 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1520 : Poly :=
[
  term ((-291048775366036 : Rat) / 1162780221153193) [(4, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1520 for generator 15. -/
def ep_Q2_024_partial_15_1520 : Poly :=
[
  term ((-582097550732072 : Rat) / 1162780221153193) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((291048775366036 : Rat) / 1162780221153193) [(4, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1520 for generator 15. -/
theorem ep_Q2_024_partial_15_1520_valid :
    mulPoly ep_Q2_024_coefficient_15_1520
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1520 := by
  native_decide

/-- Coefficient term 1521 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1521 : Poly :=
[
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 1521 for generator 15. -/
def ep_Q2_024_partial_15_1521 : Poly :=
[
  term ((5188478469540100254489206030911932864 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1521 for generator 15. -/
theorem ep_Q2_024_partial_15_1521_valid :
    mulPoly ep_Q2_024_coefficient_15_1521
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1521 := by
  native_decide

/-- Coefficient term 1522 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1522 : Poly :=
[
  term ((-8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (9, 1), (15, 1)]
]

/-- Partial product 1522 for generator 15. -/
def ep_Q2_024_partial_15_1522 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1522 for generator 15. -/
theorem ep_Q2_024_partial_15_1522_valid :
    mulPoly ep_Q2_024_coefficient_15_1522
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1522 := by
  native_decide

/-- Coefficient term 1523 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1523 : Poly :=
[
  term ((-2735192908638260911540895068147370024897677547020780622 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (13, 1), (15, 1)]
]

/-- Partial product 1523 for generator 15. -/
def ep_Q2_024_partial_15_1523 : Poly :=
[
  term ((-5470385817276521823081790136294740049795355094041561244 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((2735192908638260911540895068147370024897677547020780622 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1523 for generator 15. -/
theorem ep_Q2_024_partial_15_1523_valid :
    mulPoly ep_Q2_024_coefficient_15_1523
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1523 := by
  native_decide

/-- Coefficient term 1524 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1524 : Poly :=
[
  term ((582097550732072 : Rat) / 1162780221153193) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1524 for generator 15. -/
def ep_Q2_024_partial_15_1524 : Poly :=
[
  term ((1164195101464144 : Rat) / 1162780221153193) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-582097550732072 : Rat) / 1162780221153193) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1524 for generator 15. -/
theorem ep_Q2_024_partial_15_1524_valid :
    mulPoly ep_Q2_024_coefficient_15_1524
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1524 := by
  native_decide

/-- Coefficient term 1525 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1525 : Poly :=
[
  term ((53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (13, 2)]
]

/-- Partial product 1525 for generator 15. -/
def ep_Q2_024_partial_15_1525 : Poly :=
[
  term ((107601414080308220736805178845459671616 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (6, 1), (13, 2)],
  term ((-53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1525 for generator 15. -/
theorem ep_Q2_024_partial_15_1525_valid :
    mulPoly ep_Q2_024_coefficient_15_1525
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1525 := by
  native_decide

/-- Coefficient term 1526 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1526 : Poly :=
[
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 2), (15, 2)]
]

/-- Partial product 1526 for generator 15. -/
def ep_Q2_024_partial_15_1526 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 2), (6, 1), (15, 2)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1526 for generator 15. -/
theorem ep_Q2_024_partial_15_1526_valid :
    mulPoly ep_Q2_024_coefficient_15_1526
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1526 := by
  native_decide

/-- Coefficient term 1527 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1527 : Poly :=
[
  term ((51735384255808 : Rat) / 1162780221153193) [(4, 2), (15, 2), (16, 1)]
]

/-- Partial product 1527 for generator 15. -/
def ep_Q2_024_partial_15_1527 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1527 for generator 15. -/
theorem ep_Q2_024_partial_15_1527_valid :
    mulPoly ep_Q2_024_coefficient_15_1527
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1527 := by
  native_decide

/-- Coefficient term 1528 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1528 : Poly :=
[
  term ((236823465392436826628713367882961865264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1)]
]

/-- Partial product 1528 for generator 15. -/
def ep_Q2_024_partial_15_1528 : Poly :=
[
  term ((-236823465392436826628713367882961865264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1)],
  term ((473646930784873653257426735765923730528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1528 for generator 15. -/
theorem ep_Q2_024_partial_15_1528_valid :
    mulPoly ep_Q2_024_coefficient_15_1528
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1528 := by
  native_decide

/-- Coefficient term 1529 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1529 : Poly :=
[
  term ((40193263314434185182732768267407360376 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (12, 1)]
]

/-- Partial product 1529 for generator 15. -/
def ep_Q2_024_partial_15_1529 : Poly :=
[
  term ((-40193263314434185182732768267407360376 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((80386526628868370365465536534814720752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1529 for generator 15. -/
theorem ep_Q2_024_partial_15_1529_valid :
    mulPoly ep_Q2_024_coefficient_15_1529
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1529 := by
  native_decide

/-- Coefficient term 1530 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1530 : Poly :=
[
  term ((262194352093689976652062881408140718032 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1530 for generator 15. -/
def ep_Q2_024_partial_15_1530 : Poly :=
[
  term ((-262194352093689976652062881408140718032 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((524388704187379953304125762816281436064 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1530 for generator 15. -/
theorem ep_Q2_024_partial_15_1530_valid :
    mulPoly ep_Q2_024_coefficient_15_1530
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1530 := by
  native_decide

/-- Coefficient term 1531 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1531 : Poly :=
[
  term ((-68565332052439720700920811183379198876 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (14, 1)]
]

/-- Partial product 1531 for generator 15. -/
def ep_Q2_024_partial_15_1531 : Poly :=
[
  term ((68565332052439720700920811183379198876 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-137130664104879441401841622366758397752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1531 for generator 15. -/
theorem ep_Q2_024_partial_15_1531_valid :
    mulPoly ep_Q2_024_coefficient_15_1531
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1531 := by
  native_decide

/-- Coefficient term 1532 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1532 : Poly :=
[
  term ((-3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 1532 for generator 15. -/
def ep_Q2_024_partial_15_1532 : Poly :=
[
  term ((3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-6915135619643297929387116909828524067851506949280013118 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1532 for generator 15. -/
theorem ep_Q2_024_partial_15_1532_valid :
    mulPoly ep_Q2_024_coefficient_15_1532
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1532 := by
  native_decide

/-- Coefficient term 1533 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1533 : Poly :=
[
  term ((1196701779202068 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1533 for generator 15. -/
def ep_Q2_024_partial_15_1533 : Poly :=
[
  term ((-1196701779202068 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((2393403558404136 : Rat) / 1162780221153193) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1533 for generator 15. -/
theorem ep_Q2_024_partial_15_1533_valid :
    mulPoly ep_Q2_024_coefficient_15_1533
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1533 := by
  native_decide

/-- Coefficient term 1534 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1534 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (15, 1)]
]

/-- Partial product 1534 for generator 15. -/
def ep_Q2_024_partial_15_1534 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1534 for generator 15. -/
theorem ep_Q2_024_partial_15_1534_valid :
    mulPoly ep_Q2_024_coefficient_15_1534
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1534 := by
  native_decide

/-- Coefficient term 1535 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1535 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1535 for generator 15. -/
def ep_Q2_024_partial_15_1535 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1535 for generator 15. -/
theorem ep_Q2_024_partial_15_1535_valid :
    mulPoly ep_Q2_024_coefficient_15_1535
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1535 := by
  native_decide

/-- Coefficient term 1536 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1536 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 1536 for generator 15. -/
def ep_Q2_024_partial_15_1536 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1536 for generator 15. -/
theorem ep_Q2_024_partial_15_1536_valid :
    mulPoly ep_Q2_024_coefficient_15_1536
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1536 := by
  native_decide

/-- Coefficient term 1537 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1537 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1537 for generator 15. -/
def ep_Q2_024_partial_15_1537 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1537 for generator 15. -/
theorem ep_Q2_024_partial_15_1537_valid :
    mulPoly ep_Q2_024_coefficient_15_1537
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1537 := by
  native_decide

/-- Coefficient term 1538 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1538 : Poly :=
[
  term ((745959215937319093607510962273863246208 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 1538 for generator 15. -/
def ep_Q2_024_partial_15_1538 : Poly :=
[
  term ((-745959215937319093607510962273863246208 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((1491918431874638187215021924547726492416 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1538 for generator 15. -/
theorem ep_Q2_024_partial_15_1538_valid :
    mulPoly ep_Q2_024_coefficient_15_1538
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1538 := by
  native_decide

/-- Coefficient term 1539 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1539 : Poly :=
[
  term ((-53804611769730316523896603857760271168 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1539 for generator 15. -/
def ep_Q2_024_partial_15_1539 : Poly :=
[
  term ((53804611769730316523896603857760271168 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-107609223539460633047793207715520542336 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1539 for generator 15. -/
theorem ep_Q2_024_partial_15_1539_valid :
    mulPoly ep_Q2_024_coefficient_15_1539
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1539 := by
  native_decide

/-- Coefficient term 1540 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1540 : Poly :=
[
  term ((487438969729206091756438183880638190897844094176772109 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1540 for generator 15. -/
def ep_Q2_024_partial_15_1540 : Poly :=
[
  term ((-487438969729206091756438183880638190897844094176772109 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((974877939458412183512876367761276381795688188353544218 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1540 for generator 15. -/
theorem ep_Q2_024_partial_15_1540_valid :
    mulPoly ep_Q2_024_coefficient_15_1540
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1540 := by
  native_decide

/-- Coefficient term 1541 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1541 : Poly :=
[
  term ((-555232084328764 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1541 for generator 15. -/
def ep_Q2_024_partial_15_1541 : Poly :=
[
  term ((555232084328764 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1110464168657528 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1541 for generator 15. -/
theorem ep_Q2_024_partial_15_1541_valid :
    mulPoly ep_Q2_024_coefficient_15_1541
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1541 := by
  native_decide

/-- Coefficient term 1542 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1542 : Poly :=
[
  term ((-14472610007117941619345584851689475690048458344523759461 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 1542 for generator 15. -/
def ep_Q2_024_partial_15_1542 : Poly :=
[
  term ((14472610007117941619345584851689475690048458344523759461 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-14472610007117941619345584851689475690048458344523759461 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1542 for generator 15. -/
theorem ep_Q2_024_partial_15_1542_valid :
    mulPoly ep_Q2_024_coefficient_15_1542
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1542 := by
  native_decide

/-- Coefficient term 1543 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1543 : Poly :=
[
  term ((2573169491922654 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1543 for generator 15. -/
def ep_Q2_024_partial_15_1543 : Poly :=
[
  term ((-2573169491922654 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((5146338983845308 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1543 for generator 15. -/
theorem ep_Q2_024_partial_15_1543_valid :
    mulPoly ep_Q2_024_coefficient_15_1543
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1543 := by
  native_decide

/-- Coefficient term 1544 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1544 : Poly :=
[
  term ((-312804607024180513560004117318496266832 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 2), (13, 1)]
]

/-- Partial product 1544 for generator 15. -/
def ep_Q2_024_partial_15_1544 : Poly :=
[
  term ((312804607024180513560004117318496266832 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-625609214048361027120008234636992533664 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1544 for generator 15. -/
theorem ep_Q2_024_partial_15_1544_valid :
    mulPoly ep_Q2_024_coefficient_15_1544
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1544 := by
  native_decide

/-- Coefficient term 1545 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1545 : Poly :=
[
  term ((2912805900941191950856161570747807387800229318048947956 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 1545 for generator 15. -/
def ep_Q2_024_partial_15_1545 : Poly :=
[
  term ((-2912805900941191950856161570747807387800229318048947956 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((5825611801882383901712323141495614775600458636097895912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1545 for generator 15. -/
theorem ep_Q2_024_partial_15_1545_valid :
    mulPoly ep_Q2_024_coefficient_15_1545
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1545 := by
  native_decide

/-- Coefficient term 1546 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1546 : Poly :=
[
  term ((-3027757108828976 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1546 for generator 15. -/
def ep_Q2_024_partial_15_1546 : Poly :=
[
  term ((3027757108828976 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6055514217657952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1546 for generator 15. -/
theorem ep_Q2_024_partial_15_1546_valid :
    mulPoly ep_Q2_024_coefficient_15_1546
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1546 := by
  native_decide

/-- Coefficient term 1547 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1547 : Poly :=
[
  term ((-8913305390748042853879655868088006102 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1547 for generator 15. -/
def ep_Q2_024_partial_15_1547 : Poly :=
[
  term ((8913305390748042853879655868088006102 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (13, 1)],
  term ((-17826610781496085707759311736176012204 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1547 for generator 15. -/
theorem ep_Q2_024_partial_15_1547_valid :
    mulPoly ep_Q2_024_coefficient_15_1547
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1547 := by
  native_decide

/-- Coefficient term 1548 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1548 : Poly :=
[
  term ((-32660075849927468648066773987997501948 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 1548 for generator 15. -/
def ep_Q2_024_partial_15_1548 : Poly :=
[
  term ((32660075849927468648066773987997501948 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-65320151699854937296133547975995003896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1548 for generator 15. -/
theorem ep_Q2_024_partial_15_1548_valid :
    mulPoly ep_Q2_024_coefficient_15_1548
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1548 := by
  native_decide

/-- Coefficient term 1549 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1549 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (13, 1), (14, 2)]
]

/-- Partial product 1549 for generator 15. -/
def ep_Q2_024_partial_15_1549 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1549 for generator 15. -/
theorem ep_Q2_024_partial_15_1549_valid :
    mulPoly ep_Q2_024_coefficient_15_1549
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1549 := by
  native_decide

/-- Coefficient term 1550 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1550 : Poly :=
[
  term ((-1362806007640155222416231771176169796911687781255882802 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 1550 for generator 15. -/
def ep_Q2_024_partial_15_1550 : Poly :=
[
  term ((1362806007640155222416231771176169796911687781255882802 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-2725612015280310444832463542352339593823375562511765604 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1550 for generator 15. -/
theorem ep_Q2_024_partial_15_1550_valid :
    mulPoly ep_Q2_024_coefficient_15_1550
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1550 := by
  native_decide

/-- Coefficient term 1551 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1551 : Poly :=
[
  term ((-477267730146856 : Rat) / 1162780221153193) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1551 for generator 15. -/
def ep_Q2_024_partial_15_1551 : Poly :=
[
  term ((477267730146856 : Rat) / 1162780221153193) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-954535460293712 : Rat) / 1162780221153193) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1551 for generator 15. -/
theorem ep_Q2_024_partial_15_1551_valid :
    mulPoly ep_Q2_024_coefficient_15_1551
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1551 := by
  native_decide

/-- Coefficient term 1552 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1552 : Poly :=
[
  term ((124436155722667828870994851439736827504 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 1552 for generator 15. -/
def ep_Q2_024_partial_15_1552 : Poly :=
[
  term ((-124436155722667828870994851439736827504 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((248872311445335657741989702879473655008 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1552 for generator 15. -/
theorem ep_Q2_024_partial_15_1552_valid :
    mulPoly ep_Q2_024_coefficient_15_1552
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1552 := by
  native_decide

/-- Coefficient term 1553 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1553 : Poly :=
[
  term ((-19714483073072262712901058104205203531353604799391757087 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 1553 for generator 15. -/
def ep_Q2_024_partial_15_1553 : Poly :=
[
  term ((19714483073072262712901058104205203531353604799391757087 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-39428966146144525425802116208410407062707209598783514174 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1553 for generator 15. -/
theorem ep_Q2_024_partial_15_1553_valid :
    mulPoly ep_Q2_024_coefficient_15_1553
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1553 := by
  native_decide

/-- Coefficient term 1554 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1554 : Poly :=
[
  term ((5366002030096580 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1554 for generator 15. -/
def ep_Q2_024_partial_15_1554 : Poly :=
[
  term ((-5366002030096580 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((10732004060193160 : Rat) / 1162780221153193) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1554 for generator 15. -/
theorem ep_Q2_024_partial_15_1554_valid :
    mulPoly ep_Q2_024_coefficient_15_1554
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1554 := by
  native_decide

/-- Coefficient term 1555 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1555 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (14, 2), (15, 1)]
]

/-- Partial product 1555 for generator 15. -/
def ep_Q2_024_partial_15_1555 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1555 for generator 15. -/
theorem ep_Q2_024_partial_15_1555_valid :
    mulPoly ep_Q2_024_coefficient_15_1555
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1555 := by
  native_decide

/-- Coefficient term 1556 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1556 : Poly :=
[
  term ((-1250951611561428 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1556 for generator 15. -/
def ep_Q2_024_partial_15_1556 : Poly :=
[
  term ((1250951611561428 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(5, 1), (6, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1556 for generator 15. -/
theorem ep_Q2_024_partial_15_1556_valid :
    mulPoly ep_Q2_024_coefficient_15_1556
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1556 := by
  native_decide

/-- Coefficient term 1557 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1557 : Poly :=
[
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 1557 for generator 15. -/
def ep_Q2_024_partial_15_1557 : Poly :=
[
  term ((-8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (15, 1)],
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1557 for generator 15. -/
theorem ep_Q2_024_partial_15_1557_valid :
    mulPoly ep_Q2_024_coefficient_15_1557
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1557 := by
  native_decide

/-- Coefficient term 1558 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1558 : Poly :=
[
  term ((-2772838151047862 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1558 for generator 15. -/
def ep_Q2_024_partial_15_1558 : Poly :=
[
  term ((2772838151047862 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5545676302095724 : Rat) / 1162780221153193) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1558 for generator 15. -/
theorem ep_Q2_024_partial_15_1558_valid :
    mulPoly ep_Q2_024_coefficient_15_1558
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1558 := by
  native_decide

/-- Coefficient term 1559 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1559 : Poly :=
[
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (15, 3)]
]

/-- Partial product 1559 for generator 15. -/
def ep_Q2_024_partial_15_1559 : Poly :=
[
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (15, 3)],
  term ((10876130589817032904121532417289354534777173727755099974 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1559 for generator 15. -/
theorem ep_Q2_024_partial_15_1559_valid :
    mulPoly ep_Q2_024_coefficient_15_1559
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1559 := by
  native_decide

/-- Coefficient term 1560 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1560 : Poly :=
[
  term ((-2676908167036388 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 1560 for generator 15. -/
def ep_Q2_024_partial_15_1560 : Poly :=
[
  term ((2676908167036388 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-5353816334072776 : Rat) / 1162780221153193) [(5, 1), (6, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1560 for generator 15. -/
theorem ep_Q2_024_partial_15_1560_valid :
    mulPoly ep_Q2_024_coefficient_15_1560
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1560 := by
  native_decide

/-- Coefficient term 1561 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1561 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1)]
]

/-- Partial product 1561 for generator 15. -/
def ep_Q2_024_partial_15_1561 : Poly :=
[
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (7, 1), (8, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1561 for generator 15. -/
theorem ep_Q2_024_partial_15_1561_valid :
    mulPoly ep_Q2_024_coefficient_15_1561
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1561 := by
  native_decide

/-- Coefficient term 1562 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1562 : Poly :=
[
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1562 for generator 15. -/
def ep_Q2_024_partial_15_1562 : Poly :=
[
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1562 for generator 15. -/
theorem ep_Q2_024_partial_15_1562_valid :
    mulPoly ep_Q2_024_coefficient_15_1562
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1562 := by
  native_decide

/-- Coefficient term 1563 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1563 : Poly :=
[
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1563 for generator 15. -/
def ep_Q2_024_partial_15_1563 : Poly :=
[
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1563 for generator 15. -/
theorem ep_Q2_024_partial_15_1563_valid :
    mulPoly ep_Q2_024_coefficient_15_1563
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1563 := by
  native_decide

/-- Coefficient term 1564 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1564 : Poly :=
[
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 1564 for generator 15. -/
def ep_Q2_024_partial_15_1564 : Poly :=
[
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1564 for generator 15. -/
theorem ep_Q2_024_partial_15_1564_valid :
    mulPoly ep_Q2_024_coefficient_15_1564
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1564 := by
  native_decide

/-- Coefficient term 1565 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1565 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1565 for generator 15. -/
def ep_Q2_024_partial_15_1565 : Poly :=
[
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1565 for generator 15. -/
theorem ep_Q2_024_partial_15_1565_valid :
    mulPoly ep_Q2_024_coefficient_15_1565
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1565 := by
  native_decide

/-- Coefficient term 1566 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1566 : Poly :=
[
  term ((89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1566 for generator 15. -/
def ep_Q2_024_partial_15_1566 : Poly :=
[
  term ((179024474755913241033395817994367019248 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1566 for generator 15. -/
theorem ep_Q2_024_partial_15_1566_valid :
    mulPoly ep_Q2_024_coefficient_15_1566
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1566 := by
  native_decide

/-- Coefficient term 1567 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1567 : Poly :=
[
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1567 for generator 15. -/
def ep_Q2_024_partial_15_1567 : Poly :=
[
  term ((62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1567 for generator 15. -/
theorem ep_Q2_024_partial_15_1567_valid :
    mulPoly ep_Q2_024_coefficient_15_1567
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1567 := by
  native_decide

/-- Coefficient term 1568 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1568 : Poly :=
[
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1568 for generator 15. -/
def ep_Q2_024_partial_15_1568 : Poly :=
[
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1568 for generator 15. -/
theorem ep_Q2_024_partial_15_1568_valid :
    mulPoly ep_Q2_024_coefficient_15_1568
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1568 := by
  native_decide

/-- Coefficient term 1569 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1569 : Poly :=
[
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1569 for generator 15. -/
def ep_Q2_024_partial_15_1569 : Poly :=
[
  term ((-6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1569 for generator 15. -/
theorem ep_Q2_024_partial_15_1569_valid :
    mulPoly ep_Q2_024_coefficient_15_1569
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1569 := by
  native_decide

/-- Coefficient term 1570 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1570 : Poly :=
[
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (14, 1)]
]

/-- Partial product 1570 for generator 15. -/
def ep_Q2_024_partial_15_1570 : Poly :=
[
  term ((212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1570 for generator 15. -/
theorem ep_Q2_024_partial_15_1570_valid :
    mulPoly ep_Q2_024_coefficient_15_1570
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1570 := by
  native_decide

/-- Coefficient term 1571 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1571 : Poly :=
[
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 1)]
]

/-- Partial product 1571 for generator 15. -/
def ep_Q2_024_partial_15_1571 : Poly :=
[
  term ((-7670230364914651357464754369715747784518 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (7, 1), (12, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1571 for generator 15. -/
theorem ep_Q2_024_partial_15_1571_valid :
    mulPoly ep_Q2_024_coefficient_15_1571
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1571 := by
  native_decide

/-- Coefficient term 1572 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1572 : Poly :=
[
  term ((117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1572 for generator 15. -/
def ep_Q2_024_partial_15_1572 : Poly :=
[
  term ((234752536678976224689491461331679415648 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1572 for generator 15. -/
theorem ep_Q2_024_partial_15_1572_valid :
    mulPoly ep_Q2_024_coefficient_15_1572
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1572 := by
  native_decide

/-- Coefficient term 1573 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1573 : Poly :=
[
  term ((1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 1573 for generator 15. -/
def ep_Q2_024_partial_15_1573 : Poly :=
[
  term ((3985248181647266426199509399378651190832537409401261088 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1573 for generator 15. -/
theorem ep_Q2_024_partial_15_1573_valid :
    mulPoly ep_Q2_024_coefficient_15_1573
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1573 := by
  native_decide

/-- Coefficient term 1574 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1574 : Poly :=
[
  term ((-3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1574 for generator 15. -/
def ep_Q2_024_partial_15_1574 : Poly :=
[
  term ((-6113826032736512 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1574 for generator 15. -/
theorem ep_Q2_024_partial_15_1574_valid :
    mulPoly ep_Q2_024_coefficient_15_1574
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1574 := by
  native_decide

/-- Coefficient term 1575 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1575 : Poly :=
[
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1575 for generator 15. -/
def ep_Q2_024_partial_15_1575 : Poly :=
[
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1575 for generator 15. -/
theorem ep_Q2_024_partial_15_1575_valid :
    mulPoly ep_Q2_024_coefficient_15_1575
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1575 := by
  native_decide

/-- Coefficient term 1576 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1576 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1576 for generator 15. -/
def ep_Q2_024_partial_15_1576 : Poly :=
[
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1576 for generator 15. -/
theorem ep_Q2_024_partial_15_1576_valid :
    mulPoly ep_Q2_024_coefficient_15_1576
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1576 := by
  native_decide

/-- Coefficient term 1577 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1577 : Poly :=
[
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (14, 1)]
]

/-- Partial product 1577 for generator 15. -/
def ep_Q2_024_partial_15_1577 : Poly :=
[
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1577 for generator 15. -/
theorem ep_Q2_024_partial_15_1577_valid :
    mulPoly ep_Q2_024_coefficient_15_1577
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1577 := by
  native_decide

/-- Coefficient term 1578 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1578 : Poly :=
[
  term ((-6386845054328388818077196023632263546 : Rat) / 3389009766673664679566930870139941435) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 1578 for generator 15. -/
def ep_Q2_024_partial_15_1578 : Poly :=
[
  term ((-12773690108656777636154392047264527092 : Rat) / 3389009766673664679566930870139941435) [(5, 1), (6, 1), (8, 1), (9, 1)],
  term ((6386845054328388818077196023632263546 : Rat) / 3389009766673664679566930870139941435) [(5, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1578 for generator 15. -/
theorem ep_Q2_024_partial_15_1578_valid :
    mulPoly ep_Q2_024_coefficient_15_1578
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1578 := by
  native_decide

/-- Coefficient term 1579 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1579 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1579 for generator 15. -/
def ep_Q2_024_partial_15_1579 : Poly :=
[
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1579 for generator 15. -/
theorem ep_Q2_024_partial_15_1579_valid :
    mulPoly ep_Q2_024_coefficient_15_1579
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1579 := by
  native_decide

/-- Coefficient term 1580 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1580 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1580 for generator 15. -/
def ep_Q2_024_partial_15_1580 : Poly :=
[
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1580 for generator 15. -/
theorem ep_Q2_024_partial_15_1580_valid :
    mulPoly ep_Q2_024_coefficient_15_1580
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1580 := by
  native_decide

/-- Coefficient term 1581 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1581 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1581 for generator 15. -/
def ep_Q2_024_partial_15_1581 : Poly :=
[
  term ((1701914309157880 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1581 for generator 15. -/
theorem ep_Q2_024_partial_15_1581_valid :
    mulPoly ep_Q2_024_coefficient_15_1581
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1581 := by
  native_decide

/-- Coefficient term 1582 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1582 : Poly :=
[
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1582 for generator 15. -/
def ep_Q2_024_partial_15_1582 : Poly :=
[
  term ((-3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1582 for generator 15. -/
theorem ep_Q2_024_partial_15_1582_valid :
    mulPoly ep_Q2_024_coefficient_15_1582
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1582 := by
  native_decide

/-- Coefficient term 1583 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1583 : Poly :=
[
  term ((-20279156209872636315451510740564187888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 1583 for generator 15. -/
def ep_Q2_024_partial_15_1583 : Poly :=
[
  term ((-40558312419745272630903021481128375776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((20279156209872636315451510740564187888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1583 for generator 15. -/
theorem ep_Q2_024_partial_15_1583_valid :
    mulPoly ep_Q2_024_coefficient_15_1583
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1583 := by
  native_decide

/-- Coefficient term 1584 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1584 : Poly :=
[
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 1584 for generator 15. -/
def ep_Q2_024_partial_15_1584 : Poly :=
[
  term ((-7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1584 for generator 15. -/
theorem ep_Q2_024_partial_15_1584_valid :
    mulPoly ep_Q2_024_coefficient_15_1584
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1584 := by
  native_decide

/-- Coefficient term 1585 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1585 : Poly :=
[
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1585 for generator 15. -/
def ep_Q2_024_partial_15_1585 : Poly :=
[
  term ((23523905752088408 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1585 for generator 15. -/
theorem ep_Q2_024_partial_15_1585_valid :
    mulPoly ep_Q2_024_coefficient_15_1585
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1585 := by
  native_decide

/-- Coefficient term 1586 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1586 : Poly :=
[
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 2), (15, 1)]
]

/-- Partial product 1586 for generator 15. -/
def ep_Q2_024_partial_15_1586 : Poly :=
[
  term ((103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1586 for generator 15. -/
theorem ep_Q2_024_partial_15_1586_valid :
    mulPoly ep_Q2_024_coefficient_15_1586
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1586 := by
  native_decide

/-- Coefficient term 1587 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1587 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 1587 for generator 15. -/
def ep_Q2_024_partial_15_1587 : Poly :=
[
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1587 for generator 15. -/
theorem ep_Q2_024_partial_15_1587_valid :
    mulPoly ep_Q2_024_coefficient_15_1587
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1587 := by
  native_decide

/-- Coefficient term 1588 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1588 : Poly :=
[
  term ((94985786239315737375960686385622156768 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1588 for generator 15. -/
def ep_Q2_024_partial_15_1588 : Poly :=
[
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-94985786239315737375960686385622156768 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1588 for generator 15. -/
theorem ep_Q2_024_partial_15_1588_valid :
    mulPoly ep_Q2_024_coefficient_15_1588
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1588 := by
  native_decide

/-- Coefficient term 1589 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1589 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1589 for generator 15. -/
def ep_Q2_024_partial_15_1589 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1589 for generator 15. -/
theorem ep_Q2_024_partial_15_1589_valid :
    mulPoly ep_Q2_024_coefficient_15_1589
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1589 := by
  native_decide

/-- Coefficient term 1590 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1590 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1590 for generator 15. -/
def ep_Q2_024_partial_15_1590 : Poly :=
[
  term ((9138159832270958 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1590 for generator 15. -/
theorem ep_Q2_024_partial_15_1590_valid :
    mulPoly ep_Q2_024_coefficient_15_1590
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1590 := by
  native_decide

/-- Coefficient term 1591 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1591 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1591 for generator 15. -/
def ep_Q2_024_partial_15_1591 : Poly :=
[
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1591 for generator 15. -/
theorem ep_Q2_024_partial_15_1591_valid :
    mulPoly ep_Q2_024_coefficient_15_1591
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1591 := by
  native_decide

/-- Coefficient term 1592 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1592 : Poly :=
[
  term ((-546523595175579001715267413386915703134961119349385425 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1592 for generator 15. -/
def ep_Q2_024_partial_15_1592 : Poly :=
[
  term ((-1093047190351158003430534826773831406269922238698770850 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((546523595175579001715267413386915703134961119349385425 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1592 for generator 15. -/
theorem ep_Q2_024_partial_15_1592_valid :
    mulPoly ep_Q2_024_coefficient_15_1592
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1592 := by
  native_decide

/-- Coefficient term 1593 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1593 : Poly :=
[
  term ((966163999419180 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1593 for generator 15. -/
def ep_Q2_024_partial_15_1593 : Poly :=
[
  term ((1932327998838360 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-966163999419180 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1593 for generator 15. -/
theorem ep_Q2_024_partial_15_1593_valid :
    mulPoly ep_Q2_024_coefficient_15_1593
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1593 := by
  native_decide

/-- Coefficient term 1594 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1594 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 1594 for generator 15. -/
def ep_Q2_024_partial_15_1594 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1594 for generator 15. -/
theorem ep_Q2_024_partial_15_1594_valid :
    mulPoly ep_Q2_024_coefficient_15_1594
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1594 := by
  native_decide

/-- Coefficient term 1595 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1595 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1595 for generator 15. -/
def ep_Q2_024_partial_15_1595 : Poly :=
[
  term ((-26408829814481614 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1595 for generator 15. -/
theorem ep_Q2_024_partial_15_1595_valid :
    mulPoly ep_Q2_024_coefficient_15_1595
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1595 := by
  native_decide

/-- Coefficient term 1596 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1596 : Poly :=
[
  term ((3562952091979550677471783560986761456168 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1596 for generator 15. -/
def ep_Q2_024_partial_15_1596 : Poly :=
[
  term ((7125904183959101354943567121973522912336 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-3562952091979550677471783560986761456168 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1596 for generator 15. -/
theorem ep_Q2_024_partial_15_1596_valid :
    mulPoly ep_Q2_024_coefficient_15_1596
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1596 := by
  native_decide

/-- Coefficient term 1597 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1597 : Poly :=
[
  term ((-22042181601404886767662777307475000464 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1597 for generator 15. -/
def ep_Q2_024_partial_15_1597 : Poly :=
[
  term ((-44084363202809773535325554614950000928 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((22042181601404886767662777307475000464 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1597 for generator 15. -/
theorem ep_Q2_024_partial_15_1597_valid :
    mulPoly ep_Q2_024_coefficient_15_1597
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1597 := by
  native_decide

/-- Coefficient term 1598 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1598 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1598 for generator 15. -/
def ep_Q2_024_partial_15_1598 : Poly :=
[
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1598 for generator 15. -/
theorem ep_Q2_024_partial_15_1598_valid :
    mulPoly ep_Q2_024_coefficient_15_1598
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1598 := by
  native_decide

/-- Coefficient term 1599 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1599 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1599 for generator 15. -/
def ep_Q2_024_partial_15_1599 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1599 for generator 15. -/
theorem ep_Q2_024_partial_15_1599_valid :
    mulPoly ep_Q2_024_coefficient_15_1599
        ep_Q2_024_generator_15_1500_1599 =
      ep_Q2_024_partial_15_1599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1500_1599 : List Poly :=
[
  ep_Q2_024_partial_15_1500,
  ep_Q2_024_partial_15_1501,
  ep_Q2_024_partial_15_1502,
  ep_Q2_024_partial_15_1503,
  ep_Q2_024_partial_15_1504,
  ep_Q2_024_partial_15_1505,
  ep_Q2_024_partial_15_1506,
  ep_Q2_024_partial_15_1507,
  ep_Q2_024_partial_15_1508,
  ep_Q2_024_partial_15_1509,
  ep_Q2_024_partial_15_1510,
  ep_Q2_024_partial_15_1511,
  ep_Q2_024_partial_15_1512,
  ep_Q2_024_partial_15_1513,
  ep_Q2_024_partial_15_1514,
  ep_Q2_024_partial_15_1515,
  ep_Q2_024_partial_15_1516,
  ep_Q2_024_partial_15_1517,
  ep_Q2_024_partial_15_1518,
  ep_Q2_024_partial_15_1519,
  ep_Q2_024_partial_15_1520,
  ep_Q2_024_partial_15_1521,
  ep_Q2_024_partial_15_1522,
  ep_Q2_024_partial_15_1523,
  ep_Q2_024_partial_15_1524,
  ep_Q2_024_partial_15_1525,
  ep_Q2_024_partial_15_1526,
  ep_Q2_024_partial_15_1527,
  ep_Q2_024_partial_15_1528,
  ep_Q2_024_partial_15_1529,
  ep_Q2_024_partial_15_1530,
  ep_Q2_024_partial_15_1531,
  ep_Q2_024_partial_15_1532,
  ep_Q2_024_partial_15_1533,
  ep_Q2_024_partial_15_1534,
  ep_Q2_024_partial_15_1535,
  ep_Q2_024_partial_15_1536,
  ep_Q2_024_partial_15_1537,
  ep_Q2_024_partial_15_1538,
  ep_Q2_024_partial_15_1539,
  ep_Q2_024_partial_15_1540,
  ep_Q2_024_partial_15_1541,
  ep_Q2_024_partial_15_1542,
  ep_Q2_024_partial_15_1543,
  ep_Q2_024_partial_15_1544,
  ep_Q2_024_partial_15_1545,
  ep_Q2_024_partial_15_1546,
  ep_Q2_024_partial_15_1547,
  ep_Q2_024_partial_15_1548,
  ep_Q2_024_partial_15_1549,
  ep_Q2_024_partial_15_1550,
  ep_Q2_024_partial_15_1551,
  ep_Q2_024_partial_15_1552,
  ep_Q2_024_partial_15_1553,
  ep_Q2_024_partial_15_1554,
  ep_Q2_024_partial_15_1555,
  ep_Q2_024_partial_15_1556,
  ep_Q2_024_partial_15_1557,
  ep_Q2_024_partial_15_1558,
  ep_Q2_024_partial_15_1559,
  ep_Q2_024_partial_15_1560,
  ep_Q2_024_partial_15_1561,
  ep_Q2_024_partial_15_1562,
  ep_Q2_024_partial_15_1563,
  ep_Q2_024_partial_15_1564,
  ep_Q2_024_partial_15_1565,
  ep_Q2_024_partial_15_1566,
  ep_Q2_024_partial_15_1567,
  ep_Q2_024_partial_15_1568,
  ep_Q2_024_partial_15_1569,
  ep_Q2_024_partial_15_1570,
  ep_Q2_024_partial_15_1571,
  ep_Q2_024_partial_15_1572,
  ep_Q2_024_partial_15_1573,
  ep_Q2_024_partial_15_1574,
  ep_Q2_024_partial_15_1575,
  ep_Q2_024_partial_15_1576,
  ep_Q2_024_partial_15_1577,
  ep_Q2_024_partial_15_1578,
  ep_Q2_024_partial_15_1579,
  ep_Q2_024_partial_15_1580,
  ep_Q2_024_partial_15_1581,
  ep_Q2_024_partial_15_1582,
  ep_Q2_024_partial_15_1583,
  ep_Q2_024_partial_15_1584,
  ep_Q2_024_partial_15_1585,
  ep_Q2_024_partial_15_1586,
  ep_Q2_024_partial_15_1587,
  ep_Q2_024_partial_15_1588,
  ep_Q2_024_partial_15_1589,
  ep_Q2_024_partial_15_1590,
  ep_Q2_024_partial_15_1591,
  ep_Q2_024_partial_15_1592,
  ep_Q2_024_partial_15_1593,
  ep_Q2_024_partial_15_1594,
  ep_Q2_024_partial_15_1595,
  ep_Q2_024_partial_15_1596,
  ep_Q2_024_partial_15_1597,
  ep_Q2_024_partial_15_1598,
  ep_Q2_024_partial_15_1599
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1500_1599 : Poly :=
[
  term ((1661526584267625636836795532060999378964962064978680308 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-3057134390690640 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((-6447190534260720 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((1784700499936970998466574348067980094936 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2)],
  term ((-426961492162145389756122646102418830832 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (13, 2), (14, 2)],
  term ((1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (13, 2), (15, 2)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 3), (15, 1)],
  term ((-14175571372471503873596478138050807634278 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (6, 1), (14, 1)],
  term ((9003055202472371229180827242284194135638109347854406822 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((4761221965497272 : Rat) / 1162780221153193) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (14, 2)],
  term ((3422625837900765696354987200940684656149774116203571304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (15, 2)],
  term ((-10297322000119424 : Rat) / 1162780221153193) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-830763292133812818418397766030499689482481032489340154 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 1), (15, 1)],
  term ((1528567195345320 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (13, 1), (15, 3)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-892350249968485499233287174033990047468 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2)],
  term ((213480746081072694878061323051209415416 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2), (14, 2)],
  term ((-884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (13, 2), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 3), (15, 1)],
  term ((7087785686235751936798239069025403817139 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (14, 1)],
  term ((-4501527601236185614590413621142097067819054673927203411 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (14, 1), (15, 2)],
  term ((-2380610982748636 : Rat) / 1162780221153193) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 2)],
  term ((-1711312918950382848177493600470342328074887058101785652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (15, 2)],
  term ((5148661000059712 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)],
  term ((-108527865897635204440923906776011627033 : Rat) / 399903152467492432188897842676513089330) [(4, 2)],
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (6, 1)],
  term ((-2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((-53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((539985130814216662445046215886388007466061399321278790 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-582097550732072 : Rat) / 1162780221153193) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((5188478469540100254489206030911932864 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-5470385817276521823081790136294740049795355094041561244 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((1164195101464144 : Rat) / 1162780221153193) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((107601414080308220736805178845459671616 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (6, 1), (13, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 2), (6, 1), (15, 2)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((1297119617385025063622301507727983216 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (7, 1), (9, 1)],
  term ((26900353520077055184201294711364917904 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (7, 1), (13, 1)],
  term ((-269992565407108331222523107943194003733030699660639395 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (7, 1), (15, 1)],
  term ((291048775366036 : Rat) / 1162780221153193) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (9, 1), (13, 1)],
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (9, 1), (15, 1)],
  term ((2735192908638260911540895068147370024897677547020780622 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (13, 1), (15, 1)],
  term ((-582097550732072 : Rat) / 1162780221153193) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53800707040154110368402589422729835808 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (13, 2)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 2), (15, 2)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(4, 2), (15, 2), (16, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (7, 1), (8, 1)],
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((179024474755913241033395817994367019248 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((-7670230364914651357464754369715747784518 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (7, 1), (12, 1)],
  term ((234752536678976224689491461331679415648 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((3985248181647266426199509399378651190832537409401261088 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2)],
  term ((-6113826032736512 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((-12773690108656777636154392047264527092 : Rat) / 3389009766673664679566930870139941435) [(5, 1), (6, 1), (8, 1), (9, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-40558312419745272630903021481128375776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((23523905752088408 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1093047190351158003430534826773831406269922238698770850 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((1932327998838360 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((7125904183959101354943567121973522912336 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-44084363202809773535325554614950000928 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-236823465392436826628713367882961865264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1)],
  term ((-40193263314434185182732768267407360376 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-262194352093689976652062881408140718032 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((68565332052439720700920811183379198876 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (14, 1)],
  term ((3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-1196701779202068 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-745959215937319093607510962273863246208 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((53804611769730316523896603857760271168 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-487438969729206091756438183880638190897844094176772109 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((555232084328764 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((14472610007117941619345584851689475690048458344523759461 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2573169491922654 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((312804607024180513560004117318496266832 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-2912805900941191950856161570747807387800229318048947956 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((3027757108828976 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((8913305390748042853879655868088006102 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (13, 1)],
  term ((32660075849927468648066773987997501948 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((1362806007640155222416231771176169796911687781255882802 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((477267730146856 : Rat) / 1162780221153193) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-124436155722667828870994851439736827504 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((19714483073072262712901058104205203531353604799391757087 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5366002030096580 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (15, 1)],
  term ((2772838151047862 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (15, 3)],
  term ((2676908167036388 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((473646930784873653257426735765923730528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 1)],
  term ((80386526628868370365465536534814720752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 1), (12, 1)],
  term ((524388704187379953304125762816281436064 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1)],
  term ((-137130664104879441401841622366758397752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 1), (14, 1)],
  term ((-6915135619643297929387116909828524067851506949280013118 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (9, 1), (15, 2)],
  term ((2393403558404136 : Rat) / 1162780221153193) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (9, 2), (15, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (11, 1), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((1491918431874638187215021924547726492416 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((-107609223539460633047793207715520542336 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)],
  term ((974877939458412183512876367761276381795688188353544218 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1110464168657528 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14472610007117941619345584851689475690048458344523759461 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((5146338983845308 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-625609214048361027120008234636992533664 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 2), (13, 1)],
  term ((5825611801882383901712323141495614775600458636097895912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (12, 2), (15, 1)],
  term ((-6055514217657952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-17826610781496085707759311736176012204 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 2), (13, 1)],
  term ((-65320151699854937296133547975995003896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (13, 1), (14, 2)],
  term ((-2725612015280310444832463542352339593823375562511765604 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((-954535460293712 : Rat) / 1162780221153193) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((248872311445335657741989702879473655008 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (13, 2), (15, 1)],
  term ((-39428966146144525425802116208410407062707209598783514174 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((10732004060193160 : Rat) / 1162780221153193) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 2), (14, 2), (15, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(5, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (15, 1)],
  term ((-5545676302095724 : Rat) / 1162780221153193) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((10876130589817032904121532417289354534777173727755099974 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (15, 3)],
  term ((-5353816334072776 : Rat) / 1162780221153193) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (14, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((6386845054328388818077196023632263546 : Rat) / 3389009766673664679566930870139941435) [(5, 1), (8, 1), (9, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((20279156209872636315451510740564187888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (11, 1)],
  term ((-94985786239315737375960686385622156768 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((546523595175579001715267413386915703134961119349385425 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-966163999419180 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3562952091979550677471783560986761456168 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (13, 1)],
  term ((22042181601404886767662777307475000464 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1500 through 1599. -/
theorem ep_Q2_024_block_15_1500_1599_valid :
    checkProductSumEq ep_Q2_024_partials_15_1500_1599
      ep_Q2_024_block_15_1500_1599 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
