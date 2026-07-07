/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1400-1499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1400_1499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1400 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1400 : Poly :=
[
  term ((-53545665811850240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1400 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1400 : Poly :=
[
  term ((-107091331623700480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((53545665811850240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1400_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1400
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1401 : Poly :=
[
  term ((1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1401 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1401 : Poly :=
[
  term ((3702641550847708952992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1401_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1401
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1402 : Poly :=
[
  term ((672172392107130880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 1402 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1402 : Poly :=
[
  term ((1344344784214261760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-672172392107130880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1402_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1402
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1403 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1403 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1403 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1403_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1403
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1404 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1404 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1404 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1404_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1404
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1405 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1405 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1405 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1405_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1405
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1406 : Poly :=
[
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1406 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1406 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1406_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1406
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1407 : Poly :=
[
  term ((342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 1407 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1407 : Poly :=
[
  term ((684723763646218240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1407_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1407
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1408 : Poly :=
[
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 1408 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1408 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1408_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1408
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1409 : Poly :=
[
  term ((-260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 1409 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1409 : Poly :=
[
  term ((-521146146567925760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (16, 1)],
  term ((260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1409_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1409
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1410 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 1410 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1410 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1410_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1410
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1411 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1411 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1411 : Poly :=
[
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1411_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1411
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1412 : Poly :=
[
  term ((22265407118262978944 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1412 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1412 : Poly :=
[
  term ((44530814236525957888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-22265407118262978944 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1412_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1412
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1413 : Poly :=
[
  term ((86410693804981964852 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1413 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1413 : Poly :=
[
  term ((172821387609963929704 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-86410693804981964852 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1413_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1413
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1414 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1414 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1414 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1414_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1414
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1415 : Poly :=
[
  term ((6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1415 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1415 : Poly :=
[
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((12033302598862523296 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1415_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1415
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1416 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1416 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1416 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1416_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1416
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1417 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1417 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1417 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1417_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1417
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1418 : Poly :=
[
  term ((-159458633265125935078 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1418 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1418 : Poly :=
[
  term ((-318917266530251870156 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((159458633265125935078 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1418_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1418
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1419 : Poly :=
[
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1419 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1419 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1419_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1419
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1420 : Poly :=
[
  term ((43031733706559260202 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1420 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1420 : Poly :=
[
  term ((86063467413118520404 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-43031733706559260202 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1420_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1420
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1421 : Poly :=
[
  term (4 : Rat) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1421 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1421 : Poly :=
[
  term (-4 : Rat) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1421_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1421
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1422 : Poly :=
[
  term ((4996678062323487122 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1422 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1422 : Poly :=
[
  term ((9993356124646974244 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4996678062323487122 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1422_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1422
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1423 : Poly :=
[
  term (-2 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 1423 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1423 : Poly :=
[
  term (-4 : Rat) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1423_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1423
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1424 : Poly :=
[
  term ((-178189171847613298 : Rat) / 53898264945705951) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1424 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1424 : Poly :=
[
  term ((-356378343695226596 : Rat) / 53898264945705951) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((178189171847613298 : Rat) / 53898264945705951) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1424_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1424
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1425 : Poly :=
[
  term ((58077672737624960914 : Rat) / 89830441576176585) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1425 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1425 : Poly :=
[
  term ((116155345475249921828 : Rat) / 89830441576176585) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58077672737624960914 : Rat) / 89830441576176585) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1425_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1425
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1426 : Poly :=
[
  term ((329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1426 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1426 : Poly :=
[
  term ((658929702405729920 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1426_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1426
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1427 : Poly :=
[
  term ((18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 1427 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1427 : Poly :=
[
  term ((37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1427_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1427
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1428 : Poly :=
[
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1428 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1428 : Poly :=
[
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1428_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1428
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1429 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1429 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1429 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1429_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1429
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1430 : Poly :=
[
  term ((5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1430 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1430 : Poly :=
[
  term ((10955545468596454528 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1430_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1430
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1431 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1431 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1431 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1431_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1431
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1432 : Poly :=
[
  term ((79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1432 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1432 : Poly :=
[
  term ((158648048355215488 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1432_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1432
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1433 : Poly :=
[
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1433 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1433 : Poly :=
[
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1433_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1433
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1434 : Poly :=
[
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 1434 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1434 : Poly :=
[
  term ((59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1434_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1434
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1435 : Poly :=
[
  term ((241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (16, 1)]
]

/-- Partial product 1435 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1435 : Poly :=
[
  term ((483182297728022828392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1435_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1435
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1436 : Poly :=
[
  term ((-1452935228419969024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1436 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1436 : Poly :=
[
  term ((-2905870456839938048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1452935228419969024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1436_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1436
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1437 : Poly :=
[
  term ((2226812900840298496 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1437 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1437 : Poly :=
[
  term ((4453625801680596992 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2226812900840298496 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1437_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1437
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1438 : Poly :=
[
  term ((-20070476587482234496 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1438 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1438 : Poly :=
[
  term ((-40140953174964468992 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((20070476587482234496 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1438_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1438
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1439 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1439 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1439 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1439_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1439
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1440 : Poly :=
[
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1440 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1440 : Poly :=
[
  term ((2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5278098906746795008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1440_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1440
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1441 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1441 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1441 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1441_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1441
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1442 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1442 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1442 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1442_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1442
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1443 : Poly :=
[
  term ((-1083541197434901952 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1443 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1443 : Poly :=
[
  term ((-2167082394869803904 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1083541197434901952 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1443_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1443
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1444 : Poly :=
[
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1444 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1444 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1444_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1444
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1445 : Poly :=
[
  term ((701161224335616704 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1445 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1445 : Poly :=
[
  term ((1402322448671233408 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-701161224335616704 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1445_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1445
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1446 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1446 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1446 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1446_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1446
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1447 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1447 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1447 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1447_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1447
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1448 : Poly :=
[
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1448 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1448 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1448_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1448
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1449 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1449 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1449 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1449_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1449
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1450 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1450 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1450 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1450_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1450
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1451 : Poly :=
[
  term ((-123691604085903692768 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1451 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1451 : Poly :=
[
  term ((-247383208171807385536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((123691604085903692768 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1451_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1451
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1452 : Poly :=
[
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1452 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1452 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1452_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1452
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1453 : Poly :=
[
  term ((-394256280411378880 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1453 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1453 : Poly :=
[
  term ((-788512560822757760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((394256280411378880 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1453_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1453
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1454 : Poly :=
[
  term ((53121204641732343592 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1454 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1454 : Poly :=
[
  term ((106242409283464687184 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53121204641732343592 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1454_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1454
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1455 : Poly :=
[
  term ((-10167819998506269248 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 1455 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1455 : Poly :=
[
  term ((-20335639997012538496 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((10167819998506269248 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1455_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1455
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1455 := by
  native_decide

/-- Coefficient term 1456 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1456 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1456 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1456 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1456 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1456_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1456
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1456 := by
  native_decide

/-- Coefficient term 1457 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1457 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1457 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1457 : Poly :=
[
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1457 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1457_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1457
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1457 := by
  native_decide

/-- Coefficient term 1458 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1458 : Poly :=
[
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1458 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1458 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1458 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1458_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1458
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1458 := by
  native_decide

/-- Coefficient term 1459 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1459 : Poly :=
[
  term ((-928314980399349760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1459 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1459 : Poly :=
[
  term ((-1856629960798699520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((928314980399349760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1459 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1459_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1459
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1459 := by
  native_decide

/-- Coefficient term 1460 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1460 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1460 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1460 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1460 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1460_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1460
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1460 := by
  native_decide

/-- Coefficient term 1461 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1461 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1461 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1461 : Poly :=
[
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1461 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1461_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1461
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1461 := by
  native_decide

/-- Coefficient term 1462 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1462 : Poly :=
[
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1462 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1462 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1462 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1462_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1462
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1462 := by
  native_decide

/-- Coefficient term 1463 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1463 : Poly :=
[
  term ((41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1463 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1463 : Poly :=
[
  term ((83943818033361678848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1463 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1463_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1463
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1463 := by
  native_decide

/-- Coefficient term 1464 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1464 : Poly :=
[
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1464 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1464 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1464 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1464_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1464
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1464 := by
  native_decide

/-- Coefficient term 1465 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1465 : Poly :=
[
  term ((15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 1465 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1465 : Poly :=
[
  term ((30145691279780519168 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((-15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1465 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1465_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1465
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1465 := by
  native_decide

/-- Coefficient term 1466 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1466 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1466 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1466 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1466 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1466_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1466
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1466 := by
  native_decide

/-- Coefficient term 1467 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1467 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1467 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1467 : Poly :=
[
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1467 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1467_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1467
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1467 := by
  native_decide

/-- Coefficient term 1468 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1468 : Poly :=
[
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 1468 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1468 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1468 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1468_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1468
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1468 := by
  native_decide

/-- Coefficient term 1469 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1469 : Poly :=
[
  term ((-199037647051076919808 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1469 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1469 : Poly :=
[
  term ((-398075294102153839616 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((199037647051076919808 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1469 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1469_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1469
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1469 := by
  native_decide

/-- Coefficient term 1470 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1470 : Poly :=
[
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (16, 1)]
]

/-- Partial product 1470 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1470 : Poly :=
[
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (12, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1470 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1470_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1470
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1470 := by
  native_decide

/-- Coefficient term 1471 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1471 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1471 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1471 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1471 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1471_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1471
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1471 := by
  native_decide

/-- Coefficient term 1472 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1472 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1472 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1472 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1472 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1472_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1472
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1472 := by
  native_decide

/-- Coefficient term 1473 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1473 : Poly :=
[
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1473 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1473 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1473 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1473_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1473
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1473 := by
  native_decide

/-- Coefficient term 1474 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1474 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1474 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1474 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1474 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1474_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1474
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1474 := by
  native_decide

/-- Coefficient term 1475 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1475 : Poly :=
[
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (14, 1), (16, 1)]
]

/-- Partial product 1475 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1475 : Poly :=
[
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1475 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1475_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1475
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1475 := by
  native_decide

/-- Coefficient term 1476 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1476 : Poly :=
[
  term ((-948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 1476 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1476 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(4, 1), (5, 2), (12, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1476 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1476_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1476
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1476 := by
  native_decide

/-- Coefficient term 1477 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1477 : Poly :=
[
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1477 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1477 : Poly :=
[
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1477 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1477_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1477
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1477 := by
  native_decide

/-- Coefficient term 1478 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1478 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1478 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1478 : Poly :=
[
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1478 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1478_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1478
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1478 := by
  native_decide

/-- Coefficient term 1479 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1479 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1479 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1479 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1479 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1479_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1479
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1479 := by
  native_decide

/-- Coefficient term 1480 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1480 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1480 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1480 : Poly :=
[
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1480 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1480_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1480
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1480 := by
  native_decide

/-- Coefficient term 1481 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1481 : Poly :=
[
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1481 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1481 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1481 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1481_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1481
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1481 := by
  native_decide

/-- Coefficient term 1482 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1482 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1482 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1482 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1482 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1482_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1482
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1482 := by
  native_decide

/-- Coefficient term 1483 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1483 : Poly :=
[
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1483 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1483 : Poly :=
[
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1483 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1483_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1483
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1483 := by
  native_decide

/-- Coefficient term 1484 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1484 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1484 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1484 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1484 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1484_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1484
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1484 := by
  native_decide

/-- Coefficient term 1485 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1485 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1485 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1485 : Poly :=
[
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1485 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1485_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1485
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1485 := by
  native_decide

/-- Coefficient term 1486 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1486 : Poly :=
[
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 1486 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1486 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1486 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1486_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1486
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1486 := by
  native_decide

/-- Coefficient term 1487 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1487 : Poly :=
[
  term ((1401541829042215168 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1487 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1487 : Poly :=
[
  term ((2803083658084430336 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1401541829042215168 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1487 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1487_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1487
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1487 := by
  native_decide

/-- Coefficient term 1488 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1488 : Poly :=
[
  term (-3 : Rat) [(4, 1), (16, 1)]
]

/-- Partial product 1488 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1488 : Poly :=
[
  term (-6 : Rat) [(4, 1), (12, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1488 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1488_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1488
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1488 := by
  native_decide

/-- Coefficient term 1489 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1489 : Poly :=
[
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1489 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1489 : Poly :=
[
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1489 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1489_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1489
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1489 := by
  native_decide

/-- Coefficient term 1490 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1490 : Poly :=
[
  term ((551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 1490 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1490 : Poly :=
[
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1490 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1490_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1490
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1490 := by
  native_decide

/-- Coefficient term 1491 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1491 : Poly :=
[
  term ((82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1491 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1491 : Poly :=
[
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1491 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1491_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1491
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1491 := by
  native_decide

/-- Coefficient term 1492 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1492 : Poly :=
[
  term ((1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 1492 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1492 : Poly :=
[
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (12, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1492 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1492_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1492
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1492 := by
  native_decide

/-- Coefficient term 1493 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1493 : Poly :=
[
  term ((-34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1493 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1493 : Poly :=
[
  term ((-68360739906688179908 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1493 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1493_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1493
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1493 := by
  native_decide

/-- Coefficient term 1494 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1494 : Poly :=
[
  term ((6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1494 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1494 : Poly :=
[
  term ((12153328227362041984 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1494 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1494_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1494
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1494 := by
  native_decide

/-- Coefficient term 1495 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1495 : Poly :=
[
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 1495 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1495 : Poly :=
[
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1495 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1495_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1495
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1495 := by
  native_decide

/-- Coefficient term 1496 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1496 : Poly :=
[
  term (1 : Rat) [(4, 2), (16, 1)]
]

/-- Partial product 1496 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1496 : Poly :=
[
  term (2 : Rat) [(4, 2), (12, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1496 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1496_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1496
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1496 := by
  native_decide

/-- Coefficient term 1497 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1497 : Poly :=
[
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1497 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1497 : Poly :=
[
  term ((-629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1497 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1497_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1497
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1497 := by
  native_decide

/-- Coefficient term 1498 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1498 : Poly :=
[
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 1498 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1498 : Poly :=
[
  term ((629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1498 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1498_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1498
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1498 := by
  native_decide

/-- Coefficient term 1499 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1499 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1499 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1499 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1499 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1499_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1499
        rs_R010_ueqv_R010YNN_generator_25_1400_1499 =
      rs_R010_ueqv_R010YNN_partial_25_1499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1400_1499 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1400,
  rs_R010_ueqv_R010YNN_partial_25_1401,
  rs_R010_ueqv_R010YNN_partial_25_1402,
  rs_R010_ueqv_R010YNN_partial_25_1403,
  rs_R010_ueqv_R010YNN_partial_25_1404,
  rs_R010_ueqv_R010YNN_partial_25_1405,
  rs_R010_ueqv_R010YNN_partial_25_1406,
  rs_R010_ueqv_R010YNN_partial_25_1407,
  rs_R010_ueqv_R010YNN_partial_25_1408,
  rs_R010_ueqv_R010YNN_partial_25_1409,
  rs_R010_ueqv_R010YNN_partial_25_1410,
  rs_R010_ueqv_R010YNN_partial_25_1411,
  rs_R010_ueqv_R010YNN_partial_25_1412,
  rs_R010_ueqv_R010YNN_partial_25_1413,
  rs_R010_ueqv_R010YNN_partial_25_1414,
  rs_R010_ueqv_R010YNN_partial_25_1415,
  rs_R010_ueqv_R010YNN_partial_25_1416,
  rs_R010_ueqv_R010YNN_partial_25_1417,
  rs_R010_ueqv_R010YNN_partial_25_1418,
  rs_R010_ueqv_R010YNN_partial_25_1419,
  rs_R010_ueqv_R010YNN_partial_25_1420,
  rs_R010_ueqv_R010YNN_partial_25_1421,
  rs_R010_ueqv_R010YNN_partial_25_1422,
  rs_R010_ueqv_R010YNN_partial_25_1423,
  rs_R010_ueqv_R010YNN_partial_25_1424,
  rs_R010_ueqv_R010YNN_partial_25_1425,
  rs_R010_ueqv_R010YNN_partial_25_1426,
  rs_R010_ueqv_R010YNN_partial_25_1427,
  rs_R010_ueqv_R010YNN_partial_25_1428,
  rs_R010_ueqv_R010YNN_partial_25_1429,
  rs_R010_ueqv_R010YNN_partial_25_1430,
  rs_R010_ueqv_R010YNN_partial_25_1431,
  rs_R010_ueqv_R010YNN_partial_25_1432,
  rs_R010_ueqv_R010YNN_partial_25_1433,
  rs_R010_ueqv_R010YNN_partial_25_1434,
  rs_R010_ueqv_R010YNN_partial_25_1435,
  rs_R010_ueqv_R010YNN_partial_25_1436,
  rs_R010_ueqv_R010YNN_partial_25_1437,
  rs_R010_ueqv_R010YNN_partial_25_1438,
  rs_R010_ueqv_R010YNN_partial_25_1439,
  rs_R010_ueqv_R010YNN_partial_25_1440,
  rs_R010_ueqv_R010YNN_partial_25_1441,
  rs_R010_ueqv_R010YNN_partial_25_1442,
  rs_R010_ueqv_R010YNN_partial_25_1443,
  rs_R010_ueqv_R010YNN_partial_25_1444,
  rs_R010_ueqv_R010YNN_partial_25_1445,
  rs_R010_ueqv_R010YNN_partial_25_1446,
  rs_R010_ueqv_R010YNN_partial_25_1447,
  rs_R010_ueqv_R010YNN_partial_25_1448,
  rs_R010_ueqv_R010YNN_partial_25_1449,
  rs_R010_ueqv_R010YNN_partial_25_1450,
  rs_R010_ueqv_R010YNN_partial_25_1451,
  rs_R010_ueqv_R010YNN_partial_25_1452,
  rs_R010_ueqv_R010YNN_partial_25_1453,
  rs_R010_ueqv_R010YNN_partial_25_1454,
  rs_R010_ueqv_R010YNN_partial_25_1455,
  rs_R010_ueqv_R010YNN_partial_25_1456,
  rs_R010_ueqv_R010YNN_partial_25_1457,
  rs_R010_ueqv_R010YNN_partial_25_1458,
  rs_R010_ueqv_R010YNN_partial_25_1459,
  rs_R010_ueqv_R010YNN_partial_25_1460,
  rs_R010_ueqv_R010YNN_partial_25_1461,
  rs_R010_ueqv_R010YNN_partial_25_1462,
  rs_R010_ueqv_R010YNN_partial_25_1463,
  rs_R010_ueqv_R010YNN_partial_25_1464,
  rs_R010_ueqv_R010YNN_partial_25_1465,
  rs_R010_ueqv_R010YNN_partial_25_1466,
  rs_R010_ueqv_R010YNN_partial_25_1467,
  rs_R010_ueqv_R010YNN_partial_25_1468,
  rs_R010_ueqv_R010YNN_partial_25_1469,
  rs_R010_ueqv_R010YNN_partial_25_1470,
  rs_R010_ueqv_R010YNN_partial_25_1471,
  rs_R010_ueqv_R010YNN_partial_25_1472,
  rs_R010_ueqv_R010YNN_partial_25_1473,
  rs_R010_ueqv_R010YNN_partial_25_1474,
  rs_R010_ueqv_R010YNN_partial_25_1475,
  rs_R010_ueqv_R010YNN_partial_25_1476,
  rs_R010_ueqv_R010YNN_partial_25_1477,
  rs_R010_ueqv_R010YNN_partial_25_1478,
  rs_R010_ueqv_R010YNN_partial_25_1479,
  rs_R010_ueqv_R010YNN_partial_25_1480,
  rs_R010_ueqv_R010YNN_partial_25_1481,
  rs_R010_ueqv_R010YNN_partial_25_1482,
  rs_R010_ueqv_R010YNN_partial_25_1483,
  rs_R010_ueqv_R010YNN_partial_25_1484,
  rs_R010_ueqv_R010YNN_partial_25_1485,
  rs_R010_ueqv_R010YNN_partial_25_1486,
  rs_R010_ueqv_R010YNN_partial_25_1487,
  rs_R010_ueqv_R010YNN_partial_25_1488,
  rs_R010_ueqv_R010YNN_partial_25_1489,
  rs_R010_ueqv_R010YNN_partial_25_1490,
  rs_R010_ueqv_R010YNN_partial_25_1491,
  rs_R010_ueqv_R010YNN_partial_25_1492,
  rs_R010_ueqv_R010YNN_partial_25_1493,
  rs_R010_ueqv_R010YNN_partial_25_1494,
  rs_R010_ueqv_R010YNN_partial_25_1495,
  rs_R010_ueqv_R010YNN_partial_25_1496,
  rs_R010_ueqv_R010YNN_partial_25_1497,
  rs_R010_ueqv_R010YNN_partial_25_1498,
  rs_R010_ueqv_R010YNN_partial_25_1499
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1400_1499 : Poly :=
[
  term ((-107091331623700480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3702641550847708952992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((53545665811850240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1344344784214261760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-672172392107130880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((684723763646218240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-521146146567925760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((44530814236525957888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((172821387609963929704 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22265407118262978944 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-86410693804981964852 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-318917266530251870156 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((80046816113687258756 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((12033302598862523296 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((159458633265125935078 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-43031733706559260202 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((9993356124646974244 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-356378343695226596 : Rat) / 53898264945705951) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((115796023708945215488 : Rat) / 89830441576176585) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4996678062323487122 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((178189171847613298 : Rat) / 53898264945705951) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58077672737624960914 : Rat) / 89830441576176585) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((658929702405729920 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((10955545468596454528 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((158648048355215488 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((483182297728022828392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-2905870456839938048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1452935228419969024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4453625801680596992 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-40140953174964468992 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2226812900840298496 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((20070476587482234496 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2167082394869803904 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1347123967348210304 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5278098906746795008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1083541197434901952 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-701161224335616704 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-247383208171807385536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-788512560822757760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((38668458998334513808 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((123691604085903692768 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((394256280411378880 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53121204641732343592 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-20335639997012538496 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((10167819998506269248 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((928314980399349760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((83943818033361678848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((30145691279780519168 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((199037647051076919808 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (12, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(4, 1), (5, 2), (12, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-1401541829042215168 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (12, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (12, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-68360739906688179908 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((12153328227362041984 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (16, 1)],
  term (2 : Rat) [(4, 2), (12, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1400 through 1499. -/
theorem rs_R010_ueqv_R010YNN_block_25_1400_1499_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1400_1499
      rs_R010_ueqv_R010YNN_block_25_1400_1499 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
