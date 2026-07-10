/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:1400-1499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_1400_1499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1400 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1400 : Poly :=
[
  term ((111979997620021272207837621813177208601753391776852006295120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1400 for generator 18. -/
def ep_Q2_041_partial_18_1400 : Poly :=
[
  term ((223959995240042544415675243626354417203506783553704012590240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-111979997620021272207837621813177208601753391776852006295120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 18. -/
theorem ep_Q2_041_partial_18_1400_valid :
    mulPoly ep_Q2_041_coefficient_18_1400
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1401 : Poly :=
[
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 1401 for generator 18. -/
def ep_Q2_041_partial_18_1401 : Poly :=
[
  term ((-2358885571095919495521132492877438025993470316901758657137920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 3)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 18. -/
theorem ep_Q2_041_partial_18_1401_valid :
    mulPoly ep_Q2_041_coefficient_18_1401
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1402 : Poly :=
[
  term ((370203443909753803837248274374784100305084725550287772732391330 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1402 for generator 18. -/
def ep_Q2_041_partial_18_1402 : Poly :=
[
  term ((740406887819507607674496548749568200610169451100575545464782660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-370203443909753803837248274374784100305084725550287772732391330 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 18. -/
theorem ep_Q2_041_partial_18_1402_valid :
    mulPoly ep_Q2_041_coefficient_18_1402
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1403 : Poly :=
[
  term ((68921596152185103552537253007790039533181907719235797509584880 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (15, 2)]
]

/-- Partial product 1403 for generator 18. -/
def ep_Q2_041_partial_18_1403 : Poly :=
[
  term ((137843192304370207105074506015580079066363815438471595019169760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((-68921596152185103552537253007790039533181907719235797509584880 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 18. -/
theorem ep_Q2_041_partial_18_1403_valid :
    mulPoly ep_Q2_041_coefficient_18_1403
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1404 : Poly :=
[
  term ((1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (15, 4)]
]

/-- Partial product 1404 for generator 18. -/
def ep_Q2_041_partial_18_1404 : Poly :=
[
  term ((2572664892222206617857667685546903167076802015409547403507229200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 2), (11, 1), (15, 4)],
  term ((-1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 18. -/
theorem ep_Q2_041_partial_18_1404_valid :
    mulPoly ep_Q2_041_coefficient_18_1404
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1405 : Poly :=
[
  term ((-91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1405 for generator 18. -/
def ep_Q2_041_partial_18_1405 : Poly :=
[
  term ((-182399550391839254357067483747453859549458371322704520045120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 18. -/
theorem ep_Q2_041_partial_18_1405_valid :
    mulPoly ep_Q2_041_coefficient_18_1405
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1406 : Poly :=
[
  term ((41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 2), (12, 1), (15, 1)]
]

/-- Partial product 1406 for generator 18. -/
def ep_Q2_041_partial_18_1406 : Poly :=
[
  term ((83345606318490797732 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 18. -/
theorem ep_Q2_041_partial_18_1406_valid :
    mulPoly ep_Q2_041_coefficient_18_1406
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1407 : Poly :=
[
  term ((2610306556 : Rat) / 151763803) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1407 for generator 18. -/
def ep_Q2_041_partial_18_1407 : Poly :=
[
  term ((5220613112 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 18. -/
theorem ep_Q2_041_partial_18_1407_valid :
    mulPoly ep_Q2_041_coefficient_18_1407
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1408 : Poly :=
[
  term ((40883251229253084297 : Rat) / 518003890243601902) [(1, 1), (10, 2), (13, 1)]
]

/-- Partial product 1408 for generator 18. -/
def ep_Q2_041_partial_18_1408 : Poly :=
[
  term ((40883251229253084297 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-40883251229253084297 : Rat) / 518003890243601902) [(1, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 18. -/
theorem ep_Q2_041_partial_18_1408_valid :
    mulPoly ep_Q2_041_coefficient_18_1408
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1409 : Poly :=
[
  term ((-51934579612662313654 : Rat) / 259001945121800951) [(1, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 1409 for generator 18. -/
def ep_Q2_041_partial_18_1409 : Poly :=
[
  term ((-103869159225324627308 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((51934579612662313654 : Rat) / 259001945121800951) [(1, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 18. -/
theorem ep_Q2_041_partial_18_1409_valid :
    mulPoly ep_Q2_041_coefficient_18_1409
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1410 : Poly :=
[
  term ((-96544240317917291792841434258831458647428077610544784680651450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1410 for generator 18. -/
def ep_Q2_041_partial_18_1410 : Poly :=
[
  term ((-193088480635834583585682868517662917294856155221089569361302900 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((96544240317917291792841434258831458647428077610544784680651450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 18. -/
theorem ep_Q2_041_partial_18_1410_valid :
    mulPoly ep_Q2_041_coefficient_18_1410
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1411 : Poly :=
[
  term ((-3332843836 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1411 for generator 18. -/
def ep_Q2_041_partial_18_1411 : Poly :=
[
  term ((-6665687672 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((3332843836 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 18. -/
theorem ep_Q2_041_partial_18_1411_valid :
    mulPoly ep_Q2_041_coefficient_18_1411
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1412 : Poly :=
[
  term ((-995544302304524793658170680771428676725865911891494614719557398860921608 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (13, 1), (15, 2)]
]

/-- Partial product 1412 for generator 18. -/
def ep_Q2_041_partial_18_1412 : Poly :=
[
  term ((-1991088604609049587316341361542857353451731823782989229439114797721843216 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((995544302304524793658170680771428676725865911891494614719557398860921608 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 18. -/
theorem ep_Q2_041_partial_18_1412_valid :
    mulPoly ep_Q2_041_coefficient_18_1412
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1413 : Poly :=
[
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1413 for generator 18. -/
def ep_Q2_041_partial_18_1413 : Poly :=
[
  term ((-5780298240 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 18. -/
theorem ep_Q2_041_partial_18_1413_valid :
    mulPoly ep_Q2_041_coefficient_18_1413
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1414 : Poly :=
[
  term ((405802941044819414105808770824386284014114673588332653133903320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (13, 1), (15, 4)]
]

/-- Partial product 1414 for generator 18. -/
def ep_Q2_041_partial_18_1414 : Poly :=
[
  term ((811605882089638828211617541648772568028229347176665306267806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 4)],
  term ((-405802941044819414105808770824386284014114673588332653133903320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 18. -/
theorem ep_Q2_041_partial_18_1414_valid :
    mulPoly ep_Q2_041_coefficient_18_1414
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1415 : Poly :=
[
  term ((1789723953 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 1415 for generator 18. -/
def ep_Q2_041_partial_18_1415 : Poly :=
[
  term ((3579447906 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1789723953 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 18. -/
theorem ep_Q2_041_partial_18_1415_valid :
    mulPoly ep_Q2_041_coefficient_18_1415
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1416 : Poly :=
[
  term ((124378683596181749940676683627244844608321957016653262291280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1416 for generator 18. -/
def ep_Q2_041_partial_18_1416 : Poly :=
[
  term ((248757367192363499881353367254489689216643914033306524582560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-124378683596181749940676683627244844608321957016653262291280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 18. -/
theorem ep_Q2_041_partial_18_1416_valid :
    mulPoly ep_Q2_041_coefficient_18_1416
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1417 : Poly :=
[
  term ((3967644058661720734895758558735870498710634900054137133440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (15, 1)]
]

/-- Partial product 1417 for generator 18. -/
def ep_Q2_041_partial_18_1417 : Poly :=
[
  term ((7935288117323441469791517117471740997421269800108274266880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (13, 2), (15, 1)],
  term ((-3967644058661720734895758558735870498710634900054137133440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 18. -/
theorem ep_Q2_041_partial_18_1417_valid :
    mulPoly ep_Q2_041_coefficient_18_1417
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1418 : Poly :=
[
  term ((132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (15, 3)]
]

/-- Partial product 1418 for generator 18. -/
def ep_Q2_041_partial_18_1418 : Poly :=
[
  term ((265431267202096982097143534028143318668742170842408018149760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (13, 2), (15, 3)],
  term ((-132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 18. -/
theorem ep_Q2_041_partial_18_1418_valid :
    mulPoly ep_Q2_041_coefficient_18_1418
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1419 : Poly :=
[
  term ((-8815284058300618401892360509612942393231681378845853259224633464102855931 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 2), (14, 1), (15, 1)]
]

/-- Partial product 1419 for generator 18. -/
def ep_Q2_041_partial_18_1419 : Poly :=
[
  term ((-8815284058300618401892360509612942393231681378845853259224633464102855931 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term ((8815284058300618401892360509612942393231681378845853259224633464102855931 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 18. -/
theorem ep_Q2_041_partial_18_1419_valid :
    mulPoly ep_Q2_041_coefficient_18_1419
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1420 : Poly :=
[
  term ((-26823653454972 : Rat) / 275754830051) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1420 for generator 18. -/
def ep_Q2_041_partial_18_1420 : Poly :=
[
  term ((-53647306909944 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((26823653454972 : Rat) / 275754830051) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 18. -/
theorem ep_Q2_041_partial_18_1420_valid :
    mulPoly ep_Q2_041_coefficient_18_1420
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1421 : Poly :=
[
  term ((6504694674429519286171032197139995040380022608928208434630186844052795625 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 2), (15, 1)]
]

/-- Partial product 1421 for generator 18. -/
def ep_Q2_041_partial_18_1421 : Poly :=
[
  term ((6504694674429519286171032197139995040380022608928208434630186844052795625 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-6504694674429519286171032197139995040380022608928208434630186844052795625 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 18. -/
theorem ep_Q2_041_partial_18_1421_valid :
    mulPoly ep_Q2_041_coefficient_18_1421
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1422 : Poly :=
[
  term ((1702631743239 : Rat) / 275754830051) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1422 for generator 18. -/
def ep_Q2_041_partial_18_1422 : Poly :=
[
  term ((3405263486478 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1702631743239 : Rat) / 275754830051) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 18. -/
theorem ep_Q2_041_partial_18_1422_valid :
    mulPoly ep_Q2_041_coefficient_18_1422
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1423 : Poly :=
[
  term ((-241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (10, 2), (15, 3)]
]

/-- Partial product 1423 for generator 18. -/
def ep_Q2_041_partial_18_1423 : Poly :=
[
  term ((-241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 2), (15, 3)],
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 18. -/
theorem ep_Q2_041_partial_18_1423_valid :
    mulPoly ep_Q2_041_coefficient_18_1423
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1424 : Poly :=
[
  term ((-71674307314848 : Rat) / 275754830051) [(1, 1), (10, 2), (15, 3), (16, 1)]
]

/-- Partial product 1424 for generator 18. -/
def ep_Q2_041_partial_18_1424 : Poly :=
[
  term ((-143348614629696 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((71674307314848 : Rat) / 275754830051) [(1, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 18. -/
theorem ep_Q2_041_partial_18_1424_valid :
    mulPoly ep_Q2_041_coefficient_18_1424
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1425 : Poly :=
[
  term ((27779284645264200487 : Rat) / 148001111498171972) [(1, 1), (11, 1)]
]

/-- Partial product 1425 for generator 18. -/
def ep_Q2_041_partial_18_1425 : Poly :=
[
  term ((27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (8, 1), (11, 1)],
  term ((-27779284645264200487 : Rat) / 148001111498171972) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 18. -/
theorem ep_Q2_041_partial_18_1425_valid :
    mulPoly ep_Q2_041_coefficient_18_1425
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1426 : Poly :=
[
  term ((-118055820696595769229 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 1426 for generator 18. -/
def ep_Q2_041_partial_18_1426 : Poly :=
[
  term ((-236111641393191538458 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((118055820696595769229 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 18. -/
theorem ep_Q2_041_partial_18_1426_valid :
    mulPoly ep_Q2_041_coefficient_18_1426
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1427 : Poly :=
[
  term ((2212081081569370338212817000887897749193456879133161945810176854762948 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1427 for generator 18. -/
def ep_Q2_041_partial_18_1427 : Poly :=
[
  term ((4424162163138740676425634001775795498386913758266323891620353709525896 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2212081081569370338212817000887897749193456879133161945810176854762948 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 18. -/
theorem ep_Q2_041_partial_18_1427_valid :
    mulPoly ep_Q2_041_coefficient_18_1427
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1428 : Poly :=
[
  term ((10329607040 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1428 for generator 18. -/
def ep_Q2_041_partial_18_1428 : Poly :=
[
  term ((20659214080 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10329607040 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 18. -/
theorem ep_Q2_041_partial_18_1428_valid :
    mulPoly ep_Q2_041_coefficient_18_1428
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1429 : Poly :=
[
  term ((21602304071653695844939825879413164795916603395401139954033658240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1429 for generator 18. -/
def ep_Q2_041_partial_18_1429 : Poly :=
[
  term ((43204608143307391689879651758826329591833206790802279908067316480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-21602304071653695844939825879413164795916603395401139954033658240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 18. -/
theorem ep_Q2_041_partial_18_1429_valid :
    mulPoly ep_Q2_041_coefficient_18_1429
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1430 : Poly :=
[
  term ((-140359689420715050947031144001307465110389164832228574568720 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1430 for generator 18. -/
def ep_Q2_041_partial_18_1430 : Poly :=
[
  term ((-280719378841430101894062288002614930220778329664457149137440 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((140359689420715050947031144001307465110389164832228574568720 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 18. -/
theorem ep_Q2_041_partial_18_1430_valid :
    mulPoly ep_Q2_041_coefficient_18_1430
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1431 : Poly :=
[
  term ((-8117044952219251615675866315791918654892087853487635621585038948384888419 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1431 for generator 18. -/
def ep_Q2_041_partial_18_1431 : Poly :=
[
  term ((-8117044952219251615675866315791918654892087853487635621585038948384888419 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8117044952219251615675866315791918654892087853487635621585038948384888419 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 18. -/
theorem ep_Q2_041_partial_18_1431_valid :
    mulPoly ep_Q2_041_coefficient_18_1431
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1432 : Poly :=
[
  term ((-8431394855024 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1432 for generator 18. -/
def ep_Q2_041_partial_18_1432 : Poly :=
[
  term ((-16862789710048 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8431394855024 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 18. -/
theorem ep_Q2_041_partial_18_1432_valid :
    mulPoly ep_Q2_041_coefficient_18_1432
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1433 : Poly :=
[
  term ((3354988698841917696562440319993764463738140700842262174723860880 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1433 for generator 18. -/
def ep_Q2_041_partial_18_1433 : Poly :=
[
  term ((6709977397683835393124880639987528927476281401684524349447721760 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3354988698841917696562440319993764463738140700842262174723860880 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 18. -/
theorem ep_Q2_041_partial_18_1433_valid :
    mulPoly ep_Q2_041_coefficient_18_1433
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1434 : Poly :=
[
  term ((97486876307460690486 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1434 for generator 18. -/
def ep_Q2_041_partial_18_1434 : Poly :=
[
  term ((194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-97486876307460690486 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 18. -/
theorem ep_Q2_041_partial_18_1434_valid :
    mulPoly ep_Q2_041_coefficient_18_1434
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1435 : Poly :=
[
  term ((-11264052839735082854927668088415611530961496069648643741935520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1435 for generator 18. -/
def ep_Q2_041_partial_18_1435 : Poly :=
[
  term ((-22528105679470165709855336176831223061922992139297287483871040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((11264052839735082854927668088415611530961496069648643741935520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 18. -/
theorem ep_Q2_041_partial_18_1435_valid :
    mulPoly ep_Q2_041_coefficient_18_1435
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1436 : Poly :=
[
  term ((9980669057205218952037043515266529562813653226116803087480166100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 1436 for generator 18. -/
def ep_Q2_041_partial_18_1436 : Poly :=
[
  term ((19961338114410437904074087030533059125627306452233606174960332200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-9980669057205218952037043515266529562813653226116803087480166100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 18. -/
theorem ep_Q2_041_partial_18_1436_valid :
    mulPoly ep_Q2_041_coefficient_18_1436
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1437 : Poly :=
[
  term ((6864104160 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1437 for generator 18. -/
def ep_Q2_041_partial_18_1437 : Poly :=
[
  term ((13728208320 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6864104160 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 18. -/
theorem ep_Q2_041_partial_18_1437_valid :
    mulPoly ep_Q2_041_coefficient_18_1437
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1438 : Poly :=
[
  term ((-315199629802490166240357946658420190919131327875359521552840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1)]
]

/-- Partial product 1438 for generator 18. -/
def ep_Q2_041_partial_18_1438 : Poly :=
[
  term ((-630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((315199629802490166240357946658420190919131327875359521552840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 18. -/
theorem ep_Q2_041_partial_18_1438_valid :
    mulPoly ep_Q2_041_coefficient_18_1438
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1439 : Poly :=
[
  term ((233300498597533548603 : Rat) / 518003890243601902) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1439 for generator 18. -/
def ep_Q2_041_partial_18_1439 : Poly :=
[
  term ((233300498597533548603 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-233300498597533548603 : Rat) / 518003890243601902) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 18. -/
theorem ep_Q2_041_partial_18_1439_valid :
    mulPoly ep_Q2_041_coefficient_18_1439
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1440 : Poly :=
[
  term ((2718560200449052437691635645093990481069524432589853112366000289050469885 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1440 for generator 18. -/
def ep_Q2_041_partial_18_1440 : Poly :=
[
  term ((5437120400898104875383271290187980962139048865179706224732000578100939770 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2718560200449052437691635645093990481069524432589853112366000289050469885 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 18. -/
theorem ep_Q2_041_partial_18_1440_valid :
    mulPoly ep_Q2_041_coefficient_18_1440
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1441 : Poly :=
[
  term ((-72935950656576 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1441 for generator 18. -/
def ep_Q2_041_partial_18_1441 : Poly :=
[
  term ((-145871901313152 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((72935950656576 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 18. -/
theorem ep_Q2_041_partial_18_1441_valid :
    mulPoly ep_Q2_041_coefficient_18_1441
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1442 : Poly :=
[
  term ((7451992699 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1442 for generator 18. -/
def ep_Q2_041_partial_18_1442 : Poly :=
[
  term ((14903985398 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7451992699 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 18. -/
theorem ep_Q2_041_partial_18_1442_valid :
    mulPoly ep_Q2_041_coefficient_18_1442
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1443 : Poly :=
[
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1), (14, 2)]
]

/-- Partial product 1443 for generator 18. -/
def ep_Q2_041_partial_18_1443 : Poly :=
[
  term ((-226519213564314119024 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 18. -/
theorem ep_Q2_041_partial_18_1443_valid :
    mulPoly ep_Q2_041_coefficient_18_1443
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1444 : Poly :=
[
  term ((104533721919257483097360854375026531010509834013467187799990670 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (14, 2), (15, 2)]
]

/-- Partial product 1444 for generator 18. -/
def ep_Q2_041_partial_18_1444 : Poly :=
[
  term ((209067443838514966194721708750053062021019668026934375599981340 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((-104533721919257483097360854375026531010509834013467187799990670 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 18. -/
theorem ep_Q2_041_partial_18_1444_valid :
    mulPoly ep_Q2_041_coefficient_18_1444
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1445 : Poly :=
[
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 1445 for generator 18. -/
def ep_Q2_041_partial_18_1445 : Poly :=
[
  term ((-15949341440 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 18. -/
theorem ep_Q2_041_partial_18_1445_valid :
    mulPoly ep_Q2_041_coefficient_18_1445
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1446 : Poly :=
[
  term ((-17987274652025278491311126558396785050261324763838877204803293488590430377 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1446 for generator 18. -/
def ep_Q2_041_partial_18_1446 : Poly :=
[
  term ((-17987274652025278491311126558396785050261324763838877204803293488590430377 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((17987274652025278491311126558396785050261324763838877204803293488590430377 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 18. -/
theorem ep_Q2_041_partial_18_1446_valid :
    mulPoly ep_Q2_041_coefficient_18_1446
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1447 : Poly :=
[
  term ((25102670892288 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1447 for generator 18. -/
def ep_Q2_041_partial_18_1447 : Poly :=
[
  term ((50205341784576 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25102670892288 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 18. -/
theorem ep_Q2_041_partial_18_1447_valid :
    mulPoly ep_Q2_041_coefficient_18_1447
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1448 : Poly :=
[
  term ((-681983436609644183548003649817124438100417088407842036748551980 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (15, 4)]
]

/-- Partial product 1448 for generator 18. -/
def ep_Q2_041_partial_18_1448 : Poly :=
[
  term ((-1363966873219288367096007299634248876200834176815684073497103960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 4)],
  term ((681983436609644183548003649817124438100417088407842036748551980 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 18. -/
theorem ep_Q2_041_partial_18_1448_valid :
    mulPoly ep_Q2_041_coefficient_18_1448
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1449 : Poly :=
[
  term ((-8892660132 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1449 for generator 18. -/
def ep_Q2_041_partial_18_1449 : Poly :=
[
  term ((-17785320264 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((8892660132 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 18. -/
theorem ep_Q2_041_partial_18_1449_valid :
    mulPoly ep_Q2_041_coefficient_18_1449
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1450 : Poly :=
[
  term ((33243298555407006880 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 2)]
]

/-- Partial product 1450 for generator 18. -/
def ep_Q2_041_partial_18_1450 : Poly :=
[
  term ((66486597110814013760 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-33243298555407006880 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 18. -/
theorem ep_Q2_041_partial_18_1450_valid :
    mulPoly ep_Q2_041_coefficient_18_1450
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1451 : Poly :=
[
  term ((338891432115498811941862889876046035156155624698487924934000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1451 for generator 18. -/
def ep_Q2_041_partial_18_1451 : Poly :=
[
  term ((677782864230997623883725779752092070312311249396975849868000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-338891432115498811941862889876046035156155624698487924934000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 18. -/
theorem ep_Q2_041_partial_18_1451_valid :
    mulPoly ep_Q2_041_coefficient_18_1451
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1452 : Poly :=
[
  term ((5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 3)]
]

/-- Partial product 1452 for generator 18. -/
def ep_Q2_041_partial_18_1452 : Poly :=
[
  term ((10789717334457261396179994921124577637414577190272859042834560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 3)],
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 18. -/
theorem ep_Q2_041_partial_18_1452_valid :
    mulPoly ep_Q2_041_coefficient_18_1452
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1453 : Poly :=
[
  term ((-345347465569996505705693238956135567968975364627700365878226990 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 1453 for generator 18. -/
def ep_Q2_041_partial_18_1453 : Poly :=
[
  term ((-690694931139993011411386477912271135937950729255400731756453980 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((345347465569996505705693238956135567968975364627700365878226990 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 18. -/
theorem ep_Q2_041_partial_18_1453_valid :
    mulPoly ep_Q2_041_coefficient_18_1453
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1454 : Poly :=
[
  term ((-460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 2), (15, 4)]
]

/-- Partial product 1454 for generator 18. -/
def ep_Q2_041_partial_18_1454 : Poly :=
[
  term ((-921276435000883424623489569158137521807855004057116850055778800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 4)],
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 18. -/
theorem ep_Q2_041_partial_18_1454_valid :
    mulPoly ep_Q2_041_coefficient_18_1454
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1455 : Poly :=
[
  term ((3001135924 : Rat) / 151763803) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1455 for generator 18. -/
def ep_Q2_041_partial_18_1455 : Poly :=
[
  term ((6002271848 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3001135924 : Rat) / 151763803) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 18. -/
theorem ep_Q2_041_partial_18_1455_valid :
    mulPoly ep_Q2_041_coefficient_18_1455
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1455 := by
  native_decide

/-- Coefficient term 1456 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1456 : Poly :=
[
  term ((-2061607456209530670741912967396786075124005092116269048799468327257113560261825579 : Rat) / 410207824296815351975756508609681098120711096444266413823841219786729917697448) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1456 for generator 18. -/
def ep_Q2_041_partial_18_1456 : Poly :=
[
  term ((-2061607456209530670741912967396786075124005092116269048799468327257113560261825579 : Rat) / 205103912148407675987878254304840549060355548222133206911920609893364958848724) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2061607456209530670741912967396786075124005092116269048799468327257113560261825579 : Rat) / 410207824296815351975756508609681098120711096444266413823841219786729917697448) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1456 for generator 18. -/
theorem ep_Q2_041_partial_18_1456_valid :
    mulPoly ep_Q2_041_coefficient_18_1456
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1456 := by
  native_decide

/-- Coefficient term 1457 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1457 : Poly :=
[
  term ((-142473692121568 : Rat) / 827264490153) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1457 for generator 18. -/
def ep_Q2_041_partial_18_1457 : Poly :=
[
  term ((-284947384243136 : Rat) / 827264490153) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((142473692121568 : Rat) / 827264490153) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1457 for generator 18. -/
theorem ep_Q2_041_partial_18_1457_valid :
    mulPoly ep_Q2_041_coefficient_18_1457
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1457 := by
  native_decide

/-- Coefficient term 1458 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1458 : Poly :=
[
  term ((642086098782091434909274581702997265811252625942239206325266260 : Rat) / 1548394024210394797652230495954043224964706202160677955762991) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1458 for generator 18. -/
def ep_Q2_041_partial_18_1458 : Poly :=
[
  term ((1284172197564182869818549163405994531622505251884478412650532520 : Rat) / 1548394024210394797652230495954043224964706202160677955762991) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-642086098782091434909274581702997265811252625942239206325266260 : Rat) / 1548394024210394797652230495954043224964706202160677955762991) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1458 for generator 18. -/
theorem ep_Q2_041_partial_18_1458_valid :
    mulPoly ep_Q2_041_coefficient_18_1458
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1458 := by
  native_decide

/-- Coefficient term 1459 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1459 : Poly :=
[
  term ((-367526505136493953790683060423333373778551670863216229656263741628690142 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1459 for generator 18. -/
def ep_Q2_041_partial_18_1459 : Poly :=
[
  term ((-735053010272987907581366120846666747557103341726432459312527483257380284 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((367526505136493953790683060423333373778551670863216229656263741628690142 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1459 for generator 18. -/
theorem ep_Q2_041_partial_18_1459_valid :
    mulPoly ep_Q2_041_coefficient_18_1459
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1459 := by
  native_decide

/-- Coefficient term 1460 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1460 : Poly :=
[
  term ((73305409220992 : Rat) / 275754830051) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1460 for generator 18. -/
def ep_Q2_041_partial_18_1460 : Poly :=
[
  term ((146610818441984 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73305409220992 : Rat) / 275754830051) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1460 for generator 18. -/
theorem ep_Q2_041_partial_18_1460_valid :
    mulPoly ep_Q2_041_coefficient_18_1460
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1460 := by
  native_decide

/-- Coefficient term 1461 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1461 : Poly :=
[
  term ((310231873387634851610285032617989041170743201376789758062709920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 3)]
]

/-- Partial product 1461 for generator 18. -/
def ep_Q2_041_partial_18_1461 : Poly :=
[
  term ((620463746775269703220570065235978082341486402753579516125419840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((-310231873387634851610285032617989041170743201376789758062709920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1461 for generator 18. -/
theorem ep_Q2_041_partial_18_1461_valid :
    mulPoly ep_Q2_041_coefficient_18_1461
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1461 := by
  native_decide

/-- Coefficient term 1462 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1462 : Poly :=
[
  term ((842766787584137286349183992278344763835202685648585480464720 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (11, 1), (13, 1), (14, 3), (15, 1)]
]

/-- Partial product 1462 for generator 18. -/
def ep_Q2_041_partial_18_1462 : Poly :=
[
  term ((1685533575168274572698367984556689527670405371297170960929440 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 3), (15, 1)],
  term ((-842766787584137286349183992278344763835202685648585480464720 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (11, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1462 for generator 18. -/
theorem ep_Q2_041_partial_18_1462_valid :
    mulPoly ep_Q2_041_coefficient_18_1462
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1462 := by
  native_decide

/-- Coefficient term 1463 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1463 : Poly :=
[
  term ((-1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1463 for generator 18. -/
def ep_Q2_041_partial_18_1463 : Poly :=
[
  term ((-1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1463 for generator 18. -/
theorem ep_Q2_041_partial_18_1463_valid :
    mulPoly ep_Q2_041_coefficient_18_1463
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1463 := by
  native_decide

/-- Coefficient term 1464 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1464 : Poly :=
[
  term ((9106508107294 : Rat) / 275754830051) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1464 for generator 18. -/
def ep_Q2_041_partial_18_1464 : Poly :=
[
  term ((18213016214588 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9106508107294 : Rat) / 275754830051) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1464 for generator 18. -/
theorem ep_Q2_041_partial_18_1464_valid :
    mulPoly ep_Q2_041_coefficient_18_1464
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1464 := by
  native_decide

/-- Coefficient term 1465 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1465 : Poly :=
[
  term ((-3718684523853307326245811437649398093124686503059466778455593240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 1465 for generator 18. -/
def ep_Q2_041_partial_18_1465 : Poly :=
[
  term ((-7437369047706614652491622875298796186249373006118933556911186480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((3718684523853307326245811437649398093124686503059466778455593240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1465 for generator 18. -/
theorem ep_Q2_041_partial_18_1465_valid :
    mulPoly ep_Q2_041_coefficient_18_1465
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1465 := by
  native_decide

/-- Coefficient term 1466 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1466 : Poly :=
[
  term ((-9121579069703924256 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2)]
]

/-- Partial product 1466 for generator 18. -/
def ep_Q2_041_partial_18_1466 : Poly :=
[
  term ((-18243158139407848512 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((9121579069703924256 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1466 for generator 18. -/
theorem ep_Q2_041_partial_18_1466_valid :
    mulPoly ep_Q2_041_coefficient_18_1466
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1466 := by
  native_decide

/-- Coefficient term 1467 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1467 : Poly :=
[
  term ((14062434399126883228 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1467 for generator 18. -/
def ep_Q2_041_partial_18_1467 : Poly :=
[
  term ((28124868798253766456 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-14062434399126883228 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1467 for generator 18. -/
theorem ep_Q2_041_partial_18_1467_valid :
    mulPoly ep_Q2_041_coefficient_18_1467
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1467 := by
  native_decide

/-- Coefficient term 1468 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1468 : Poly :=
[
  term ((-25808450468679489717632032943848654989995510088726754695258685160 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1468 for generator 18. -/
def ep_Q2_041_partial_18_1468 : Poly :=
[
  term ((-51616900937358979435264065887697309979991020177453509390517370320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((25808450468679489717632032943848654989995510088726754695258685160 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1468 for generator 18. -/
theorem ep_Q2_041_partial_18_1468_valid :
    mulPoly ep_Q2_041_coefficient_18_1468
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1468 := by
  native_decide

/-- Coefficient term 1469 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1469 : Poly :=
[
  term ((990143680 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1469 for generator 18. -/
def ep_Q2_041_partial_18_1469 : Poly :=
[
  term ((1980287360 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-990143680 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1469 for generator 18. -/
theorem ep_Q2_041_partial_18_1469_valid :
    mulPoly ep_Q2_041_coefficient_18_1469
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1469 := by
  native_decide

/-- Coefficient term 1470 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1470 : Poly :=
[
  term ((-536652901934247543728 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2), (14, 2)]
]

/-- Partial product 1470 for generator 18. -/
def ep_Q2_041_partial_18_1470 : Poly :=
[
  term ((-1073305803868495087456 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 2)],
  term ((536652901934247543728 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1470 for generator 18. -/
theorem ep_Q2_041_partial_18_1470_valid :
    mulPoly ep_Q2_041_coefficient_18_1470
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1470 := by
  native_decide

/-- Coefficient term 1471 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1471 : Poly :=
[
  term ((-11260279366979730006953345917647509036830891803024740492587595240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (14, 2), (15, 2)]
]

/-- Partial product 1471 for generator 18. -/
def ep_Q2_041_partial_18_1471 : Poly :=
[
  term ((-22520558733959460013906691835295018073661783606049480985175190480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((11260279366979730006953345917647509036830891803024740492587595240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1471 for generator 18. -/
theorem ep_Q2_041_partial_18_1471_valid :
    mulPoly ep_Q2_041_coefficient_18_1471
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1471 := by
  native_decide

/-- Coefficient term 1472 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1472 : Poly :=
[
  term ((-37786023680 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

/-- Partial product 1472 for generator 18. -/
def ep_Q2_041_partial_18_1472 : Poly :=
[
  term ((-75572047360 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((37786023680 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1472 for generator 18. -/
theorem ep_Q2_041_partial_18_1472_valid :
    mulPoly ep_Q2_041_coefficient_18_1472
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1472 := by
  native_decide

/-- Coefficient term 1473 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1473 : Poly :=
[
  term ((272333222130804443697482332647511875423783019887160640895578160 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 1473 for generator 18. -/
def ep_Q2_041_partial_18_1473 : Poly :=
[
  term ((544666444261608887394964665295023750847566039774321281791156320 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-272333222130804443697482332647511875423783019887160640895578160 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1473 for generator 18. -/
theorem ep_Q2_041_partial_18_1473_valid :
    mulPoly ep_Q2_041_coefficient_18_1473
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1473 := by
  native_decide

/-- Coefficient term 1474 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1474 : Poly :=
[
  term ((-642255360 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1474 for generator 18. -/
def ep_Q2_041_partial_18_1474 : Poly :=
[
  term ((-1284510720 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((642255360 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1474 for generator 18. -/
theorem ep_Q2_041_partial_18_1474_valid :
    mulPoly ep_Q2_041_coefficient_18_1474
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1474 := by
  native_decide

/-- Coefficient term 1475 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1475 : Poly :=
[
  term ((-5292895712028087527479159599938195714262064572187333941788480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 1475 for generator 18. -/
def ep_Q2_041_partial_18_1475 : Poly :=
[
  term ((-10585791424056175054958319199876391428524129144374667883576960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((5292895712028087527479159599938195714262064572187333941788480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1475 for generator 18. -/
theorem ep_Q2_041_partial_18_1475_valid :
    mulPoly ep_Q2_041_coefficient_18_1475
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1475 := by
  native_decide

/-- Coefficient term 1476 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1476 : Poly :=
[
  term ((1018570384530916117399871773498143353704390398001950329532800 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 1), (13, 3), (14, 2), (15, 1)]
]

/-- Partial product 1476 for generator 18. -/
def ep_Q2_041_partial_18_1476 : Poly :=
[
  term ((2037140769061832234799743546996286707408780796003900659065600 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 1), (13, 3), (14, 2), (15, 1)],
  term ((-1018570384530916117399871773498143353704390398001950329532800 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 1), (13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1476 for generator 18. -/
theorem ep_Q2_041_partial_18_1476_valid :
    mulPoly ep_Q2_041_coefficient_18_1476
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1476 := by
  native_decide

/-- Coefficient term 1477 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1477 : Poly :=
[
  term ((1004170776079449734007372776879568441981328879091202558264600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (13, 3), (15, 1)]
]

/-- Partial product 1477 for generator 18. -/
def ep_Q2_041_partial_18_1477 : Poly :=
[
  term ((2008341552158899468014745553759136883962657758182405116529200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((-1004170776079449734007372776879568441981328879091202558264600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1477 for generator 18. -/
theorem ep_Q2_041_partial_18_1477_valid :
    mulPoly ep_Q2_041_coefficient_18_1477
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1477 := by
  native_decide

/-- Coefficient term 1478 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1478 : Poly :=
[
  term ((-62478249817238181029724 : Rat) / 20461153664622275129) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 1478 for generator 18. -/
def ep_Q2_041_partial_18_1478 : Poly :=
[
  term ((-124956499634476362059448 : Rat) / 20461153664622275129) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((62478249817238181029724 : Rat) / 20461153664622275129) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1478 for generator 18. -/
theorem ep_Q2_041_partial_18_1478_valid :
    mulPoly ep_Q2_041_coefficient_18_1478
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1478 := by
  native_decide

/-- Coefficient term 1479 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1479 : Poly :=
[
  term ((-282303284075473136023814972839436337361214190277376049545579150425750613973899345905 : Rat) / 11833874203956612578209702915042921376088392842877018968493843673847481262059712) [(1, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1479 for generator 18. -/
def ep_Q2_041_partial_18_1479 : Poly :=
[
  term ((-282303284075473136023814972839436337361214190277376049545579150425750613973899345905 : Rat) / 5916937101978306289104851457521460688044196421438509484246921836923740631029856) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((282303284075473136023814972839436337361214190277376049545579150425750613973899345905 : Rat) / 11833874203956612578209702915042921376088392842877018968493843673847481262059712) [(1, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1479 for generator 18. -/
theorem ep_Q2_041_partial_18_1479_valid :
    mulPoly ep_Q2_041_coefficient_18_1479
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1479 := by
  native_decide

/-- Coefficient term 1480 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1480 : Poly :=
[
  term ((28325520345832 : Rat) / 275754830051) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1480 for generator 18. -/
def ep_Q2_041_partial_18_1480 : Poly :=
[
  term ((56651040691664 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28325520345832 : Rat) / 275754830051) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1480 for generator 18. -/
theorem ep_Q2_041_partial_18_1480_valid :
    mulPoly ep_Q2_041_coefficient_18_1480
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1480 := by
  native_decide

/-- Coefficient term 1481 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1481 : Poly :=
[
  term ((6285290789964498005595041839633905098873591704626897981444755900 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (14, 1), (15, 4)]
]

/-- Partial product 1481 for generator 18. -/
def ep_Q2_041_partial_18_1481 : Poly :=
[
  term ((12570581579928996011190083679267810197747183409253795962889511800 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 4)],
  term ((-6285290789964498005595041839633905098873591704626897981444755900 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1481 for generator 18. -/
theorem ep_Q2_041_partial_18_1481_valid :
    mulPoly ep_Q2_041_coefficient_18_1481
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1481 := by
  native_decide

/-- Coefficient term 1482 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1482 : Poly :=
[
  term ((-15754577218 : Rat) / 151763803) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1482 for generator 18. -/
def ep_Q2_041_partial_18_1482 : Poly :=
[
  term ((-31509154436 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((15754577218 : Rat) / 151763803) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1482 for generator 18. -/
theorem ep_Q2_041_partial_18_1482_valid :
    mulPoly ep_Q2_041_coefficient_18_1482
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1482 := by
  native_decide

/-- Coefficient term 1483 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1483 : Poly :=
[
  term ((325213254727999360101 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 2)]
]

/-- Partial product 1483 for generator 18. -/
def ep_Q2_041_partial_18_1483 : Poly :=
[
  term ((650426509455998720202 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((-325213254727999360101 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1483 for generator 18. -/
theorem ep_Q2_041_partial_18_1483_valid :
    mulPoly ep_Q2_041_coefficient_18_1483
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1483 := by
  native_decide

/-- Coefficient term 1484 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1484 : Poly :=
[
  term ((12026565164606170575196395886936496099315701027012605883151025070259245720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 1484 for generator 18. -/
def ep_Q2_041_partial_18_1484 : Poly :=
[
  term ((24053130329212341150392791773872992198631402054025211766302050140518491440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((-12026565164606170575196395886936496099315701027012605883151025070259245720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1484 for generator 18. -/
theorem ep_Q2_041_partial_18_1484_valid :
    mulPoly ep_Q2_041_coefficient_18_1484
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1484 := by
  native_decide

/-- Coefficient term 1485 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1485 : Poly :=
[
  term ((-54794217545088 : Rat) / 275754830051) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1485 for generator 18. -/
def ep_Q2_041_partial_18_1485 : Poly :=
[
  term ((-109588435090176 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1485 for generator 18. -/
theorem ep_Q2_041_partial_18_1485_valid :
    mulPoly ep_Q2_041_coefficient_18_1485
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1485 := by
  native_decide

/-- Coefficient term 1486 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1486 : Poly :=
[
  term ((22251168134 : Rat) / 151763803) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 1486 for generator 18. -/
def ep_Q2_041_partial_18_1486 : Poly :=
[
  term ((44502336268 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-22251168134 : Rat) / 151763803) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1486 for generator 18. -/
theorem ep_Q2_041_partial_18_1486_valid :
    mulPoly ep_Q2_041_coefficient_18_1486
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1486 := by
  native_decide

/-- Coefficient term 1487 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1487 : Poly :=
[
  term ((-4430809159739450636 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 3)]
]

/-- Partial product 1487 for generator 18. -/
def ep_Q2_041_partial_18_1487 : Poly :=
[
  term ((-8861618319478901272 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (14, 3)],
  term ((4430809159739450636 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1487 for generator 18. -/
theorem ep_Q2_041_partial_18_1487_valid :
    mulPoly ep_Q2_041_coefficient_18_1487
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1487 := by
  native_decide

/-- Coefficient term 1488 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1488 : Poly :=
[
  term ((1429795252144366970253047343779911117971856571285846007042075200 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (14, 3), (15, 2)]
]

/-- Partial product 1488 for generator 18. -/
def ep_Q2_041_partial_18_1488 : Poly :=
[
  term ((2859590504288733940506094687559822235943713142571692014084150400 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (8, 1), (11, 1), (14, 3), (15, 2)],
  term ((-1429795252144366970253047343779911117971856571285846007042075200 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1488 for generator 18. -/
theorem ep_Q2_041_partial_18_1488_valid :
    mulPoly ep_Q2_041_coefficient_18_1488
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1488 := by
  native_decide

/-- Coefficient term 1489 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1489 : Poly :=
[
  term ((1986144088 : Rat) / 151763803) [(1, 1), (11, 1), (14, 3), (16, 1)]
]

/-- Partial product 1489 for generator 18. -/
def ep_Q2_041_partial_18_1489 : Poly :=
[
  term ((3972288176 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 3), (16, 1)],
  term ((-1986144088 : Rat) / 151763803) [(1, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1489 for generator 18. -/
theorem ep_Q2_041_partial_18_1489_valid :
    mulPoly ep_Q2_041_coefficient_18_1489
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1489 := by
  native_decide

/-- Coefficient term 1490 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1490 : Poly :=
[
  term ((132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 1490 for generator 18. -/
def ep_Q2_041_partial_18_1490 : Poly :=
[
  term ((132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1490 for generator 18. -/
theorem ep_Q2_041_partial_18_1490_valid :
    mulPoly ep_Q2_041_coefficient_18_1490
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1490 := by
  native_decide

/-- Coefficient term 1491 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1491 : Poly :=
[
  term ((-15490981251700 : Rat) / 275754830051) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1491 for generator 18. -/
def ep_Q2_041_partial_18_1491 : Poly :=
[
  term ((-30981962503400 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((15490981251700 : Rat) / 275754830051) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1491 for generator 18. -/
theorem ep_Q2_041_partial_18_1491_valid :
    mulPoly ep_Q2_041_coefficient_18_1491
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1491 := by
  native_decide

/-- Coefficient term 1492 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1492 : Poly :=
[
  term ((6824500905098957258146963303565320513169065977217093525198010 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (15, 4)]
]

/-- Partial product 1492 for generator 18. -/
def ep_Q2_041_partial_18_1492 : Poly :=
[
  term ((13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (15, 4)],
  term ((-6824500905098957258146963303565320513169065977217093525198010 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1492 for generator 18. -/
theorem ep_Q2_041_partial_18_1492_valid :
    mulPoly ep_Q2_041_coefficient_18_1492
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1492 := by
  native_decide

/-- Coefficient term 1493 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1493 : Poly :=
[
  term ((5788375401 : Rat) / 303527606) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1493 for generator 18. -/
def ep_Q2_041_partial_18_1493 : Poly :=
[
  term ((5788375401 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-5788375401 : Rat) / 303527606) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1493 for generator 18. -/
theorem ep_Q2_041_partial_18_1493_valid :
    mulPoly ep_Q2_041_coefficient_18_1493
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1493 := by
  native_decide

/-- Coefficient term 1494 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1494 : Poly :=
[
  term ((4215415881680670950329431214123569805710553436685550192848320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1494 for generator 18. -/
def ep_Q2_041_partial_18_1494 : Poly :=
[
  term ((8430831763361341900658862428247139611421106873371100385696640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4215415881680670950329431214123569805710553436685550192848320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1494 for generator 18. -/
theorem ep_Q2_041_partial_18_1494_valid :
    mulPoly ep_Q2_041_coefficient_18_1494
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1494 := by
  native_decide

/-- Coefficient term 1495 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1495 : Poly :=
[
  term ((-4621634695584238251242125667966855087841020737877204392683455800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1495 for generator 18. -/
def ep_Q2_041_partial_18_1495 : Poly :=
[
  term ((-9243269391168476502484251335933710175682041475754408785366911600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((4621634695584238251242125667966855087841020737877204392683455800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1495 for generator 18. -/
theorem ep_Q2_041_partial_18_1495_valid :
    mulPoly ep_Q2_041_coefficient_18_1495
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1495 := by
  native_decide

/-- Coefficient term 1496 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1496 : Poly :=
[
  term ((2801176615676404400931344835291957655867246001320838405351280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1496 for generator 18. -/
def ep_Q2_041_partial_18_1496 : Poly :=
[
  term ((5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-2801176615676404400931344835291957655867246001320838405351280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1496 for generator 18. -/
theorem ep_Q2_041_partial_18_1496_valid :
    mulPoly ep_Q2_041_coefficient_18_1496
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1496 := by
  native_decide

/-- Coefficient term 1497 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1497 : Poly :=
[
  term ((3113563512798031505938445297024954335860859640661823911556840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1497 for generator 18. -/
def ep_Q2_041_partial_18_1497 : Poly :=
[
  term ((6227127025596063011876890594049908671721719281323647823113680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-3113563512798031505938445297024954335860859640661823911556840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1497 for generator 18. -/
theorem ep_Q2_041_partial_18_1497_valid :
    mulPoly ep_Q2_041_coefficient_18_1497
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1497 := by
  native_decide

/-- Coefficient term 1498 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1498 : Poly :=
[
  term ((18436268273769378810223319530462048716963098002308730436321200 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 3)]
]

/-- Partial product 1498 for generator 18. -/
def ep_Q2_041_partial_18_1498 : Poly :=
[
  term ((36872536547538757620446639060924097433926196004617460872642400 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((-18436268273769378810223319530462048716963098002308730436321200 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1498 for generator 18. -/
theorem ep_Q2_041_partial_18_1498_valid :
    mulPoly ep_Q2_041_coefficient_18_1498
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1498 := by
  native_decide

/-- Coefficient term 1499 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1499 : Poly :=
[
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1499 for generator 18. -/
def ep_Q2_041_partial_18_1499 : Poly :=
[
  term ((-6508776853579481570974976693309967886537538467006704442843520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1499 for generator 18. -/
theorem ep_Q2_041_partial_18_1499_valid :
    mulPoly ep_Q2_041_coefficient_18_1499
        ep_Q2_041_generator_18_1400_1499 =
      ep_Q2_041_partial_18_1499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_1400_1499 : List Poly :=
[
  ep_Q2_041_partial_18_1400,
  ep_Q2_041_partial_18_1401,
  ep_Q2_041_partial_18_1402,
  ep_Q2_041_partial_18_1403,
  ep_Q2_041_partial_18_1404,
  ep_Q2_041_partial_18_1405,
  ep_Q2_041_partial_18_1406,
  ep_Q2_041_partial_18_1407,
  ep_Q2_041_partial_18_1408,
  ep_Q2_041_partial_18_1409,
  ep_Q2_041_partial_18_1410,
  ep_Q2_041_partial_18_1411,
  ep_Q2_041_partial_18_1412,
  ep_Q2_041_partial_18_1413,
  ep_Q2_041_partial_18_1414,
  ep_Q2_041_partial_18_1415,
  ep_Q2_041_partial_18_1416,
  ep_Q2_041_partial_18_1417,
  ep_Q2_041_partial_18_1418,
  ep_Q2_041_partial_18_1419,
  ep_Q2_041_partial_18_1420,
  ep_Q2_041_partial_18_1421,
  ep_Q2_041_partial_18_1422,
  ep_Q2_041_partial_18_1423,
  ep_Q2_041_partial_18_1424,
  ep_Q2_041_partial_18_1425,
  ep_Q2_041_partial_18_1426,
  ep_Q2_041_partial_18_1427,
  ep_Q2_041_partial_18_1428,
  ep_Q2_041_partial_18_1429,
  ep_Q2_041_partial_18_1430,
  ep_Q2_041_partial_18_1431,
  ep_Q2_041_partial_18_1432,
  ep_Q2_041_partial_18_1433,
  ep_Q2_041_partial_18_1434,
  ep_Q2_041_partial_18_1435,
  ep_Q2_041_partial_18_1436,
  ep_Q2_041_partial_18_1437,
  ep_Q2_041_partial_18_1438,
  ep_Q2_041_partial_18_1439,
  ep_Q2_041_partial_18_1440,
  ep_Q2_041_partial_18_1441,
  ep_Q2_041_partial_18_1442,
  ep_Q2_041_partial_18_1443,
  ep_Q2_041_partial_18_1444,
  ep_Q2_041_partial_18_1445,
  ep_Q2_041_partial_18_1446,
  ep_Q2_041_partial_18_1447,
  ep_Q2_041_partial_18_1448,
  ep_Q2_041_partial_18_1449,
  ep_Q2_041_partial_18_1450,
  ep_Q2_041_partial_18_1451,
  ep_Q2_041_partial_18_1452,
  ep_Q2_041_partial_18_1453,
  ep_Q2_041_partial_18_1454,
  ep_Q2_041_partial_18_1455,
  ep_Q2_041_partial_18_1456,
  ep_Q2_041_partial_18_1457,
  ep_Q2_041_partial_18_1458,
  ep_Q2_041_partial_18_1459,
  ep_Q2_041_partial_18_1460,
  ep_Q2_041_partial_18_1461,
  ep_Q2_041_partial_18_1462,
  ep_Q2_041_partial_18_1463,
  ep_Q2_041_partial_18_1464,
  ep_Q2_041_partial_18_1465,
  ep_Q2_041_partial_18_1466,
  ep_Q2_041_partial_18_1467,
  ep_Q2_041_partial_18_1468,
  ep_Q2_041_partial_18_1469,
  ep_Q2_041_partial_18_1470,
  ep_Q2_041_partial_18_1471,
  ep_Q2_041_partial_18_1472,
  ep_Q2_041_partial_18_1473,
  ep_Q2_041_partial_18_1474,
  ep_Q2_041_partial_18_1475,
  ep_Q2_041_partial_18_1476,
  ep_Q2_041_partial_18_1477,
  ep_Q2_041_partial_18_1478,
  ep_Q2_041_partial_18_1479,
  ep_Q2_041_partial_18_1480,
  ep_Q2_041_partial_18_1481,
  ep_Q2_041_partial_18_1482,
  ep_Q2_041_partial_18_1483,
  ep_Q2_041_partial_18_1484,
  ep_Q2_041_partial_18_1485,
  ep_Q2_041_partial_18_1486,
  ep_Q2_041_partial_18_1487,
  ep_Q2_041_partial_18_1488,
  ep_Q2_041_partial_18_1489,
  ep_Q2_041_partial_18_1490,
  ep_Q2_041_partial_18_1491,
  ep_Q2_041_partial_18_1492,
  ep_Q2_041_partial_18_1493,
  ep_Q2_041_partial_18_1494,
  ep_Q2_041_partial_18_1495,
  ep_Q2_041_partial_18_1496,
  ep_Q2_041_partial_18_1497,
  ep_Q2_041_partial_18_1498,
  ep_Q2_041_partial_18_1499
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_1400_1499 : Poly :=
[
  term ((223959995240042544415675243626354417203506783553704012590240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2358885571095919495521132492877438025993470316901758657137920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 3)],
  term ((740406887819507607674496548749568200610169451100575545464782660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((137843192304370207105074506015580079066363815438471595019169760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((2572664892222206617857667685546903167076802015409547403507229200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 2), (11, 1), (15, 4)],
  term ((-182399550391839254357067483747453859549458371322704520045120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((83345606318490797732 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((5220613112 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((40883251229253084297 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-103869159225324627308 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((-193088480635834583585682868517662917294856155221089569361302900 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-6665687672 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1991088604609049587316341361542857353451731823782989229439114797721843216 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-5780298240 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((811605882089638828211617541648772568028229347176665306267806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 4)],
  term ((3579447906 : Rat) / 151763803) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((248757367192363499881353367254489689216643914033306524582560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((7935288117323441469791517117471740997421269800108274266880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (13, 2), (15, 1)],
  term ((265431267202096982097143534028143318668742170842408018149760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (13, 2), (15, 3)],
  term ((-8815284058300618401892360509612942393231681378845853259224633464102855931 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term ((-53647306909944 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((6504694674429519286171032197139995040380022608928208434630186844052795625 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((3405263486478 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 2), (15, 3)],
  term ((-143348614629696 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (8, 1), (11, 1)],
  term ((-236111641393191538458 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((4424162163138740676425634001775795498386913758266323891620353709525896 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((20659214080 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((43204608143307391689879651758826329591833206790802279908067316480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-280719378841430101894062288002614930220778329664457149137440 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-8117044952219251615675866315791918654892087853487635621585038948384888419 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16862789710048 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6709977397683835393124880639987528927476281401684524349447721760 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-22528105679470165709855336176831223061922992139297287483871040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((19961338114410437904074087030533059125627306452233606174960332200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((13728208320 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((233300498597533548603 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((5437120400898104875383271290187980962139048865179706224732000578100939770 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-145871901313152 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((14903985398 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-226519213564314119024 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((209067443838514966194721708750053062021019668026934375599981340 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((-15949341440 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-17987274652025278491311126558396785050261324763838877204803293488590430377 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((50205341784576 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1363966873219288367096007299634248876200834176815684073497103960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 4)],
  term ((-17785320264 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((66486597110814013760 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((677782864230997623883725779752092070312311249396975849868000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((10789717334457261396179994921124577637414577190272859042834560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 3)],
  term ((-690694931139993011411386477912271135937950729255400731756453980 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-921276435000883424623489569158137521807855004057116850055778800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 4)],
  term ((6002271848 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2061607456209530670741912967396786075124005092116269048799468327257113560261825579 : Rat) / 205103912148407675987878254304840549060355548222133206911920609893364958848724) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-284947384243136 : Rat) / 827264490153) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1284172197564182869818549163405994531622505251884478412650532520 : Rat) / 1548394024210394797652230495954043224964706202160677955762991) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-735053010272987907581366120846666747557103341726432459312527483257380284 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((146610818441984 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((620463746775269703220570065235978082341486402753579516125419840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((1685533575168274572698367984556689527670405371297170960929440 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 3), (15, 1)],
  term ((-1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((18213016214588 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7437369047706614652491622875298796186249373006118933556911186480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((-18243158139407848512 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((28124868798253766456 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-51616900937358979435264065887697309979991020177453509390517370320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((1980287360 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1073305803868495087456 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 2)],
  term ((-22520558733959460013906691835295018073661783606049480985175190480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((-75572047360 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((544666444261608887394964665295023750847566039774321281791156320 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1284510720 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-10585791424056175054958319199876391428524129144374667883576960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((2037140769061832234799743546996286707408780796003900659065600 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 1), (13, 3), (14, 2), (15, 1)],
  term ((2008341552158899468014745553759136883962657758182405116529200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((-124956499634476362059448 : Rat) / 20461153664622275129) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-282303284075473136023814972839436337361214190277376049545579150425750613973899345905 : Rat) / 5916937101978306289104851457521460688044196421438509484246921836923740631029856) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((56651040691664 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((12570581579928996011190083679267810197747183409253795962889511800 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 4)],
  term ((-31509154436 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((650426509455998720202 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((24053130329212341150392791773872992198631402054025211766302050140518491440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((-109588435090176 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((44502336268 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-8861618319478901272 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (14, 3)],
  term ((2859590504288733940506094687559822235943713142571692014084150400 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (8, 1), (11, 1), (14, 3), (15, 2)],
  term ((3972288176 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 3), (16, 1)],
  term ((132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-30981962503400 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (15, 4)],
  term ((5788375401 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((8430831763361341900658862428247139611421106873371100385696640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9243269391168476502484251335933710175682041475754408785366911600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((6227127025596063011876890594049908671721719281323647823113680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((36872536547538757620446639060924097433926196004617460872642400 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((-6508776853579481570974976693309967886537538467006704442843520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-111979997620021272207837621813177208601753391776852006295120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 3)],
  term ((-370203443909753803837248274374784100305084725550287772732391330 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-68921596152185103552537253007790039533181907719235797509584880 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (15, 4)],
  term ((91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-40883251229253084297 : Rat) / 518003890243601902) [(1, 1), (10, 2), (13, 1)],
  term ((51934579612662313654 : Rat) / 259001945121800951) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((96544240317917291792841434258831458647428077610544784680651450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((3332843836 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((995544302304524793658170680771428676725865911891494614719557398860921608 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-405802941044819414105808770824386284014114673588332653133903320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (13, 1), (15, 4)],
  term ((-1789723953 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-124378683596181749940676683627244844608321957016653262291280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-3967644058661720734895758558735870498710634900054137133440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((-132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (13, 2), (15, 3)],
  term ((8815284058300618401892360509612942393231681378845853259224633464102855931 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((26823653454972 : Rat) / 275754830051) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6504694674429519286171032197139995040380022608928208434630186844052795625 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 2), (15, 1)],
  term ((-1702631743239 : Rat) / 275754830051) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (10, 2), (15, 3)],
  term ((71674307314848 : Rat) / 275754830051) [(1, 1), (10, 2), (15, 3), (16, 1)],
  term ((-27779284645264200487 : Rat) / 148001111498171972) [(1, 1), (11, 1)],
  term ((118055820696595769229 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1)],
  term ((-2212081081569370338212817000887897749193456879133161945810176854762948 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10329607040 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21602304071653695844939825879413164795916603395401139954033658240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((140359689420715050947031144001307465110389164832228574568720 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((8117044952219251615675866315791918654892087853487635621585038948384888419 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8431394855024 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3354988698841917696562440319993764463738140700842262174723860880 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-97486876307460690486 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((11264052839735082854927668088415611530961496069648643741935520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-9980669057205218952037043515266529562813653226116803087480166100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-6864104160 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((315199629802490166240357946658420190919131327875359521552840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((-233300498597533548603 : Rat) / 518003890243601902) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2718560200449052437691635645093990481069524432589853112366000289050469885 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((72935950656576 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7451992699 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-104533721919257483097360854375026531010509834013467187799990670 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((17987274652025278491311126558396785050261324763838877204803293488590430377 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-25102670892288 : Rat) / 275754830051) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((681983436609644183548003649817124438100417088407842036748551980 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (15, 4)],
  term ((8892660132 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33243298555407006880 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 2)],
  term ((-338891432115498811941862889876046035156155624698487924934000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 3)],
  term ((345347465569996505705693238956135567968975364627700365878226990 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 2), (15, 4)],
  term ((-3001135924 : Rat) / 151763803) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((2061607456209530670741912967396786075124005092116269048799468327257113560261825579 : Rat) / 410207824296815351975756508609681098120711096444266413823841219786729917697448) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((142473692121568 : Rat) / 827264490153) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-642086098782091434909274581702997265811252625942239206325266260 : Rat) / 1548394024210394797652230495954043224964706202160677955762991) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((367526505136493953790683060423333373778551670863216229656263741628690142 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-73305409220992 : Rat) / 275754830051) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-310231873387634851610285032617989041170743201376789758062709920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((-842766787584137286349183992278344763835202685648585480464720 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (11, 1), (13, 1), (14, 3), (15, 1)],
  term ((1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9106508107294 : Rat) / 275754830051) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3718684523853307326245811437649398093124686503059466778455593240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((9121579069703924256 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2)],
  term ((-14062434399126883228 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((25808450468679489717632032943848654989995510088726754695258685160 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-990143680 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((536652901934247543728 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((11260279366979730006953345917647509036830891803024740492587595240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((37786023680 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-272333222130804443697482332647511875423783019887160640895578160 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((642255360 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((5292895712028087527479159599938195714262064572187333941788480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-1018570384530916117399871773498143353704390398001950329532800 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 1), (13, 3), (14, 2), (15, 1)],
  term ((-1004170776079449734007372776879568441981328879091202558264600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((62478249817238181029724 : Rat) / 20461153664622275129) [(1, 1), (11, 1), (14, 1)],
  term ((282303284075473136023814972839436337361214190277376049545579150425750613973899345905 : Rat) / 11833874203956612578209702915042921376088392842877018968493843673847481262059712) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-28325520345832 : Rat) / 275754830051) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6285290789964498005595041839633905098873591704626897981444755900 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (14, 1), (15, 4)],
  term ((15754577218 : Rat) / 151763803) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-325213254727999360101 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 2)],
  term ((-12026565164606170575196395886936496099315701027012605883151025070259245720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22251168134 : Rat) / 151763803) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((4430809159739450636 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 3)],
  term ((-1429795252144366970253047343779911117971856571285846007042075200 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (14, 3), (15, 2)],
  term ((-1986144088 : Rat) / 151763803) [(1, 1), (11, 1), (14, 3), (16, 1)],
  term ((-132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 1), (15, 2)],
  term ((15490981251700 : Rat) / 275754830051) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6824500905098957258146963303565320513169065977217093525198010 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (15, 4)],
  term ((-5788375401 : Rat) / 303527606) [(1, 1), (11, 1), (16, 1)],
  term ((-4215415881680670950329431214123569805710553436685550192848320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4621634695584238251242125667966855087841020737877204392683455800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-2801176615676404400931344835291957655867246001320838405351280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-3113563512798031505938445297024954335860859640661823911556840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-18436268273769378810223319530462048716963098002308730436321200 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 1400 through 1499. -/
theorem ep_Q2_041_block_18_1400_1499_valid :
    checkProductSumEq ep_Q2_041_partials_18_1400_1499
      ep_Q2_041_block_18_1400_1499 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
