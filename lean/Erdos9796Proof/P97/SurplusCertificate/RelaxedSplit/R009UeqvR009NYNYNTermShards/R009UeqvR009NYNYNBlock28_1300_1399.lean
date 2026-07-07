/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1300-1399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1300 : Poly :=
[
  term ((-168473926473102530003731583097407684556844541383160362603918880536319045418388543 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 1300 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1300 : Poly :=
[
  term ((168473926473102530003731583097407684556844541383160362603918880536319045418388543 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-168473926473102530003731583097407684556844541383160362603918880536319045418388543 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1300_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1300
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1301 : Poly :=
[
  term ((-268022140990933801496465948610263915025989 : Rat) / 3956717497564794816821286817636579928550) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1301 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1301 : Poly :=
[
  term ((268022140990933801496465948610263915025989 : Rat) / 3956717497564794816821286817636579928550) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-268022140990933801496465948610263915025989 : Rat) / 1978358748782397408410643408818289964275) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1301_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1301
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1302 : Poly :=
[
  term ((455990557046237490504 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1302 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1302 : Poly :=
[
  term ((-455990557046237490504 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((911981114092474981008 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1302_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1302
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1303 : Poly :=
[
  term ((880337643550703386932617 : Rat) / 252544831003060582291221) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1303 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1303 : Poly :=
[
  term ((1760675287101406773865234 : Rat) / 252544831003060582291221) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-880337643550703386932617 : Rat) / 252544831003060582291221) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1303_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1303
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1304 : Poly :=
[
  term ((352694614488421859450680360088515772986381 : Rat) / 1130490713589941376234653376467594265300) [(3, 1), (9, 1), (10, 1), (12, 2)]
]

/-- Partial product 1304 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1304 : Poly :=
[
  term ((-352694614488421859450680360088515772986381 : Rat) / 1130490713589941376234653376467594265300) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term ((352694614488421859450680360088515772986381 : Rat) / 565245356794970688117326688233797132650) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1304_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1304
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1305 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)]
]

/-- Partial product 1305 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1305 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1305_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1305
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1306 : Poly :=
[
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1306 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1306 : Poly :=
[
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1306_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1306
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1307 : Poly :=
[
  term ((-300022627110540835908 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

/-- Partial product 1307 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1307 : Poly :=
[
  term ((-600045254221081671816 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((300022627110540835908 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1307_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1307
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1308 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 3)]
]

/-- Partial product 1308 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1308 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 3)],
  term ((-2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1308_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1308
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1309 : Poly :=
[
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 3), (16, 1)]
]

/-- Partial product 1309 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1309 : Poly :=
[
  term ((9505418205450486962784 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 3), (14, 1), (16, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1309_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1309
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1310 : Poly :=
[
  term ((-10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1310 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1310 : Poly :=
[
  term ((10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1310_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1310
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1311 : Poly :=
[
  term ((-2622062932264292573827993 : Rat) / 2525448310030605822912210) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1311 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1311 : Poly :=
[
  term ((2622062932264292573827993 : Rat) / 2525448310030605822912210) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2622062932264292573827993 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1311_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1311
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1312 : Poly :=
[
  term ((-2622062932264292573827993 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1312 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1312 : Poly :=
[
  term ((-5244125864528585147655986 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2622062932264292573827993 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1312_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1312
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1313 : Poly :=
[
  term ((32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1313 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1313 : Poly :=
[
  term ((-32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((65181104695659976368950852661160175790944298441446950316508824126 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1313_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1313
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1314 : Poly :=
[
  term ((-1934306101779058091312 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1314 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1314 : Poly :=
[
  term ((-3868612203558116182624 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1934306101779058091312 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1314_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1314
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1315 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1315 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1315 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1315_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1315
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1316 : Poly :=
[
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1316 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1316 : Poly :=
[
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1316_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1316
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1317 : Poly :=
[
  term ((-21077880216650817382066622664947427632070984375055523800476009286 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1317 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1317 : Poly :=
[
  term ((21077880216650817382066622664947427632070984375055523800476009286 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-42155760433301634764133245329894855264141968750111047600952018572 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1317_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1317
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1318 : Poly :=
[
  term ((-42155760433301634764133245329894855264141968750111047600952018572 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1318 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1318 : Poly :=
[
  term ((42155760433301634764133245329894855264141968750111047600952018572 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-84311520866603269528266490659789710528283937500222095201904037144 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1318_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1318
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1319 : Poly :=
[
  term ((381408385665006389168 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1319 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1319 : Poly :=
[
  term ((-381408385665006389168 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((762816771330012778336 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1319_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1319
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1320 : Poly :=
[
  term ((190704192832503194584 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1320 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1320 : Poly :=
[
  term ((381408385665006389168 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-190704192832503194584 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1320_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1320
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1321 : Poly :=
[
  term ((-380510376087715141069577342504071494045046615182705846731999481807971931333312167 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 1321 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1321 : Poly :=
[
  term ((380510376087715141069577342504071494045046615182705846731999481807971931333312167 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (12, 1)],
  term ((-380510376087715141069577342504071494045046615182705846731999481807971931333312167 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1321_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1321
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1322 : Poly :=
[
  term ((-587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 30264529057443470721967141241250447066719208941396773988140493987453049000) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1322 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1322 : Poly :=
[
  term ((-587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 15132264528721735360983570620625223533359604470698386994070246993726524500) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 30264529057443470721967141241250447066719208941396773988140493987453049000) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1322_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1322
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1323 : Poly :=
[
  term ((-245665066961804878338 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1323 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1323 : Poly :=
[
  term ((-491330133923609756676 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((245665066961804878338 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1323_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1323
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1324 : Poly :=
[
  term ((40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 1324 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1324 : Poly :=
[
  term ((-40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (9, 1), (12, 1), (13, 2)],
  term ((40124413927308229725632498429178187339943 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1324_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1324
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1325 : Poly :=
[
  term ((3312839258305634239384 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1325 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1325 : Poly :=
[
  term ((6625678516611268478768 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3312839258305634239384 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1325_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1325
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1326 : Poly :=
[
  term ((-1027896096670869844683681266269320533942129153001036566958006284831765847392111663 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1326 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1326 : Poly :=
[
  term ((1027896096670869844683681266269320533942129153001036566958006284831765847392111663 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1027896096670869844683681266269320533942129153001036566958006284831765847392111663 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1326_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1326
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1327 : Poly :=
[
  term ((47701344719540887841209063 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1327 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1327 : Poly :=
[
  term ((-47701344719540887841209063 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((47701344719540887841209063 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1327_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1327
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1328 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1328 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1328 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1328_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1328
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1329 : Poly :=
[
  term ((1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1329 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1329 : Poly :=
[
  term ((2175766321403526012888 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1329_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1329
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1330 : Poly :=
[
  term ((34844588964242759033778037 : Rat) / 2525448310030605822912210) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1330 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1330 : Poly :=
[
  term ((34844588964242759033778037 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-34844588964242759033778037 : Rat) / 2525448310030605822912210) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1330_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1330
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1331 : Poly :=
[
  term ((2976608124470626285812548282160821242519423360327355557952055044215035402551600543 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (9, 1), (12, 2)]
]

/-- Partial product 1331 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1331 : Poly :=
[
  term ((-2976608124470626285812548282160821242519423360327355557952055044215035402551600543 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (9, 1), (12, 2)],
  term ((2976608124470626285812548282160821242519423360327355557952055044215035402551600543 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1331_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1331
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1332 : Poly :=
[
  term ((3474203545639783811292668732035443921698293 : Rat) / 6594529162607991361368811362727633214250) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 1332 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1332 : Poly :=
[
  term ((-3474203545639783811292668732035443921698293 : Rat) / 6594529162607991361368811362727633214250) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1332_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1332
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1333 : Poly :=
[
  term ((-17732162024501022419544 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1333 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1333 : Poly :=
[
  term ((17732162024501022419544 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1333_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1333
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1334 : Poly :=
[
  term ((-86401788338014369271863843 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 1334 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1334 : Poly :=
[
  term ((-172803576676028738543727686 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((86401788338014369271863843 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1334_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1334
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1335 : Poly :=
[
  term ((-3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 3)]
]

/-- Partial product 1335 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1335 : Poly :=
[
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 3)],
  term ((-6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1335_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1335
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1336 : Poly :=
[
  term ((35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 3), (16, 1)]
]

/-- Partial product 1336 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1336 : Poly :=
[
  term ((70928648098004089678176 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 3), (14, 1), (16, 1)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1336_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1336
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1337 : Poly :=
[
  term ((169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 4035270540992462762928952165500059608895894525519569865085399198327073200) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1337 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1337 : Poly :=
[
  term ((-169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 4035270540992462762928952165500059608895894525519569865085399198327073200) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 2017635270496231381464476082750029804447947262759784932542699599163536600) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1337_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1337
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1338 : Poly :=
[
  term ((-27572875063453159065 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1338 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1338 : Poly :=
[
  term ((27572875063453159065 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55145750126906318130 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1338_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1338
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1339 : Poly :=
[
  term ((169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 8070541081984925525857904331000119217791789051039139730170798396654146400) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1339 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1339 : Poly :=
[
  term ((169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 4035270540992462762928952165500059608895894525519569865085399198327073200) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 8070541081984925525857904331000119217791789051039139730170798396654146400) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1339_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1339
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1340 : Poly :=
[
  term ((-27572875063453159065 : Rat) / 247957615123279904066) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1340 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1340 : Poly :=
[
  term ((-27572875063453159065 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27572875063453159065 : Rat) / 247957615123279904066) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1340_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1340
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1341 : Poly :=
[
  term ((-40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 1341 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1341 : Poly :=
[
  term ((40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(3, 1), (9, 1), (13, 2)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1341_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1341
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1342 : Poly :=
[
  term ((-40124413927308229725632498429178187339943 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1342 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1342 : Poly :=
[
  term ((40124413927308229725632498429178187339943 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (9, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1342_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1342
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1343 : Poly :=
[
  term ((-1656419629152817119692 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1343 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1343 : Poly :=
[
  term ((1656419629152817119692 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3312839258305634239384 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1343_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1343
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1344 : Poly :=
[
  term ((-828209814576408559846 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 1344 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1344 : Poly :=
[
  term ((-1656419629152817119692 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((828209814576408559846 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1344_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1344
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1345 : Poly :=
[
  term ((-78548017020932428109676086958622286192199458752849663689112558267977878261000819 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 1345 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1345 : Poly :=
[
  term ((78548017020932428109676086958622286192199458752849663689112558267977878261000819 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (9, 1), (14, 1)],
  term ((-78548017020932428109676086958622286192199458752849663689112558267977878261000819 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1345_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1345
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1346 : Poly :=
[
  term ((1030277426548413409813408 : Rat) / 541167495006558390624045) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1346 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1346 : Poly :=
[
  term ((-1030277426548413409813408 : Rat) / 541167495006558390624045) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((2060554853096826819626816 : Rat) / 541167495006558390624045) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1346_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1346
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1347 : Poly :=
[
  term ((-16222037034265348075173481 : Rat) / 15152689860183634937473260) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 1347 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1347 : Poly :=
[
  term ((-16222037034265348075173481 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((16222037034265348075173481 : Rat) / 15152689860183634937473260) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1347_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1347
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1348 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 1348 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1348 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 2), (12, 1), (13, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1348_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1348
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1349 : Poly :=
[
  term ((247164151855212058728 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1349 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1349 : Poly :=
[
  term ((494328303710424117456 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1349_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1349
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1350 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 1350 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1350 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (9, 2), (13, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1350_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1350
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1351 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

/-- Partial product 1351 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1351 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1351_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1351
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1352 : Poly :=
[
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1352 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1352 : Poly :=
[
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1352_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1352
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1353 : Poly :=
[
  term ((-61791037963803014682 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 1353 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1353 : Poly :=
[
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((61791037963803014682 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1353_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1353
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1354 : Poly :=
[
  term ((-88246726602797914545475898920738919516949527261414692478322848383 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 1354 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1354 : Poly :=
[
  term ((88246726602797914545475898920738919516949527261414692478322848383 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 1), (10, 1), (11, 1)],
  term ((-88246726602797914545475898920738919516949527261414692478322848383 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1354_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1354
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1355 : Poly :=
[
  term ((89205938814422643395207982436877050180169762746841297784368841193 : Rat) / 205796438234362474757268816098541090941408983755397063262645250) [(3, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1355 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1355 : Poly :=
[
  term ((-89205938814422643395207982436877050180169762746841297784368841193 : Rat) / 205796438234362474757268816098541090941408983755397063262645250) [(3, 1), (10, 1), (11, 1), (12, 1)],
  term ((89205938814422643395207982436877050180169762746841297784368841193 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1355_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1355
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1356 : Poly :=
[
  term ((2590555565346015381439445536771451470160668541553779221097995316 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1356 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1356 : Poly :=
[
  term ((-2590555565346015381439445536771451470160668541553779221097995316 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((5181111130692030762878891073542902940321337083107558442195990632 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1356_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1356
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1357 : Poly :=
[
  term ((-344655283032824939744 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1357 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1357 : Poly :=
[
  term ((344655283032824939744 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-689310566065649879488 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1357_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1357
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1358 : Poly :=
[
  term ((-4894773035925346746468 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1358 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1358 : Poly :=
[
  term ((-9789546071850693492936 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4894773035925346746468 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1358_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1358
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1359 : Poly :=
[
  term ((-13647504056034942011384414828414404904483821135239693935759550374 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 2)]
]

/-- Partial product 1359 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1359 : Poly :=
[
  term ((13647504056034942011384414828414404904483821135239693935759550374 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 2)],
  term ((-27295008112069884022768829656828809808967642270479387871519100748 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1359_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1359
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1360 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)]
]

/-- Partial product 1360 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1360 : Poly :=
[
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1360_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1360
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1361 : Poly :=
[
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1361 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1361 : Poly :=
[
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1361_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1361
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1362 : Poly :=
[
  term ((226768694801173115888 : Rat) / 17711258223091421719) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1362 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1362 : Poly :=
[
  term ((453537389602346231776 : Rat) / 17711258223091421719) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-226768694801173115888 : Rat) / 17711258223091421719) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1362_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1362
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1363 : Poly :=
[
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 3)]
]

/-- Partial product 1363 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1363 : Poly :=
[
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 3)],
  term ((34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1363_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1363
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1364 : Poly :=
[
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 3), (16, 1)]
]

/-- Partial product 1364 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1364 : Poly :=
[
  term ((-7184562380340495453824 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1364_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1364
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1365 : Poly :=
[
  term ((-79402197844408393364346724444700246999006313909787405821081248383 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1365 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1365 : Poly :=
[
  term ((79402197844408393364346724444700246999006313909787405821081248383 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-79402197844408393364346724444700246999006313909787405821081248383 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1365_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1365
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1366 : Poly :=
[
  term ((136201711073172083818 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1366 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1366 : Poly :=
[
  term ((-136201711073172083818 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((272403422146344167636 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1366_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1366
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1367 : Poly :=
[
  term ((272403422146344167636 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1367 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1367 : Poly :=
[
  term ((544806844292688335272 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-272403422146344167636 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1367_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1367
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1368 : Poly :=
[
  term ((13573157081180174538517279323157033839418421522402984062728145047384434839559399 : Rat) / 174067329007093693724179953059088453670325727850235939615554408242188783472000) [(3, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1368 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1368 : Poly :=
[
  term ((-13573157081180174538517279323157033839418421522402984062728145047384434839559399 : Rat) / 174067329007093693724179953059088453670325727850235939615554408242188783472000) [(3, 1), (10, 1), (12, 1), (13, 1)],
  term ((13573157081180174538517279323157033839418421522402984062728145047384434839559399 : Rat) / 87033664503546846862089976529544226835162863925117969807777204121094391736000) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1368_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1368
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1369 : Poly :=
[
  term ((74025111329999962385803003179524286757499 : Rat) / 474806099707775378018554418116389591426) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1369 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1369 : Poly :=
[
  term ((-74025111329999962385803003179524286757499 : Rat) / 474806099707775378018554418116389591426) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((74025111329999962385803003179524286757499 : Rat) / 237403049853887689009277209058194795713) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1369_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1369
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1370 : Poly :=
[
  term ((6111822476927595069112 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1370 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1370 : Poly :=
[
  term ((-6111822476927595069112 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((12223644953855190138224 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1370_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1370
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1371 : Poly :=
[
  term ((3829208057352146331128951 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1371 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1371 : Poly :=
[
  term ((7658416114704292662257902 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3829208057352146331128951 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1371_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1371
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1372 : Poly :=
[
  term ((817312464464394257503876457363683582907387040999106679163022484923 : Rat) / 4113208856365533807167300322195109196483625200914049550177018396) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1372 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1372 : Poly :=
[
  term ((-817312464464394257503876457363683582907387040999106679163022484923 : Rat) / 4113208856365533807167300322195109196483625200914049550177018396) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((817312464464394257503876457363683582907387040999106679163022484923 : Rat) / 2056604428182766903583650161097554598241812600457024775088509198) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1372_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1372
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1373 : Poly :=
[
  term ((-23493060346536 : Rat) / 1048898954827367) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1373 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1373 : Poly :=
[
  term ((23493060346536 : Rat) / 1048898954827367) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46986120693072 : Rat) / 1048898954827367) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1373_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1373
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1374 : Poly :=
[
  term ((229969719525138404323616111095375502776950944250608190309783139403992597429 : Rat) / 1854464892145539110164220354063598151889821323583304723994609805946976000) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1374 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1374 : Poly :=
[
  term ((229969719525138404323616111095375502776950944250608190309783139403992597429 : Rat) / 927232446072769555082110177031799075944910661791652361997304902973488000) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-229969719525138404323616111095375502776950944250608190309783139403992597429 : Rat) / 1854464892145539110164220354063598151889821323583304723994609805946976000) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1374_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1374
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1375 : Poly :=
[
  term ((-3205227477400656273 : Rat) / 508715993091272995) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1375 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1375 : Poly :=
[
  term ((-6410454954801312546 : Rat) / 508715993091272995) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3205227477400656273 : Rat) / 508715993091272995) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1375_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1375
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1376 : Poly :=
[
  term ((-97410825861136568411964777357649391893171 : Rat) / 135658885630792965148158405176111311836) [(3, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 1376 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1376 : Poly :=
[
  term ((97410825861136568411964777357649391893171 : Rat) / 135658885630792965148158405176111311836) [(3, 1), (10, 1), (12, 2), (13, 1)],
  term ((-97410825861136568411964777357649391893171 : Rat) / 67829442815396482574079202588055655918) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1376_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1376
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1377 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1377 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1377 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1377_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1377
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1378 : Poly :=
[
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1378 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1378 : Poly :=
[
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1378_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1378
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1379 : Poly :=
[
  term ((-4021322388426421012924 : Rat) / 371936422684919856099) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1379 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1379 : Poly :=
[
  term ((-8042644776852842025848 : Rat) / 371936422684919856099) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4021322388426421012924 : Rat) / 371936422684919856099) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1379_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1379
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1380 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1380 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1380 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1380_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1380
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1381 : Poly :=
[
  term ((-850425755199768 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1381 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1381 : Poly :=
[
  term ((850425755199768 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1381_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1381
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1382 : Poly :=
[
  term ((-18499518064414126164244330109389429186240768515831587452993078087633 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(3, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 1382 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1382 : Poly :=
[
  term ((-18499518064414126164244330109389429186240768515831587452993078087633 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((18499518064414126164244330109389429186240768515831587452993078087633 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(3, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1382_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1382
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1383 : Poly :=
[
  term ((-1797161543147916 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1383 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1383 : Poly :=
[
  term ((-3594323086295832 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1797161543147916 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1383_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1383
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1384 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 3), (13, 1)]
]

/-- Partial product 1384 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1384 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 3), (13, 1)],
  term ((771550671415912258681082857570897192444402 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1384_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1384
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1385 : Poly :=
[
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

/-- Partial product 1385 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1385 : Poly :=
[
  term ((127404894121038055617952 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1385_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1385
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1386 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 3), (15, 1)]
]

/-- Partial product 1386 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1386 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(3, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1386_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1386
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1387 : Poly :=
[
  term ((1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 1387 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1387 : Poly :=
[
  term ((3401703020799072 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1387_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1387
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1388 : Poly :=
[
  term ((4167719175295925063729835895474463487059545692286557264081538715513274317724450089 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 1388 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1388 : Poly :=
[
  term ((-4167719175295925063729835895474463487059545692286557264081538715513274317724450089 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 1), (10, 1), (13, 1)],
  term ((4167719175295925063729835895474463487059545692286557264081538715513274317724450089 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1388_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1388
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1389 : Poly :=
[
  term ((1573298411937935410137844764191722440914369383722230610815662282428153440467193 : Rat) / 3698930741400740991638824002505629640494421716817513716830531175146511648780) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1389 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1389 : Poly :=
[
  term ((-1573298411937935410137844764191722440914369383722230610815662282428153440467193 : Rat) / 3698930741400740991638824002505629640494421716817513716830531175146511648780) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((1573298411937935410137844764191722440914369383722230610815662282428153440467193 : Rat) / 1849465370700370495819412001252814820247210858408756858415265587573255824390) [(3, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1389_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1389
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1390 : Poly :=
[
  term ((59608254084485313228876817 : Rat) / 7576344930091817468736630) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1390 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1390 : Poly :=
[
  term ((-59608254084485313228876817 : Rat) / 7576344930091817468736630) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((59608254084485313228876817 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1390_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1390
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1391 : Poly :=
[
  term ((18135926067247587758159311 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1391 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1391 : Poly :=
[
  term ((36271852134495175516318622 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18135926067247587758159311 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1391_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1391
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1392 : Poly :=
[
  term ((93071754276876528650617478525009530204226430228360801418609349023 : Rat) / 153559797304313262134245878695284076668722007500791183206608686784) [(3, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1392 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1392 : Poly :=
[
  term ((-93071754276876528650617478525009530204226430228360801418609349023 : Rat) / 153559797304313262134245878695284076668722007500791183206608686784) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((93071754276876528650617478525009530204226430228360801418609349023 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(3, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1392_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1392
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1393 : Poly :=
[
  term ((1873006292068461 : Rat) / 14684585367583138) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1393 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1393 : Poly :=
[
  term ((-1873006292068461 : Rat) / 14684585367583138) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1873006292068461 : Rat) / 7342292683791569) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1393_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1393
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1394 : Poly :=
[
  term ((8452780697877571740270609860874896825357038179672710978166788776427398228096541 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 1394 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1394 : Poly :=
[
  term ((8452780697877571740270609860874896825357038179672710978166788776427398228096541 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8452780697877571740270609860874896825357038179672710978166788776427398228096541 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1394_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1394
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1395 : Poly :=
[
  term ((169076409087156267461 : Rat) / 9156887875642913910) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1395 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1395 : Poly :=
[
  term ((169076409087156267461 : Rat) / 4578443937821456955) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-169076409087156267461 : Rat) / 9156887875642913910) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1395_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1395
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1396 : Poly :=
[
  term ((4046441870490428229426144113616282337199632054239914370651441577380874774842261277 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 1), (11, 1)]
]

/-- Partial product 1396 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1396 : Poly :=
[
  term ((-4046441870490428229426144113616282337199632054239914370651441577380874774842261277 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 1), (11, 1)],
  term ((4046441870490428229426144113616282337199632054239914370651441577380874774842261277 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1396_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1396
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1397 : Poly :=
[
  term ((-8258076853703846085532222936049460575299539441605437163492651990600081082047970167 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 1397 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1397 : Poly :=
[
  term ((8258076853703846085532222936049460575299539441605437163492651990600081082047970167 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (11, 1), (12, 1)],
  term ((-8258076853703846085532222936049460575299539441605437163492651990600081082047970167 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1397_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1397
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1398 : Poly :=
[
  term ((-854646455612320621717600161920099730193751625366459407766132658949916834889 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1398 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1398 : Poly :=
[
  term ((-1709292911224641243435200323840199460387503250732918815532265317899833669778 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((854646455612320621717600161920099730193751625366459407766132658949916834889 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1398_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1398
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1399 : Poly :=
[
  term ((-5004809905924371035648 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1399 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1399 : Poly :=
[
  term ((-10009619811848742071296 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5004809905924371035648 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1399_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1399
        rs_R009_ueqv_R009NYNYN_generator_28_1300_1399 =
      rs_R009_ueqv_R009NYNYN_partial_28_1399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1300_1399 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1300,
  rs_R009_ueqv_R009NYNYN_partial_28_1301,
  rs_R009_ueqv_R009NYNYN_partial_28_1302,
  rs_R009_ueqv_R009NYNYN_partial_28_1303,
  rs_R009_ueqv_R009NYNYN_partial_28_1304,
  rs_R009_ueqv_R009NYNYN_partial_28_1305,
  rs_R009_ueqv_R009NYNYN_partial_28_1306,
  rs_R009_ueqv_R009NYNYN_partial_28_1307,
  rs_R009_ueqv_R009NYNYN_partial_28_1308,
  rs_R009_ueqv_R009NYNYN_partial_28_1309,
  rs_R009_ueqv_R009NYNYN_partial_28_1310,
  rs_R009_ueqv_R009NYNYN_partial_28_1311,
  rs_R009_ueqv_R009NYNYN_partial_28_1312,
  rs_R009_ueqv_R009NYNYN_partial_28_1313,
  rs_R009_ueqv_R009NYNYN_partial_28_1314,
  rs_R009_ueqv_R009NYNYN_partial_28_1315,
  rs_R009_ueqv_R009NYNYN_partial_28_1316,
  rs_R009_ueqv_R009NYNYN_partial_28_1317,
  rs_R009_ueqv_R009NYNYN_partial_28_1318,
  rs_R009_ueqv_R009NYNYN_partial_28_1319,
  rs_R009_ueqv_R009NYNYN_partial_28_1320,
  rs_R009_ueqv_R009NYNYN_partial_28_1321,
  rs_R009_ueqv_R009NYNYN_partial_28_1322,
  rs_R009_ueqv_R009NYNYN_partial_28_1323,
  rs_R009_ueqv_R009NYNYN_partial_28_1324,
  rs_R009_ueqv_R009NYNYN_partial_28_1325,
  rs_R009_ueqv_R009NYNYN_partial_28_1326,
  rs_R009_ueqv_R009NYNYN_partial_28_1327,
  rs_R009_ueqv_R009NYNYN_partial_28_1328,
  rs_R009_ueqv_R009NYNYN_partial_28_1329,
  rs_R009_ueqv_R009NYNYN_partial_28_1330,
  rs_R009_ueqv_R009NYNYN_partial_28_1331,
  rs_R009_ueqv_R009NYNYN_partial_28_1332,
  rs_R009_ueqv_R009NYNYN_partial_28_1333,
  rs_R009_ueqv_R009NYNYN_partial_28_1334,
  rs_R009_ueqv_R009NYNYN_partial_28_1335,
  rs_R009_ueqv_R009NYNYN_partial_28_1336,
  rs_R009_ueqv_R009NYNYN_partial_28_1337,
  rs_R009_ueqv_R009NYNYN_partial_28_1338,
  rs_R009_ueqv_R009NYNYN_partial_28_1339,
  rs_R009_ueqv_R009NYNYN_partial_28_1340,
  rs_R009_ueqv_R009NYNYN_partial_28_1341,
  rs_R009_ueqv_R009NYNYN_partial_28_1342,
  rs_R009_ueqv_R009NYNYN_partial_28_1343,
  rs_R009_ueqv_R009NYNYN_partial_28_1344,
  rs_R009_ueqv_R009NYNYN_partial_28_1345,
  rs_R009_ueqv_R009NYNYN_partial_28_1346,
  rs_R009_ueqv_R009NYNYN_partial_28_1347,
  rs_R009_ueqv_R009NYNYN_partial_28_1348,
  rs_R009_ueqv_R009NYNYN_partial_28_1349,
  rs_R009_ueqv_R009NYNYN_partial_28_1350,
  rs_R009_ueqv_R009NYNYN_partial_28_1351,
  rs_R009_ueqv_R009NYNYN_partial_28_1352,
  rs_R009_ueqv_R009NYNYN_partial_28_1353,
  rs_R009_ueqv_R009NYNYN_partial_28_1354,
  rs_R009_ueqv_R009NYNYN_partial_28_1355,
  rs_R009_ueqv_R009NYNYN_partial_28_1356,
  rs_R009_ueqv_R009NYNYN_partial_28_1357,
  rs_R009_ueqv_R009NYNYN_partial_28_1358,
  rs_R009_ueqv_R009NYNYN_partial_28_1359,
  rs_R009_ueqv_R009NYNYN_partial_28_1360,
  rs_R009_ueqv_R009NYNYN_partial_28_1361,
  rs_R009_ueqv_R009NYNYN_partial_28_1362,
  rs_R009_ueqv_R009NYNYN_partial_28_1363,
  rs_R009_ueqv_R009NYNYN_partial_28_1364,
  rs_R009_ueqv_R009NYNYN_partial_28_1365,
  rs_R009_ueqv_R009NYNYN_partial_28_1366,
  rs_R009_ueqv_R009NYNYN_partial_28_1367,
  rs_R009_ueqv_R009NYNYN_partial_28_1368,
  rs_R009_ueqv_R009NYNYN_partial_28_1369,
  rs_R009_ueqv_R009NYNYN_partial_28_1370,
  rs_R009_ueqv_R009NYNYN_partial_28_1371,
  rs_R009_ueqv_R009NYNYN_partial_28_1372,
  rs_R009_ueqv_R009NYNYN_partial_28_1373,
  rs_R009_ueqv_R009NYNYN_partial_28_1374,
  rs_R009_ueqv_R009NYNYN_partial_28_1375,
  rs_R009_ueqv_R009NYNYN_partial_28_1376,
  rs_R009_ueqv_R009NYNYN_partial_28_1377,
  rs_R009_ueqv_R009NYNYN_partial_28_1378,
  rs_R009_ueqv_R009NYNYN_partial_28_1379,
  rs_R009_ueqv_R009NYNYN_partial_28_1380,
  rs_R009_ueqv_R009NYNYN_partial_28_1381,
  rs_R009_ueqv_R009NYNYN_partial_28_1382,
  rs_R009_ueqv_R009NYNYN_partial_28_1383,
  rs_R009_ueqv_R009NYNYN_partial_28_1384,
  rs_R009_ueqv_R009NYNYN_partial_28_1385,
  rs_R009_ueqv_R009NYNYN_partial_28_1386,
  rs_R009_ueqv_R009NYNYN_partial_28_1387,
  rs_R009_ueqv_R009NYNYN_partial_28_1388,
  rs_R009_ueqv_R009NYNYN_partial_28_1389,
  rs_R009_ueqv_R009NYNYN_partial_28_1390,
  rs_R009_ueqv_R009NYNYN_partial_28_1391,
  rs_R009_ueqv_R009NYNYN_partial_28_1392,
  rs_R009_ueqv_R009NYNYN_partial_28_1393,
  rs_R009_ueqv_R009NYNYN_partial_28_1394,
  rs_R009_ueqv_R009NYNYN_partial_28_1395,
  rs_R009_ueqv_R009NYNYN_partial_28_1396,
  rs_R009_ueqv_R009NYNYN_partial_28_1397,
  rs_R009_ueqv_R009NYNYN_partial_28_1398,
  rs_R009_ueqv_R009NYNYN_partial_28_1399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1300_1399 : Poly :=
[
  term ((168473926473102530003731583097407684556844541383160362603918880536319045418388543 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-135065919716742025509494411825864330086044349221149318155241004256915777042569823 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((232568862142993094875510 : Rat) / 36077833000437226041603) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-268022140990933801496465948610263915025989 : Rat) / 1978358748782397408410643408818289964275) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 2)],
  term ((911981114092474981008 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-880337643550703386932617 : Rat) / 252544831003060582291221) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-352694614488421859450680360088515772986381 : Rat) / 1130490713589941376234653376467594265300) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term ((1824589628273257878434152312819916217287104 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((-18625229346375236772864 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 2)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 2), (16, 1)],
  term ((300022627110540835908 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 3)],
  term ((-2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 3), (14, 1)],
  term ((9505418205450486962784 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 3), (14, 1), (16, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 3), (16, 1)],
  term ((10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-2622062932264292573827993 : Rat) / 841816103343535274304070) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((-2622062932264292573827993 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((2622062932264292573827993 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((65181104695659976368950852661160175790944298441446950316508824126 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3868612203558116182624 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1934306101779058091312 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21077880216650817382066622664947427632070984375055523800476009286 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-84311520866603269528266490659789710528283937500222095201904037144 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((762816771330012778336 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-190704192832503194584 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((380510376087715141069577342504071494045046615182705846731999481807971931333312167 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (12, 1)],
  term ((-587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 15132264528721735360983570620625223533359604470698386994070246993726524500) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-491330133923609756676 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 30264529057443470721967141241250447066719208941396773988140493987453049000) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((245665066961804878338 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (9, 1), (12, 1), (13, 2)],
  term ((40124413927308229725632498429178187339943 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((6625678516611268478768 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3312839258305634239384 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-66061376834495842196514883618689917385692133583957816496525821369266617926724281 : Rat) / 155744452269504883858476800105500195389238809129158472287601312637747858896000) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((2175766321403526012888 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8492957319258719282182061 : Rat) / 398754996320621972038770) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1027896096670869844683681266269320533942129153001036566958006284831765847392111663 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((47701344719540887841209063 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-34844588964242759033778037 : Rat) / 2525448310030605822912210) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2976608124470626285812548282160821242519423360327355557952055044215035402551600543 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (9, 1), (12, 2)],
  term ((2586865718910674997586774878982521100803964518862091759753245292338381491519702767 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-157323399228639345971465774 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 2), (14, 2)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 2), (14, 2), (16, 1)],
  term ((86401788338014369271863843 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 3)],
  term ((-6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 3), (14, 1)],
  term ((70928648098004089678176 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 3), (14, 1), (16, 1)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 3), (16, 1)],
  term ((169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 2017635270496231381464476082750029804447947262759784932542699599163536600) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-55145750126906318130 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-169584108201747662578613896008404864871125699880828562568695738395175930241 : Rat) / 8070541081984925525857904331000119217791789051039139730170798396654146400) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((27572875063453159065 : Rat) / 247957615123279904066) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(3, 1), (9, 1), (13, 2)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (9, 1), (13, 2), (14, 2)],
  term ((-3312839258305634239384 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((828209814576408559846 : Rat) / 13017774793972194963465) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((78548017020932428109676086958622286192199458752849663689112558267977878261000819 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (9, 1), (14, 1)],
  term ((-10215307001981045270853731 : Rat) / 2525448310030605822912210) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-78548017020932428109676086958622286192199458752849663689112558267977878261000819 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (9, 1), (14, 2)],
  term ((2060554853096826819626816 : Rat) / 541167495006558390624045) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((16222037034265348075173481 : Rat) / 15152689860183634937473260) [(3, 1), (9, 1), (16, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 2), (12, 1), (13, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((494328303710424117456 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (9, 2), (13, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 2), (13, 1), (14, 2)],
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((61791037963803014682 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((88246726602797914545475898920738919516949527261414692478322848383 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 1), (10, 1), (11, 1)],
  term ((-89205938814422643395207982436877050180169762746841297784368841193 : Rat) / 205796438234362474757268816098541090941408983755397063262645250) [(3, 1), (10, 1), (11, 1), (12, 1)],
  term ((254665038616537853278426719626773893189705945532754997247616546999 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-8066269656686568794216 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5181111130692030762878891073542902940321337083107558442195990632 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-689310566065649879488 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((4894773035925346746468 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((13647504056034942011384414828414404904483821135239693935759550374 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (12, 2)],
  term ((-39847418236554532538944366924800348372171081082710889456822794752 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((14077668040996994248704 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 2)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-226768694801173115888 : Rat) / 17711258223091421719) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 3)],
  term ((34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 3), (14, 1)],
  term ((-7184562380340495453824 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 3), (16, 1)],
  term ((-91194902855594421605852290412751810356263931711957121364070048383 : Rat) / 411592876468724949514537632197082181882817967510794126525290500) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((408605133219516251454 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-79402197844408393364346724444700246999006313909787405821081248383 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((272403422146344167636 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-272403422146344167636 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13573157081180174538517279323157033839418421522402984062728145047384434839559399 : Rat) / 174067329007093693724179953059088453670325727850235939615554408242188783472000) [(3, 1), (10, 1), (12, 1), (13, 1)],
  term ((4088132196289770835784689702096335270334639112014361344473000746263974995399 : Rat) / 87033664503546846862089976529544226835162863925117969807777204121094391736000) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25189501820925676802042 : Rat) / 77309642143794055803435) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((74025111329999962385803003179524286757499 : Rat) / 237403049853887689009277209058194795713) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((12223644953855190138224 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3829208057352146331128951 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((45724605285858935643032249064795040049304498372261569839421306672770553429 : Rat) / 927232446072769555082110177031799075944910661791652361997304902973488000) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6399060820533242586 : Rat) / 508715993091272995) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((817312464464394257503876457363683582907387040999106679163022484923 : Rat) / 2056604428182766903583650161097554598241812600457024775088509198) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-46986120693072 : Rat) / 1048898954827367) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-229969719525138404323616111095375502776950944250608190309783139403992597429 : Rat) / 1854464892145539110164220354063598151889821323583304723994609805946976000) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((3205227477400656273 : Rat) / 508715993091272995) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((97410825861136568411964777357649391893171 : Rat) / 135658885630792965148158405176111311836) [(3, 1), (10, 1), (12, 2), (13, 1)],
  term ((-503933928238637294179704296455380020006464 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-83213781219863319000064 : Rat) / 4339258264657398321155) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 2)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((4021322388426421012924 : Rat) / 371936422684919856099) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-720232252288154568179530888584871442812635468641041283683769313616 : Rat) / 423418558743510833090751503755378887873314358917622747812340129) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2743897331096064 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 2), (14, 2), (15, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((18499518064414126164244330109389429186240768515831587452993078087633 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((1797161543147916 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 3), (13, 1)],
  term ((771550671415912258681082857570897192444402 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 3), (13, 1), (14, 1)],
  term ((127404894121038055617952 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(3, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((3401703020799072 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 3), (15, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4167719175295925063729835895474463487059545692286557264081538715513274317724450089 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 1), (10, 1), (13, 1)],
  term ((183382412910580934167698252529745286844061630925665365197386562625358756997437921 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((1437272242722781978195603 : Rat) / 841816103343535274304070) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1573298411937935410137844764191722440914369383722230610815662282428153440467193 : Rat) / 1849465370700370495819412001252814820247210858408756858415265587573255824390) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((59608254084485313228876817 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-18135926067247587758159311 : Rat) / 3788172465045908734368315) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((59149678322905605373687490426558792062778301619817148969728007797507391524437787 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((2358894054755308912189 : Rat) / 64098215129500397370) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((93071754276876528650617478525009530204226430228360801418609349023 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((1873006292068461 : Rat) / 7342292683791569) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8452780697877571740270609860874896825357038179672710978166788776427398228096541 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (10, 1), (15, 1)],
  term ((-169076409087156267461 : Rat) / 9156887875642913910) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4046441870490428229426144113616282337199632054239914370651441577380874774842261277 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 1), (11, 1)],
  term ((8258076853703846085532222936049460575299539441605437163492651990600081082047970167 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (11, 1), (12, 1)],
  term ((-1709292911224641243435200323840199460387503250732918815532265317899833669778 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10009619811848742071296 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((854646455612320621717600161920099730193751625366459407766132658949916834889 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5004809905924371035648 : Rat) / 4339258264657398321155) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8258076853703846085532222936049460575299539441605437163492651990600081082047970167 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((4046441870490428229426144113616282337199632054239914370651441577380874774842261277 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1300 through 1399. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1300_1399_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1300_1399
      rs_R009_ueqv_R009NYNYN_block_28_1300_1399 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
