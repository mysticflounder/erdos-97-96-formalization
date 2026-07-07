/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 20:400-441

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0400 : Poly :=
[
  term ((2308690611150561 : Rat) / 7342292683791569) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 400 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0400 : Poly :=
[
  term ((4617381222301122 : Rat) / 7342292683791569) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((4617381222301122 : Rat) / 7342292683791569) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2308690611150561 : Rat) / 7342292683791569) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2308690611150561 : Rat) / 7342292683791569) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0400_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0400
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0401 : Poly :=
[
  term ((-18626531947003029748 : Rat) / 6409821512950039737) [(10, 1), (16, 1)]
]

/-- Partial product 401 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0401 : Poly :=
[
  term ((-37253063894006059496 : Rat) / 6409821512950039737) [(8, 1), (10, 2), (16, 1)],
  term ((-37253063894006059496 : Rat) / 6409821512950039737) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18626531947003029748 : Rat) / 6409821512950039737) [(10, 1), (11, 2), (16, 1)],
  term ((18626531947003029748 : Rat) / 6409821512950039737) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0401_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0401
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0402 : Poly :=
[
  term ((685851645270409302560606049996505500578646665083612632339323040712 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 402 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0402 : Poly :=
[
  term ((1371703290540818605121212099993011001157293330167225264678646081424 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1371703290540818605121212099993011001157293330167225264678646081424 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-685851645270409302560606049996505500578646665083612632339323040712 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-685851645270409302560606049996505500578646665083612632339323040712 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0402_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0402
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0403 : Poly :=
[
  term ((116211397484807968872952 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 403 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0403 : Poly :=
[
  term ((232422794969615937745904 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((232422794969615937745904 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-116211397484807968872952 : Rat) / 4339258264657398321155) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-116211397484807968872952 : Rat) / 4339258264657398321155) [(11, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0403_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0403
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0404 : Poly :=
[
  term ((-725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 404 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0404 : Poly :=
[
  term ((-725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0404_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0404
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0405 : Poly :=
[
  term ((-7672300823653152858324 : Rat) / 867851652931479664231) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0405 : Poly :=
[
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0405_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0405
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0406 : Poly :=
[
  term ((-20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 31159792565559842113565453397107424091525008542470735550580394619434214129322720000) [(11, 1), (13, 1)]
]

/-- Partial product 406 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0406 : Poly :=
[
  term ((-20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 15579896282779921056782726698553712045762504271235367775290197309717107064661360000) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 15579896282779921056782726698553712045762504271235367775290197309717107064661360000) [(9, 1), (11, 2), (13, 1)],
  term ((20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 31159792565559842113565453397107424091525008542470735550580394619434214129322720000) [(10, 2), (11, 1), (13, 1)],
  term ((20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 31159792565559842113565453397107424091525008542470735550580394619434214129322720000) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0406_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0406
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0407 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 407 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0407 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0407_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0407
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0408 : Poly :=
[
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 408 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0408 : Poly :=
[
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0408_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0408
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0409 : Poly :=
[
  term ((-300716027809620506376810701179 : Rat) / 39889456056933418972898356950) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 409 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0409 : Poly :=
[
  term ((-300716027809620506376810701179 : Rat) / 19944728028466709486449178475) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-300716027809620506376810701179 : Rat) / 19944728028466709486449178475) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((300716027809620506376810701179 : Rat) / 39889456056933418972898356950) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((300716027809620506376810701179 : Rat) / 39889456056933418972898356950) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0409_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0409
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0410 : Poly :=
[
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 410 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0410 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0410_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0410
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0411 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0411 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0411_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0411
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0412 : Poly :=
[
  term ((11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(11, 1), (15, 1)]
]

/-- Partial product 412 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0412 : Poly :=
[
  term ((11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(9, 1), (11, 2), (15, 1)],
  term ((-11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(10, 2), (11, 1), (15, 1)],
  term ((-11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0412_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0412
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0413 : Poly :=
[
  term ((110570259335654814231955637 : Rat) / 7576344930091817468736630) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0413 : Poly :=
[
  term ((110570259335654814231955637 : Rat) / 3788172465045908734368315) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((110570259335654814231955637 : Rat) / 3788172465045908734368315) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-110570259335654814231955637 : Rat) / 7576344930091817468736630) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-110570259335654814231955637 : Rat) / 7576344930091817468736630) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0413_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0413
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0414 : Poly :=
[
  term ((-73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(11, 2)]
]

/-- Partial product 414 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0414 : Poly :=
[
  term ((-73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(8, 1), (10, 1), (11, 2)],
  term ((-73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(9, 1), (11, 3)],
  term ((73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(10, 2), (11, 2)],
  term ((73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0414_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0414
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0415 : Poly :=
[
  term ((1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(11, 2), (12, 1)]
]

/-- Partial product 415 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0415 : Poly :=
[
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (11, 3), (12, 1)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(10, 2), (11, 2), (12, 1)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0415_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0415
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0416 : Poly :=
[
  term ((-236801443996489053408 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 416 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0416 : Poly :=
[
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(10, 2), (11, 2), (12, 1), (16, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(11, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0416_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0416
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0417 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 417 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0417 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0417_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0417
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0418 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 418 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0418 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(11, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0418_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0418
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0419 : Poly :=
[
  term ((-492817744926035596762 : Rat) / 619894037808199760165) [(11, 2), (16, 1)]
]

/-- Partial product 419 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0419 : Poly :=
[
  term ((-985635489852071193524 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-985635489852071193524 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (16, 1)],
  term ((492817744926035596762 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (16, 1)],
  term ((492817744926035596762 : Rat) / 619894037808199760165) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0419_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0419
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0420 : Poly :=
[
  term ((3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(12, 1)]
]

/-- Partial product 420 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0420 : Poly :=
[
  term ((3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (10, 1), (12, 1)],
  term ((3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(9, 1), (11, 1), (12, 1)],
  term ((-3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(10, 2), (12, 1)],
  term ((-3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0420_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0420
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0421 : Poly :=
[
  term ((5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 421 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0421 : Poly :=
[
  term ((5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0421_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0421
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0422 : Poly :=
[
  term ((13233571487311860256371 : Rat) / 867851652931479664231) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0422 : Poly :=
[
  term ((26467142974623720512742 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((26467142974623720512742 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13233571487311860256371 : Rat) / 867851652931479664231) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13233571487311860256371 : Rat) / 867851652931479664231) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0422_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0422
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0423 : Poly :=
[
  term ((-1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(12, 1), (13, 2)]
]

/-- Partial product 423 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0423 : Poly :=
[
  term ((-1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(10, 2), (12, 1), (13, 2)],
  term ((1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0423_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0423
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0424 : Poly :=
[
  term ((-276669183649289883953668 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 424 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0424 : Poly :=
[
  term ((-553338367298579767907336 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-553338367298579767907336 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((276669183649289883953668 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((276669183649289883953668 : Rat) / 13017774793972194963465) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0424_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0424
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0425 : Poly :=
[
  term ((-336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(12, 1), (15, 2)]
]

/-- Partial product 425 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0425 : Poly :=
[
  term ((-336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(10, 2), (12, 1), (15, 2)],
  term ((336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0425_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0425
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0426 : Poly :=
[
  term ((-20220551851188249 : Rat) / 7342292683791569) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 426 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0426 : Poly :=
[
  term ((-40441103702376498 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-40441103702376498 : Rat) / 7342292683791569) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0426_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0426
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0427 : Poly :=
[
  term ((16304117144212294774288741 : Rat) / 1349908410627278368612200) [(12, 1), (16, 1)]
]

/-- Partial product 427 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0427 : Poly :=
[
  term ((16304117144212294774288741 : Rat) / 674954205313639184306100) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((16304117144212294774288741 : Rat) / 674954205313639184306100) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-16304117144212294774288741 : Rat) / 1349908410627278368612200) [(10, 2), (12, 1), (16, 1)],
  term ((-16304117144212294774288741 : Rat) / 1349908410627278368612200) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0427_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0427
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0428 : Poly :=
[
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 1430587202512273027840969987420490002886433592478549358510127564587667200) [(12, 2)]
]

/-- Partial product 428 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0428 : Poly :=
[
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 715293601256136513920484993710245001443216796239274679255063782293833600) [(8, 1), (10, 1), (12, 2)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 715293601256136513920484993710245001443216796239274679255063782293833600) [(9, 1), (11, 1), (12, 2)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 1430587202512273027840969987420490002886433592478549358510127564587667200) [(10, 2), (12, 2)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 1430587202512273027840969987420490002886433592478549358510127564587667200) [(11, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0428_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0428
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0429 : Poly :=
[
  term ((-25554335901564559274 : Rat) / 6409821512950039737) [(12, 2), (16, 1)]
]

/-- Partial product 429 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0429 : Poly :=
[
  term ((-51108671803129118548 : Rat) / 6409821512950039737) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-51108671803129118548 : Rat) / 6409821512950039737) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((25554335901564559274 : Rat) / 6409821512950039737) [(10, 2), (12, 2), (16, 1)],
  term ((25554335901564559274 : Rat) / 6409821512950039737) [(11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0429_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0429
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0430 : Poly :=
[
  term ((-4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(13, 1), (15, 1)]
]

/-- Partial product 430 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0430 : Poly :=
[
  term ((-4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(10, 2), (13, 1), (15, 1)],
  term ((4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0430_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0430
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0431 : Poly :=
[
  term ((2721277994998787991202507 : Rat) / 757634493009181746873663) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0431 : Poly :=
[
  term ((5442555989997575982405014 : Rat) / 757634493009181746873663) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5442555989997575982405014 : Rat) / 757634493009181746873663) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2721277994998787991202507 : Rat) / 757634493009181746873663) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2721277994998787991202507 : Rat) / 757634493009181746873663) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0431_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0431
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0432 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(13, 1), (15, 3)]
]

/-- Partial product 432 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0432 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(10, 2), (13, 1), (15, 3)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0432_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0432
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0433 : Poly :=
[
  term ((-2020095442437435 : Rat) / 7342292683791569) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 433 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0433 : Poly :=
[
  term ((-4040190884874870 : Rat) / 7342292683791569) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4040190884874870 : Rat) / 7342292683791569) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0433_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0433
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0434 : Poly :=
[
  term ((8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(13, 2)]
]

/-- Partial product 434 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0434 : Poly :=
[
  term ((8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(8, 1), (10, 1), (13, 2)],
  term ((8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (11, 1), (13, 2)],
  term ((-8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(10, 2), (13, 2)],
  term ((-8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0434_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0434
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0435 : Poly :=
[
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(13, 2), (15, 2)]
]

/-- Partial product 435 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0435 : Poly :=
[
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(10, 2), (13, 2), (15, 2)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0435_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0435
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0436 : Poly :=
[
  term ((4534893515323182578033 : Rat) / 4339258264657398321155) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 436 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0436 : Poly :=
[
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4534893515323182578033 : Rat) / 4339258264657398321155) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4534893515323182578033 : Rat) / 4339258264657398321155) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0436_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0436
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0437 : Poly :=
[
  term ((358925737512943747664125147 : Rat) / 15152689860183634937473260) [(13, 2), (16, 1)]
]

/-- Partial product 437 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0437 : Poly :=
[
  term ((358925737512943747664125147 : Rat) / 7576344930091817468736630) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((358925737512943747664125147 : Rat) / 7576344930091817468736630) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-358925737512943747664125147 : Rat) / 15152689860183634937473260) [(10, 2), (13, 2), (16, 1)],
  term ((-358925737512943747664125147 : Rat) / 15152689860183634937473260) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0437_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0437
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0438 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(13, 3), (15, 1)]
]

/-- Partial product 438 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0438 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (13, 3), (15, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (13, 3), (15, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0438_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0438
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0439 : Poly :=
[
  term ((-1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 1203168328574819748105421613587240869666580419359186093392066946785486791649920000) [(15, 2)]
]

/-- Partial product 439 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0439 : Poly :=
[
  term ((-1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 601584164287409874052710806793620434833290209679593046696033473392743395824960000) [(8, 1), (10, 1), (15, 2)],
  term ((-1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 601584164287409874052710806793620434833290209679593046696033473392743395824960000) [(9, 1), (11, 1), (15, 2)],
  term ((1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 1203168328574819748105421613587240869666580419359186093392066946785486791649920000) [(10, 2), (15, 2)],
  term ((1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 1203168328574819748105421613587240869666580419359186093392066946785486791649920000) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0439_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0439
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0440 : Poly :=
[
  term ((-7395699534151762065229813 : Rat) / 337477102656819592153050) [(15, 2), (16, 1)]
]

/-- Partial product 440 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0440 : Poly :=
[
  term ((-7395699534151762065229813 : Rat) / 168738551328409796076525) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-7395699534151762065229813 : Rat) / 168738551328409796076525) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((7395699534151762065229813 : Rat) / 337477102656819592153050) [(10, 2), (15, 2), (16, 1)],
  term ((7395699534151762065229813 : Rat) / 337477102656819592153050) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0440_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0440
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0441 : Poly :=
[
  term ((547564681946801206352233 : Rat) / 449969470209092789537400) [(16, 1)]
]

/-- Partial product 441 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0441 : Poly :=
[
  term ((547564681946801206352233 : Rat) / 224984735104546394768700) [(8, 1), (10, 1), (16, 1)],
  term ((547564681946801206352233 : Rat) / 224984735104546394768700) [(9, 1), (11, 1), (16, 1)],
  term ((-547564681946801206352233 : Rat) / 449969470209092789537400) [(10, 2), (16, 1)],
  term ((-547564681946801206352233 : Rat) / 449969470209092789537400) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0441_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0441
        rs_R009_ueqv_R009NYNYN_generator_20_0400_0441 =
      rs_R009_ueqv_R009NYNYN_partial_20_0441 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_20_0400_0441 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_20_0400,
  rs_R009_ueqv_R009NYNYN_partial_20_0401,
  rs_R009_ueqv_R009NYNYN_partial_20_0402,
  rs_R009_ueqv_R009NYNYN_partial_20_0403,
  rs_R009_ueqv_R009NYNYN_partial_20_0404,
  rs_R009_ueqv_R009NYNYN_partial_20_0405,
  rs_R009_ueqv_R009NYNYN_partial_20_0406,
  rs_R009_ueqv_R009NYNYN_partial_20_0407,
  rs_R009_ueqv_R009NYNYN_partial_20_0408,
  rs_R009_ueqv_R009NYNYN_partial_20_0409,
  rs_R009_ueqv_R009NYNYN_partial_20_0410,
  rs_R009_ueqv_R009NYNYN_partial_20_0411,
  rs_R009_ueqv_R009NYNYN_partial_20_0412,
  rs_R009_ueqv_R009NYNYN_partial_20_0413,
  rs_R009_ueqv_R009NYNYN_partial_20_0414,
  rs_R009_ueqv_R009NYNYN_partial_20_0415,
  rs_R009_ueqv_R009NYNYN_partial_20_0416,
  rs_R009_ueqv_R009NYNYN_partial_20_0417,
  rs_R009_ueqv_R009NYNYN_partial_20_0418,
  rs_R009_ueqv_R009NYNYN_partial_20_0419,
  rs_R009_ueqv_R009NYNYN_partial_20_0420,
  rs_R009_ueqv_R009NYNYN_partial_20_0421,
  rs_R009_ueqv_R009NYNYN_partial_20_0422,
  rs_R009_ueqv_R009NYNYN_partial_20_0423,
  rs_R009_ueqv_R009NYNYN_partial_20_0424,
  rs_R009_ueqv_R009NYNYN_partial_20_0425,
  rs_R009_ueqv_R009NYNYN_partial_20_0426,
  rs_R009_ueqv_R009NYNYN_partial_20_0427,
  rs_R009_ueqv_R009NYNYN_partial_20_0428,
  rs_R009_ueqv_R009NYNYN_partial_20_0429,
  rs_R009_ueqv_R009NYNYN_partial_20_0430,
  rs_R009_ueqv_R009NYNYN_partial_20_0431,
  rs_R009_ueqv_R009NYNYN_partial_20_0432,
  rs_R009_ueqv_R009NYNYN_partial_20_0433,
  rs_R009_ueqv_R009NYNYN_partial_20_0434,
  rs_R009_ueqv_R009NYNYN_partial_20_0435,
  rs_R009_ueqv_R009NYNYN_partial_20_0436,
  rs_R009_ueqv_R009NYNYN_partial_20_0437,
  rs_R009_ueqv_R009NYNYN_partial_20_0438,
  rs_R009_ueqv_R009NYNYN_partial_20_0439,
  rs_R009_ueqv_R009NYNYN_partial_20_0440,
  rs_R009_ueqv_R009NYNYN_partial_20_0441
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_20_0400_0441 : Poly :=
[
  term ((1371703290540818605121212099993011001157293330167225264678646081424 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((232422794969615937745904 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 15579896282779921056782726698553712045762504271235367775290197309717107064661360000) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-300716027809620506376810701179 : Rat) / 19944728028466709486449178475) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((110570259335654814231955637 : Rat) / 3788172465045908734368315) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(8, 1), (10, 1), (11, 2)],
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-985635489852071193524 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (10, 1), (12, 1)],
  term ((5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((26467142974623720512742 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-553338367298579767907336 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-40441103702376498 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((16304117144212294774288741 : Rat) / 674954205313639184306100) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 715293601256136513920484993710245001443216796239274679255063782293833600) [(8, 1), (10, 1), (12, 2)],
  term ((-51108671803129118548 : Rat) / 6409821512950039737) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((5442555989997575982405014 : Rat) / 757634493009181746873663) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-4040190884874870 : Rat) / 7342292683791569) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(8, 1), (10, 1), (13, 2)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((358925737512943747664125147 : Rat) / 7576344930091817468736630) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (13, 3), (15, 1)],
  term ((-1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 601584164287409874052710806793620434833290209679593046696033473392743395824960000) [(8, 1), (10, 1), (15, 2)],
  term ((-7395699534151762065229813 : Rat) / 168738551328409796076525) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((547564681946801206352233 : Rat) / 224984735104546394768700) [(8, 1), (10, 1), (16, 1)],
  term ((4617381222301122 : Rat) / 7342292683791569) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-37253063894006059496 : Rat) / 6409821512950039737) [(8, 1), (10, 2), (16, 1)],
  term ((4617381222301122 : Rat) / 7342292683791569) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-37253063894006059496 : Rat) / 6409821512950039737) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(9, 1), (11, 1), (12, 1)],
  term ((5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((26467142974623720512742 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-553338367298579767907336 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-40441103702376498 : Rat) / 7342292683791569) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((16304117144212294774288741 : Rat) / 674954205313639184306100) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 715293601256136513920484993710245001443216796239274679255063782293833600) [(9, 1), (11, 1), (12, 2)],
  term ((-51108671803129118548 : Rat) / 6409821512950039737) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((5442555989997575982405014 : Rat) / 757634493009181746873663) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-4040190884874870 : Rat) / 7342292683791569) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (11, 1), (13, 2)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((358925737512943747664125147 : Rat) / 7576344930091817468736630) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((-1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 601584164287409874052710806793620434833290209679593046696033473392743395824960000) [(9, 1), (11, 1), (15, 2)],
  term ((-7395699534151762065229813 : Rat) / 168738551328409796076525) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((547564681946801206352233 : Rat) / 224984735104546394768700) [(9, 1), (11, 1), (16, 1)],
  term ((1371703290540818605121212099993011001157293330167225264678646081424 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((232422794969615937745904 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 15579896282779921056782726698553712045762504271235367775290197309717107064661360000) [(9, 1), (11, 2), (13, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-300716027809620506376810701179 : Rat) / 19944728028466709486449178475) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(9, 1), (11, 2), (15, 1)],
  term ((110570259335654814231955637 : Rat) / 3788172465045908734368315) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(9, 1), (11, 3)],
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (11, 3), (12, 1)],
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-985635489852071193524 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (16, 1)],
  term ((-2308690611150561 : Rat) / 7342292683791569) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((18626531947003029748 : Rat) / 6409821512950039737) [(10, 1), (11, 2), (16, 1)],
  term ((-685851645270409302560606049996505500578646665083612632339323040712 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-116211397484807968872952 : Rat) / 4339258264657398321155) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 31159792565559842113565453397107424091525008542470735550580394619434214129322720000) [(10, 2), (11, 1), (13, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((300716027809620506376810701179 : Rat) / 39889456056933418972898356950) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(10, 2), (11, 1), (15, 1)],
  term ((-110570259335654814231955637 : Rat) / 7576344930091817468736630) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(10, 2), (11, 2)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(10, 2), (11, 2), (12, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(10, 2), (11, 2), (12, 1), (16, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((492817744926035596762 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (16, 1)],
  term ((-3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(10, 2), (12, 1)],
  term ((-5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13233571487311860256371 : Rat) / 867851652931479664231) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(10, 2), (12, 1), (13, 2)],
  term ((276669183649289883953668 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(10, 2), (12, 1), (15, 2)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-16304117144212294774288741 : Rat) / 1349908410627278368612200) [(10, 2), (12, 1), (16, 1)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 1430587202512273027840969987420490002886433592478549358510127564587667200) [(10, 2), (12, 2)],
  term ((25554335901564559274 : Rat) / 6409821512950039737) [(10, 2), (12, 2), (16, 1)],
  term ((4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(10, 2), (13, 1), (15, 1)],
  term ((-2721277994998787991202507 : Rat) / 757634493009181746873663) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(10, 2), (13, 1), (15, 3)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(10, 2), (13, 2)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(10, 2), (13, 2), (15, 2)],
  term ((-4534893515323182578033 : Rat) / 4339258264657398321155) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-358925737512943747664125147 : Rat) / 15152689860183634937473260) [(10, 2), (13, 2), (16, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (13, 3), (15, 1)],
  term ((1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 1203168328574819748105421613587240869666580419359186093392066946785486791649920000) [(10, 2), (15, 2)],
  term ((7395699534151762065229813 : Rat) / 337477102656819592153050) [(10, 2), (15, 2), (16, 1)],
  term ((-547564681946801206352233 : Rat) / 449969470209092789537400) [(10, 2), (16, 1)],
  term ((-2308690611150561 : Rat) / 7342292683791569) [(10, 3), (15, 2), (16, 1)],
  term ((18626531947003029748 : Rat) / 6409821512950039737) [(10, 3), (16, 1)],
  term ((-3519928786664250617234177992635471761706748322185770831707651846013629520125878142977 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(11, 2), (12, 1)],
  term ((-5358418899081921113349036574770049153894730731903494496385082788640676258837 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13233571487311860256371 : Rat) / 867851652931479664231) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1879755372770408788094907081981704759010374379550006964088326782769 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(11, 2), (12, 1), (13, 2)],
  term ((276669183649289883953668 : Rat) / 13017774793972194963465) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((336981889722456586186762527020870964418612650069032215101071598601291 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(11, 2), (12, 1), (15, 2)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-16304117144212294774288741 : Rat) / 1349908410627278368612200) [(11, 2), (12, 1), (16, 1)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 1430587202512273027840969987420490002886433592478549358510127564587667200) [(11, 2), (12, 2)],
  term ((25554335901564559274 : Rat) / 6409821512950039737) [(11, 2), (12, 2), (16, 1)],
  term ((4450988116876122556012229908713376285197097047120609714831851656609612161728401703629 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(11, 2), (13, 1), (15, 1)],
  term ((-2721277994998787991202507 : Rat) / 757634493009181746873663) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(11, 2), (13, 1), (15, 3)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-8886209365458733811077557121496934817486946574090041158582428095414265006880795807 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 2), (13, 2)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(11, 2), (13, 2), (15, 2)],
  term ((-4534893515323182578033 : Rat) / 4339258264657398321155) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-358925737512943747664125147 : Rat) / 15152689860183634937473260) [(11, 2), (13, 2), (16, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 2), (13, 3), (15, 1)],
  term ((1179851602192058314515777023291979536899978152321301718721132044782586420880547732943 : Rat) / 1203168328574819748105421613587240869666580419359186093392066946785486791649920000) [(11, 2), (15, 2)],
  term ((7395699534151762065229813 : Rat) / 337477102656819592153050) [(11, 2), (15, 2), (16, 1)],
  term ((-547564681946801206352233 : Rat) / 449969470209092789537400) [(11, 2), (16, 1)],
  term ((-685851645270409302560606049996505500578646665083612632339323040712 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(11, 3), (12, 1), (13, 1)],
  term ((-116211397484807968872952 : Rat) / 4339258264657398321155) [(11, 3), (12, 1), (13, 1), (16, 1)],
  term ((725022740977751376001601141104170068927830600282841415021742782134107707101 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(11, 3), (12, 1), (15, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((20191695976066405504776923951603464064657062695328181674896243577025110721725432731641 : Rat) / 31159792565559842113565453397107424091525008542470735550580394619434214129322720000) [(11, 3), (13, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 3), (13, 1), (15, 2)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((300716027809620506376810701179 : Rat) / 39889456056933418972898356950) [(11, 3), (13, 1), (16, 1)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 3), (13, 2), (15, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-11244856253148011005385899116282122736461280175067293048411429005749683641546705311 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(11, 3), (15, 1)],
  term ((-110570259335654814231955637 : Rat) / 7576344930091817468736630) [(11, 3), (15, 1), (16, 1)],
  term ((73962810741726341707655810126666354203282710732625758872821670153 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(11, 4)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(11, 4), (12, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(11, 4), (12, 1), (16, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 4), (13, 1), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(11, 4), (13, 1), (15, 1), (16, 1)],
  term ((492817744926035596762 : Rat) / 619894037808199760165) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 400 through 441. -/
theorem rs_R009_ueqv_R009NYNYN_block_20_0400_0441_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_20_0400_0441
      rs_R009_ueqv_R009NYNYN_block_20_0400_0441 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
