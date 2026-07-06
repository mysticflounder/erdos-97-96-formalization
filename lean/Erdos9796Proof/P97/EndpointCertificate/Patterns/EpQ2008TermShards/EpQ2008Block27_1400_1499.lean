/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1400-1499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1400_1499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1400 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1400 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1400 for generator 27. -/
def ep_Q2_008_partial_27_1400 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 27. -/
theorem ep_Q2_008_partial_27_1400_valid :
    mulPoly ep_Q2_008_coefficient_27_1400
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1401 : Poly :=
[
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 1401 for generator 27. -/
def ep_Q2_008_partial_27_1401 : Poly :=
[
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 27. -/
theorem ep_Q2_008_partial_27_1401_valid :
    mulPoly ep_Q2_008_coefficient_27_1401
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1402 : Poly :=
[
  term ((751020491041030665081 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1402 for generator 27. -/
def ep_Q2_008_partial_27_1402 : Poly :=
[
  term ((751020491041030665081 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-751020491041030665081 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 27. -/
theorem ep_Q2_008_partial_27_1402_valid :
    mulPoly ep_Q2_008_coefficient_27_1402
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1403 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1403 for generator 27. -/
def ep_Q2_008_partial_27_1403 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 27. -/
theorem ep_Q2_008_partial_27_1403_valid :
    mulPoly ep_Q2_008_coefficient_27_1403
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1404 : Poly :=
[
  term ((14557226997723800919914271282551643479727207 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1404 for generator 27. -/
def ep_Q2_008_partial_27_1404 : Poly :=
[
  term ((14557226997723800919914271282551643479727207 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14557226997723800919914271282551643479727207 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 27. -/
theorem ep_Q2_008_partial_27_1404_valid :
    mulPoly ep_Q2_008_coefficient_27_1404
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1405 : Poly :=
[
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1405 for generator 27. -/
def ep_Q2_008_partial_27_1405 : Poly :=
[
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 27. -/
theorem ep_Q2_008_partial_27_1405_valid :
    mulPoly ep_Q2_008_coefficient_27_1405
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1406 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1406 for generator 27. -/
def ep_Q2_008_partial_27_1406 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 27. -/
theorem ep_Q2_008_partial_27_1406_valid :
    mulPoly ep_Q2_008_coefficient_27_1406
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1407 : Poly :=
[
  term ((-159335507713746425171 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1407 for generator 27. -/
def ep_Q2_008_partial_27_1407 : Poly :=
[
  term ((159335507713746425171 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-159335507713746425171 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 27. -/
theorem ep_Q2_008_partial_27_1407_valid :
    mulPoly ep_Q2_008_coefficient_27_1407
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1408 : Poly :=
[
  term ((-159335507713746425171 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 1408 for generator 27. -/
def ep_Q2_008_partial_27_1408 : Poly :=
[
  term ((-159335507713746425171 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((159335507713746425171 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 27. -/
theorem ep_Q2_008_partial_27_1408_valid :
    mulPoly ep_Q2_008_coefficient_27_1408
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1409 : Poly :=
[
  term ((107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1409 for generator 27. -/
def ep_Q2_008_partial_27_1409 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 27. -/
theorem ep_Q2_008_partial_27_1409_valid :
    mulPoly ep_Q2_008_coefficient_27_1409
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1410 : Poly :=
[
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1410 for generator 27. -/
def ep_Q2_008_partial_27_1410 : Poly :=
[
  term ((107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 27. -/
theorem ep_Q2_008_partial_27_1410_valid :
    mulPoly ep_Q2_008_coefficient_27_1410
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1411 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1411 for generator 27. -/
def ep_Q2_008_partial_27_1411 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (14, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 27. -/
theorem ep_Q2_008_partial_27_1411_valid :
    mulPoly ep_Q2_008_coefficient_27_1411
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1412 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

/-- Partial product 1412 for generator 27. -/
def ep_Q2_008_partial_27_1412 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (14, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 27. -/
theorem ep_Q2_008_partial_27_1412_valid :
    mulPoly ep_Q2_008_coefficient_27_1412
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1413 : Poly :=
[
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1413 for generator 27. -/
def ep_Q2_008_partial_27_1413 : Poly :=
[
  term ((-2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 27. -/
theorem ep_Q2_008_partial_27_1413_valid :
    mulPoly ep_Q2_008_coefficient_27_1413
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1414 : Poly :=
[
  term ((2104639235181182094975540307520976395808377 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1414 for generator 27. -/
def ep_Q2_008_partial_27_1414 : Poly :=
[
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 27. -/
theorem ep_Q2_008_partial_27_1414_valid :
    mulPoly ep_Q2_008_coefficient_27_1414
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1415 : Poly :=
[
  term ((-1875638183957108672576521536883497600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1415 for generator 27. -/
def ep_Q2_008_partial_27_1415 : Poly :=
[
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1875638183957108672576521536883497600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 27. -/
theorem ep_Q2_008_partial_27_1415_valid :
    mulPoly ep_Q2_008_coefficient_27_1415
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1416 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1416 for generator 27. -/
def ep_Q2_008_partial_27_1416 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 27. -/
theorem ep_Q2_008_partial_27_1416_valid :
    mulPoly ep_Q2_008_coefficient_27_1416
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1417 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1417 for generator 27. -/
def ep_Q2_008_partial_27_1417 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 27. -/
theorem ep_Q2_008_partial_27_1417_valid :
    mulPoly ep_Q2_008_coefficient_27_1417
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1418 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1418 for generator 27. -/
def ep_Q2_008_partial_27_1418 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 27. -/
theorem ep_Q2_008_partial_27_1418_valid :
    mulPoly ep_Q2_008_coefficient_27_1418
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1419 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1419 for generator 27. -/
def ep_Q2_008_partial_27_1419 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 27. -/
theorem ep_Q2_008_partial_27_1419_valid :
    mulPoly ep_Q2_008_coefficient_27_1419
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1420 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 1420 for generator 27. -/
def ep_Q2_008_partial_27_1420 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 27. -/
theorem ep_Q2_008_partial_27_1420_valid :
    mulPoly ep_Q2_008_coefficient_27_1420
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1421 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1421 for generator 27. -/
def ep_Q2_008_partial_27_1421 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 27. -/
theorem ep_Q2_008_partial_27_1421_valid :
    mulPoly ep_Q2_008_coefficient_27_1421
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1422 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1422 for generator 27. -/
def ep_Q2_008_partial_27_1422 : Poly :=
[
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 27. -/
theorem ep_Q2_008_partial_27_1422_valid :
    mulPoly ep_Q2_008_coefficient_27_1422
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1423 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1423 for generator 27. -/
def ep_Q2_008_partial_27_1423 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 27. -/
theorem ep_Q2_008_partial_27_1423_valid :
    mulPoly ep_Q2_008_coefficient_27_1423
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1424 : Poly :=
[
  term ((1050765711398722821019979784327422400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1424 for generator 27. -/
def ep_Q2_008_partial_27_1424 : Poly :=
[
  term ((-1050765711398722821019979784327422400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2101531422797445642039959568654844800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 27. -/
theorem ep_Q2_008_partial_27_1424_valid :
    mulPoly ep_Q2_008_coefficient_27_1424
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1425 : Poly :=
[
  term ((5196785466312412140400024172466402008071953 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1425 for generator 27. -/
def ep_Q2_008_partial_27_1425 : Poly :=
[
  term ((10393570932624824280800048344932804016143906 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5196785466312412140400024172466402008071953 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 27. -/
theorem ep_Q2_008_partial_27_1425_valid :
    mulPoly ep_Q2_008_coefficient_27_1425
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1426 : Poly :=
[
  term ((2166072348180399061886656149160944000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1426 for generator 27. -/
def ep_Q2_008_partial_27_1426 : Poly :=
[
  term ((4332144696360798123773312298321888000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2166072348180399061886656149160944000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 27. -/
theorem ep_Q2_008_partial_27_1426_valid :
    mulPoly ep_Q2_008_coefficient_27_1426
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1427 : Poly :=
[
  term ((-7325065191025312785727670551142217600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1427 for generator 27. -/
def ep_Q2_008_partial_27_1427 : Poly :=
[
  term ((-14650130382050625571455341102284435200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((7325065191025312785727670551142217600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 27. -/
theorem ep_Q2_008_partial_27_1427_valid :
    mulPoly ep_Q2_008_coefficient_27_1427
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1428 : Poly :=
[
  term ((58755176627565441303 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1428 for generator 27. -/
def ep_Q2_008_partial_27_1428 : Poly :=
[
  term ((58755176627565441303 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-58755176627565441303 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 27. -/
theorem ep_Q2_008_partial_27_1428_valid :
    mulPoly ep_Q2_008_coefficient_27_1428
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1429 : Poly :=
[
  term ((149843272382999824940131119415138296000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1429 for generator 27. -/
def ep_Q2_008_partial_27_1429 : Poly :=
[
  term ((299686544765999649880262238830276592000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-149843272382999824940131119415138296000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 27. -/
theorem ep_Q2_008_partial_27_1429_valid :
    mulPoly ep_Q2_008_coefficient_27_1429
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1430 : Poly :=
[
  term ((364938985264381623 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1430 for generator 27. -/
def ep_Q2_008_partial_27_1430 : Poly :=
[
  term ((-364938985264381623 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 27. -/
theorem ep_Q2_008_partial_27_1430_valid :
    mulPoly ep_Q2_008_coefficient_27_1430
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1431 : Poly :=
[
  term ((44365809038106688352059494814574020818903 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1431 for generator 27. -/
def ep_Q2_008_partial_27_1431 : Poly :=
[
  term ((44365809038106688352059494814574020818903 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44365809038106688352059494814574020818903 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 27. -/
theorem ep_Q2_008_partial_27_1431_valid :
    mulPoly ep_Q2_008_coefficient_27_1431
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1432 : Poly :=
[
  term ((-33003693329384826319 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 1432 for generator 27. -/
def ep_Q2_008_partial_27_1432 : Poly :=
[
  term ((-33003693329384826319 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((33003693329384826319 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 27. -/
theorem ep_Q2_008_partial_27_1432_valid :
    mulPoly ep_Q2_008_coefficient_27_1432
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1433 : Poly :=
[
  term ((406075037438257278953580819062949600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1433 for generator 27. -/
def ep_Q2_008_partial_27_1433 : Poly :=
[
  term ((812150074876514557907161638125899200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-406075037438257278953580819062949600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 27. -/
theorem ep_Q2_008_partial_27_1433_valid :
    mulPoly ep_Q2_008_coefficient_27_1433
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1434 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)]
]

/-- Partial product 1434 for generator 27. -/
def ep_Q2_008_partial_27_1434 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 27. -/
theorem ep_Q2_008_partial_27_1434_valid :
    mulPoly ep_Q2_008_coefficient_27_1434
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1435 : Poly :=
[
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1435 for generator 27. -/
def ep_Q2_008_partial_27_1435 : Poly :=
[
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 27. -/
theorem ep_Q2_008_partial_27_1435_valid :
    mulPoly ep_Q2_008_coefficient_27_1435
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1436 : Poly :=
[
  term ((47628214178878485828671428386619200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1436 for generator 27. -/
def ep_Q2_008_partial_27_1436 : Poly :=
[
  term ((95256428357756971657342856773238400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47628214178878485828671428386619200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 27. -/
theorem ep_Q2_008_partial_27_1436_valid :
    mulPoly ep_Q2_008_coefficient_27_1436
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1437 : Poly :=
[
  term ((-13117062446999150049 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 1437 for generator 27. -/
def ep_Q2_008_partial_27_1437 : Poly :=
[
  term ((-13117062446999150049 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((13117062446999150049 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 27. -/
theorem ep_Q2_008_partial_27_1437_valid :
    mulPoly ep_Q2_008_coefficient_27_1437
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1438 : Poly :=
[
  term ((-37760516492492065920949584990495529631703 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1438 for generator 27. -/
def ep_Q2_008_partial_27_1438 : Poly :=
[
  term ((37760516492492065920949584990495529631703 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37760516492492065920949584990495529631703 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 27. -/
theorem ep_Q2_008_partial_27_1438_valid :
    mulPoly ep_Q2_008_coefficient_27_1438
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1439 : Poly :=
[
  term ((-37760516492492065920949584990495529631703 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1439 for generator 27. -/
def ep_Q2_008_partial_27_1439 : Poly :=
[
  term ((-37760516492492065920949584990495529631703 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37760516492492065920949584990495529631703 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 27. -/
theorem ep_Q2_008_partial_27_1439_valid :
    mulPoly ep_Q2_008_coefficient_27_1439
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1440 : Poly :=
[
  term ((-2650129288552549710736880502956688000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1440 for generator 27. -/
def ep_Q2_008_partial_27_1440 : Poly :=
[
  term ((2650129288552549710736880502956688000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5300258577105099421473761005913376000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 27. -/
theorem ep_Q2_008_partial_27_1440_valid :
    mulPoly ep_Q2_008_coefficient_27_1440
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1441 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1441 for generator 27. -/
def ep_Q2_008_partial_27_1441 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 27. -/
theorem ep_Q2_008_partial_27_1441_valid :
    mulPoly ep_Q2_008_coefficient_27_1441
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1442 : Poly :=
[
  term ((-1325064644276274855368440251478344000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1442 for generator 27. -/
def ep_Q2_008_partial_27_1442 : Poly :=
[
  term ((-2650129288552549710736880502956688000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1325064644276274855368440251478344000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 27. -/
theorem ep_Q2_008_partial_27_1442_valid :
    mulPoly ep_Q2_008_coefficient_27_1442
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1443 : Poly :=
[
  term ((32291916775513583922 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 1443 for generator 27. -/
def ep_Q2_008_partial_27_1443 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 27. -/
theorem ep_Q2_008_partial_27_1443_valid :
    mulPoly ep_Q2_008_coefficient_27_1443
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1444 : Poly :=
[
  term ((-48405694037215064885022435379574400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1444 for generator 27. -/
def ep_Q2_008_partial_27_1444 : Poly :=
[
  term ((48405694037215064885022435379574400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 27. -/
theorem ep_Q2_008_partial_27_1444_valid :
    mulPoly ep_Q2_008_coefficient_27_1444
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1445 : Poly :=
[
  term ((-24202847018607532442511217689787200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1445 for generator 27. -/
def ep_Q2_008_partial_27_1445 : Poly :=
[
  term ((-48405694037215064885022435379574400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((24202847018607532442511217689787200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 27. -/
theorem ep_Q2_008_partial_27_1445_valid :
    mulPoly ep_Q2_008_coefficient_27_1445
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1446 : Poly :=
[
  term ((145964270546929699202729312859225600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1446 for generator 27. -/
def ep_Q2_008_partial_27_1446 : Poly :=
[
  term ((-145964270546929699202729312859225600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((291928541093859398405458625718451200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 27. -/
theorem ep_Q2_008_partial_27_1446_valid :
    mulPoly ep_Q2_008_coefficient_27_1446
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1447 : Poly :=
[
  term ((18495092854611217581 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1447 for generator 27. -/
def ep_Q2_008_partial_27_1447 : Poly :=
[
  term ((-18495092854611217581 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((18495092854611217581 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 27. -/
theorem ep_Q2_008_partial_27_1447_valid :
    mulPoly ep_Q2_008_coefficient_27_1447
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1448 : Poly :=
[
  term ((72982135273464849601364656429612800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1448 for generator 27. -/
def ep_Q2_008_partial_27_1448 : Poly :=
[
  term ((145964270546929699202729312859225600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-72982135273464849601364656429612800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 27. -/
theorem ep_Q2_008_partial_27_1448_valid :
    mulPoly ep_Q2_008_coefficient_27_1448
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1449 : Poly :=
[
  term ((18495092854611217581 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 1449 for generator 27. -/
def ep_Q2_008_partial_27_1449 : Poly :=
[
  term ((18495092854611217581 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-18495092854611217581 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 27. -/
theorem ep_Q2_008_partial_27_1449_valid :
    mulPoly ep_Q2_008_coefficient_27_1449
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1450 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1450 for generator 27. -/
def ep_Q2_008_partial_27_1450 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 27. -/
theorem ep_Q2_008_partial_27_1450_valid :
    mulPoly ep_Q2_008_coefficient_27_1450
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1451 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1451 for generator 27. -/
def ep_Q2_008_partial_27_1451 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 27. -/
theorem ep_Q2_008_partial_27_1451_valid :
    mulPoly ep_Q2_008_coefficient_27_1451
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1452 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1452 for generator 27. -/
def ep_Q2_008_partial_27_1452 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 27. -/
theorem ep_Q2_008_partial_27_1452_valid :
    mulPoly ep_Q2_008_coefficient_27_1452
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1453 : Poly :=
[
  term ((55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1453 for generator 27. -/
def ep_Q2_008_partial_27_1453 : Poly :=
[
  term ((110180002781412346271456991001651200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 27. -/
theorem ep_Q2_008_partial_27_1453_valid :
    mulPoly ep_Q2_008_coefficient_27_1453
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1454 : Poly :=
[
  term ((4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1454 for generator 27. -/
def ep_Q2_008_partial_27_1454 : Poly :=
[
  term ((8173716430679577126605077517573740800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 27. -/
theorem ep_Q2_008_partial_27_1454_valid :
    mulPoly ep_Q2_008_coefficient_27_1454
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1455 : Poly :=
[
  term ((25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1455 for generator 27. -/
def ep_Q2_008_partial_27_1455 : Poly :=
[
  term ((-25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 27. -/
theorem ep_Q2_008_partial_27_1455_valid :
    mulPoly ep_Q2_008_coefficient_27_1455
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1455 := by
  native_decide

/-- Coefficient term 1456 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1456 : Poly :=
[
  term ((-55369355625519749160304831346779200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1456 for generator 27. -/
def ep_Q2_008_partial_27_1456 : Poly :=
[
  term ((-110738711251039498320609662693558400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((55369355625519749160304831346779200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1456 for generator 27. -/
theorem ep_Q2_008_partial_27_1456_valid :
    mulPoly ep_Q2_008_coefficient_27_1456
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1456 := by
  native_decide

/-- Coefficient term 1457 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1457 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1457 for generator 27. -/
def ep_Q2_008_partial_27_1457 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1457 for generator 27. -/
theorem ep_Q2_008_partial_27_1457_valid :
    mulPoly ep_Q2_008_coefficient_27_1457
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1457 := by
  native_decide

/-- Coefficient term 1458 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1458 : Poly :=
[
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1458 for generator 27. -/
def ep_Q2_008_partial_27_1458 : Poly :=
[
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1458 for generator 27. -/
theorem ep_Q2_008_partial_27_1458_valid :
    mulPoly ep_Q2_008_coefficient_27_1458
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1458 := by
  native_decide

/-- Coefficient term 1459 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1459 : Poly :=
[
  term ((29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1459 for generator 27. -/
def ep_Q2_008_partial_27_1459 : Poly :=
[
  term ((59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1459 for generator 27. -/
theorem ep_Q2_008_partial_27_1459_valid :
    mulPoly ep_Q2_008_coefficient_27_1459
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1459 := by
  native_decide

/-- Coefficient term 1460 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1460 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1460 for generator 27. -/
def ep_Q2_008_partial_27_1460 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1460 for generator 27. -/
theorem ep_Q2_008_partial_27_1460_valid :
    mulPoly ep_Q2_008_coefficient_27_1460
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1460 := by
  native_decide

/-- Coefficient term 1461 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1461 : Poly :=
[
  term ((-25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1461 for generator 27. -/
def ep_Q2_008_partial_27_1461 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1461 for generator 27. -/
theorem ep_Q2_008_partial_27_1461_valid :
    mulPoly ep_Q2_008_coefficient_27_1461
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1461 := by
  native_decide

/-- Coefficient term 1462 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1462 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1462 for generator 27. -/
def ep_Q2_008_partial_27_1462 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1462 for generator 27. -/
theorem ep_Q2_008_partial_27_1462_valid :
    mulPoly ep_Q2_008_coefficient_27_1462
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1462 := by
  native_decide

/-- Coefficient term 1463 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1463 : Poly :=
[
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1463 for generator 27. -/
def ep_Q2_008_partial_27_1463 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1463 for generator 27. -/
theorem ep_Q2_008_partial_27_1463_valid :
    mulPoly ep_Q2_008_coefficient_27_1463
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1463 := by
  native_decide

/-- Coefficient term 1464 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1464 : Poly :=
[
  term ((730359866922240931723673235806400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1464 for generator 27. -/
def ep_Q2_008_partial_27_1464 : Poly :=
[
  term ((-730359866922240931723673235806400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((1460719733844481863447346471612800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1464 for generator 27. -/
theorem ep_Q2_008_partial_27_1464_valid :
    mulPoly ep_Q2_008_coefficient_27_1464
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1464 := by
  native_decide

/-- Coefficient term 1465 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1465 : Poly :=
[
  term ((365179933461120465861836617903200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 1465 for generator 27. -/
def ep_Q2_008_partial_27_1465 : Poly :=
[
  term ((730359866922240931723673235806400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-365179933461120465861836617903200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1465 for generator 27. -/
theorem ep_Q2_008_partial_27_1465_valid :
    mulPoly ep_Q2_008_coefficient_27_1465
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1465 := by
  native_decide

/-- Coefficient term 1466 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1466 : Poly :=
[
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1466 for generator 27. -/
def ep_Q2_008_partial_27_1466 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1466 for generator 27. -/
theorem ep_Q2_008_partial_27_1466_valid :
    mulPoly ep_Q2_008_coefficient_27_1466
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1466 := by
  native_decide

/-- Coefficient term 1467 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1467 : Poly :=
[
  term ((23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1467 for generator 27. -/
def ep_Q2_008_partial_27_1467 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1467 for generator 27. -/
theorem ep_Q2_008_partial_27_1467_valid :
    mulPoly ep_Q2_008_coefficient_27_1467
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1467 := by
  native_decide

/-- Coefficient term 1468 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1468 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 1468 for generator 27. -/
def ep_Q2_008_partial_27_1468 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1468 for generator 27. -/
theorem ep_Q2_008_partial_27_1468_valid :
    mulPoly ep_Q2_008_coefficient_27_1468
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1468 := by
  native_decide

/-- Coefficient term 1469 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1469 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1469 for generator 27. -/
def ep_Q2_008_partial_27_1469 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1469 for generator 27. -/
theorem ep_Q2_008_partial_27_1469_valid :
    mulPoly ep_Q2_008_coefficient_27_1469
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1469 := by
  native_decide

/-- Coefficient term 1470 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1470 : Poly :=
[
  term ((-515700953587329750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1470 for generator 27. -/
def ep_Q2_008_partial_27_1470 : Poly :=
[
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1470 for generator 27. -/
theorem ep_Q2_008_partial_27_1470_valid :
    mulPoly ep_Q2_008_coefficient_27_1470
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1470 := by
  native_decide

/-- Coefficient term 1471 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1471 : Poly :=
[
  term ((-59550582138075000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1471 for generator 27. -/
def ep_Q2_008_partial_27_1471 : Poly :=
[
  term ((-119101164276150000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((59550582138075000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1471 for generator 27. -/
theorem ep_Q2_008_partial_27_1471_valid :
    mulPoly ep_Q2_008_coefficient_27_1471
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1471 := by
  native_decide

/-- Coefficient term 1472 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1472 : Poly :=
[
  term ((28479665886099942513 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1472 for generator 27. -/
def ep_Q2_008_partial_27_1472 : Poly :=
[
  term ((56959331772199885026 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28479665886099942513 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1472 for generator 27. -/
theorem ep_Q2_008_partial_27_1472_valid :
    mulPoly ep_Q2_008_coefficient_27_1472
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1472 := by
  native_decide

/-- Coefficient term 1473 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1473 : Poly :=
[
  term ((-362761673993516827284964706956444148104200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1473 for generator 27. -/
def ep_Q2_008_partial_27_1473 : Poly :=
[
  term ((-725523347987033654569929413912888296208400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((362761673993516827284964706956444148104200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1473 for generator 27. -/
theorem ep_Q2_008_partial_27_1473_valid :
    mulPoly ep_Q2_008_coefficient_27_1473
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1473 := by
  native_decide

/-- Coefficient term 1474 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1474 : Poly :=
[
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1474 for generator 27. -/
def ep_Q2_008_partial_27_1474 : Poly :=
[
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1474 for generator 27. -/
theorem ep_Q2_008_partial_27_1474_valid :
    mulPoly ep_Q2_008_coefficient_27_1474
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1474 := by
  native_decide

/-- Coefficient term 1475 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1475 : Poly :=
[
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1475 for generator 27. -/
def ep_Q2_008_partial_27_1475 : Poly :=
[
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1475 for generator 27. -/
theorem ep_Q2_008_partial_27_1475_valid :
    mulPoly ep_Q2_008_coefficient_27_1475
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1475 := by
  native_decide

/-- Coefficient term 1476 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1476 : Poly :=
[
  term ((19644271160863178157 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1476 for generator 27. -/
def ep_Q2_008_partial_27_1476 : Poly :=
[
  term ((19644271160863178157 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19644271160863178157 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1476 for generator 27. -/
theorem ep_Q2_008_partial_27_1476_valid :
    mulPoly ep_Q2_008_coefficient_27_1476
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1476 := by
  native_decide

/-- Coefficient term 1477 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1477 : Poly :=
[
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1477 for generator 27. -/
def ep_Q2_008_partial_27_1477 : Poly :=
[
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1477 for generator 27. -/
theorem ep_Q2_008_partial_27_1477_valid :
    mulPoly ep_Q2_008_coefficient_27_1477
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1477 := by
  native_decide

/-- Coefficient term 1478 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1478 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 1478 for generator 27. -/
def ep_Q2_008_partial_27_1478 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1478 for generator 27. -/
theorem ep_Q2_008_partial_27_1478_valid :
    mulPoly ep_Q2_008_coefficient_27_1478
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1478 := by
  native_decide

/-- Coefficient term 1479 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1479 : Poly :=
[
  term ((29910645282475776833608179861358243852725 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1479 for generator 27. -/
def ep_Q2_008_partial_27_1479 : Poly :=
[
  term ((59821290564951553667216359722716487705450 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29910645282475776833608179861358243852725 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1479 for generator 27. -/
theorem ep_Q2_008_partial_27_1479_valid :
    mulPoly ep_Q2_008_coefficient_27_1479
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1479 := by
  native_decide

/-- Coefficient term 1480 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1480 : Poly :=
[
  term ((49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1480 for generator 27. -/
def ep_Q2_008_partial_27_1480 : Poly :=
[
  term ((-49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1480 for generator 27. -/
theorem ep_Q2_008_partial_27_1480_valid :
    mulPoly ep_Q2_008_coefficient_27_1480
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1480 := by
  native_decide

/-- Coefficient term 1481 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1481 : Poly :=
[
  term ((-566998172446752295633439805990061229148000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1481 for generator 27. -/
def ep_Q2_008_partial_27_1481 : Poly :=
[
  term ((-1133996344893504591266879611980122458296000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((566998172446752295633439805990061229148000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1481 for generator 27. -/
theorem ep_Q2_008_partial_27_1481_valid :
    mulPoly ep_Q2_008_coefficient_27_1481
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1481 := by
  native_decide

/-- Coefficient term 1482 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1482 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1482 for generator 27. -/
def ep_Q2_008_partial_27_1482 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1482 for generator 27. -/
theorem ep_Q2_008_partial_27_1482_valid :
    mulPoly ep_Q2_008_coefficient_27_1482
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1482 := by
  native_decide

/-- Coefficient term 1483 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1483 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1483 for generator 27. -/
def ep_Q2_008_partial_27_1483 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1483 for generator 27. -/
theorem ep_Q2_008_partial_27_1483_valid :
    mulPoly ep_Q2_008_coefficient_27_1483
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1483 := by
  native_decide

/-- Coefficient term 1484 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1484 : Poly :=
[
  term ((160470477040029050844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1484 for generator 27. -/
def ep_Q2_008_partial_27_1484 : Poly :=
[
  term ((320940954080058101688 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-160470477040029050844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1484 for generator 27. -/
theorem ep_Q2_008_partial_27_1484_valid :
    mulPoly ep_Q2_008_coefficient_27_1484
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1484 := by
  native_decide

/-- Coefficient term 1485 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1485 : Poly :=
[
  term ((7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1485 for generator 27. -/
def ep_Q2_008_partial_27_1485 : Poly :=
[
  term ((15875915431027820209348766041944939916800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1485 for generator 27. -/
theorem ep_Q2_008_partial_27_1485_valid :
    mulPoly ep_Q2_008_coefficient_27_1485
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1485 := by
  native_decide

/-- Coefficient term 1486 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1486 : Poly :=
[
  term ((257850476793664875 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1486 for generator 27. -/
def ep_Q2_008_partial_27_1486 : Poly :=
[
  term ((-257850476793664875 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1486 for generator 27. -/
theorem ep_Q2_008_partial_27_1486_valid :
    mulPoly ep_Q2_008_coefficient_27_1486
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1486 := by
  native_decide

/-- Coefficient term 1487 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1487 : Poly :=
[
  term ((62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1487 for generator 27. -/
def ep_Q2_008_partial_27_1487 : Poly :=
[
  term ((124325658180356701690943008069016281171500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1487 for generator 27. -/
theorem ep_Q2_008_partial_27_1487_valid :
    mulPoly ep_Q2_008_coefficient_27_1487
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1487 := by
  native_decide

/-- Coefficient term 1488 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1488 : Poly :=
[
  term ((-20008329659229663711 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1488 for generator 27. -/
def ep_Q2_008_partial_27_1488 : Poly :=
[
  term ((-20008329659229663711 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((20008329659229663711 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1488 for generator 27. -/
theorem ep_Q2_008_partial_27_1488_valid :
    mulPoly ep_Q2_008_coefficient_27_1488
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1488 := by
  native_decide

/-- Coefficient term 1489 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1489 : Poly :=
[
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1489 for generator 27. -/
def ep_Q2_008_partial_27_1489 : Poly :=
[
  term ((-12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1489 for generator 27. -/
theorem ep_Q2_008_partial_27_1489_valid :
    mulPoly ep_Q2_008_coefficient_27_1489
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1489 := by
  native_decide

/-- Coefficient term 1490 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1490 : Poly :=
[
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)]
]

/-- Partial product 1490 for generator 27. -/
def ep_Q2_008_partial_27_1490 : Poly :=
[
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1490 for generator 27. -/
theorem ep_Q2_008_partial_27_1490_valid :
    mulPoly ep_Q2_008_coefficient_27_1490
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1490 := by
  native_decide

/-- Coefficient term 1491 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1491 : Poly :=
[
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1491 for generator 27. -/
def ep_Q2_008_partial_27_1491 : Poly :=
[
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1491 for generator 27. -/
theorem ep_Q2_008_partial_27_1491_valid :
    mulPoly ep_Q2_008_coefficient_27_1491
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1491 := by
  native_decide

/-- Coefficient term 1492 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1492 : Poly :=
[
  term ((-37827146390764630521 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1492 for generator 27. -/
def ep_Q2_008_partial_27_1492 : Poly :=
[
  term ((-37827146390764630521 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((37827146390764630521 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1492 for generator 27. -/
theorem ep_Q2_008_partial_27_1492_valid :
    mulPoly ep_Q2_008_coefficient_27_1492
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1492 := by
  native_decide

/-- Coefficient term 1493 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1493 : Poly :=
[
  term ((-65084664471042559371019799012880479702550 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1493 for generator 27. -/
def ep_Q2_008_partial_27_1493 : Poly :=
[
  term ((65084664471042559371019799012880479702550 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130169328942085118742039598025760959405100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1493 for generator 27. -/
theorem ep_Q2_008_partial_27_1493_valid :
    mulPoly ep_Q2_008_coefficient_27_1493
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1493 := by
  native_decide

/-- Coefficient term 1494 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1494 : Poly :=
[
  term ((-31872387377473740333237074797546904299275 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1494 for generator 27. -/
def ep_Q2_008_partial_27_1494 : Poly :=
[
  term ((-63744774754947480666474149595093808598550 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31872387377473740333237074797546904299275 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1494 for generator 27. -/
theorem ep_Q2_008_partial_27_1494_valid :
    mulPoly ep_Q2_008_coefficient_27_1494
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1494 := by
  native_decide

/-- Coefficient term 1495 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1495 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1495 for generator 27. -/
def ep_Q2_008_partial_27_1495 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1495 for generator 27. -/
theorem ep_Q2_008_partial_27_1495_valid :
    mulPoly ep_Q2_008_coefficient_27_1495
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1495 := by
  native_decide

/-- Coefficient term 1496 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1496 : Poly :=
[
  term ((-49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1496 for generator 27. -/
def ep_Q2_008_partial_27_1496 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1496 for generator 27. -/
theorem ep_Q2_008_partial_27_1496_valid :
    mulPoly ep_Q2_008_coefficient_27_1496
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1496 := by
  native_decide

/-- Coefficient term 1497 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1497 : Poly :=
[
  term ((-13564349848759678983 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1497 for generator 27. -/
def ep_Q2_008_partial_27_1497 : Poly :=
[
  term ((13564349848759678983 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13564349848759678983 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1497 for generator 27. -/
theorem ep_Q2_008_partial_27_1497_valid :
    mulPoly ep_Q2_008_coefficient_27_1497
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1497 := by
  native_decide

/-- Coefficient term 1498 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1498 : Poly :=
[
  term ((28208879309322896949 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1498 for generator 27. -/
def ep_Q2_008_partial_27_1498 : Poly :=
[
  term ((28208879309322896949 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28208879309322896949 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1498 for generator 27. -/
theorem ep_Q2_008_partial_27_1498_valid :
    mulPoly ep_Q2_008_coefficient_27_1498
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1498 := by
  native_decide

/-- Coefficient term 1499 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1499 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1499 for generator 27. -/
def ep_Q2_008_partial_27_1499 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1499 for generator 27. -/
theorem ep_Q2_008_partial_27_1499_valid :
    mulPoly ep_Q2_008_coefficient_27_1499
        ep_Q2_008_generator_27_1400_1499 =
      ep_Q2_008_partial_27_1499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1400_1499 : List Poly :=
[
  ep_Q2_008_partial_27_1400,
  ep_Q2_008_partial_27_1401,
  ep_Q2_008_partial_27_1402,
  ep_Q2_008_partial_27_1403,
  ep_Q2_008_partial_27_1404,
  ep_Q2_008_partial_27_1405,
  ep_Q2_008_partial_27_1406,
  ep_Q2_008_partial_27_1407,
  ep_Q2_008_partial_27_1408,
  ep_Q2_008_partial_27_1409,
  ep_Q2_008_partial_27_1410,
  ep_Q2_008_partial_27_1411,
  ep_Q2_008_partial_27_1412,
  ep_Q2_008_partial_27_1413,
  ep_Q2_008_partial_27_1414,
  ep_Q2_008_partial_27_1415,
  ep_Q2_008_partial_27_1416,
  ep_Q2_008_partial_27_1417,
  ep_Q2_008_partial_27_1418,
  ep_Q2_008_partial_27_1419,
  ep_Q2_008_partial_27_1420,
  ep_Q2_008_partial_27_1421,
  ep_Q2_008_partial_27_1422,
  ep_Q2_008_partial_27_1423,
  ep_Q2_008_partial_27_1424,
  ep_Q2_008_partial_27_1425,
  ep_Q2_008_partial_27_1426,
  ep_Q2_008_partial_27_1427,
  ep_Q2_008_partial_27_1428,
  ep_Q2_008_partial_27_1429,
  ep_Q2_008_partial_27_1430,
  ep_Q2_008_partial_27_1431,
  ep_Q2_008_partial_27_1432,
  ep_Q2_008_partial_27_1433,
  ep_Q2_008_partial_27_1434,
  ep_Q2_008_partial_27_1435,
  ep_Q2_008_partial_27_1436,
  ep_Q2_008_partial_27_1437,
  ep_Q2_008_partial_27_1438,
  ep_Q2_008_partial_27_1439,
  ep_Q2_008_partial_27_1440,
  ep_Q2_008_partial_27_1441,
  ep_Q2_008_partial_27_1442,
  ep_Q2_008_partial_27_1443,
  ep_Q2_008_partial_27_1444,
  ep_Q2_008_partial_27_1445,
  ep_Q2_008_partial_27_1446,
  ep_Q2_008_partial_27_1447,
  ep_Q2_008_partial_27_1448,
  ep_Q2_008_partial_27_1449,
  ep_Q2_008_partial_27_1450,
  ep_Q2_008_partial_27_1451,
  ep_Q2_008_partial_27_1452,
  ep_Q2_008_partial_27_1453,
  ep_Q2_008_partial_27_1454,
  ep_Q2_008_partial_27_1455,
  ep_Q2_008_partial_27_1456,
  ep_Q2_008_partial_27_1457,
  ep_Q2_008_partial_27_1458,
  ep_Q2_008_partial_27_1459,
  ep_Q2_008_partial_27_1460,
  ep_Q2_008_partial_27_1461,
  ep_Q2_008_partial_27_1462,
  ep_Q2_008_partial_27_1463,
  ep_Q2_008_partial_27_1464,
  ep_Q2_008_partial_27_1465,
  ep_Q2_008_partial_27_1466,
  ep_Q2_008_partial_27_1467,
  ep_Q2_008_partial_27_1468,
  ep_Q2_008_partial_27_1469,
  ep_Q2_008_partial_27_1470,
  ep_Q2_008_partial_27_1471,
  ep_Q2_008_partial_27_1472,
  ep_Q2_008_partial_27_1473,
  ep_Q2_008_partial_27_1474,
  ep_Q2_008_partial_27_1475,
  ep_Q2_008_partial_27_1476,
  ep_Q2_008_partial_27_1477,
  ep_Q2_008_partial_27_1478,
  ep_Q2_008_partial_27_1479,
  ep_Q2_008_partial_27_1480,
  ep_Q2_008_partial_27_1481,
  ep_Q2_008_partial_27_1482,
  ep_Q2_008_partial_27_1483,
  ep_Q2_008_partial_27_1484,
  ep_Q2_008_partial_27_1485,
  ep_Q2_008_partial_27_1486,
  ep_Q2_008_partial_27_1487,
  ep_Q2_008_partial_27_1488,
  ep_Q2_008_partial_27_1489,
  ep_Q2_008_partial_27_1490,
  ep_Q2_008_partial_27_1491,
  ep_Q2_008_partial_27_1492,
  ep_Q2_008_partial_27_1493,
  ep_Q2_008_partial_27_1494,
  ep_Q2_008_partial_27_1495,
  ep_Q2_008_partial_27_1496,
  ep_Q2_008_partial_27_1497,
  ep_Q2_008_partial_27_1498,
  ep_Q2_008_partial_27_1499
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1400_1499 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((751020491041030665081 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-751020491041030665081 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14557226997723800919914271282551643479727207 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14557226997723800919914271282551643479727207 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-159335507713746425171 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((159335507713746425171 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (14, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1875638183957108672576521536883497600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((10393540460419193717838238765519058520894306 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4332144696360798123773312298321888000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2101531422797445642039959568654844800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5196785466312412140400024172466402008071953 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2166072348180399061886656149160944000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14650130382050625571455341102284435200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((58755176627565441303 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((7325065191025312785727670551142217600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58755176627565441303 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((299686544765999649880262238830276592000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-149843272382999824940131119415138296000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((44365809038106688352059494814574020818903 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33733571299913589565 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-44365809038106688352059494814574020818903 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((33003693329384826319 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((812150074876514557907161638125899200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-406075037438257278953580819062949600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16422254336897173035 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((95256428357756971657342856773238400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-13117062446999150049 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-47628214178878485828671428386619200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((13117062446999150049 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-37760516492492065920949584990495529631703 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((37760516492492065920949584990495529631703 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5300258577105099421473761005913376000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((1325064644276274855368440251478344000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((24202847018607532442511217689787200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((291928541093859398405458625718451200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((18495092854611217581 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-72982135273464849601364656429612800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-18495092854611217581 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((110180002781412346271456991001651200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8173716430679577126605077517573740800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-136122923768677936601991891009004800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((55369355625519749160304831346779200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1460719733844481863447346471612800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-365179933461120465861836617903200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(5, 1), (9, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-119101164276150000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((59550582138075000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((56959331772199885026 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28479665886099942513 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725523347987033654569929413912888296208400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((362761673993516827284964706956444148104200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19644271160863178157 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19644271160863178157 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((59821290564951553667216359722716487705450 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29910645282475776833608179861358243852725 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1135426163364000885633560090909365946673600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((566998172446752295633439805990061229148000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((320940954080058101688 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-160470477040029050844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((15875915431027820209348766041944939916800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((124325658180356701690943008069016281171500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22071133473578982711 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((20008329659229663711 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-37827146390764630521 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((37827146390764630521 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130169328942085118742039598025760959405100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((31872387377473740333237074797546904299275 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((10443307289520643983 : Rat) / 1385912907228352718) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13564349848759678983 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-28208879309322896949 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1400 through 1499. -/
theorem ep_Q2_008_block_27_1400_1499_valid :
    checkProductSumEq ep_Q2_008_partials_27_1400_1499
      ep_Q2_008_block_27_1400_1499 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
