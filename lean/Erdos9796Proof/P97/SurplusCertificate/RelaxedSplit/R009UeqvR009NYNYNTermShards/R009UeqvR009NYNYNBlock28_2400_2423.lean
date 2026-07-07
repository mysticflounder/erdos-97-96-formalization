/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:2400-2423

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 2400 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2400 : Poly :=
[
  term ((15288765681034329802489 : Rat) / 512785721036003178960) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2400 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2400 : Poly :=
[
  term ((-15288765681034329802489 : Rat) / 512785721036003178960) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15288765681034329802489 : Rat) / 256392860518001589480) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2400 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2400_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2400
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2400 := by
  native_decide

/-- Coefficient term 2401 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2401 : Poly :=
[
  term ((334818526776615153121576723428530260553290859954272062970779664787560660585568184543917 : Rat) / 123479185581736096079283878381243930910840983519488969900723523901210910464233472000) [(13, 1), (15, 1)]
]

/-- Partial product 2401 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2401 : Poly :=
[
  term ((334818526776615153121576723428530260553290859954272062970779664787560660585568184543917 : Rat) / 61739592790868048039641939190621965455420491759744484950361761950605455232116736000) [(13, 1), (14, 1), (15, 1)],
  term ((-334818526776615153121576723428530260553290859954272062970779664787560660585568184543917 : Rat) / 123479185581736096079283878381243930910840983519488969900723523901210910464233472000) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2401 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2401_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2401
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2401 := by
  native_decide

/-- Coefficient term 2402 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2402 : Poly :=
[
  term ((7205429556615538119743454143 : Rat) / 121221518881469079499786080) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2402 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2402 : Poly :=
[
  term ((7205429556615538119743454143 : Rat) / 60610759440734539749893040) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7205429556615538119743454143 : Rat) / 121221518881469079499786080) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2402 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2402_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2402
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2402 := by
  native_decide

/-- Coefficient term 2403 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2403 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(13, 1), (15, 3)]
]

/-- Partial product 2403 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2403 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(13, 1), (14, 1), (15, 3)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2403 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2403_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2403
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2403 := by
  native_decide

