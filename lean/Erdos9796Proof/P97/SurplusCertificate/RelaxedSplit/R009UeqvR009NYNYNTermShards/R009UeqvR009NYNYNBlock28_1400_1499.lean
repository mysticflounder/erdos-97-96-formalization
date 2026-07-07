/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1400-1499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1400 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1400 : Poly :=
[
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1400 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1400 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1400_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1400
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1401 : Poly :=
[
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1401 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1401 : Poly :=
[
  term ((-5598979460486274884512 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2799489730243137442256 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1401_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1401
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1402 : Poly :=
[
  term ((-9330634850797974349272814272167598210973281305336936520051326454557685780336517621 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1402 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1402 : Poly :=
[
  term ((9330634850797974349272814272167598210973281305336936520051326454557685780336517621 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9330634850797974349272814272167598210973281305336936520051326454557685780336517621 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1402_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1402
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1403 : Poly :=
[
  term ((-13465960750611664749872356 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1403 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1403 : Poly :=
[
  term ((13465960750611664749872356 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26931921501223329499744712 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1403_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1403
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1404 : Poly :=
[
  term ((-81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1404 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1404 : Poly :=
[
  term ((-163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1404_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1404
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1405 : Poly :=
[
  term ((-4475284955904352474328 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1405 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1405 : Poly :=
[
  term ((-8950569911808704948656 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4475284955904352474328 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1405_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1405
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1406 : Poly :=
[
  term ((-81679522433246872761041564 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1406 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1406 : Poly :=
[
  term ((-163359044866493745522083128 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((81679522433246872761041564 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1406_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1406
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1407 : Poly :=
[
  term ((19308476416009194711647193639460184574027989358119622816568769996457241757052310261 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (12, 2)]
]

/-- Partial product 1407 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1407 : Poly :=
[
  term ((-19308476416009194711647193639460184574027989358119622816568769996457241757052310261 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (12, 2)],
  term ((19308476416009194711647193639460184574027989358119622816568769996457241757052310261 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1407_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1407
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1408 : Poly :=
[
  term ((494130539801094265859537255076078965976364 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

/-- Partial product 1408 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1408 : Poly :=
[
  term ((-494130539801094265859537255076078965976364 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1408_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1408
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1409 : Poly :=
[
  term ((13402653249941324801184 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1409 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1409 : Poly :=
[
  term ((-13402653249941324801184 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1409_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1409
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1410 : Poly :=
[
  term ((56183212219220270878328792 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1410 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1410 : Poly :=
[
  term ((112366424438440541756657584 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-56183212219220270878328792 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1410_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1410
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1411 : Poly :=
[
  term ((-988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 3)]
]

/-- Partial product 1411 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1411 : Poly :=
[
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 3)],
  term ((-1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1411_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1411
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1412 : Poly :=
[
  term ((-26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 3), (16, 1)]
]

/-- Partial product 1412 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1412 : Poly :=
[
  term ((-53610612999765299204736 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1412_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1412
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1413 : Poly :=
[
  term ((406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 14180167563728533805473225481174908264192400441082825831123390757173450) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1413 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1413 : Poly :=
[
  term ((-406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 14180167563728533805473225481174908264192400441082825831123390757173450) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 7090083781864266902736612740587454132096200220541412915561695378586725) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1413_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1413
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1414 : Poly :=
[
  term ((975614522236836982092 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1414 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1414 : Poly :=
[
  term ((-975614522236836982092 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1951229044473673964184 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1414_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1414
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1415 : Poly :=
[
  term ((406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 28360335127457067610946450962349816528384800882165651662246781514346900) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1415 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1415 : Poly :=
[
  term ((406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 14180167563728533805473225481174908264192400441082825831123390757173450) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 28360335127457067610946450962349816528384800882165651662246781514346900) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1415_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1415
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1416 : Poly :=
[
  term ((487807261118418491046 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1416 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1416 : Poly :=
[
  term ((975614522236836982092 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-487807261118418491046 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1416_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1416
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1417 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2)]
]

/-- Partial product 1417 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1417 : Poly :=
[
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2)],
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1417_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1417
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1418 : Poly :=
[
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1418 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1418 : Poly :=
[
  term ((-2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1418_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1418
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1419 : Poly :=
[
  term ((5598979460486274884512 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1419 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1419 : Poly :=
[
  term ((-5598979460486274884512 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1419_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1419
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1420 : Poly :=
[
  term ((2799489730243137442256 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1420 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1420 : Poly :=
[
  term ((5598979460486274884512 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1420_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1420
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1421 : Poly :=
[
  term ((-121821996009723923941023370248108956873511807187561145642412497421819289462127567 : Rat) / 845469883748740798088874057715572489255867820986860278132692840033488376864000) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 1421 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1421 : Poly :=
[
  term ((121821996009723923941023370248108956873511807187561145642412497421819289462127567 : Rat) / 845469883748740798088874057715572489255867820986860278132692840033488376864000) [(3, 1), (11, 1), (14, 1)],
  term ((-121821996009723923941023370248108956873511807187561145642412497421819289462127567 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(3, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1421_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1421
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1422 : Poly :=
[
  term ((-6120770401325508647008628 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1422 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1422 : Poly :=
[
  term ((6120770401325508647008628 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-12241540802651017294017256 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1422_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1422
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1423 : Poly :=
[
  term ((19676871468461219947266677 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1423 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1423 : Poly :=
[
  term ((39353742936922439894533354 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19676871468461219947266677 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1423_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1423
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1424 : Poly :=
[
  term ((-7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 1424 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1424 : Poly :=
[
  term ((7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (12, 1), (13, 1)],
  term ((-14048629605433846003155839212410232785395307551178928395910228016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1424_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1424
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1425 : Poly :=
[
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1425 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1425 : Poly :=
[
  term ((947205775985956213632 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-473602887992978106816 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1425_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1425
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1426 : Poly :=
[
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 1426 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1426 : Poly :=
[
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1426_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1426
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1427 : Poly :=
[
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1427 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1427 : Poly :=
[
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1427_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1427
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1428 : Poly :=
[
  term ((5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1)]
]

/-- Partial product 1428 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1428 : Poly :=
[
  term ((-5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1)],
  term ((10037102181595908004515576333914777365064290138145122254455680016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1428_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1428
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1429 : Poly :=
[
  term ((10037102181595908004515576333914777365064290138145122254455680016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 1429 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1429 : Poly :=
[
  term ((-10037102181595908004515576333914777365064290138145122254455680016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((20074204363191816009031152667829554730128580276290244508911360032 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1429_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1429
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1430 : Poly :=
[
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1430 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1430 : Poly :=
[
  term ((947205775985956213632 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1894411551971912427264 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1430_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1430
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1431 : Poly :=
[
  term ((-473602887992978106816 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1431 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1431 : Poly :=
[
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1431_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1431
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1432 : Poly :=
[
  term ((-18619779252293670234982543101902930676783664732367403316578301478663564047779981302621 : Rat) / 5144966065905670669970161599218497121285040979978707079196813495883787936009728000) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 1432 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1432 : Poly :=
[
  term ((18619779252293670234982543101902930676783664732367403316578301478663564047779981302621 : Rat) / 5144966065905670669970161599218497121285040979978707079196813495883787936009728000) [(3, 1), (12, 1), (13, 1)],
  term ((-18619779252293670234982543101902930676783664732367403316578301478663564047779981302621 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1432_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1432
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1433 : Poly :=
[
  term ((-618406055169187573216074014707711645406579288876818425629588342363557709941607860087 : Rat) / 321560379119104416873135099951156070080315061248669192449800843492736746000608000) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1433 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1433 : Poly :=
[
  term ((618406055169187573216074014707711645406579288876818425629588342363557709941607860087 : Rat) / 321560379119104416873135099951156070080315061248669192449800843492736746000608000) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-618406055169187573216074014707711645406579288876818425629588342363557709941607860087 : Rat) / 160780189559552208436567549975578035040157530624334596224900421746368373000304000) [(3, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1433_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1433
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1434 : Poly :=
[
  term ((-25150395995012484207755243 : Rat) / 505089662006121164582442) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1434 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1434 : Poly :=
[
  term ((25150395995012484207755243 : Rat) / 505089662006121164582442) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25150395995012484207755243 : Rat) / 252544831003060582291221) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1434_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1434
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1435 : Poly :=
[
  term ((5013974707116274539272774761607831078256692865392050769212844210040045586831 : Rat) / 50844408816505030812904797285300751072088271021546580300076029898921122320) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1435 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1435 : Poly :=
[
  term ((5013974707116274539272774761607831078256692865392050769212844210040045586831 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5013974707116274539272774761607831078256692865392050769212844210040045586831 : Rat) / 50844408816505030812904797285300751072088271021546580300076029898921122320) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1435_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1435
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1436 : Poly :=
[
  term ((14246396405003149315162 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1436 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1436 : Poly :=
[
  term ((28492792810006298630324 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14246396405003149315162 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1436_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1436
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1437 : Poly :=
[
  term ((-474604650764100400064280197 : Rat) / 5050896620061211645824420) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1437 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1437 : Poly :=
[
  term ((-474604650764100400064280197 : Rat) / 2525448310030605822912210) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((474604650764100400064280197 : Rat) / 5050896620061211645824420) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1437_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1437
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1438 : Poly :=
[
  term ((50785110714791278157798953984664901048766649488355887709626887181 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1438 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1438 : Poly :=
[
  term ((50785110714791278157798953984664901048766649488355887709626887181 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-50785110714791278157798953984664901048766649488355887709626887181 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1438_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1438
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1439 : Poly :=
[
  term ((4203476630192060293306 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1439 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1439 : Poly :=
[
  term ((8406953260384120586612 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4203476630192060293306 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1439_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1439
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1440 : Poly :=
[
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (12, 1), (13, 3)]
]

/-- Partial product 1440 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1440 : Poly :=
[
  term ((1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (12, 1), (13, 3)],
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (12, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1440_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1440
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1441 : Poly :=
[
  term ((35418544759331186040882018855762742385715595583037385734780338889997401478437341 : Rat) / 26116799969064056396264748090348465492694731664288397088960888819112452403200) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1441 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1441 : Poly :=
[
  term ((-35418544759331186040882018855762742385715595583037385734780338889997401478437341 : Rat) / 26116799969064056396264748090348465492694731664288397088960888819112452403200) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((35418544759331186040882018855762742385715595583037385734780338889997401478437341 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(3, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1441_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1441
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1442 : Poly :=
[
  term ((1019325842984925151997 : Rat) / 25639286051800158948) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1442 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1442 : Poly :=
[
  term ((-1019325842984925151997 : Rat) / 25639286051800158948) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1019325842984925151997 : Rat) / 12819643025900079474) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1442_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1442
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1443 : Poly :=
[
  term ((511431128575261108824301185737694447051290504145911657780065023807949494852758723 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 1443 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1443 : Poly :=
[
  term ((511431128575261108824301185737694447051290504145911657780065023807949494852758723 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-511431128575261108824301185737694447051290504145911657780065023807949494852758723 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1443_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1443
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1444 : Poly :=
[
  term ((5612913599711474218219 : Rat) / 32049107564750198685) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1444 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1444 : Poly :=
[
  term ((11225827199422948436438 : Rat) / 32049107564750198685) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5612913599711474218219 : Rat) / 32049107564750198685) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1444_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1444
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1445 : Poly :=
[
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 1445 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1445 : Poly :=
[
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1445_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1445
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1446 : Poly :=
[
  term ((-25667968590396 : Rat) / 88461357636043) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1446 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1446 : Poly :=
[
  term ((-51335937180792 : Rat) / 88461357636043) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((25667968590396 : Rat) / 88461357636043) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1446_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1446
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1447 : Poly :=
[
  term ((-187431402278715565637079096410812960446646646184833584252215547288969020159321994093 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(3, 1), (12, 2), (13, 1)]
]

/-- Partial product 1447 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1447 : Poly :=
[
  term ((187431402278715565637079096410812960446646646184833584252215547288969020159321994093 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(3, 1), (12, 2), (13, 1)],
  term ((-187431402278715565637079096410812960446646646184833584252215547288969020159321994093 : Rat) / 120585142169664156327425662481683526280118147968250947168675316309776279750228000) [(3, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1447_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1447
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1448 : Poly :=
[
  term ((-959541265129155854369091337903367459817163 : Rat) / 791343499512958963364257363527315985710) [(3, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1448 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1448 : Poly :=
[
  term ((959541265129155854369091337903367459817163 : Rat) / 791343499512958963364257363527315985710) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1448_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1448
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1449 : Poly :=
[
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1449 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1449 : Poly :=
[
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1449_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1449
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1450 : Poly :=
[
  term ((64408640901071785456245749 : Rat) / 3788172465045908734368315) [(3, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1450 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1450 : Poly :=
[
  term ((128817281802143570912491498 : Rat) / 3788172465045908734368315) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-64408640901071785456245749 : Rat) / 3788172465045908734368315) [(3, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1450_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1450
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1451 : Poly :=
[
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 86377385983676209950513306766097293126156129219195040553717386316) [(3, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1451 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1451 : Poly :=
[
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 86377385983676209950513306766097293126156129219195040553717386316) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1451_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1451
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1452 : Poly :=
[
  term ((48773959882868088 : Rat) / 7342292683791569) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1452 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1452 : Poly :=
[
  term ((-48773959882868088 : Rat) / 7342292683791569) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1452_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1452
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1453 : Poly :=
[
  term ((14148972444303125797176016586707755407632600508864114285220543261730450209574519 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 1453 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1453 : Poly :=
[
  term ((14148972444303125797176016586707755407632600508864114285220543261730450209574519 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-14148972444303125797176016586707755407632600508864114285220543261730450209574519 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1453_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1453
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1454 : Poly :=
[
  term ((-2848189322899762224701 : Rat) / 64098215129500397370) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1454 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1454 : Poly :=
[
  term ((-2848189322899762224701 : Rat) / 32049107564750198685) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2848189322899762224701 : Rat) / 64098215129500397370) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1454_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1454
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1455 : Poly :=
[
  term ((959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 3), (13, 1)]
]

/-- Partial product 1455 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1455 : Poly :=
[
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 3), (13, 1)],
  term ((1919082530258311708738182675806734919634326 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1455_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1455
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1455 := by
  native_decide

/-- Coefficient term 1456 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1456 : Poly :=
[
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 3), (13, 1), (16, 1)]
]

/-- Partial product 1456 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1456 : Poly :=
[
  term ((316894943696178215242976 : Rat) / 4339258264657398321155) [(3, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1456 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1456_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1456
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1456 := by
  native_decide

/-- Coefficient term 1457 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1457 : Poly :=
[
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 3), (15, 1)]
]

/-- Partial product 1457 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1457 : Poly :=
[
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 21594346495919052487628326691524323281539032304798760138429346579) [(3, 1), (12, 3), (14, 1), (15, 1)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1457 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1457_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1457
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1457 := by
  native_decide

/-- Coefficient term 1458 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1458 : Poly :=
[
  term ((-97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 1458 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1458 : Poly :=
[
  term ((-195095839531472352 : Rat) / 7342292683791569) [(3, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1458 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1458_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1458
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1458 := by
  native_decide

/-- Coefficient term 1459 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1459 : Poly :=
[
  term ((609841861589995678442324833536310758350753058032943791978900018602202412908567915101 : Rat) / 2128951475547174070332480661745585015704154888267051205184888343124326042486784000) [(3, 1), (13, 1)]
]

/-- Partial product 1459 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1459 : Poly :=
[
  term ((-609841861589995678442324833536310758350753058032943791978900018602202412908567915101 : Rat) / 2128951475547174070332480661745585015704154888267051205184888343124326042486784000) [(3, 1), (13, 1)],
  term ((609841861589995678442324833536310758350753058032943791978900018602202412908567915101 : Rat) / 1064475737773587035166240330872792507852077444133525602592444171562163021243392000) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1459 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1459_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1459
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1459 := by
  native_decide

/-- Coefficient term 1460 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1460 : Poly :=
[
  term ((8474177609866721292003041792423016941689865894697560483096616625468817705954669048687 : Rat) / 4409970913633432002831567085044426103958606554267463210740125853614675373722624000) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 1460 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1460 : Poly :=
[
  term ((-8474177609866721292003041792423016941689865894697560483096616625468817705954669048687 : Rat) / 4409970913633432002831567085044426103958606554267463210740125853614675373722624000) [(3, 1), (13, 1), (14, 1)],
  term ((8474177609866721292003041792423016941689865894697560483096616625468817705954669048687 : Rat) / 2204985456816716001415783542522213051979303277133731605370062926807337686861312000) [(3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1460 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1460_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1460
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1460 := by
  native_decide

/-- Coefficient term 1461 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1461 : Poly :=
[
  term ((-10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1461 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1461 : Poly :=
[
  term ((10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(3, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1461 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1461_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1461
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1461 := by
  native_decide

/-- Coefficient term 1462 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1462 : Poly :=
[
  term ((317842298394687 : Rat) / 1048898954827367) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1462 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1462 : Poly :=
[
  term ((-317842298394687 : Rat) / 1048898954827367) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((635684596789374 : Rat) / 1048898954827367) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1462 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1462_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1462
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1462 := by
  native_decide

/-- Coefficient term 1463 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1463 : Poly :=
[
  term ((1394096613649126549013293787 : Rat) / 30305379720367269874946520) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1463 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1463 : Poly :=
[
  term ((-1394096613649126549013293787 : Rat) / 30305379720367269874946520) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1394096613649126549013293787 : Rat) / 15152689860183634937473260) [(3, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1463 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1463_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1463
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1463 := by
  native_decide

/-- Coefficient term 1464 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1464 : Poly :=
[
  term ((-10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 460679391912939786402737636085852230006166022502373549619826060352) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 1464 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1464 : Poly :=
[
  term ((-10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 460679391912939786402737636085852230006166022502373549619826060352) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1464 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1464_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1464
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1464 := by
  native_decide

/-- Coefficient term 1465 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1465 : Poly :=
[
  term ((317842298394687 : Rat) / 2097797909654734) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1465 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1465 : Poly :=
[
  term ((317842298394687 : Rat) / 1048898954827367) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-317842298394687 : Rat) / 2097797909654734) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1465 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1465_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1465
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1465 := by
  native_decide

/-- Coefficient term 1466 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1466 : Poly :=
[
  term ((72575553300176642736079387 : Rat) / 12122151888146907949978608) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 1466 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1466 : Poly :=
[
  term ((72575553300176642736079387 : Rat) / 6061075944073453974989304) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72575553300176642736079387 : Rat) / 12122151888146907949978608) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1466 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1466_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1466
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1466 := by
  native_decide

/-- Coefficient term 1467 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1467 : Poly :=
[
  term ((-10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 118538748422992785460186838072759668382251574643108708439283664) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1467 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1467 : Poly :=
[
  term ((10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 118538748422992785460186838072759668382251574643108708439283664) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 59269374211496392730093419036379834191125787321554354219641832) [(3, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1467 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1467_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1467
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1467 := by
  native_decide

/-- Coefficient term 1468 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1468 : Poly :=
[
  term ((-22698052023976948911 : Rat) / 17711258223091421719) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1468 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1468 : Poly :=
[
  term ((22698052023976948911 : Rat) / 17711258223091421719) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-45396104047953897822 : Rat) / 17711258223091421719) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1468 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1468_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1468
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1468 := by
  native_decide

/-- Coefficient term 1469 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1469 : Poly :=
[
  term ((-10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 237077496845985570920373676145519336764503149286217416878567328) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 1469 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1469 : Poly :=
[
  term ((-10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 118538748422992785460186838072759668382251574643108708439283664) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 237077496845985570920373676145519336764503149286217416878567328) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1469 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1469_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1469
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1469 := by
  native_decide

/-- Coefficient term 1470 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1470 : Poly :=
[
  term ((-22698052023976948911 : Rat) / 35422516446182843438) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1470 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1470 : Poly :=
[
  term ((-22698052023976948911 : Rat) / 17711258223091421719) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((22698052023976948911 : Rat) / 35422516446182843438) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1470 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1470_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1470
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1470 := by
  native_decide

/-- Coefficient term 1471 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1471 : Poly :=
[
  term ((1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3)]
]

/-- Partial product 1471 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1471 : Poly :=
[
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1471 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1471_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1471
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1471 := by
  native_decide

/-- Coefficient term 1472 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1472 : Poly :=
[
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3), (14, 1)]
]

/-- Partial product 1472 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1472 : Poly :=
[
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3), (14, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1472 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1472_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1472
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1472 := by
  native_decide

/-- Coefficient term 1473 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1473 : Poly :=
[
  term ((-1067396936902117880236820460972717384435875221670935449176565138513734740949480507 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 1473 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1473 : Poly :=
[
  term ((1067396936902117880236820460972717384435875221670935449176565138513734740949480507 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(3, 1), (14, 1), (15, 1)],
  term ((-1067396936902117880236820460972717384435875221670935449176565138513734740949480507 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1473 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1473_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1473
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1473 := by
  native_decide

/-- Coefficient term 1474 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1474 : Poly :=
[
  term ((-20720132348600431235777 : Rat) / 512785721036003178960) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1474 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1474 : Poly :=
[
  term ((20720132348600431235777 : Rat) / 512785721036003178960) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20720132348600431235777 : Rat) / 256392860518001589480) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1474 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1474_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1474
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1474 := by
  native_decide

/-- Coefficient term 1475 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1475 : Poly :=
[
  term ((-5383083736726780452349244078144956378364861935088567150385437962811577180922525 : Rat) / 2785791996700166015601573129637169652554104710857429022822494807371994923008) [(3, 1), (15, 1)]
]

/-- Partial product 1475 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1475 : Poly :=
[
  term ((-5383083736726780452349244078144956378364861935088567150385437962811577180922525 : Rat) / 1392895998350083007800786564818584826277052355428714511411247403685997461504) [(3, 1), (14, 1), (15, 1)],
  term ((5383083736726780452349244078144956378364861935088567150385437962811577180922525 : Rat) / 2785791996700166015601573129637169652554104710857429022822494807371994923008) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1475 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1475_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1475
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1475 := by
  native_decide

/-- Coefficient term 1476 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1476 : Poly :=
[
  term ((-2725673841164654452103 : Rat) / 68371429471467090528) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1476 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1476 : Poly :=
[
  term ((-2725673841164654452103 : Rat) / 34185714735733545264) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2725673841164654452103 : Rat) / 68371429471467090528) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1476 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1476_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1476
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1476 := by
  native_decide

/-- Coefficient term 1477 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1477 : Poly :=
[
  term ((245089056955448753827612020721708364142321090804309069908134504293755693741504977 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 2)]
]

/-- Partial product 1477 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1477 : Poly :=
[
  term ((-245089056955448753827612020721708364142321090804309069908134504293755693741504977 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 2)],
  term ((245089056955448753827612020721708364142321090804309069908134504293755693741504977 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1477 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1477_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1477
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1477 := by
  native_decide

/-- Coefficient term 1478 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1478 : Poly :=
[
  term ((1609482418193252636710632663811785753505959613877452800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1)]
]

/-- Partial product 1478 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1478 : Poly :=
[
  term ((-1609482418193252636710632663811785753505959613877452800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1)],
  term ((3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1478 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1478_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1478
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1478 := by
  native_decide

/-- Coefficient term 1479 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1479 : Poly :=
[
  term ((-6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 1479 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1479 : Poly :=
[
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-12875859345546021093685061310494286028047676911019622400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1479 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1479_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1479
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1479 := by
  native_decide

/-- Coefficient term 1480 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1480 : Poly :=
[
  term ((3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 1480 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1480 : Poly :=
[
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1480 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1480_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1480
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1480 := by
  native_decide

/-- Coefficient term 1481 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1481 : Poly :=
[
  term ((3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 1481 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1481 : Poly :=
[
  term ((6907362044746042565883131848858913858796410009557401600 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1481 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1481_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1481
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1481 := by
  native_decide

/-- Coefficient term 1482 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1482 : Poly :=
[
  term ((-1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1482 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1482 : Poly :=
[
  term ((1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1482 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1482_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1482
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1482 := by
  native_decide

/-- Coefficient term 1483 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1483 : Poly :=
[
  term ((-863420255593255320735391481107364232349551251194675200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 1483 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1483 : Poly :=
[
  term ((-1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((863420255593255320735391481107364232349551251194675200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1483 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1483_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1483
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1483 := by
  native_decide

/-- Coefficient term 1484 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1484 : Poly :=
[
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 340616000598160244724040473195354762592007998209178418692887515378016000) [(3, 2), (8, 1)]
]

/-- Partial product 1484 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1484 : Poly :=
[
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 340616000598160244724040473195354762592007998209178418692887515378016000) [(3, 2), (8, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(3, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1484 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1484_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1484
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1484 := by
  native_decide

/-- Coefficient term 1485 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1485 : Poly :=
[
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(3, 2), (8, 1), (12, 1)]
]

/-- Partial product 1485 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1485 : Poly :=
[
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(3, 2), (8, 1), (12, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 42577000074770030590505059149419345324000999776147302336610939422252000) [(3, 2), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1485 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1485_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1485
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1485 := by
  native_decide

/-- Coefficient term 1486 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1486 : Poly :=
[
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 1486 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1486 : Poly :=
[
  term ((-85184708823587271392 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1486 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1486_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1486
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1486 := by
  native_decide

/-- Coefficient term 1487 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1487 : Poly :=
[
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(3, 2), (8, 1), (14, 1)]
]

/-- Partial product 1487 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1487 : Poly :=
[
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(3, 2), (8, 1), (14, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(3, 2), (8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1487 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1487_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1487
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1487 := by
  native_decide

/-- Coefficient term 1488 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1488 : Poly :=
[
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 1488 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1488 : Poly :=
[
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1488 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1488_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1488
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1488 := by
  native_decide

/-- Coefficient term 1489 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1489 : Poly :=
[
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (16, 1)]
]

/-- Partial product 1489 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1489 : Poly :=
[
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1489 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1489_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1489
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1489 := by
  native_decide

/-- Coefficient term 1490 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1490 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 4396352775071994240912540908485088809500) [(3, 2), (9, 1), (11, 1)]
]

/-- Partial product 1490 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1490 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 4396352775071994240912540908485088809500) [(3, 2), (9, 1), (11, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1490 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1490_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1490
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1490 := by
  native_decide

/-- Coefficient term 1491 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1491 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1491 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1491 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-122766201736782921383248439727255513889582 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1491 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1491_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1491
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1491 := by
  native_decide

/-- Coefficient term 1492 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1492 : Poly :=
[
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1492 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1492 : Poly :=
[
  term ((3759555509742011600736 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1492 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1492_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1492
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1492 := by
  native_decide

/-- Coefficient term 1493 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1493 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1493 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1493 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1493 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1493_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1493
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1493 := by
  native_decide

/-- Coefficient term 1494 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1494 : Poly :=
[
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1494 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1494 : Poly :=
[
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1494 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1494_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1494
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1494 := by
  native_decide

/-- Coefficient term 1495 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1495 : Poly :=
[
  term ((-469944438717751450092 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1495 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1495 : Poly :=
[
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((469944438717751450092 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1495 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1495_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1495
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1495 := by
  native_decide

/-- Coefficient term 1496 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1496 : Poly :=
[
  term ((1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1496 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1496 : Poly :=
[
  term ((1278871982648117439859095448076099120671183 : Rat) / 9891793743911987042053217044091449821375) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1496 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1496_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1496
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1496 := by
  native_decide

/-- Coefficient term 1497 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1497 : Poly :=
[
  term ((-2175766321403526012888 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1497 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1497 : Poly :=
[
  term ((-4351532642807052025776 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2175766321403526012888 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1497 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1497_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1497
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1497 := by
  native_decide

/-- Coefficient term 1498 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1498 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 2), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1498 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1498 : Poly :=
[
  term ((1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(3, 2), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1498 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1498_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1498
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1498 := by
  native_decide

/-- Coefficient term 1499 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1499 : Poly :=
[
  term ((1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1499 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1499 : Poly :=
[
  term ((-1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2175766321403526012888 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1499 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1499_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1499
        rs_R009_ueqv_R009NYNYN_generator_28_1400_1499 =
      rs_R009_ueqv_R009NYNYN_partial_28_1499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1400_1499 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1400,
  rs_R009_ueqv_R009NYNYN_partial_28_1401,
  rs_R009_ueqv_R009NYNYN_partial_28_1402,
  rs_R009_ueqv_R009NYNYN_partial_28_1403,
  rs_R009_ueqv_R009NYNYN_partial_28_1404,
  rs_R009_ueqv_R009NYNYN_partial_28_1405,
  rs_R009_ueqv_R009NYNYN_partial_28_1406,
  rs_R009_ueqv_R009NYNYN_partial_28_1407,
  rs_R009_ueqv_R009NYNYN_partial_28_1408,
  rs_R009_ueqv_R009NYNYN_partial_28_1409,
  rs_R009_ueqv_R009NYNYN_partial_28_1410,
  rs_R009_ueqv_R009NYNYN_partial_28_1411,
  rs_R009_ueqv_R009NYNYN_partial_28_1412,
  rs_R009_ueqv_R009NYNYN_partial_28_1413,
  rs_R009_ueqv_R009NYNYN_partial_28_1414,
  rs_R009_ueqv_R009NYNYN_partial_28_1415,
  rs_R009_ueqv_R009NYNYN_partial_28_1416,
  rs_R009_ueqv_R009NYNYN_partial_28_1417,
  rs_R009_ueqv_R009NYNYN_partial_28_1418,
  rs_R009_ueqv_R009NYNYN_partial_28_1419,
  rs_R009_ueqv_R009NYNYN_partial_28_1420,
  rs_R009_ueqv_R009NYNYN_partial_28_1421,
  rs_R009_ueqv_R009NYNYN_partial_28_1422,
  rs_R009_ueqv_R009NYNYN_partial_28_1423,
  rs_R009_ueqv_R009NYNYN_partial_28_1424,
  rs_R009_ueqv_R009NYNYN_partial_28_1425,
  rs_R009_ueqv_R009NYNYN_partial_28_1426,
  rs_R009_ueqv_R009NYNYN_partial_28_1427,
  rs_R009_ueqv_R009NYNYN_partial_28_1428,
  rs_R009_ueqv_R009NYNYN_partial_28_1429,
  rs_R009_ueqv_R009NYNYN_partial_28_1430,
  rs_R009_ueqv_R009NYNYN_partial_28_1431,
  rs_R009_ueqv_R009NYNYN_partial_28_1432,
  rs_R009_ueqv_R009NYNYN_partial_28_1433,
  rs_R009_ueqv_R009NYNYN_partial_28_1434,
  rs_R009_ueqv_R009NYNYN_partial_28_1435,
  rs_R009_ueqv_R009NYNYN_partial_28_1436,
  rs_R009_ueqv_R009NYNYN_partial_28_1437,
  rs_R009_ueqv_R009NYNYN_partial_28_1438,
  rs_R009_ueqv_R009NYNYN_partial_28_1439,
  rs_R009_ueqv_R009NYNYN_partial_28_1440,
  rs_R009_ueqv_R009NYNYN_partial_28_1441,
  rs_R009_ueqv_R009NYNYN_partial_28_1442,
  rs_R009_ueqv_R009NYNYN_partial_28_1443,
  rs_R009_ueqv_R009NYNYN_partial_28_1444,
  rs_R009_ueqv_R009NYNYN_partial_28_1445,
  rs_R009_ueqv_R009NYNYN_partial_28_1446,
  rs_R009_ueqv_R009NYNYN_partial_28_1447,
  rs_R009_ueqv_R009NYNYN_partial_28_1448,
  rs_R009_ueqv_R009NYNYN_partial_28_1449,
  rs_R009_ueqv_R009NYNYN_partial_28_1450,
  rs_R009_ueqv_R009NYNYN_partial_28_1451,
  rs_R009_ueqv_R009NYNYN_partial_28_1452,
  rs_R009_ueqv_R009NYNYN_partial_28_1453,
  rs_R009_ueqv_R009NYNYN_partial_28_1454,
  rs_R009_ueqv_R009NYNYN_partial_28_1455,
  rs_R009_ueqv_R009NYNYN_partial_28_1456,
  rs_R009_ueqv_R009NYNYN_partial_28_1457,
  rs_R009_ueqv_R009NYNYN_partial_28_1458,
  rs_R009_ueqv_R009NYNYN_partial_28_1459,
  rs_R009_ueqv_R009NYNYN_partial_28_1460,
  rs_R009_ueqv_R009NYNYN_partial_28_1461,
  rs_R009_ueqv_R009NYNYN_partial_28_1462,
  rs_R009_ueqv_R009NYNYN_partial_28_1463,
  rs_R009_ueqv_R009NYNYN_partial_28_1464,
  rs_R009_ueqv_R009NYNYN_partial_28_1465,
  rs_R009_ueqv_R009NYNYN_partial_28_1466,
  rs_R009_ueqv_R009NYNYN_partial_28_1467,
  rs_R009_ueqv_R009NYNYN_partial_28_1468,
  rs_R009_ueqv_R009NYNYN_partial_28_1469,
  rs_R009_ueqv_R009NYNYN_partial_28_1470,
  rs_R009_ueqv_R009NYNYN_partial_28_1471,
  rs_R009_ueqv_R009NYNYN_partial_28_1472,
  rs_R009_ueqv_R009NYNYN_partial_28_1473,
  rs_R009_ueqv_R009NYNYN_partial_28_1474,
  rs_R009_ueqv_R009NYNYN_partial_28_1475,
  rs_R009_ueqv_R009NYNYN_partial_28_1476,
  rs_R009_ueqv_R009NYNYN_partial_28_1477,
  rs_R009_ueqv_R009NYNYN_partial_28_1478,
  rs_R009_ueqv_R009NYNYN_partial_28_1479,
  rs_R009_ueqv_R009NYNYN_partial_28_1480,
  rs_R009_ueqv_R009NYNYN_partial_28_1481,
  rs_R009_ueqv_R009NYNYN_partial_28_1482,
  rs_R009_ueqv_R009NYNYN_partial_28_1483,
  rs_R009_ueqv_R009NYNYN_partial_28_1484,
  rs_R009_ueqv_R009NYNYN_partial_28_1485,
  rs_R009_ueqv_R009NYNYN_partial_28_1486,
  rs_R009_ueqv_R009NYNYN_partial_28_1487,
  rs_R009_ueqv_R009NYNYN_partial_28_1488,
  rs_R009_ueqv_R009NYNYN_partial_28_1489,
  rs_R009_ueqv_R009NYNYN_partial_28_1490,
  rs_R009_ueqv_R009NYNYN_partial_28_1491,
  rs_R009_ueqv_R009NYNYN_partial_28_1492,
  rs_R009_ueqv_R009NYNYN_partial_28_1493,
  rs_R009_ueqv_R009NYNYN_partial_28_1494,
  rs_R009_ueqv_R009NYNYN_partial_28_1495,
  rs_R009_ueqv_R009NYNYN_partial_28_1496,
  rs_R009_ueqv_R009NYNYN_partial_28_1497,
  rs_R009_ueqv_R009NYNYN_partial_28_1498,
  rs_R009_ueqv_R009NYNYN_partial_28_1499
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1400_1499 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-5598979460486274884512 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2799489730243137442256 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((9330634850797974349272814272167598210973281305336936520051326454557685780336517621 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8950569911808704948656 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20832389965536820174586468 : Rat) / 199377498160310986019385) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9330634850797974349272814272167598210973281305336936520051326454557685780336517621 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-26931921501223329499744712 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((4475284955904352474328 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((81679522433246872761041564 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19308476416009194711647193639460184574027989358119622816568769996457241757052310261 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (12, 2)],
  term ((17312908102966950639172317766001667301417047747563085557265281288077330561709151733 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((14380844021605966457889136 : Rat) / 77309642143794055803435) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 2), (14, 2)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-56183212219220270878328792 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 3)],
  term ((-1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 3), (14, 1)],
  term ((-53610612999765299204736 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 7090083781864266902736612740587454132096200220541412915561695378586725) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1951229044473673964184 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-406804295085247924554036557588440271815895509302391111584942292960233979 : Rat) / 28360335127457067610946450962349816528384800882165651662246781514346900) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-487807261118418491046 : Rat) / 867851652931479664231) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(3, 1), (11, 1), (13, 2), (14, 2)],
  term ((11197958920972549769024 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((121821996009723923941023370248108956873511807187561145642412497421819289462127567 : Rat) / 845469883748740798088874057715572489255867820986860278132692840033488376864000) [(3, 1), (11, 1), (14, 1)],
  term ((15158171112749316180513994 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-121821996009723923941023370248108956873511807187561145642412497421819289462127567 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(3, 1), (11, 1), (14, 2)],
  term ((-12241540802651017294017256 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-19676871468461219947266677 : Rat) / 3788172465045908734368315) [(3, 1), (11, 1), (16, 1)],
  term ((7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (12, 1), (13, 1)],
  term ((-14048629605433846003155839212410232785395307551178928395910228016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((947205775985956213632 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-473602887992978106816 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1)],
  term ((20074204363191816009031152667829554730128580276290244508911360032 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (11, 2), (13, 1), (14, 2)],
  term ((-1894411551971912427264 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((18619779252293670234982543101902930676783664732367403316578301478663564047779981302621 : Rat) / 5144966065905670669970161599218497121285040979978707079196813495883787936009728000) [(3, 1), (12, 1), (13, 1)],
  term ((-9594758463817662911757158585432447377916512576387969060730943677021124468945346261 : Rat) / 1805251251194972164901811087445086709222821396483756869893618770485539626670080) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((5013974707116274539272774761607831078256692865392050769212844210040045586831 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((28492792810006298630324 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9180333441816788921723789 : Rat) / 66459166053436995339795) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-618406055169187573216074014707711645406579288876818425629588342363557709941607860087 : Rat) / 160780189559552208436567549975578035040157530624334596224900421746368373000304000) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-25150395995012484207755243 : Rat) / 252544831003060582291221) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5013974707116274539272774761607831078256692865392050769212844210040045586831 : Rat) / 50844408816505030812904797285300751072088271021546580300076029898921122320) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-14246396405003149315162 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((474604650764100400064280197 : Rat) / 5050896620061211645824420) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((50785110714791278157798953984664901048766649488355887709626887181 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((8406953260384120586612 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50785110714791278157798953984664901048766649488355887709626887181 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4203476630192060293306 : Rat) / 13017774793972194963465) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (12, 1), (13, 3)],
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (12, 1), (13, 3), (14, 1)],
  term ((1868631790504388505092794648671964076276584038668459702446358400781810972018848187 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((39806679582767167985767 : Rat) / 128196430259000794740) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-51335937180792 : Rat) / 88461357636043) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((35418544759331186040882018855762742385715595583037385734780338889997401478437341 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((1019325842984925151997 : Rat) / 12819643025900079474) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-511431128575261108824301185737694447051290504145911657780065023807949494852758723 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 1), (15, 1)],
  term ((-5612913599711474218219 : Rat) / 32049107564750198685) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(3, 1), (12, 1), (15, 3)],
  term ((25667968590396 : Rat) / 88461357636043) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((187431402278715565637079096410812960446646646184833584252215547288969020159321994093 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(3, 1), (12, 2), (13, 1)],
  term ((-41216237884907501898711499682262120383491594950635439259186371761042397075488065693 : Rat) / 120585142169664156327425662481683526280118147968250947168675316309776279750228000) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((39595920652766893277854202 : Rat) / 757634493009181746873663) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 2), (13, 1), (14, 2)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-64408640901071785456245749 : Rat) / 3788172465045908734368315) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-13704296441169363398201004472556286193093139955740969113153477574609167311097481 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-437298236826925918403 : Rat) / 4578443937821456955) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 2), (14, 2), (15, 1)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-14148972444303125797176016586707755407632600508864114285220543261730450209574519 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 2), (15, 1)],
  term ((2848189322899762224701 : Rat) / 64098215129500397370) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 3), (13, 1)],
  term ((1919082530258311708738182675806734919634326 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 3), (13, 1), (14, 1)],
  term ((316894943696178215242976 : Rat) / 4339258264657398321155) [(3, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 21594346495919052487628326691524323281539032304798760138429346579) [(3, 1), (12, 3), (14, 1), (15, 1)],
  term ((-195095839531472352 : Rat) / 7342292683791569) [(3, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 3), (15, 1)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((-609841861589995678442324833536310758350753058032943791978900018602202412908567915101 : Rat) / 2128951475547174070332480661745585015704154888267051205184888343124326042486784000) [(3, 1), (13, 1)],
  term ((-21684286084873528317288475195004222187321470093712267403275112416050965607986569689 : Rat) / 16078018955955220843656754997557803504015753062433459622490042174636837300030400) [(3, 1), (13, 1), (14, 1)],
  term ((-12276414847002896849201153 : Rat) / 360778330004372260416030) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((8474177609866721292003041792423016941689865894697560483096616625468817705954669048687 : Rat) / 2204985456816716001415783542522213051979303277133731605370062926807337686861312000) [(3, 1), (13, 1), (14, 2)],
  term ((-10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((635684596789374 : Rat) / 1048898954827367) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1394096613649126549013293787 : Rat) / 15152689860183634937473260) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((10821122407266851842082742966467955979180987188335806294522143580055 : Rat) / 460679391912939786402737636085852230006166022502373549619826060352) [(3, 1), (13, 1), (15, 2)],
  term ((-317842298394687 : Rat) / 2097797909654734) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72575553300176642736079387 : Rat) / 12122151888146907949978608) [(3, 1), (13, 1), (16, 1)],
  term ((-10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 59269374211496392730093419036379834191125787321554354219641832) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((-45396104047953897822 : Rat) / 17711258223091421719) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((10282048411289830394688570259325815337121665662393555145537609381 : Rat) / 237077496845985570920373676145519336764503149286217416878567328) [(3, 1), (13, 2), (15, 1)],
  term ((22698052023976948911 : Rat) / 35422516446182843438) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (13, 3), (14, 2)],
  term ((-14863429130787887334283532317681894647671062562301206753405845274071979717132287 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(3, 1), (14, 1), (15, 1)],
  term ((-2520621908608673193221 : Rat) / 64098215129500397370) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1067396936902117880236820460972717384435875221670935449176565138513734740949480507 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 1), (14, 2), (15, 1)],
  term ((-20720132348600431235777 : Rat) / 256392860518001589480) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((5383083736726780452349244078144956378364861935088567150385437962811577180922525 : Rat) / 2785791996700166015601573129637169652554104710857429022822494807371994923008) [(3, 1), (15, 1)],
  term ((2725673841164654452103 : Rat) / 68371429471467090528) [(3, 1), (15, 1), (16, 1)],
  term ((-245089056955448753827612020721708364142321090804309069908134504293755693741504977 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 2)],
  term ((-1609482418193252636710632663811785753505959613877452800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1)],
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-12875859345546021093685061310494286028047676911019622400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 2), (5, 1), (11, 1), (14, 2)],
  term ((6907362044746042565883131848858913858796410009557401600 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (14, 2), (15, 1)],
  term ((863420255593255320735391481107364232349551251194675200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 2), (5, 1), (15, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 340616000598160244724040473195354762592007998209178418692887515378016000) [(3, 2), (8, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(3, 2), (8, 1), (12, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 42577000074770030590505059149419345324000999776147302336610939422252000) [(3, 2), (8, 1), (12, 1), (14, 1)],
  term ((-85184708823587271392 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(3, 2), (8, 1), (14, 2)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (14, 2), (16, 1)],
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 2), (8, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 4396352775071994240912540908485088809500) [(3, 2), (9, 1), (11, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-122766201736782921383248439727255513889582 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((3759555509742011600736 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (9, 1), (11, 1), (14, 2)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((469944438717751450092 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 9891793743911987042053217044091449821375) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4351532642807052025776 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((2175766321403526012888 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((2175766321403526012888 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((245089056955448753827612020721708364142321090804309069908134504293755693741504977 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1400 through 1499. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1400_1499_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1400_1499
      rs_R009_ueqv_R009NYNYN_block_28_1400_1499 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
