/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 20:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0300 : Poly :=
[
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0300 : Poly :=
[
  term ((4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((4398314402745957616864 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0300_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0300
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0301 : Poly :=
[
  term ((-701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 3175145047044449610540718876948919688810310035083268976052241000) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 301 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0301 : Poly :=
[
  term ((-701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 1587572523522224805270359438474459844405155017541634488026120500) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 3175145047044449610540718876948919688810310035083268976052241000) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 3175145047044449610540718876948919688810310035083268976052241000) [(8, 1), (11, 3), (13, 1)],
  term ((-701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 1587572523522224805270359438474459844405155017541634488026120500) [(8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0301_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0301
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0302 : Poly :=
[
  term ((-10084765212890875503798 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 302 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0302 : Poly :=
[
  term ((-20169530425781751007596 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((10084765212890875503798 : Rat) / 4339258264657398321155) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((10084765212890875503798 : Rat) / 4339258264657398321155) [(8, 1), (11, 3), (13, 1), (16, 1)],
  term ((-20169530425781751007596 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0302_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0302
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0303 : Poly :=
[
  term ((-1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 8307909937337423335441960340735416841844488729010879133999351290673386000) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 303 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0303 : Poly :=
[
  term ((-1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 4153954968668711667720980170367708420922244364505439566999675645336693000) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 8307909937337423335441960340735416841844488729010879133999351290673386000) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 8307909937337423335441960340735416841844488729010879133999351290673386000) [(8, 1), (11, 3), (15, 1)],
  term ((-1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 4153954968668711667720980170367708420922244364505439566999675645336693000) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0303_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0303
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0304 : Poly :=
[
  term ((-5191284536245964710444 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0304 : Poly :=
[
  term ((-10382569072491929420888 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((5191284536245964710444 : Rat) / 4339258264657398321155) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((5191284536245964710444 : Rat) / 4339258264657398321155) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-10382569072491929420888 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0304_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0304
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0305 : Poly :=
[
  term ((18237183048592505059676817428671279085964279428872960013192310559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2)]
]

/-- Partial product 305 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0305 : Poly :=
[
  term ((36474366097185010119353634857342558171928558857745920026384621118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (9, 1), (11, 3)],
  term ((-18237183048592505059676817428671279085964279428872960013192310559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 2), (11, 2)],
  term ((-18237183048592505059676817428671279085964279428872960013192310559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 4)],
  term ((36474366097185010119353634857342558171928558857745920026384621118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0305_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0305
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0306 : Poly :=
[
  term ((55901335996819086744 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 306 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0306 : Poly :=
[
  term ((111802671993638173488 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-55901335996819086744 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((-55901335996819086744 : Rat) / 619894037808199760165) [(8, 1), (11, 4), (16, 1)],
  term ((111802671993638173488 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0306_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0306
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0307 : Poly :=
[
  term ((1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(8, 1), (12, 1)]
]

/-- Partial product 307 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0307 : Poly :=
[
  term ((1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(8, 1), (10, 2), (12, 1)],
  term ((-1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(8, 1), (11, 2), (12, 1)],
  term ((1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(8, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0307_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0307
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0308 : Poly :=
[
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 308 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0308 : Poly :=
[
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0308_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0308
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0309 : Poly :=
[
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0309 : Poly :=
[
  term ((-159009514516881327386792 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-159009514516881327386792 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0309_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0309
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0310 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 310 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0310 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (11, 2), (12, 1), (13, 2)],
  term ((944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0310_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0310
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0311 : Poly :=
[
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 311 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0311 : Poly :=
[
  term ((155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (12, 1), (13, 2), (16, 1)],
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0311_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0311
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0312 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 312 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0312 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0312_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0312
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0313 : Poly :=
[
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 313 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0313 : Poly :=
[
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0313_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0313
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0314 : Poly :=
[
  term ((8061986569762561028 : Rat) / 10683035854916732895) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 314 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0314 : Poly :=
[
  term ((16123973139525122056 : Rat) / 10683035854916732895) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8061986569762561028 : Rat) / 10683035854916732895) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-8061986569762561028 : Rat) / 10683035854916732895) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((16123973139525122056 : Rat) / 10683035854916732895) [(8, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0314_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0314
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0315 : Poly :=
[
  term ((3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 315 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0315 : Poly :=
[
  term ((3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0315_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0315
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0316 : Poly :=
[
  term ((15678357985455981095245199 : Rat) / 360778330004372260416030) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0316 : Poly :=
[
  term ((15678357985455981095245199 : Rat) / 180389165002186130208015) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15678357985455981095245199 : Rat) / 360778330004372260416030) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15678357985455981095245199 : Rat) / 360778330004372260416030) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((15678357985455981095245199 : Rat) / 180389165002186130208015) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0316_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0316
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0317 : Poly :=
[
  term ((-5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 11124603733536063132748342864678585384945629223511319449114379474124847064000) [(8, 1), (13, 2)]
]

/-- Partial product 317 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0317 : Poly :=
[
  term ((-5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 5562301866768031566374171432339292692472814611755659724557189737062423532000) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 11124603733536063132748342864678585384945629223511319449114379474124847064000) [(8, 1), (10, 2), (13, 2)],
  term ((5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 11124603733536063132748342864678585384945629223511319449114379474124847064000) [(8, 1), (11, 2), (13, 2)],
  term ((-5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 5562301866768031566374171432339292692472814611755659724557189737062423532000) [(8, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0317_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0317
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0318 : Poly :=
[
  term ((-271042624845880939428931 : Rat) / 28482499737187283717055) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 318 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0318 : Poly :=
[
  term ((-542085249691761878857862 : Rat) / 28482499737187283717055) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((271042624845880939428931 : Rat) / 28482499737187283717055) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((271042624845880939428931 : Rat) / 28482499737187283717055) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-542085249691761878857862 : Rat) / 28482499737187283717055) [(8, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0318_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0318
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0319 : Poly :=
[
  term ((-60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (15, 2)]
]

/-- Partial product 319 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0319 : Poly :=
[
  term ((-60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (10, 2), (15, 2)],
  term ((60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (11, 2), (15, 2)],
  term ((-60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0319_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0319
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0320 : Poly :=
[
  term ((-589604590111663573498 : Rat) / 32049107564750198685) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 320 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0320 : Poly :=
[
  term ((-1179209180223327146996 : Rat) / 32049107564750198685) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((589604590111663573498 : Rat) / 32049107564750198685) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((589604590111663573498 : Rat) / 32049107564750198685) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1179209180223327146996 : Rat) / 32049107564750198685) [(8, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0320_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0320
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0321 : Poly :=
[
  term ((34109154008211337234 : Rat) / 10683035854916732895) [(8, 1), (16, 1)]
]

/-- Partial product 321 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0321 : Poly :=
[
  term ((68218308016422674468 : Rat) / 10683035854916732895) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-34109154008211337234 : Rat) / 10683035854916732895) [(8, 1), (10, 2), (16, 1)],
  term ((-34109154008211337234 : Rat) / 10683035854916732895) [(8, 1), (11, 2), (16, 1)],
  term ((68218308016422674468 : Rat) / 10683035854916732895) [(8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0321_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0321
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0322 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2)]
]

/-- Partial product 322 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0322 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (9, 1), (11, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (10, 2)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (11, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0322_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0322
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0323 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (13, 1)]
]

/-- Partial product 323 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0323 : Poly :=
[
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (13, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0323_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0323
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0324 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 324 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0324 : Poly :=
[
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0324_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0324
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0325 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (15, 1)]
]

/-- Partial product 325 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0325 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (15, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0325_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0325
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0326 : Poly :=
[
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0326 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0326_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0326
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0327 : Poly :=
[
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 327 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0327 : Poly :=
[
  term ((1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (13, 1)],
  term ((1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0327_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0327
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0328 : Poly :=
[
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 328 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0328 : Poly :=
[
  term ((3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (13, 1), (16, 1)],
  term ((3628184864870638142464 : Rat) / 619894037808199760165) [(8, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0328_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0328
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0329 : Poly :=
[
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 329 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0329 : Poly :=
[
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (15, 1)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0329_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0329
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0330 : Poly :=
[
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0330 : Poly :=
[
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0330_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0330
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0331 : Poly :=
[
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 331 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0331 : Poly :=
[
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0331_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0331
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0332 : Poly :=
[
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0332 : Poly :=
[
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0332_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0332
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0333 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2)]
]

/-- Partial product 333 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0333 : Poly :=
[
  term ((-389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 2)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 2), (13, 2)],
  term ((-389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0333_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0333
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0334 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (16, 1)]
]

/-- Partial product 334 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0334 : Poly :=
[
  term ((-64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 2), (16, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 2), (16, 1)],
  term ((-64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 3), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0334_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0334
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0335 : Poly :=
[
  term ((50575245416997317663540097508143143432564790030018074458524305201 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 335 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0335 : Poly :=
[
  term ((101150490833994635327080195016286286865129580060036148917048610402 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-50575245416997317663540097508143143432564790030018074458524305201 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 3)],
  term ((-50575245416997317663540097508143143432564790030018074458524305201 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 3), (11, 1)],
  term ((101150490833994635327080195016286286865129580060036148917048610402 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0335_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0335
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0336 : Poly :=
[
  term ((166697162697546550488 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 336 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0336 : Poly :=
[
  term ((333394325395093100976 : Rat) / 88556291115457108595) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-166697162697546550488 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (11, 3), (16, 1)],
  term ((-166697162697546550488 : Rat) / 88556291115457108595) [(9, 1), (10, 3), (11, 1), (16, 1)],
  term ((333394325395093100976 : Rat) / 88556291115457108595) [(9, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0336_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0336
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0337 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 337 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0337 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 3), (12, 1), (13, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0337_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0337
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0338 : Poly :=
[
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 338 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0338 : Poly :=
[
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0338_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0338
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0339 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 339 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0339 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 3), (12, 1), (15, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0339_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0339
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0340 : Poly :=
[
  term ((1188177275681310870348 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0340 : Poly :=
[
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1188177275681310870348 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1188177275681310870348 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (12, 1), (15, 1), (16, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0340_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0340
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0341 : Poly :=
[
  term ((-573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 2222601532931114727378503213864243782167217024558288283236568700) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 341 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0341 : Poly :=
[
  term ((-573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 1111300766465557363689251606932121891083608512279144141618284350) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 2222601532931114727378503213864243782167217024558288283236568700) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 2222601532931114727378503213864243782167217024558288283236568700) [(9, 1), (10, 3), (13, 1)],
  term ((-573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 1111300766465557363689251606932121891083608512279144141618284350) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0341_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0341
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0342 : Poly :=
[
  term ((-1995889145435250188696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 342 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0342 : Poly :=
[
  term ((-3991778290870500377392 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((1995889145435250188696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1995889145435250188696 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-3991778290870500377392 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0342_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0342
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0343 : Poly :=
[
  term ((10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 343 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0343 : Poly :=
[
  term ((10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 1), (10, 3), (15, 1)],
  term ((10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0343_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0343
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0344 : Poly :=
[
  term ((644311338976664930343 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0344 : Poly :=
[
  term ((1288622677953329860686 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-644311338976664930343 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-644311338976664930343 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((1288622677953329860686 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0344_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0344
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0345 : Poly :=
[
  term ((-270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (11, 1)]
]

/-- Partial product 345 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0345 : Poly :=
[
  term ((-270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 2), (11, 1)],
  term ((270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (11, 3)],
  term ((-270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0345_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0345
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0346 : Poly :=
[
  term ((-57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 370433588821852454563083868977373963694536170759714713872761450) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 346 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0346 : Poly :=
[
  term ((-57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 185216794410926227281541934488686981847268085379857356936380725) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 370433588821852454563083868977373963694536170759714713872761450) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 370433588821852454563083868977373963694536170759714713872761450) [(9, 1), (11, 3), (12, 1)],
  term ((-57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 185216794410926227281541934488686981847268085379857356936380725) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0346_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0346
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0347 : Poly :=
[
  term ((-1356885100164789814960 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 347 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0347 : Poly :=
[
  term ((-2713770200329579629920 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1356885100164789814960 : Rat) / 867851652931479664231) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((1356885100164789814960 : Rat) / 867851652931479664231) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-2713770200329579629920 : Rat) / 867851652931479664231) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0347_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0347
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0348 : Poly :=
[
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 348 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0348 : Poly :=
[
  term ((4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0348_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0348
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0349 : Poly :=
[
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0349 : Poly :=
[
  term ((2179610221583563253424 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((2179610221583563253424 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0349_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0349
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0350 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 350 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0350 : Poly :=
[
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 3), (13, 2)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0350_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0350
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0351 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 351 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0351 : Poly :=
[
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 3), (13, 2), (16, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0351_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0351
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0352 : Poly :=
[
  term ((-24711420822446307365096279 : Rat) / 7576344930091817468736630) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 352 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0352 : Poly :=
[
  term ((-24711420822446307365096279 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((24711420822446307365096279 : Rat) / 7576344930091817468736630) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((24711420822446307365096279 : Rat) / 7576344930091817468736630) [(9, 1), (11, 3), (16, 1)],
  term ((-24711420822446307365096279 : Rat) / 3788172465045908734368315) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0352_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0352
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0353 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 353 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0353 : Poly :=
[
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 4), (13, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0353_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0353
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0354 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 354 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0354 : Poly :=
[
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 4), (13, 1), (16, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(9, 2), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0354_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0354
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0355 : Poly :=
[
  term ((24459497435816635593996773177217093339595061 : Rat) / 33914721407698241287039601294027827959000) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 355 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0355 : Poly :=
[
  term ((24459497435816635593996773177217093339595061 : Rat) / 16957360703849120643519800647013913979500) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-24459497435816635593996773177217093339595061 : Rat) / 33914721407698241287039601294027827959000) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-24459497435816635593996773177217093339595061 : Rat) / 33914721407698241287039601294027827959000) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((24459497435816635593996773177217093339595061 : Rat) / 16957360703849120643519800647013913979500) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0355_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0355
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0356 : Poly :=
[
  term ((-40769755824704776676858 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 356 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0356 : Poly :=
[
  term ((-81539511649409553353716 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((40769755824704776676858 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((40769755824704776676858 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-81539511649409553353716 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0356_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0356
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0357 : Poly :=
[
  term ((-282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 830790993733742333544196034073541684184448872901087913399935129067338600) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 357 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0357 : Poly :=
[
  term ((-282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 415395496866871166772098017036770842092224436450543956699967564533669300) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 830790993733742333544196034073541684184448872901087913399935129067338600) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 830790993733742333544196034073541684184448872901087913399935129067338600) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 415395496866871166772098017036770842092224436450543956699967564533669300) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0357_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0357
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0358 : Poly :=
[
  term ((638383408451809198677 : Rat) / 867851652931479664231) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0358 : Poly :=
[
  term ((1276766816903618397354 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-638383408451809198677 : Rat) / 867851652931479664231) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-638383408451809198677 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1276766816903618397354 : Rat) / 867851652931479664231) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0358_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0358
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0359 : Poly :=
[
  term ((1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (13, 1)]
]

/-- Partial product 359 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0359 : Poly :=
[
  term ((1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (10, 2), (13, 1)],
  term ((-1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (11, 2), (13, 1)],
  term ((1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0359_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0359
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0360 : Poly :=
[
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 360 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0360 : Poly :=
[
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0360_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0360
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0361 : Poly :=
[
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0361 : Poly :=
[
  term ((972214275157813717938 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((972214275157813717938 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0361_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0361
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0362 : Poly :=
[
  term ((11500194258375700707278339 : Rat) / 360778330004372260416030) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 362 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0362 : Poly :=
[
  term ((11500194258375700707278339 : Rat) / 180389165002186130208015) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11500194258375700707278339 : Rat) / 360778330004372260416030) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-11500194258375700707278339 : Rat) / 360778330004372260416030) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((11500194258375700707278339 : Rat) / 180389165002186130208015) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0362_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0362
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0363 : Poly :=
[
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 363 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0363 : Poly :=
[
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0363_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0363
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0364 : Poly :=
[
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0364 : Poly :=
[
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0364_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0364
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0365 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3)]
]

/-- Partial product 365 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0365 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (10, 1), (13, 3)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 2), (13, 3)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 2), (13, 3)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0365_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0365
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0366 : Poly :=
[
  term ((9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (15, 1)]
]

/-- Partial product 366 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0366 : Poly :=
[
  term ((9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (10, 2), (15, 1)],
  term ((-9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (11, 2), (15, 1)],
  term ((9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0366_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0366
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0367 : Poly :=
[
  term ((86173930386613180387704721 : Rat) / 7576344930091817468736630) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0367 : Poly :=
[
  term ((86173930386613180387704721 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86173930386613180387704721 : Rat) / 7576344930091817468736630) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-86173930386613180387704721 : Rat) / 7576344930091817468736630) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((86173930386613180387704721 : Rat) / 3788172465045908734368315) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0367_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0367
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0368 : Poly :=
[
  term ((-66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(9, 2)]
]

/-- Partial product 368 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0368 : Poly :=
[
  term ((-66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(8, 1), (9, 2), (10, 1)],
  term ((66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(9, 2), (10, 2)],
  term ((66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(9, 2), (11, 2)],
  term ((-66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0368_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0368
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0369 : Poly :=
[
  term ((172843350608788909488646233714065276159179 : Rat) / 3768302378633137920782177921558647551000) [(9, 2), (10, 1)]
]

/-- Partial product 369 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0369 : Poly :=
[
  term ((172843350608788909488646233714065276159179 : Rat) / 1884151189316568960391088960779323775500) [(8, 1), (9, 2), (10, 2)],
  term ((-172843350608788909488646233714065276159179 : Rat) / 3768302378633137920782177921558647551000) [(9, 2), (10, 1), (11, 2)],
  term ((-172843350608788909488646233714065276159179 : Rat) / 3768302378633137920782177921558647551000) [(9, 2), (10, 3)],
  term ((172843350608788909488646233714065276159179 : Rat) / 1884151189316568960391088960779323775500) [(9, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0369_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0369
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0370 : Poly :=
[
  term ((-220545965254338273258 : Rat) / 619894037808199760165) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 370 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0370 : Poly :=
[
  term ((-441091930508676546516 : Rat) / 619894037808199760165) [(8, 1), (9, 2), (10, 2), (16, 1)],
  term ((220545965254338273258 : Rat) / 619894037808199760165) [(9, 2), (10, 1), (11, 2), (16, 1)],
  term ((220545965254338273258 : Rat) / 619894037808199760165) [(9, 2), (10, 3), (16, 1)],
  term ((-441091930508676546516 : Rat) / 619894037808199760165) [(9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0370_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0370
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0371 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 371 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0371 : Poly :=
[
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 3), (13, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0371_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0371
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0372 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 372 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0372 : Poly :=
[
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 3), (13, 1), (16, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0372_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0372
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0373 : Poly :=
[
  term ((-742183550159579544714885424430369479527691 : Rat) / 15826869990259179267285147270546319714200) [(9, 2), (12, 1)]
]

/-- Partial product 373 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0373 : Poly :=
[
  term ((-742183550159579544714885424430369479527691 : Rat) / 7913434995129589633642573635273159857100) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((742183550159579544714885424430369479527691 : Rat) / 15826869990259179267285147270546319714200) [(9, 2), (10, 2), (12, 1)],
  term ((742183550159579544714885424430369479527691 : Rat) / 15826869990259179267285147270546319714200) [(9, 2), (11, 2), (12, 1)],
  term ((-742183550159579544714885424430369479527691 : Rat) / 7913434995129589633642573635273159857100) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0373_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0373
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0374 : Poly :=
[
  term ((315672325816609132494 : Rat) / 867851652931479664231) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 374 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0374 : Poly :=
[
  term ((631344651633218264988 : Rat) / 867851652931479664231) [(8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-315672325816609132494 : Rat) / 867851652931479664231) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-315672325816609132494 : Rat) / 867851652931479664231) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((631344651633218264988 : Rat) / 867851652931479664231) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0374_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0374
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0375 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 375 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0375 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0375_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0375
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0376 : Poly :=
[
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0376 : Poly :=
[
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0376_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0376
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0377 : Poly :=
[
  term ((-4815216119097466034610881 : Rat) / 2164669980026233562496180) [(9, 2), (16, 1)]
]

/-- Partial product 377 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0377 : Poly :=
[
  term ((-4815216119097466034610881 : Rat) / 1082334990013116781248090) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((4815216119097466034610881 : Rat) / 2164669980026233562496180) [(9, 2), (10, 2), (16, 1)],
  term ((4815216119097466034610881 : Rat) / 2164669980026233562496180) [(9, 2), (11, 2), (16, 1)],
  term ((-4815216119097466034610881 : Rat) / 1082334990013116781248090) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0377_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0377
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0378 : Poly :=
[
  term ((-1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 5722348810049092111363879949681960011545734369914197434040510258350668800) [(10, 1)]
]

/-- Partial product 378 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0378 : Poly :=
[
  term ((-1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 2861174405024546055681939974840980005772867184957098717020255129175334400) [(8, 1), (10, 2)],
  term ((-1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 2861174405024546055681939974840980005772867184957098717020255129175334400) [(9, 1), (10, 1), (11, 1)],
  term ((1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 5722348810049092111363879949681960011545734369914197434040510258350668800) [(10, 1), (11, 2)],
  term ((1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 5722348810049092111363879949681960011545734369914197434040510258350668800) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0378_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0378
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0379 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 379 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0379 : Poly :=
[
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 3), (12, 1), (13, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 3), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0379_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0379
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0380 : Poly :=
[
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 380 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0380 : Poly :=
[
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0380_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0380
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0381 : Poly :=
[
  term ((4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 381 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0381 : Poly :=
[
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(10, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0381_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0381
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0382 : Poly :=
[
  term ((-898070297542561931728 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0382 : Poly :=
[
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0382_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0382
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0383 : Poly :=
[
  term ((6341417698079030253372886405043734691311 : Rat) / 24424182083733301338403005047139382275) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 383 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0383 : Poly :=
[
  term ((12682835396158060506745772810087469382622 : Rat) / 24424182083733301338403005047139382275) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((12682835396158060506745772810087469382622 : Rat) / 24424182083733301338403005047139382275) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-6341417698079030253372886405043734691311 : Rat) / 24424182083733301338403005047139382275) [(10, 1), (11, 3), (13, 1)],
  term ((-6341417698079030253372886405043734691311 : Rat) / 24424182083733301338403005047139382275) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0383_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0383
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0384 : Poly :=
[
  term ((-740963157741320935752 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 384 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0384 : Poly :=
[
  term ((-1481926315482641871504 : Rat) / 123978807561639952033) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1481926315482641871504 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((740963157741320935752 : Rat) / 123978807561639952033) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((740963157741320935752 : Rat) / 123978807561639952033) [(10, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0384_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0384
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0385 : Poly :=
[
  term ((-129843095969959631932171305167911436585076809634532703458830882251 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 385 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0385 : Poly :=
[
  term ((-129843095969959631932171305167911436585076809634532703458830882251 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-129843095969959631932171305167911436585076809634532703458830882251 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((129843095969959631932171305167911436585076809634532703458830882251 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(10, 1), (11, 3), (15, 1)],
  term ((129843095969959631932171305167911436585076809634532703458830882251 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0385_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0385
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0386 : Poly :=
[
  term ((72944513322029274556 : Rat) / 88556291115457108595) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0386 : Poly :=
[
  term ((145889026644058549112 : Rat) / 88556291115457108595) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((145889026644058549112 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-72944513322029274556 : Rat) / 88556291115457108595) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-72944513322029274556 : Rat) / 88556291115457108595) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0386_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0386
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0387 : Poly :=
[
  term ((243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 1), (12, 1)]
]

/-- Partial product 387 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0387 : Poly :=
[
  term ((243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 131810728371474556102697372215955397640948775126992341519726878482196186640000) [(8, 1), (10, 2), (12, 1)],
  term ((243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 131810728371474556102697372215955397640948775126992341519726878482196186640000) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 1), (11, 2), (12, 1)],
  term ((-243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0387_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0387
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0388 : Poly :=
[
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 388 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0388 : Poly :=
[
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0388_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0388
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0389 : Poly :=
[
  term ((294241217500957067036 : Rat) / 265668873346371325785) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0389 : Poly :=
[
  term ((588482435001914134072 : Rat) / 265668873346371325785) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((588482435001914134072 : Rat) / 265668873346371325785) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(10, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0389_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0389
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0390 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 390 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0390 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (11, 2), (12, 1), (13, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 3), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0390_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0390
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0391 : Poly :=
[
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 391 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0391 : Poly :=
[
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (12, 1), (13, 2), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 3), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0391_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0391
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0392 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 392 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0392 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0392_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0392
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0393 : Poly :=
[
  term ((425212877599884 : Rat) / 7342292683791569) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 393 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0393 : Poly :=
[
  term ((850425755199768 : Rat) / 7342292683791569) [(8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((850425755199768 : Rat) / 7342292683791569) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(10, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0393_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0393
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0394 : Poly :=
[
  term ((2706696571234225068150902 : Rat) / 168738551328409796076525) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 394 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0394 : Poly :=
[
  term ((5413393142468450136301804 : Rat) / 168738551328409796076525) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((5413393142468450136301804 : Rat) / 168738551328409796076525) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2706696571234225068150902 : Rat) / 168738551328409796076525) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2706696571234225068150902 : Rat) / 168738551328409796076525) [(10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0394_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0394
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0395 : Poly :=
[
  term ((3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 395 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0395 : Poly :=
[
  term ((3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0395_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0395
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0396 : Poly :=
[
  term ((-3317843429890571964293 : Rat) / 1859682113424599280495) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0396 : Poly :=
[
  term ((-6635686859781143928586 : Rat) / 1859682113424599280495) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6635686859781143928586 : Rat) / 1859682113424599280495) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3317843429890571964293 : Rat) / 1859682113424599280495) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3317843429890571964293 : Rat) / 1859682113424599280495) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0396_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0396
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0397 : Poly :=
[
  term ((70730743884244359700585565421483053426477 : Rat) / 211024933203455723563801963607284262856) [(10, 1), (13, 2)]
]

/-- Partial product 397 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0397 : Poly :=
[
  term ((70730743884244359700585565421483053426477 : Rat) / 105512466601727861781900981803642131428) [(8, 1), (10, 2), (13, 2)],
  term ((70730743884244359700585565421483053426477 : Rat) / 105512466601727861781900981803642131428) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-70730743884244359700585565421483053426477 : Rat) / 211024933203455723563801963607284262856) [(10, 1), (11, 2), (13, 2)],
  term ((-70730743884244359700585565421483053426477 : Rat) / 211024933203455723563801963607284262856) [(10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0397_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0397
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0398 : Poly :=
[
  term ((4379869302266815606182 : Rat) / 867851652931479664231) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 398 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0398 : Poly :=
[
  term ((8759738604533631212364 : Rat) / 867851652931479664231) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((8759738604533631212364 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4379869302266815606182 : Rat) / 867851652931479664231) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((-4379869302266815606182 : Rat) / 867851652931479664231) [(10, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0398_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0398
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0399 : Poly :=
[
  term ((-2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(10, 1), (15, 2)]
]

/-- Partial product 399 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0399 : Poly :=
[
  term ((-2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(8, 1), (10, 2), (15, 2)],
  term ((-2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(10, 1), (11, 2), (15, 2)],
  term ((2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0399_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0399
        rs_R009_ueqv_R009NYNYN_generator_20_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_20_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_20_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_20_0300,
  rs_R009_ueqv_R009NYNYN_partial_20_0301,
  rs_R009_ueqv_R009NYNYN_partial_20_0302,
  rs_R009_ueqv_R009NYNYN_partial_20_0303,
  rs_R009_ueqv_R009NYNYN_partial_20_0304,
  rs_R009_ueqv_R009NYNYN_partial_20_0305,
  rs_R009_ueqv_R009NYNYN_partial_20_0306,
  rs_R009_ueqv_R009NYNYN_partial_20_0307,
  rs_R009_ueqv_R009NYNYN_partial_20_0308,
  rs_R009_ueqv_R009NYNYN_partial_20_0309,
  rs_R009_ueqv_R009NYNYN_partial_20_0310,
  rs_R009_ueqv_R009NYNYN_partial_20_0311,
  rs_R009_ueqv_R009NYNYN_partial_20_0312,
  rs_R009_ueqv_R009NYNYN_partial_20_0313,
  rs_R009_ueqv_R009NYNYN_partial_20_0314,
  rs_R009_ueqv_R009NYNYN_partial_20_0315,
  rs_R009_ueqv_R009NYNYN_partial_20_0316,
  rs_R009_ueqv_R009NYNYN_partial_20_0317,
  rs_R009_ueqv_R009NYNYN_partial_20_0318,
  rs_R009_ueqv_R009NYNYN_partial_20_0319,
  rs_R009_ueqv_R009NYNYN_partial_20_0320,
  rs_R009_ueqv_R009NYNYN_partial_20_0321,
  rs_R009_ueqv_R009NYNYN_partial_20_0322,
  rs_R009_ueqv_R009NYNYN_partial_20_0323,
  rs_R009_ueqv_R009NYNYN_partial_20_0324,
  rs_R009_ueqv_R009NYNYN_partial_20_0325,
  rs_R009_ueqv_R009NYNYN_partial_20_0326,
  rs_R009_ueqv_R009NYNYN_partial_20_0327,
  rs_R009_ueqv_R009NYNYN_partial_20_0328,
  rs_R009_ueqv_R009NYNYN_partial_20_0329,
  rs_R009_ueqv_R009NYNYN_partial_20_0330,
  rs_R009_ueqv_R009NYNYN_partial_20_0331,
  rs_R009_ueqv_R009NYNYN_partial_20_0332,
  rs_R009_ueqv_R009NYNYN_partial_20_0333,
  rs_R009_ueqv_R009NYNYN_partial_20_0334,
  rs_R009_ueqv_R009NYNYN_partial_20_0335,
  rs_R009_ueqv_R009NYNYN_partial_20_0336,
  rs_R009_ueqv_R009NYNYN_partial_20_0337,
  rs_R009_ueqv_R009NYNYN_partial_20_0338,
  rs_R009_ueqv_R009NYNYN_partial_20_0339,
  rs_R009_ueqv_R009NYNYN_partial_20_0340,
  rs_R009_ueqv_R009NYNYN_partial_20_0341,
  rs_R009_ueqv_R009NYNYN_partial_20_0342,
  rs_R009_ueqv_R009NYNYN_partial_20_0343,
  rs_R009_ueqv_R009NYNYN_partial_20_0344,
  rs_R009_ueqv_R009NYNYN_partial_20_0345,
  rs_R009_ueqv_R009NYNYN_partial_20_0346,
  rs_R009_ueqv_R009NYNYN_partial_20_0347,
  rs_R009_ueqv_R009NYNYN_partial_20_0348,
  rs_R009_ueqv_R009NYNYN_partial_20_0349,
  rs_R009_ueqv_R009NYNYN_partial_20_0350,
  rs_R009_ueqv_R009NYNYN_partial_20_0351,
  rs_R009_ueqv_R009NYNYN_partial_20_0352,
  rs_R009_ueqv_R009NYNYN_partial_20_0353,
  rs_R009_ueqv_R009NYNYN_partial_20_0354,
  rs_R009_ueqv_R009NYNYN_partial_20_0355,
  rs_R009_ueqv_R009NYNYN_partial_20_0356,
  rs_R009_ueqv_R009NYNYN_partial_20_0357,
  rs_R009_ueqv_R009NYNYN_partial_20_0358,
  rs_R009_ueqv_R009NYNYN_partial_20_0359,
  rs_R009_ueqv_R009NYNYN_partial_20_0360,
  rs_R009_ueqv_R009NYNYN_partial_20_0361,
  rs_R009_ueqv_R009NYNYN_partial_20_0362,
  rs_R009_ueqv_R009NYNYN_partial_20_0363,
  rs_R009_ueqv_R009NYNYN_partial_20_0364,
  rs_R009_ueqv_R009NYNYN_partial_20_0365,
  rs_R009_ueqv_R009NYNYN_partial_20_0366,
  rs_R009_ueqv_R009NYNYN_partial_20_0367,
  rs_R009_ueqv_R009NYNYN_partial_20_0368,
  rs_R009_ueqv_R009NYNYN_partial_20_0369,
  rs_R009_ueqv_R009NYNYN_partial_20_0370,
  rs_R009_ueqv_R009NYNYN_partial_20_0371,
  rs_R009_ueqv_R009NYNYN_partial_20_0372,
  rs_R009_ueqv_R009NYNYN_partial_20_0373,
  rs_R009_ueqv_R009NYNYN_partial_20_0374,
  rs_R009_ueqv_R009NYNYN_partial_20_0375,
  rs_R009_ueqv_R009NYNYN_partial_20_0376,
  rs_R009_ueqv_R009NYNYN_partial_20_0377,
  rs_R009_ueqv_R009NYNYN_partial_20_0378,
  rs_R009_ueqv_R009NYNYN_partial_20_0379,
  rs_R009_ueqv_R009NYNYN_partial_20_0380,
  rs_R009_ueqv_R009NYNYN_partial_20_0381,
  rs_R009_ueqv_R009NYNYN_partial_20_0382,
  rs_R009_ueqv_R009NYNYN_partial_20_0383,
  rs_R009_ueqv_R009NYNYN_partial_20_0384,
  rs_R009_ueqv_R009NYNYN_partial_20_0385,
  rs_R009_ueqv_R009NYNYN_partial_20_0386,
  rs_R009_ueqv_R009NYNYN_partial_20_0387,
  rs_R009_ueqv_R009NYNYN_partial_20_0388,
  rs_R009_ueqv_R009NYNYN_partial_20_0389,
  rs_R009_ueqv_R009NYNYN_partial_20_0390,
  rs_R009_ueqv_R009NYNYN_partial_20_0391,
  rs_R009_ueqv_R009NYNYN_partial_20_0392,
  rs_R009_ueqv_R009NYNYN_partial_20_0393,
  rs_R009_ueqv_R009NYNYN_partial_20_0394,
  rs_R009_ueqv_R009NYNYN_partial_20_0395,
  rs_R009_ueqv_R009NYNYN_partial_20_0396,
  rs_R009_ueqv_R009NYNYN_partial_20_0397,
  rs_R009_ueqv_R009NYNYN_partial_20_0398,
  rs_R009_ueqv_R009NYNYN_partial_20_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_20_0300_0399 : Poly :=
[
  term ((-270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 185216794410926227281541934488686981847268085379857356936380725) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2713770200329579629920 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2179610221583563253424 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24711420822446307365096279 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((24459497435816635593996773177217093339595061 : Rat) / 16957360703849120643519800647013913979500) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-81539511649409553353716 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 415395496866871166772098017036770842092224436450543956699967564533669300) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1276766816903618397354 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((972214275157813717938 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((11500194258375700707278339 : Rat) / 180389165002186130208015) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (10, 1), (13, 3)],
  term ((9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((86173930386613180387704721 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((101150490833994635327080195016286286865129580060036148917048610402 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((333394325395093100976 : Rat) / 88556291115457108595) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 1111300766465557363689251606932121891083608512279144141618284350) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-3991778290870500377392 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((1288622677953329860686 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-159009514516881327386792 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((16123973139525122056 : Rat) / 10683035854916732895) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((15678357985455981095245199 : Rat) / 180389165002186130208015) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 5562301866768031566374171432339292692472814611755659724557189737062423532000) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-542085249691761878857862 : Rat) / 28482499737187283717055) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-1179209180223327146996 : Rat) / 32049107564750198685) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((68218308016422674468 : Rat) / 10683035854916732895) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 1587572523522224805270359438474459844405155017541634488026120500) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-20169530425781751007596 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 4153954968668711667720980170367708420922244364505439566999675645336693000) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-10382569072491929420888 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((36474366097185010119353634857342558171928558857745920026384621118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (9, 1), (11, 3)],
  term ((111802671993638173488 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(8, 1), (9, 2), (10, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-742183550159579544714885424430369479527691 : Rat) / 7913434995129589633642573635273159857100) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((631344651633218264988 : Rat) / 867851652931479664231) [(8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4815216119097466034610881 : Rat) / 1082334990013116781248090) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((172843350608788909488646233714065276159179 : Rat) / 1884151189316568960391088960779323775500) [(8, 1), (9, 2), (10, 2)],
  term ((-441091930508676546516 : Rat) / 619894037808199760165) [(8, 1), (9, 2), (10, 2), (16, 1)],
  term ((-1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 2861174405024546055681939974840980005772867184957098717020255129175334400) [(8, 1), (10, 2)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3995297796458102671888 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2350030147431464905665150967513118247954784138646958495525018336707 : Rat) / 3175145047044449610540718876948919688810310035083268976052241000) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-41782655829001589998842 : Rat) / 4339258264657398321155) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2334078676145891443335123535194057573993220691238308083365140619696630980039 : Rat) / 8307909937337423335441960340735416841844488729010879133999351290673386000) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((12339846841804833616932 : Rat) / 4339258264657398321155) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18237183048592505059676817428671279085964279428872960013192310559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 2), (11, 2)],
  term ((-55901335996819086744 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((461745506412674791434510488578375882411844538496222924586484048324062339604474037 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(8, 1), (10, 2), (12, 1)],
  term ((2768673897794787099024774110921829555952484280384891615350274762765224134429 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((108340396573534456262924 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1716221272320651761264388219449139978901421 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((-141698398814831472851848 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (12, 1), (13, 2), (16, 1)],
  term ((-26365904822486781293210193182420958524559440191972496632286611601 : Rat) / 710924987519968806177064253218907762355194479170329551882447624) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-10572903088892100 : Rat) / 7342292683791569) [(8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((5286054064599050484864544 : Rat) / 168738551328409796076525) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-2809431811391285614999058316299284712680758464601097817919977180146944449253100340177 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-204405798027150879727601 : Rat) / 4346726867522557354410) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((254779349151141014671980771460648599318304141762566181853520273301240347118996999 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(8, 1), (10, 2), (13, 2)],
  term ((74284928113291465186016683 : Rat) / 3788172465045908734368315) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((56175657268020246660746340437292497181286609479400171990564812474726261404850941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (10, 2), (15, 2)],
  term ((589604590111663573498 : Rat) / 32049107564750198685) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-34109154008211337234 : Rat) / 10683035854916732895) [(8, 1), (10, 2), (16, 1)],
  term ((-1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(8, 1), (11, 2), (12, 1)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (11, 2), (12, 1), (13, 2)],
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8061986569762561028 : Rat) / 10683035854916732895) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-15678357985455981095245199 : Rat) / 360778330004372260416030) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 11124603733536063132748342864678585384945629223511319449114379474124847064000) [(8, 1), (11, 2), (13, 2)],
  term ((271042624845880939428931 : Rat) / 28482499737187283717055) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (11, 2), (15, 2)],
  term ((589604590111663573498 : Rat) / 32049107564750198685) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-34109154008211337234 : Rat) / 10683035854916732895) [(8, 1), (11, 2), (16, 1)],
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 3175145047044449610540718876948919688810310035083268976052241000) [(8, 1), (11, 3), (13, 1)],
  term ((10084765212890875503798 : Rat) / 4339258264657398321155) [(8, 1), (11, 3), (13, 1), (16, 1)],
  term ((1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 8307909937337423335441960340735416841844488729010879133999351290673386000) [(8, 1), (11, 3), (15, 1)],
  term ((5191284536245964710444 : Rat) / 4339258264657398321155) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-18237183048592505059676817428671279085964279428872960013192310559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 4)],
  term ((-55901335996819086744 : Rat) / 619894037808199760165) [(8, 1), (11, 4), (16, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (13, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (15, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (9, 1), (11, 1)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((-64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1318548377479670937631897946787170336791256 : Rat) / 1413113391987426720293316720584492831625) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((5559479898277901985152 : Rat) / 867851652931479664231) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-659274188739835468815948973393585168395628 : Rat) / 1413113391987426720293316720584492831625) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2779739949138950992576 : Rat) / 867851652931479664231) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((-4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4398314402745957616864 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-701260831327679003717627113506878195064292904349961705493778555827 : Rat) / 1587572523522224805270359438474459844405155017541634488026120500) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-20169530425781751007596 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1160393034373623032986095378397581577660952998459350946899897153448175570377 : Rat) / 4153954968668711667720980170367708420922244364505439566999675645336693000) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-10382569072491929420888 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36474366097185010119353634857342558171928558857745920026384621118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 2), (10, 1), (11, 2)],
  term ((111802671993638173488 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 2), (16, 1)],
  term ((1581414065500104382911989841638989221855191348150933312071800330337681049279 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(8, 2), (10, 1), (12, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-159009514516881327386792 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (12, 1), (13, 2)],
  term ((155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 2), (10, 1), (12, 1), (15, 2)],
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((16123973139525122056 : Rat) / 10683035854916732895) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((3165574050544024008930943770607382579082844555857239994240691462285841940335928186577 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((15678357985455981095245199 : Rat) / 180389165002186130208015) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5952012616491198598031729388743509770718255167648290125730333100561914272305421 : Rat) / 5562301866768031566374171432339292692472814611755659724557189737062423532000) [(8, 2), (10, 1), (13, 2)],
  term ((-542085249691761878857862 : Rat) / 28482499737187283717055) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-60737929474538096222549609361065627331279406383640999327366191371161936157058941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 2), (10, 1), (15, 2)],
  term ((-1179209180223327146996 : Rat) / 32049107564750198685) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((68218308016422674468 : Rat) / 10683035854916732895) [(8, 2), (10, 1), (16, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (10, 2)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 2)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 2), (16, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (11, 2)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 2), (13, 2)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 2), (16, 1)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (13, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (13, 1), (16, 1)],
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (15, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (10, 1), (13, 1)],
  term ((-4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (10, 1), (15, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 3), (10, 1)],
  term ((1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (10, 1), (11, 1), (13, 1)],
  term ((3628184864870638142464 : Rat) / 619894037808199760165) [(8, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (10, 1), (11, 1), (15, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (10, 1), (13, 1), (15, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (10, 1), (13, 2)],
  term ((-64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 3), (10, 1), (13, 2), (16, 1)],
  term ((-1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 2861174405024546055681939974840980005772867184957098717020255129175334400) [(9, 1), (10, 1), (11, 1)],
  term ((243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 131810728371474556102697372215955397640948775126992341519726878482196186640000) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((588482435001914134072 : Rat) / 265668873346371325785) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((850425755199768 : Rat) / 7342292683791569) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5413393142468450136301804 : Rat) / 168738551328409796076525) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6635686859781143928586 : Rat) / 1859682113424599280495) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((70730743884244359700585565421483053426477 : Rat) / 105512466601727861781900981803642131428) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((8759738604533631212364 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3567146578784573260288823822774196577344503 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((5504464576510871165816 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((3567146578784573260288823822774196577344503 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2752232288255435582908 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1727253561534263885800470687753670346288301667805677490921640694409 : Rat) / 2222601532931114727378503213864243782167217024558288283236568700) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-49871531896457215313944 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-99981331897385163770333971584166331435317263729896158879817248128929066477347 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1300850193316440795229 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-50575245416997317663540097508143143432564790030018074458524305201 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 3)],
  term ((-166697162697546550488 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (11, 3), (16, 1)],
  term ((270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 2), (11, 1)],
  term ((57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 370433588821852454563083868977373963694536170759714713872761450) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((1356885100164789814960 : Rat) / 867851652931479664231) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((24711420822446307365096279 : Rat) / 7576344930091817468736630) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-24459497435816635593996773177217093339595061 : Rat) / 33914721407698241287039601294027827959000) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((40769755824704776676858 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 830790993733742333544196034073541684184448872901087913399935129067338600) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-638383408451809198677 : Rat) / 867851652931479664231) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (10, 2), (13, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11500194258375700707278339 : Rat) / 360778330004372260416030) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 2), (13, 3)],
  term ((-9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (10, 2), (15, 1)],
  term ((-86173930386613180387704721 : Rat) / 7576344930091817468736630) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-50575245416997317663540097508143143432564790030018074458524305201 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 3), (11, 1)],
  term ((-166697162697546550488 : Rat) / 88556291115457108595) [(9, 1), (10, 3), (11, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 3), (12, 1), (13, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (12, 1), (13, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 3), (12, 1), (15, 1)],
  term ((-1188177275681310870348 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (12, 1), (15, 1), (16, 1)],
  term ((573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 2222601532931114727378503213864243782167217024558288283236568700) [(9, 1), (10, 3), (13, 1)],
  term ((1995889145435250188696 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 1), (10, 3), (15, 1)],
  term ((-644311338976664930343 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-24459497435816635593996773177217093339595061 : Rat) / 33914721407698241287039601294027827959000) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((40769755824704776676858 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 830790993733742333544196034073541684184448872901087913399935129067338600) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-638383408451809198677 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (11, 2), (13, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11500194258375700707278339 : Rat) / 360778330004372260416030) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 2), (13, 3)],
  term ((-9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (11, 2), (15, 1)],
  term ((-86173930386613180387704721 : Rat) / 7576344930091817468736630) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((270627770508342121467541184427911348733325658943873655659309946850448842202836287 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (11, 3)],
  term ((57610219586960130971921973343678155186293985212764937570536986721 : Rat) / 370433588821852454563083868977373963694536170759714713872761450) [(9, 1), (11, 3), (12, 1)],
  term ((1356885100164789814960 : Rat) / 867851652931479664231) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 3), (13, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 3), (13, 2), (16, 1)],
  term ((24711420822446307365096279 : Rat) / 7576344930091817468736630) [(9, 1), (11, 3), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 4), (13, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 4), (13, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-573115040261613754437203989949302309264957803797779737899772847793 : Rat) / 1111300766465557363689251606932121891083608512279144141618284350) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3991778290870500377392 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((10872303279137544624142889287579533068135834642605853608058784913736499441739 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((1288622677953329860686 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2087793069961973410392959338186635585369759156893683497887386672207 : Rat) / 7408671776437049091261677379547479273890723415194294277455229000) [(9, 2), (10, 1), (11, 2)],
  term ((510861248603997996018 : Rat) / 123978807561639952033) [(9, 2), (10, 1), (11, 2), (16, 1)],
  term ((66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(9, 2), (10, 2)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((742183550159579544714885424430369479527691 : Rat) / 15826869990259179267285147270546319714200) [(9, 2), (10, 2), (12, 1)],
  term ((-315672325816609132494 : Rat) / 867851652931479664231) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((4815216119097466034610881 : Rat) / 2164669980026233562496180) [(9, 2), (10, 2), (16, 1)],
  term ((-172843350608788909488646233714065276159179 : Rat) / 3768302378633137920782177921558647551000) [(9, 2), (10, 3)],
  term ((220545965254338273258 : Rat) / 619894037808199760165) [(9, 2), (10, 3), (16, 1)],
  term ((24459497435816635593996773177217093339595061 : Rat) / 16957360703849120643519800647013913979500) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-81539511649409553353716 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-282711395539197411335118760173390998199786299963651345098429103256464857549 : Rat) / 415395496866871166772098017036770842092224436450543956699967564533669300) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1276766816903618397354 : Rat) / 867851652931479664231) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1961780787452060079881518291238891935116796678969116354957510363035103133933487586137 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(9, 2), (11, 1), (13, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((972214275157813717938 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11500194258375700707278339 : Rat) / 180389165002186130208015) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (11, 1), (13, 3)],
  term ((9296601175701284102983726584993710927528819952498995527844647410370498208015058350411 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 2), (11, 1), (15, 1)],
  term ((86173930386613180387704721 : Rat) / 3788172465045908734368315) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-250304659837482803166556648880056543104054973984271873670176880641388111231780211 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(9, 2), (11, 2)],
  term ((-14146896295229189082822327707318195042352627645486578871965369819 : Rat) / 53556663444123246442855499129258886317282337941163573090037800) [(9, 2), (11, 2), (12, 1)],
  term ((-61825357676452831886 : Rat) / 17711258223091421719) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((20551535709078373473909773078581861762321167272033373526043603305529307822251 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((17287306253176391208234 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 2), (13, 2)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-21713056818700989072702983 : Rat) / 5050896620061211645824420) [(9, 2), (11, 2), (16, 1)],
  term ((2721304306748048046376886983586947620466744 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 3), (13, 1)],
  term ((-3870417608991304228736 : Rat) / 867851652931479664231) [(9, 2), (11, 3), (13, 1), (16, 1)],
  term ((172843350608788909488646233714065276159179 : Rat) / 1884151189316568960391088960779323775500) [(9, 3), (10, 1), (11, 1)],
  term ((-441091930508676546516 : Rat) / 619894037808199760165) [(9, 3), (10, 1), (11, 1), (16, 1)],
  term ((-66319420504184015274098958214295153124227542764535800325341829095526207023200903 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 3), (11, 1)],
  term ((-742183550159579544714885424430369479527691 : Rat) / 7913434995129589633642573635273159857100) [(9, 3), (11, 1), (12, 1)],
  term ((631344651633218264988 : Rat) / 867851652931479664231) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4815216119097466034610881 : Rat) / 1082334990013116781248090) [(9, 3), (11, 1), (16, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 2), (13, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 5722348810049092111363879949681960011545734369914197434040510258350668800) [(10, 1), (11, 2)],
  term ((-243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 1), (11, 2), (12, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (11, 2), (12, 1), (13, 2)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2706696571234225068150902 : Rat) / 168738551328409796076525) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((3317843429890571964293 : Rat) / 1859682113424599280495) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70730743884244359700585565421483053426477 : Rat) / 211024933203455723563801963607284262856) [(10, 1), (11, 2), (13, 2)],
  term ((-4379869302266815606182 : Rat) / 867851652931479664231) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(10, 1), (11, 2), (15, 2)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 3), (12, 1), (13, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-6341417698079030253372886405043734691311 : Rat) / 24424182083733301338403005047139382275) [(10, 1), (11, 3), (13, 1)],
  term ((740963157741320935752 : Rat) / 123978807561639952033) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((129843095969959631932171305167911436585076809634532703458830882251 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(10, 1), (11, 3), (15, 1)],
  term ((-72944513322029274556 : Rat) / 88556291115457108595) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((1149443733910222272323156251438255546490843460381202133733250381769173188301 : Rat) / 5722348810049092111363879949681960011545734369914197434040510258350668800) [(10, 3)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 3), (11, 1), (12, 1), (13, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6341417698079030253372886405043734691311 : Rat) / 24424182083733301338403005047139382275) [(10, 3), (11, 1), (13, 1)],
  term ((740963157741320935752 : Rat) / 123978807561639952033) [(10, 3), (11, 1), (13, 1), (16, 1)],
  term ((129843095969959631932171305167911436585076809634532703458830882251 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(10, 3), (11, 1), (15, 1)],
  term ((-72944513322029274556 : Rat) / 88556291115457108595) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-243361970788624470081302684063531858585523642920133458125329067270873005888917921 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 3), (12, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 3), (12, 1), (13, 1), (15, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(10, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 3), (12, 1), (13, 2)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 3), (12, 1), (13, 2), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 3), (12, 1), (15, 2)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(10, 3), (12, 1), (15, 2), (16, 1)],
  term ((-2706696571234225068150902 : Rat) / 168738551328409796076525) [(10, 3), (12, 1), (16, 1)],
  term ((-3519525954564251094292397839203104903252542644916337679470723330858436087641 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 3), (13, 1), (15, 1)],
  term ((3317843429890571964293 : Rat) / 1859682113424599280495) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-70730743884244359700585565421483053426477 : Rat) / 211024933203455723563801963607284262856) [(10, 3), (13, 2)],
  term ((-4379869302266815606182 : Rat) / 867851652931479664231) [(10, 3), (13, 2), (16, 1)],
  term ((2682494011938054540386384858857403856279937718816494974715750269221 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NYNYN_block_20_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_20_0300_0399
      rs_R009_ueqv_R009NYNYN_block_20_0300_0399 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