/-- Coefficient term 2404 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2404 : Poly :=
[
  term ((-2020095442437435 : Rat) / 7342292683791569) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 2404 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2404 : Poly :=
[
  term ((-4040190884874870 : Rat) / 7342292683791569) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2404 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2404_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2404
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2404 := by
  native_decide

/-- Coefficient term 2405 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2405 : Poly :=
[
  term ((-758619161012760292785611386138941488875865374114543439863278954270841885223262726467 : Rat) / 1371990950908178845325376426458265899009344261327655221119150265569010116269260800) [(13, 2)]
]

/-- Partial product 2405 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2405 : Poly :=
[
  term ((758619161012760292785611386138941488875865374114543439863278954270841885223262726467 : Rat) / 1371990950908178845325376426458265899009344261327655221119150265569010116269260800) [(13, 2)],
  term ((-758619161012760292785611386138941488875865374114543439863278954270841885223262726467 : Rat) / 685995475454089422662688213229132949504672130663827610559575132784505058134630400) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2405 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2405_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2405
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2405 := by
  native_decide

/-- Coefficient term 2406 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2406 : Poly :=
[
  term ((-540129455301983623285253066391267876347336579740829894127077594918713695527993263087 : Rat) / 293998060908895466855437805669628406930573770284497547382675056907645024914841600) [(13, 2), (14, 1)]
]

/-- Partial product 2406 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2406 : Poly :=
[
  term ((540129455301983623285253066391267876347336579740829894127077594918713695527993263087 : Rat) / 293998060908895466855437805669628406930573770284497547382675056907645024914841600) [(13, 2), (14, 1)],
  term ((-540129455301983623285253066391267876347336579740829894127077594918713695527993263087 : Rat) / 146999030454447733427718902834814203465286885142248773691337528453822512457420800) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2406 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2406_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2406
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2406 := by
  native_decide

/-- Coefficient term 2407 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2407 : Poly :=
[
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(13, 2), (14, 1), (15, 2)]
]

/-- Partial product 2407 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2407 : Poly :=
[
  term ((-364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(13, 2), (14, 1), (15, 2)],
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 16452835425462135228669201288780436785934500803656198200708073584) [(13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2407 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2407_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2407
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2407 := by
  native_decide

/-- Coefficient term 2408 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2408 : Poly :=
[
  term ((-94454695759941 : Rat) / 7342292683791569) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2408 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2408 : Poly :=
[
  term ((94454695759941 : Rat) / 7342292683791569) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-188909391519882 : Rat) / 7342292683791569) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2408 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2408_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2408
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2408 := by
  native_decide

/-- Coefficient term 2409 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2409 : Poly :=
[
  term ((-26575107245932686108311809 : Rat) / 673452882674828219443256) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2409 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2409 : Poly :=
[
  term ((26575107245932686108311809 : Rat) / 673452882674828219443256) [(13, 2), (14, 1), (16, 1)],
  term ((-26575107245932686108311809 : Rat) / 336726441337414109721628) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2409 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2409_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2409
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2409 := by
  native_decide

/-- Coefficient term 2410 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2410 : Poly :=
[
  term ((5232402523587997367858451375810021124752775390439862745531008014921465688461 : Rat) / 67792545088673374417206396380401001429451028028728773733434706531894829760) [(13, 2), (15, 2)]
]

/-- Partial product 2410 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2410 : Poly :=
[
  term ((5232402523587997367858451375810021124752775390439862745531008014921465688461 : Rat) / 33896272544336687208603198190200500714725514014364386866717353265947414880) [(13, 2), (14, 1), (15, 2)],
  term ((-5232402523587997367858451375810021124752775390439862745531008014921465688461 : Rat) / 67792545088673374417206396380401001429451028028728773733434706531894829760) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2410 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2410_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2410
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2410 := by
  native_decide

/-- Coefficient term 2411 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2411 : Poly :=
[
  term ((9013964777725718824771 : Rat) / 8678516529314796642310) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 2411 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2411 : Poly :=
[
  term ((9013964777725718824771 : Rat) / 4339258264657398321155) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9013964777725718824771 : Rat) / 8678516529314796642310) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2411 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2411_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2411
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2411 := by
  native_decide

/-- Coefficient term 2412 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2412 : Poly :=
[
  term ((-98423453562768008332857641 : Rat) / 6734528826748282194432560) [(13, 2), (16, 1)]
]

/-- Partial product 2412 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2412 : Poly :=
[
  term ((-98423453562768008332857641 : Rat) / 3367264413374141097216280) [(13, 2), (14, 1), (16, 1)],
  term ((98423453562768008332857641 : Rat) / 6734528826748282194432560) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2412 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2412_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2412
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2412 := by
  native_decide

/-- Coefficient term 2413 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2413 : Poly :=
[
  term ((54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(13, 3), (14, 1), (15, 1)]
]

/-- Partial product 2413 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2413 : Poly :=
[
  term ((-54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(13, 3), (14, 1), (15, 1)],
  term ((54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2413 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2413_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2413
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2413 := by
  native_decide

/-- Coefficient term 2414 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2414 : Poly :=
[
  term ((2101738315096030146653 : Rat) / 13017774793972194963465) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2414 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2414 : Poly :=
[
  term ((-2101738315096030146653 : Rat) / 13017774793972194963465) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4203476630192060293306 : Rat) / 13017774793972194963465) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2414 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2414_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2414
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2414 := by
  native_decide

/-- Coefficient term 2415 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2415 : Poly :=
[
  term ((40019781376354698315326779908808020162873159200893613999168497741 : Rat) / 10668487358069350691416815426548370154402641717879783759535529760) [(13, 3), (15, 1)]
]

/-- Partial product 2415 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2415 : Poly :=
[
  term ((40019781376354698315326779908808020162873159200893613999168497741 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(13, 3), (14, 1), (15, 1)],
  term ((-40019781376354698315326779908808020162873159200893613999168497741 : Rat) / 10668487358069350691416815426548370154402641717879783759535529760) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2415 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2415_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2415
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2415 := by
  native_decide

/-- Coefficient term 2416 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2416 : Poly :=
[
  term ((2101738315096030146653 : Rat) / 26035549587944389926930) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 2416 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2416 : Poly :=
[
  term ((2101738315096030146653 : Rat) / 13017774793972194963465) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2101738315096030146653 : Rat) / 26035549587944389926930) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2416 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2416_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2416
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2416 := by
  native_decide

/-- Coefficient term 2417 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2417 : Poly :=
[
  term ((-356560770608282544613862031251137373331068560292 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4)]
]

/-- Partial product 2417 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2417 : Poly :=
[
  term ((356560770608282544613862031251137373331068560292 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4)],
  term ((-713121541216565089227724062502274746662137120584 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2417 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2417_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2417
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2417 := by
  native_decide

/-- Coefficient term 2418 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2418 : Poly :=
[
  term ((-713121541216565089227724062502274746662137120584 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4), (14, 1)]
]

/-- Partial product 2418 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2418 : Poly :=
[
  term ((713121541216565089227724062502274746662137120584 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4), (14, 1)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2418 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2418_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2418
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2418 := by
  native_decide

/-- Coefficient term 2419 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2419 : Poly :=
[
  term ((82518451076878583644542972317210219268413259661195714853884773819614443325824771 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(14, 1)]
]

/-- Partial product 2419 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2419 : Poly :=
[
  term ((-82518451076878583644542972317210219268413259661195714853884773819614443325824771 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(14, 1)],
  term ((82518451076878583644542972317210219268413259661195714853884773819614443325824771 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2419 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2419_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2419
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2419 := by
  native_decide

/-- Coefficient term 2420 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2420 : Poly :=
[
  term ((1969926125285451085981 : Rat) / 256392860518001589480) [(14, 1), (16, 1)]
]

/-- Partial product 2420 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2420 : Poly :=
[
  term ((-1969926125285451085981 : Rat) / 256392860518001589480) [(14, 1), (16, 1)],
  term ((1969926125285451085981 : Rat) / 128196430259000794740) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2420 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2420_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2420
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2420 := by
  native_decide

/-- Coefficient term 2421 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2421 : Poly :=
[
  term ((66471839279032612783800096034792373781595138963774861045466614390563105359616704669 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(15, 2)]
]

/-- Partial product 2421 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2421 : Poly :=
[
  term ((66471839279032612783800096034792373781595138963774861045466614390563105359616704669 : Rat) / 1203168328574819748105421613587240869666580419359186093392066946785486791649920000) [(14, 1), (15, 2)],
  term ((-66471839279032612783800096034792373781595138963774861045466614390563105359616704669 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2421 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2421_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2421
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2421 := by
  native_decide

/-- Coefficient term 2422 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2422 : Poly :=
[
  term ((-648145745326122766714724 : Rat) / 168738551328409796076525) [(15, 2), (16, 1)]
]

/-- Partial product 2422 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2422 : Poly :=
[
  term ((-1296291490652245533429448 : Rat) / 168738551328409796076525) [(14, 1), (15, 2), (16, 1)],
  term ((648145745326122766714724 : Rat) / 168738551328409796076525) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2422 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2422_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2422
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2422 := by
  native_decide

/-- Coefficient term 2423 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2423 : Poly :=
[
  term ((-888275150633845501087489 : Rat) / 899938940418185579074800) [(16, 1)]
]

/-- Partial product 2423 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2423 : Poly :=
[
  term ((-888275150633845501087489 : Rat) / 449969470209092789537400) [(14, 1), (16, 1)],
  term ((888275150633845501087489 : Rat) / 899938940418185579074800) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2423 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2423_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2423
        rs_R009_ueqv_R009NYNYN_generator_28_2400_2423 =
      rs_R009_ueqv_R009NYNYN_partial_28_2423 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_2400_2423 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_2400,
  rs_R009_ueqv_R009NYNYN_partial_28_2401,
  rs_R009_ueqv_R009NYNYN_partial_28_2402,
  rs_R009_ueqv_R009NYNYN_partial_28_2403,
  rs_R009_ueqv_R009NYNYN_partial_28_2404,
  rs_R009_ueqv_R009NYNYN_partial_28_2405,
  rs_R009_ueqv_R009NYNYN_partial_28_2406,
  rs_R009_ueqv_R009NYNYN_partial_28_2407,
  rs_R009_ueqv_R009NYNYN_partial_28_2408,
  rs_R009_ueqv_R009NYNYN_partial_28_2409,
  rs_R009_ueqv_R009NYNYN_partial_28_2410,
  rs_R009_ueqv_R009NYNYN_partial_28_2411,
  rs_R009_ueqv_R009NYNYN_partial_28_2412,
  rs_R009_ueqv_R009NYNYN_partial_28_2413,
  rs_R009_ueqv_R009NYNYN_partial_28_2414,
  rs_R009_ueqv_R009NYNYN_partial_28_2415,
  rs_R009_ueqv_R009NYNYN_partial_28_2416,
  rs_R009_ueqv_R009NYNYN_partial_28_2417,
  rs_R009_ueqv_R009NYNYN_partial_28_2418,
  rs_R009_ueqv_R009NYNYN_partial_28_2419,
  rs_R009_ueqv_R009NYNYN_partial_28_2420,
  rs_R009_ueqv_R009NYNYN_partial_28_2421,
  rs_R009_ueqv_R009NYNYN_partial_28_2422,
  rs_R009_ueqv_R009NYNYN_partial_28_2423
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_2400_2423 : Poly :=
[
  term ((334818526776615153121576723428530260553290859954272062970779664787560660585568184543917 : Rat) / 61739592790868048039641939190621965455420491759744484950361761950605455232116736000) [(13, 1), (14, 1), (15, 1)],
  term ((37488282929742787301521228 : Rat) / 420908051671767637152035) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(13, 1), (14, 1), (15, 3)],
  term ((-4040190884874870 : Rat) / 7342292683791569) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((15288765681034329802489 : Rat) / 256392860518001589480) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-334818526776615153121576723428530260553290859954272062970779664787560660585568184543917 : Rat) / 123479185581736096079283878381243930910840983519488969900723523901210910464233472000) [(13, 1), (15, 1)],
  term ((-7205429556615538119743454143 : Rat) / 121221518881469079499786080) [(13, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(13, 1), (15, 3)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(13, 1), (15, 3), (16, 1)],
  term ((758619161012760292785611386138941488875865374114543439863278954270841885223262726467 : Rat) / 1371990950908178845325376426458265899009344261327655221119150265569010116269260800) [(13, 2)],
  term ((144272306755713620076681106817681237327814411027816232678269392409745994346833269 : Rat) / 197276306208039519554070613466966914159702491563600731564294996007813954601600) [(13, 2), (14, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(13, 2), (14, 1), (15, 2)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((8613020666723855552175351 : Rat) / 841816103343535274304070) [(13, 2), (14, 1), (16, 1)],
  term ((-540129455301983623285253066391267876347336579740829894127077594918713695527993263087 : Rat) / 146999030454447733427718902834814203465286885142248773691337528453822512457420800) [(13, 2), (14, 2)],
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 16452835425462135228669201288780436785934500803656198200708073584) [(13, 2), (14, 2), (15, 2)],
  term ((-188909391519882 : Rat) / 7342292683791569) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-26575107245932686108311809 : Rat) / 336726441337414109721628) [(13, 2), (14, 2), (16, 1)],
  term ((-5232402523587997367858451375810021124752775390439862745531008014921465688461 : Rat) / 67792545088673374417206396380401001429451028028728773733434706531894829760) [(13, 2), (15, 2)],
  term ((-9013964777725718824771 : Rat) / 8678516529314796642310) [(13, 2), (15, 2), (16, 1)],
  term ((98423453562768008332857641 : Rat) / 6734528826748282194432560) [(13, 2), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(13, 3), (14, 1), (15, 1)],
  term ((54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(13, 3), (14, 2), (15, 1)],
  term ((4203476630192060293306 : Rat) / 13017774793972194963465) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-40019781376354698315326779908808020162873159200893613999168497741 : Rat) / 10668487358069350691416815426548370154402641717879783759535529760) [(13, 3), (15, 1)],
  term ((-2101738315096030146653 : Rat) / 26035549587944389926930) [(13, 3), (15, 1), (16, 1)],
  term ((356560770608282544613862031251137373331068560292 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(13, 4), (14, 2)],
  term ((-82518451076878583644542972317210219268413259661195714853884773819614443325824771 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(14, 1)],
  term ((66471839279032612783800096034792373781595138963774861045466614390563105359616704669 : Rat) / 1203168328574819748105421613587240869666580419359186093392066946785486791649920000) [(14, 1), (15, 2)],
  term ((-1296291490652245533429448 : Rat) / 168738551328409796076525) [(14, 1), (15, 2), (16, 1)],
  term ((-543186937563726519623018 : Rat) / 56246183776136598692175) [(14, 1), (16, 1)],
  term ((82518451076878583644542972317210219268413259661195714853884773819614443325824771 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(14, 2)],
  term ((1969926125285451085981 : Rat) / 128196430259000794740) [(14, 2), (16, 1)],
  term ((-66471839279032612783800096034792373781595138963774861045466614390563105359616704669 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(15, 2)],
  term ((648145745326122766714724 : Rat) / 168738551328409796076525) [(15, 2), (16, 1)],
  term ((888275150633845501087489 : Rat) / 899938940418185579074800) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 2400 through 2423. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_2400_2423_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_2400_2423
      rs_R009_ueqv_R009NYNYN_block_28_2400_2423 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
