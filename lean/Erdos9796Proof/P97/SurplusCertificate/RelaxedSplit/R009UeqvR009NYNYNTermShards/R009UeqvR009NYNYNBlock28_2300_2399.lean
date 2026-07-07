/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:2300-2399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 2300 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2300 : Poly :=
[
  term ((1244639333360497992903087736609315506780781627395055954906263941691412864854543623 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2300 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2300 : Poly :=
[
  term ((-1244639333360497992903087736609315506780781627395055954906263941691412864854543623 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(11, 1), (12, 1), (13, 1)],
  term ((1244639333360497992903087736609315506780781627395055954906263941691412864854543623 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2300 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2300_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2300
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2300 := by
  native_decide

/-- Coefficient term 2301 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2301 : Poly :=
[
  term ((525905096241549761925756143857906828598607699650822805552947001337694771294127511 : Rat) / 311488904539009767716953600211000390778477618258316944575202625275495717792000) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2301 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2301 : Poly :=
[
  term ((-525905096241549761925756143857906828598607699650822805552947001337694771294127511 : Rat) / 311488904539009767716953600211000390778477618258316944575202625275495717792000) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((525905096241549761925756143857906828598607699650822805552947001337694771294127511 : Rat) / 155744452269504883858476800105500195389238809129158472287601312637747858896000) [(11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2301 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2301_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2301
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2301 := by
  native_decide

/-- Coefficient term 2302 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2302 : Poly :=
[
  term ((759257519421629999986996 : Rat) / 28482499737187283717055) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2302 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2302 : Poly :=
[
  term ((-759257519421629999986996 : Rat) / 28482499737187283717055) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1518515038843259999973992 : Rat) / 28482499737187283717055) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2302 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2302_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2302
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2302 := by
  native_decide

/-- Coefficient term 2303 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2303 : Poly :=
[
  term ((570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 653863282105260169919043174965287436626649575894374746657356351580775750) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 2303 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2303 : Poly :=
[
  term ((570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 326931641052630084959521587482643718313324787947187373328678175790387875) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 653863282105260169919043174965287436626649575894374746657356351580775750) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2303 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2303_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2303
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2303 := by
  native_decide

/-- Coefficient term 2304 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2304 : Poly :=
[
  term ((402787655279832436132 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2304 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2304 : Poly :=
[
  term ((805575310559664872264 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-402787655279832436132 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2304 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2304_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2304
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2304 := by
  native_decide

/-- Coefficient term 2305 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2305 : Poly :=
[
  term ((3701467792506590855391760 : Rat) / 108233499001311678124809) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2305 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2305 : Poly :=
[
  term ((7402935585013181710783520 : Rat) / 108233499001311678124809) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3701467792506590855391760 : Rat) / 108233499001311678124809) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2305 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2305_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2305
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2305 := by
  native_decide

/-- Coefficient term 2306 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2306 : Poly :=
[
  term ((503133504104619930762407150475443956691858252317770681883916768 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 2306 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2306 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-503133504104619930762407150475443956691858252317770681883916768 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2306 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2306_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2306
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2306 := by
  native_decide

/-- Coefficient term 2307 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2307 : Poly :=
[
  term ((1399744865121568721128 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2307 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2307 : Poly :=
[
  term ((2799489730243137442256 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1399744865121568721128 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2307 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2307_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2307
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2307 := by
  native_decide

/-- Coefficient term 2308 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2308 : Poly :=
[
  term ((13989896892563239286550105689226432731137611993968 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 2308 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2308 : Poly :=
[
  term ((-13989896892563239286550105689226432731137611993968 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((27979793785126478573100211378452865462275223987936 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2308 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2308_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2308
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2308 := by
  native_decide

/-- Coefficient term 2309 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2309 : Poly :=
[
  term ((9461193315707740565139311721725296741765537180909233667189912154540001404586349676569 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2309 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2309 : Poly :=
[
  term ((9461193315707740565139311721725296741765537180909233667189912154540001404586349676569 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9461193315707740565139311721725296741765537180909233667189912154540001404586349676569 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2309 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2309_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2309
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2309 := by
  native_decide

/-- Coefficient term 2310 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2310 : Poly :=
[
  term ((172670294046116360291994169 : Rat) / 3788172465045908734368315) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2310 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2310 : Poly :=
[
  term ((345340588092232720583988338 : Rat) / 3788172465045908734368315) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-172670294046116360291994169 : Rat) / 3788172465045908734368315) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2310 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2310_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2310
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2310 := by
  native_decide

/-- Coefficient term 2311 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2311 : Poly :=
[
  term ((-22976363729865058244159475068589837498619760868781269297161261965553 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 2311 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2311 : Poly :=
[
  term ((22976363729865058244159475068589837498619760868781269297161261965553 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(11, 1), (12, 2), (13, 1)],
  term ((-22976363729865058244159475068589837498619760868781269297161261965553 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2311 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2311_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2311
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2311 := by
  native_decide

/-- Coefficient term 2312 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2312 : Poly :=
[
  term ((-494130539801094265859537255076078965976364 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2312 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2312 : Poly :=
[
  term ((494130539801094265859537255076078965976364 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2312 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2312_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2312
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2312 := by
  native_decide

/-- Coefficient term 2313 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2313 : Poly :=
[
  term ((-13402653249941324801184 : Rat) / 619894037808199760165) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2313 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2313 : Poly :=
[
  term ((13402653249941324801184 : Rat) / 619894037808199760165) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-26805306499882649602368 : Rat) / 619894037808199760165) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2313 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2313_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2313
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2313 := by
  native_decide

/-- Coefficient term 2314 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2314 : Poly :=
[
  term ((-3874721704128967262474 : Rat) / 228382013929336753745) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 2314 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2314 : Poly :=
[
  term ((-7749443408257934524948 : Rat) / 228382013929336753745) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((3874721704128967262474 : Rat) / 228382013929336753745) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2314 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2314_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2314
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2314 := by
  native_decide

/-- Coefficient term 2315 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2315 : Poly :=
[
  term ((-2466330295650284597490192952190089705512861764815599752735900477489020629395933537 : Rat) / 1183657837248237117324423680801801484958214949381604389385769976046883727609600) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 2315 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2315 : Poly :=
[
  term ((-2466330295650284597490192952190089705512861764815599752735900477489020629395933537 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((2466330295650284597490192952190089705512861764815599752735900477489020629395933537 : Rat) / 1183657837248237117324423680801801484958214949381604389385769976046883727609600) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2315 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2315_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2315
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2315 := by
  native_decide

/-- Coefficient term 2316 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2316 : Poly :=
[
  term ((-21929207661602494485135824 : Rat) / 757634493009181746873663) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2316 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2316 : Poly :=
[
  term ((-43858415323204988970271648 : Rat) / 757634493009181746873663) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21929207661602494485135824 : Rat) / 757634493009181746873663) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2316 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2316_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2316
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2316 := by
  native_decide

/-- Coefficient term 2317 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2317 : Poly :=
[
  term ((494130539801094265859537255076078965976364 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 3), (15, 1)]
]

/-- Partial product 2317 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2317 : Poly :=
[
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-494130539801094265859537255076078965976364 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2317 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2317_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2317
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2317 := by
  native_decide

/-- Coefficient term 2318 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2318 : Poly :=
[
  term ((13402653249941324801184 : Rat) / 619894037808199760165) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 2318 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2318 : Poly :=
[
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-13402653249941324801184 : Rat) / 619894037808199760165) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2318 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2318_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2318
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2318 := by
  native_decide

/-- Coefficient term 2319 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2319 : Poly :=
[
  term ((1698761872597014807692802808089306612083153067286755620009534193275737653526720925264621 : Rat) / 54176492673986712154785801639770774687131481519175785543942446111656286966182435840000) [(11, 1), (13, 1)]
]

/-- Partial product 2319 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2319 : Poly :=
[
  term ((-1698761872597014807692802808089306612083153067286755620009534193275737653526720925264621 : Rat) / 54176492673986712154785801639770774687131481519175785543942446111656286966182435840000) [(11, 1), (13, 1)],
  term ((1698761872597014807692802808089306612083153067286755620009534193275737653526720925264621 : Rat) / 27088246336993356077392900819885387343565740759587892771971223055828143483091217920000) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2319 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2319_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2319
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2319 := by
  native_decide

/-- Coefficient term 2320 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2320 : Poly :=
[
  term ((-74343862429101155411148707518876288906770404429412376505427253309774535973393753815487641 : Rat) / 81264739010980068232178702459656162030697222278763678315913669167484430449273653760000) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2320 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2320 : Poly :=
[
  term ((74343862429101155411148707518876288906770404429412376505427253309774535973393753815487641 : Rat) / 81264739010980068232178702459656162030697222278763678315913669167484430449273653760000) [(11, 1), (13, 1), (14, 1)],
  term ((-74343862429101155411148707518876288906770404429412376505427253309774535973393753815487641 : Rat) / 40632369505490034116089351229828081015348611139381839157956834583742215224636826880000) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2320 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2320_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2320
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2320 := by
  native_decide

/-- Coefficient term 2321 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2321 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 2321 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2321 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2321 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2321_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2321
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2321 := by
  native_decide

/-- Coefficient term 2322 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2322 : Poly :=
[
  term ((2020095442437435 : Rat) / 7342292683791569) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2322 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2322 : Poly :=
[
  term ((-2020095442437435 : Rat) / 7342292683791569) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2322 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2322_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2322
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2322 := by
  native_decide

/-- Coefficient term 2323 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2323 : Poly :=
[
  term ((-1016464044907976979221904333641 : Rat) / 79778912113866837945796713900) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2323 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2323 : Poly :=
[
  term ((1016464044907976979221904333641 : Rat) / 79778912113866837945796713900) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1016464044907976979221904333641 : Rat) / 39889456056933418972898356950) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2323 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2323_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2323
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2323 := by
  native_decide

/-- Coefficient term 2324 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2324 : Poly :=
[
  term ((-25087411598134628641652791552630797303879897452598333404205521101722394393109 : Rat) / 564937875738944786810053303170008345245425233572739781111955887765790248000) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 2324 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2324 : Poly :=
[
  term ((-25087411598134628641652791552630797303879897452598333404205521101722394393109 : Rat) / 282468937869472393405026651585004172622712616786369890555977943882895124000) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((25087411598134628641652791552630797303879897452598333404205521101722394393109 : Rat) / 564937875738944786810053303170008345245425233572739781111955887765790248000) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2324 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2324_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2324
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2324 := by
  native_decide

/-- Coefficient term 2325 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2325 : Poly :=
[
  term ((-7270226249481828733767 : Rat) / 8678516529314796642310) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2325 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2325 : Poly :=
[
  term ((-7270226249481828733767 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7270226249481828733767 : Rat) / 8678516529314796642310) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2325 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2325_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2325
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2325 := by
  native_decide

/-- Coefficient term 2326 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2326 : Poly :=
[
  term ((5649823850806659311147094563 : Rat) / 7597991629892079804361591800) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2326 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2326 : Poly :=
[
  term ((5649823850806659311147094563 : Rat) / 3798995814946039902180795900) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5649823850806659311147094563 : Rat) / 7597991629892079804361591800) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2326 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2326_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2326
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2326 := by
  native_decide

/-- Coefficient term 2327 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2327 : Poly :=
[
  term ((-30722115867500611237084971499105526737464261462125381903960100351886706331161 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 2327 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2327 : Poly :=
[
  term ((30722115867500611237084971499105526737464261462125381903960100351886706331161 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-30722115867500611237084971499105526737464261462125381903960100351886706331161 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2327 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2327_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2327
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2327 := by
  native_decide

/-- Coefficient term 2328 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2328 : Poly :=
[
  term ((-987536234120603002833 : Rat) / 867851652931479664231) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2328 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2328 : Poly :=
[
  term ((987536234120603002833 : Rat) / 867851652931479664231) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1975072468241206005666 : Rat) / 867851652931479664231) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2328 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2328_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2328
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2328 := by
  native_decide

/-- Coefficient term 2329 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2329 : Poly :=
[
  term ((-307014490016558807295758366552018388525717606192108295240224184201467453803083 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116000) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 2329 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2329 : Poly :=
[
  term ((-307014490016558807295758366552018388525717606192108295240224184201467453803083 : Rat) / 1271110220412625770322619932132518776802206775538664507501900747473028058000) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((307014490016558807295758366552018388525717606192108295240224184201467453803083 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116000) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2329 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2329_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2329
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2329 := by
  native_decide

/-- Coefficient term 2330 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2330 : Poly :=
[
  term ((-448300739201857163621 : Rat) / 313681320336679396710) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2330 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2330 : Poly :=
[
  term ((-448300739201857163621 : Rat) / 156840660168339698355) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((448300739201857163621 : Rat) / 313681320336679396710) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2330 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2330_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2330
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2330 := by
  native_decide

/-- Coefficient term 2331 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2331 : Poly :=
[
  term ((-1682957631478948164607032460896975001422275692623340330720821808 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3)]
]

/-- Partial product 2331 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2331 : Poly :=
[
  term ((1682957631478948164607032460896975001422275692623340330720821808 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3)],
  term ((-3365915262957896329214064921793950002844551385246680661441643616 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2331 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2331_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2331
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2331 := by
  native_decide

/-- Coefficient term 2332 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2332 : Poly :=
[
  term ((-3365915262957896329214064921793950002844551385246680661441643616 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3), (14, 1)]
]

/-- Partial product 2332 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2332 : Poly :=
[
  term ((3365915262957896329214064921793950002844551385246680661441643616 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3), (14, 1)],
  term ((-6731830525915792658428129843587900005689102770493361322883287232 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2332 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2332_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2332
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2332 := by
  native_decide

/-- Coefficient term 2333 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2333 : Poly :=
[
  term ((-1399744865121568721128 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 2333 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2333 : Poly :=
[
  term ((1399744865121568721128 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2333 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2333_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2333
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2333 := by
  native_decide

/-- Coefficient term 2334 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2334 : Poly :=
[
  term ((-699872432560784360564 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 2334 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2334 : Poly :=
[
  term ((-1399744865121568721128 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((699872432560784360564 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2334 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2334_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2334
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2334 := by
  native_decide

/-- Coefficient term 2335 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2335 : Poly :=
[
  term ((-24422919971301380716660253243145728993972434068533771918872241233275935890353923 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 2335 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2335 : Poly :=
[
  term ((24422919971301380716660253243145728993972434068533771918872241233275935890353923 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(11, 1), (14, 1), (15, 1)],
  term ((-24422919971301380716660253243145728993972434068533771918872241233275935890353923 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2335 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2335_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2335
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2335 := by
  native_decide

/-- Coefficient term 2336 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2336 : Poly :=
[
  term ((-494737446544837898093 : Rat) / 28488095613111287720) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2336 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2336 : Poly :=
[
  term ((494737446544837898093 : Rat) / 28488095613111287720) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494737446544837898093 : Rat) / 14244047806555643860) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2336 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2336_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2336
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2336 := by
  native_decide

/-- Coefficient term 2337 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2337 : Poly :=
[
  term ((-170165883702096987553505063900290928335796774192856510703396608907080720330799446143 : Rat) / 245974473270390629640007725859051655200878453226073645220564788647830498932736000) [(11, 1), (15, 1)]
]

/-- Partial product 2337 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2337 : Poly :=
[
  term ((-170165883702096987553505063900290928335796774192856510703396608907080720330799446143 : Rat) / 122987236635195314820003862929525827600439226613036822610282394323915249466368000) [(11, 1), (14, 1), (15, 1)],
  term ((170165883702096987553505063900290928335796774192856510703396608907080720330799446143 : Rat) / 245974473270390629640007725859051655200878453226073645220564788647830498932736000) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2337 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2337_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2337
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2337 := by
  native_decide

/-- Coefficient term 2338 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2338 : Poly :=
[
  term ((-947525219018491235206148683 : Rat) / 60610759440734539749893040) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2338 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2338 : Poly :=
[
  term ((-947525219018491235206148683 : Rat) / 30305379720367269874946520) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((947525219018491235206148683 : Rat) / 60610759440734539749893040) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2338 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2338_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2338
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2338 := by
  native_decide

/-- Coefficient term 2339 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2339 : Poly :=
[
  term ((-434335491906405559929902693944382756278484910794418220817847920857561437002962610309 : Rat) / 1074475605708960072881567358520945658328448570430025363813117055842559107907680000) [(11, 2)]
]

/-- Partial product 2339 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2339 : Poly :=
[
  term ((434335491906405559929902693944382756278484910794418220817847920857561437002962610309 : Rat) / 1074475605708960072881567358520945658328448570430025363813117055842559107907680000) [(11, 2)],
  term ((-434335491906405559929902693944382756278484910794418220817847920857561437002962610309 : Rat) / 537237802854480036440783679260472829164224285215012681906558527921279553953840000) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2339 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2339_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2339
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2339 := by
  native_decide

/-- Coefficient term 2340 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2340 : Poly :=
[
  term ((20476973959062948816814289961399827167689704965126044270688473514 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(11, 2), (12, 1)]
]

/-- Partial product 2340 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2340 : Poly :=
[
  term ((-20476973959062948816814289961399827167689704965126044270688473514 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(11, 2), (12, 1)],
  term ((40953947918125897633628579922799654335379409930252088541376947028 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2340 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2340_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2340
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2340 := by
  native_decide

/-- Coefficient term 2341 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2341 : Poly :=
[
  term ((3512157401358461500788959803102558196348826887794732098977557004 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2341 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2341 : Poly :=
[
  term ((7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3512157401358461500788959803102558196348826887794732098977557004 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2341 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2341_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2341
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2341 := by
  native_decide

/-- Coefficient term 2342 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2342 : Poly :=
[
  term ((-236801443996489053408 : Rat) / 619894037808199760165) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2342 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2342 : Poly :=
[
  term ((-473602887992978106816 : Rat) / 619894037808199760165) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((236801443996489053408 : Rat) / 619894037808199760165) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2342 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2342_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2342
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2342 := by
  native_decide

/-- Coefficient term 2343 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2343 : Poly :=
[
  term ((-14615930794358448344461982376218376647387832253979 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 2343 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2343 : Poly :=
[
  term ((14615930794358448344461982376218376647387832253979 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 2), (12, 1), (14, 1)],
  term ((-29231861588716896688923964752436753294775664507958 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 2), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2343 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2343_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2343
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2343 := by
  native_decide

/-- Coefficient term 2344 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2344 : Poly :=
[
  term ((495824891904596041024 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 2344 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2344 : Poly :=
[
  term ((991649783809192082048 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-495824891904596041024 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2344 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2344_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2344
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2344 := by
  native_decide

/-- Coefficient term 2345 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2345 : Poly :=
[
  term ((-33035071414078347364790310258779166255574394455489455620032360999 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 2)]
]

/-- Partial product 2345 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2345 : Poly :=
[
  term ((33035071414078347364790310258779166255574394455489455620032360999 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 2)],
  term ((-66070142828156694729580620517558332511148788910978911240064721998 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2345 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2345_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2345
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2345 := by
  native_decide

/-- Coefficient term 2346 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2346 : Poly :=
[
  term ((-3417136524057712739352 : Rat) / 619894037808199760165) [(11, 2), (12, 2), (16, 1)]
]

/-- Partial product 2346 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2346 : Poly :=
[
  term ((-6834273048115425478704 : Rat) / 619894037808199760165) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((3417136524057712739352 : Rat) / 619894037808199760165) [(11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2346 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2346_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2346
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2346 := by
  native_decide

/-- Coefficient term 2347 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2347 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2347 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2347 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2347 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2347_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2347
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2347 := by
  native_decide

/-- Coefficient term 2348 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2348 : Poly :=
[
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2348 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2348 : Poly :=
[
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2348 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2348_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2348
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2348 := by
  native_decide

/-- Coefficient term 2349 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2349 : Poly :=
[
  term ((-504984557474518959549284318182743549934417339602785525592147664803223289713 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 2349 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2349 : Poly :=
[
  term ((-504984557474518959549284318182743549934417339602785525592147664803223289713 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((504984557474518959549284318182743549934417339602785525592147664803223289713 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2349 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2349_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2349
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2349 := by
  native_decide

/-- Coefficient term 2350 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2350 : Poly :=
[
  term ((6536316760139080821514 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2350 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2350 : Poly :=
[
  term ((13072633520278161643028 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6536316760139080821514 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2350 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2350_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2350
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2350 := by
  native_decide

/-- Coefficient term 2351 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2351 : Poly :=
[
  term ((209951078118216260751732133307157162732173287666752827310150678938 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2)]
]

/-- Partial product 2351 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2351 : Poly :=
[
  term ((-209951078118216260751732133307157162732173287666752827310150678938 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2)],
  term ((419902156236432521503464266614314325464346575333505654620301357876 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2351 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2351_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2351
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2351 := by
  native_decide

/-- Coefficient term 2352 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2352 : Poly :=
[
  term ((419902156236432521503464266614314325464346575333505654620301357876 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2), (14, 1)]
]

/-- Partial product 2352 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2352 : Poly :=
[
  term ((-419902156236432521503464266614314325464346575333505654620301357876 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2), (14, 1)],
  term ((839804312472865043006928533228628650928693150667011309240602715752 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2352 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2352_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2352
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2352 := by
  native_decide

/-- Coefficient term 2353 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2353 : Poly :=
[
  term ((16170789244898819890592 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2353 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2353 : Poly :=
[
  term ((-16170789244898819890592 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((32341578489797639781184 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2353 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2353_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2353
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2353 := by
  native_decide

/-- Coefficient term 2354 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2354 : Poly :=
[
  term ((8085394622449409945296 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (16, 1)]
]

/-- Partial product 2354 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2354 : Poly :=
[
  term ((16170789244898819890592 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-8085394622449409945296 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2354 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2354_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2354
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2354 := by
  native_decide

/-- Coefficient term 2355 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2355 : Poly :=
[
  term ((-12778224202682698377746706469752752569011797085531600639720983481748332386180800408081 : Rat) / 15579896282779921056782726698553712045762504271235367775290197309717107064661360000) [(11, 2), (14, 1)]
]

/-- Partial product 2355 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2355 : Poly :=
[
  term ((12778224202682698377746706469752752569011797085531600639720983481748332386180800408081 : Rat) / 15579896282779921056782726698553712045762504271235367775290197309717107064661360000) [(11, 2), (14, 1)],
  term ((-12778224202682698377746706469752752569011797085531600639720983481748332386180800408081 : Rat) / 7789948141389960528391363349276856022881252135617683887645098654858553532330680000) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2355 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2355_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2355
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2355 := by
  native_decide

/-- Coefficient term 2356 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2356 : Poly :=
[
  term ((-227858720000299517716645554494 : Rat) / 19944728028466709486449178475) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 2356 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2356 : Poly :=
[
  term ((227858720000299517716645554494 : Rat) / 19944728028466709486449178475) [(11, 2), (14, 1), (16, 1)],
  term ((-455717440000599035433291108988 : Rat) / 19944728028466709486449178475) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2356 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2356_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2356
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2356 := by
  native_decide

/-- Coefficient term 2357 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2357 : Poly :=
[
  term ((-140885506565779881719230152007 : Rat) / 19944728028466709486449178475) [(11, 2), (16, 1)]
]

/-- Partial product 2357 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2357 : Poly :=
[
  term ((-281771013131559763438460304014 : Rat) / 19944728028466709486449178475) [(11, 2), (14, 1), (16, 1)],
  term ((140885506565779881719230152007 : Rat) / 19944728028466709486449178475) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2357 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2357_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2357
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2357 := by
  native_decide

/-- Coefficient term 2358 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2358 : Poly :=
[
  term ((30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1)]
]

/-- Partial product 2358 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2358 : Poly :=
[
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2358 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2358_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2358
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2358 := by
  native_decide

/-- Coefficient term 2359 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2359 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (14, 1)]
]

/-- Partial product 2359 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2359 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (14, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2359 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2359_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2359
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2359 := by
  native_decide

/-- Coefficient term 2360 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2360 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2360 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2360 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2360 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2360_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2360
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2360 := by
  native_decide

/-- Coefficient term 2361 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2361 : Poly :=
[
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (16, 1)]
]

/-- Partial product 2361 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2361 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2361 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2361_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2361
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2361 := by
  native_decide

/-- Coefficient term 2362 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2362 : Poly :=
[
  term ((-7644882646952604482600940998649050973272391799495199688911181363727947038683661839583 : Rat) / 12833795504798077313124497211597235943110191139831318329515380765711859110932480000) [(12, 1)]
]

/-- Partial product 2362 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2362 : Poly :=
[
  term ((7644882646952604482600940998649050973272391799495199688911181363727947038683661839583 : Rat) / 12833795504798077313124497211597235943110191139831318329515380765711859110932480000) [(12, 1)],
  term ((-7644882646952604482600940998649050973272391799495199688911181363727947038683661839583 : Rat) / 6416897752399038656562248605798617971555095569915659164757690382855929555466240000) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2362 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2362_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2362
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2362 := by
  native_decide

/-- Coefficient term 2363 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2363 : Poly :=
[
  term ((-31976621769347293522707445535402697094937328459307623181008547219363723453086941 : Rat) / 26116799969064056396264748090348465492694731664288397088960888819112452403200) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2363 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2363 : Poly :=
[
  term ((31976621769347293522707445535402697094937328459307623181008547219363723453086941 : Rat) / 26116799969064056396264748090348465492694731664288397088960888819112452403200) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-31976621769347293522707445535402697094937328459307623181008547219363723453086941 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2363 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2363_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2363
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2363 := by
  native_decide

/-- Coefficient term 2364 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2364 : Poly :=
[
  term ((-999380710823140750469 : Rat) / 25639286051800158948) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2364 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2364 : Poly :=
[
  term ((999380710823140750469 : Rat) / 25639286051800158948) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-999380710823140750469 : Rat) / 12819643025900079474) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2364 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2364_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2364
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2364 := by
  native_decide

/-- Coefficient term 2365 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2365 : Poly :=
[
  term ((538064020834889292604025523883819658245060218114547742528286857280801285432145318997 : Rat) / 363174075240400282586129054062482149737767598586732264413892717356502677835980800) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2365 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2365 : Poly :=
[
  term ((538064020834889292604025523883819658245060218114547742528286857280801285432145318997 : Rat) / 181587037620200141293064527031241074868883799293366132206946358678251338917990400) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-538064020834889292604025523883819658245060218114547742528286857280801285432145318997 : Rat) / 363174075240400282586129054062482149737767598586732264413892717356502677835980800) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2365 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2365_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2365
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2365 := by
  native_decide

/-- Coefficient term 2366 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2366 : Poly :=
[
  term ((352863359050813040949765443 : Rat) / 30305379720367269874946520) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2366 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2366 : Poly :=
[
  term ((352863359050813040949765443 : Rat) / 15152689860183634937473260) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-352863359050813040949765443 : Rat) / 30305379720367269874946520) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2366 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2366_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2366
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2366 := by
  native_decide

/-- Coefficient term 2367 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2367 : Poly :=
[
  term ((-364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(12, 1), (13, 1), (15, 3)]
]

/-- Partial product 2367 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2367 : Poly :=
[
  term ((-364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 16452835425462135228669201288780436785934500803656198200708073584) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2367 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2367_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2367
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2367 := by
  native_decide

/-- Coefficient term 2368 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2368 : Poly :=
[
  term ((94454695759941 : Rat) / 7342292683791569) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 2368 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2368 : Poly :=
[
  term ((188909391519882 : Rat) / 7342292683791569) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-94454695759941 : Rat) / 7342292683791569) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2368 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2368_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2368
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2368 := by
  native_decide

/-- Coefficient term 2369 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2369 : Poly :=
[
  term ((3121519723404661252915792738889510818932137099234169888147834059074981205297246017 : Rat) / 7748442870339865466822532528943519760971447259004076926501225144403295084352000) [(12, 1), (13, 2)]
]

/-- Partial product 2369 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2369 : Poly :=
[
  term ((-3121519723404661252915792738889510818932137099234169888147834059074981205297246017 : Rat) / 7748442870339865466822532528943519760971447259004076926501225144403295084352000) [(12, 1), (13, 2)],
  term ((3121519723404661252915792738889510818932137099234169888147834059074981205297246017 : Rat) / 3874221435169932733411266264471759880485723629502038463250612572201647542176000) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2369 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2369_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2369
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2369 := by
  native_decide

/-- Coefficient term 2370 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2370 : Poly :=
[
  term ((26080757546136617736612470914580359804610051125025445745375947819586507634555875553 : Rat) / 25386345719929296068931718417196531848445925888052830982879013959952901000048000) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2370 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2370 : Poly :=
[
  term ((-26080757546136617736612470914580359804610051125025445745375947819586507634555875553 : Rat) / 25386345719929296068931718417196531848445925888052830982879013959952901000048000) [(12, 1), (13, 2), (14, 1)],
  term ((26080757546136617736612470914580359804610051125025445745375947819586507634555875553 : Rat) / 12693172859964648034465859208598265924222962944026415491439506979976450500024000) [(12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2370 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2370_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2370
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2370 := by
  native_decide

/-- Coefficient term 2371 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2371 : Poly :=
[
  term ((11892949135528766494445087 : Rat) / 398754996320621972038770) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2371 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2371 : Poly :=
[
  term ((-11892949135528766494445087 : Rat) / 398754996320621972038770) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((11892949135528766494445087 : Rat) / 199377498160310986019385) [(12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2371 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2371_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2371
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2371 := by
  native_decide

/-- Coefficient term 2372 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2372 : Poly :=
[
  term ((-54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(12, 1), (13, 2), (15, 2)]
]

/-- Partial product 2372 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2372 : Poly :=
[
  term ((-54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2372 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2372_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2372
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2372 := by
  native_decide

/-- Coefficient term 2373 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2373 : Poly :=
[
  term ((-2101738315096030146653 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 2373 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2373 : Poly :=
[
  term ((-4203476630192060293306 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2101738315096030146653 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2373 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2373_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2373
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2373 := by
  native_decide

/-- Coefficient term 2374 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2374 : Poly :=
[
  term ((17005515371940331329253043 : Rat) / 841816103343535274304070) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 2374 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2374 : Poly :=
[
  term ((17005515371940331329253043 : Rat) / 420908051671767637152035) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-17005515371940331329253043 : Rat) / 841816103343535274304070) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2374 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2374_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2374
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2374 := by
  native_decide

/-- Coefficient term 2375 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2375 : Poly :=
[
  term ((713121541216565089227724062502274746662137120584 : Rat) / 1354520779047503116208002444856180344466756464819) [(12, 1), (13, 3), (15, 1)]
]

/-- Partial product 2375 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2375 : Poly :=
[
  term ((1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((-713121541216565089227724062502274746662137120584 : Rat) / 1354520779047503116208002444856180344466756464819) [(12, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2375 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2375_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2375
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2375 := by
  native_decide

/-- Coefficient term 2376 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2376 : Poly :=
[
  term ((-3089112576919614817389699220149940314861938920953756492081954532942935276665343923129 : Rat) / 38501386514394231939373491634791707829330573419493954988546142297135577332797440000) [(12, 1), (14, 1)]
]

/-- Partial product 2376 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2376 : Poly :=
[
  term ((3089112576919614817389699220149940314861938920953756492081954532942935276665343923129 : Rat) / 38501386514394231939373491634791707829330573419493954988546142297135577332797440000) [(12, 1), (14, 1)],
  term ((-3089112576919614817389699220149940314861938920953756492081954532942935276665343923129 : Rat) / 19250693257197115969686745817395853914665286709746977494273071148567788666398720000) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2376 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2376_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2376
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2376 := by
  native_decide

/-- Coefficient term 2377 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2377 : Poly :=
[
  term ((2660418806983641878405443 : Rat) / 5399633642509113474448800) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 2377 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2377 : Poly :=
[
  term ((-2660418806983641878405443 : Rat) / 5399633642509113474448800) [(12, 1), (14, 1), (16, 1)],
  term ((2660418806983641878405443 : Rat) / 2699816821254556737224400) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2377 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2377_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2377
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2377 := by
  native_decide

/-- Coefficient term 2378 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2378 : Poly :=
[
  term ((-898197020651578365874340513120226610234544980398554891229495603182441270553834739 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(12, 1), (15, 2)]
]

/-- Partial product 2378 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2378 : Poly :=
[
  term ((-898197020651578365874340513120226610234544980398554891229495603182441270553834739 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(12, 1), (14, 1), (15, 2)],
  term ((898197020651578365874340513120226610234544980398554891229495603182441270553834739 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2378 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2378_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2378
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2378 := by
  native_decide

/-- Coefficient term 2379 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2379 : Poly :=
[
  term ((-16912594220871062803249 : Rat) / 512785721036003178960) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2379 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2379 : Poly :=
[
  term ((-16912594220871062803249 : Rat) / 256392860518001589480) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((16912594220871062803249 : Rat) / 512785721036003178960) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2379 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2379_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2379
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2379 := by
  native_decide

/-- Coefficient term 2380 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2380 : Poly :=
[
  term ((-4116364546812798759926477 : Rat) / 257125411548053022592800) [(12, 1), (16, 1)]
]

/-- Partial product 2380 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2380 : Poly :=
[
  term ((-4116364546812798759926477 : Rat) / 128562705774026511296400) [(12, 1), (14, 1), (16, 1)],
  term ((4116364546812798759926477 : Rat) / 257125411548053022592800) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2380 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2380_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2380
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2380 := by
  native_decide

/-- Coefficient term 2381 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2381 : Poly :=
[
  term ((72821029123185350327643396424704466062099336673149994180142062791978114179399281 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(12, 2)]
]

/-- Partial product 2381 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2381 : Poly :=
[
  term ((-72821029123185350327643396424704466062099336673149994180142062791978114179399281 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(12, 2)],
  term ((72821029123185350327643396424704466062099336673149994180142062791978114179399281 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2381 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2381_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2381
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2381 := by
  native_decide

/-- Coefficient term 2382 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2382 : Poly :=
[
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 86377385983676209950513306766097293126156129219195040553717386316) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2382 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2382 : Poly :=
[
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 86377385983676209950513306766097293126156129219195040553717386316) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(12, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2382 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2382_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2382
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2382 := by
  native_decide

/-- Coefficient term 2383 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2383 : Poly :=
[
  term ((-48773959882868088 : Rat) / 7342292683791569) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2383 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2383 : Poly :=
[
  term ((48773959882868088 : Rat) / 7342292683791569) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97547919765736176 : Rat) / 7342292683791569) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2383 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2383_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2383
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2383 := by
  native_decide

/-- Coefficient term 2384 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2384 : Poly :=
[
  term ((-909549496501771672099757943892304891335795231224530482136999677552497233357837375207 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 2384 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2384 : Poly :=
[
  term ((-909549496501771672099757943892304891335795231224530482136999677552497233357837375207 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((909549496501771672099757943892304891335795231224530482136999677552497233357837375207 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2384 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2384_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2384
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2384 := by
  native_decide

/-- Coefficient term 2385 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2385 : Poly :=
[
  term ((-138453189997881475291346218 : Rat) / 3788172465045908734368315) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2385 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2385 : Poly :=
[
  term ((-276906379995762950582692436 : Rat) / 3788172465045908734368315) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((138453189997881475291346218 : Rat) / 3788172465045908734368315) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2385 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2385_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2385
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2385 := by
  native_decide

/-- Coefficient term 2386 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2386 : Poly :=
[
  term ((269559411458958486271453060816625839134251721626253250303078627871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 2), (13, 2)]
]

/-- Partial product 2386 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2386 : Poly :=
[
  term ((-269559411458958486271453060816625839134251721626253250303078627871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 2), (13, 2)],
  term ((269559411458958486271453060816625839134251721626253250303078627871 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(12, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2386 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2386_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2386
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2386 := by
  native_decide

/-- Coefficient term 2387 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2387 : Poly :=
[
  term ((959541265129155854369091337903367459817163 : Rat) / 791343499512958963364257363527315985710) [(12, 2), (13, 2), (14, 1)]
]

/-- Partial product 2387 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2387 : Poly :=
[
  term ((-959541265129155854369091337903367459817163 : Rat) / 791343499512958963364257363527315985710) [(12, 2), (13, 2), (14, 1)],
  term ((959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(12, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2387 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2387_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2387
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2387 := by
  native_decide

/-- Coefficient term 2388 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2388 : Poly :=
[
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2388 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2388 : Poly :=
[
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2388 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2388_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2388
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2388 := by
  native_decide

/-- Coefficient term 2389 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2389 : Poly :=
[
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (16, 1)]
]

/-- Partial product 2389 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2389 : Poly :=
[
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2389 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2389_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2389
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2389 := by
  native_decide

/-- Coefficient term 2390 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2390 : Poly :=
[
  term ((31831775383570285047726987101568455130993842273548729582484326976420100749469341 : Rat) / 26116799969064056396264748090348465492694731664288397088960888819112452403200) [(12, 2), (15, 2)]
]

/-- Partial product 2390 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2390 : Poly :=
[
  term ((31831775383570285047726987101568455130993842273548729582484326976420100749469341 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(12, 2), (14, 1), (15, 2)],
  term ((-31831775383570285047726987101568455130993842273548729582484326976420100749469341 : Rat) / 26116799969064056396264748090348465492694731664288397088960888819112452403200) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2390 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2390_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2390
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2390 := by
  native_decide

/-- Coefficient term 2391 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2391 : Poly :=
[
  term ((999545628721937607455 : Rat) / 25639286051800158948) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 2391 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2391 : Poly :=
[
  term ((999545628721937607455 : Rat) / 12819643025900079474) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-999545628721937607455 : Rat) / 25639286051800158948) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2391 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2391_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2391
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2391 := by
  native_decide

/-- Coefficient term 2392 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2392 : Poly :=
[
  term ((1958467394146948091371 : Rat) / 512785721036003178960) [(12, 2), (16, 1)]
]

/-- Partial product 2392 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2392 : Poly :=
[
  term ((1958467394146948091371 : Rat) / 256392860518001589480) [(12, 2), (14, 1), (16, 1)],
  term ((-1958467394146948091371 : Rat) / 512785721036003178960) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2392 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2392_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2392
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2392 := by
  native_decide

/-- Coefficient term 2393 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2393 : Poly :=
[
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 2861174405024546055681939974840980005772867184957098717020255129175334400) [(12, 3)]
]

/-- Partial product 2393 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2393 : Poly :=
[
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 2861174405024546055681939974840980005772867184957098717020255129175334400) [(12, 3)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 1430587202512273027840969987420490002886433592478549358510127564587667200) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2393 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2393_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2393
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2393 := by
  native_decide

/-- Coefficient term 2394 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2394 : Poly :=
[
  term ((-959541265129155854369091337903367459817163 : Rat) / 791343499512958963364257363527315985710) [(12, 3), (13, 1), (15, 1)]
]

/-- Partial product 2394 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2394 : Poly :=
[
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(12, 3), (13, 1), (14, 1), (15, 1)],
  term ((959541265129155854369091337903367459817163 : Rat) / 791343499512958963364257363527315985710) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2394 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2394_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2394
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2394 := by
  native_decide

/-- Coefficient term 2395 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2395 : Poly :=
[
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2395 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2395 : Poly :=
[
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2395 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2395_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2395
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2395 := by
  native_decide

/-- Coefficient term 2396 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2396 : Poly :=
[
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 86377385983676209950513306766097293126156129219195040553717386316) [(12, 3), (15, 2)]
]

/-- Partial product 2396 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2396 : Poly :=
[
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(12, 3), (14, 1), (15, 2)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 86377385983676209950513306766097293126156129219195040553717386316) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2396 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2396_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2396
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2396 := by
  native_decide

/-- Coefficient term 2397 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2397 : Poly :=
[
  term ((48773959882868088 : Rat) / 7342292683791569) [(12, 3), (15, 2), (16, 1)]
]

/-- Partial product 2397 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2397 : Poly :=
[
  term ((97547919765736176 : Rat) / 7342292683791569) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-48773959882868088 : Rat) / 7342292683791569) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2397 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2397_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2397
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2397 := by
  native_decide

/-- Coefficient term 2398 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2398 : Poly :=
[
  term ((-12777167950782279637 : Rat) / 6409821512950039737) [(12, 3), (16, 1)]
]

/-- Partial product 2398 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2398 : Poly :=
[
  term ((-25554335901564559274 : Rat) / 6409821512950039737) [(12, 3), (14, 1), (16, 1)],
  term ((12777167950782279637 : Rat) / 6409821512950039737) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2398 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2398_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2398
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2398 := by
  native_decide

/-- Coefficient term 2399 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2399 : Poly :=
[
  term ((670878372993146077751918682980706132997298194067520117512978186486076122033610739 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2399 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2399 : Poly :=
[
  term ((-670878372993146077751918682980706132997298194067520117512978186486076122033610739 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(13, 1), (14, 1), (15, 1)],
  term ((670878372993146077751918682980706132997298194067520117512978186486076122033610739 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2399 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2399_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2399
        rs_R009_ueqv_R009NYNYN_generator_28_2300_2399 =
      rs_R009_ueqv_R009NYNYN_partial_28_2399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_2300_2399 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_2300,
  rs_R009_ueqv_R009NYNYN_partial_28_2301,
  rs_R009_ueqv_R009NYNYN_partial_28_2302,
  rs_R009_ueqv_R009NYNYN_partial_28_2303,
  rs_R009_ueqv_R009NYNYN_partial_28_2304,
  rs_R009_ueqv_R009NYNYN_partial_28_2305,
  rs_R009_ueqv_R009NYNYN_partial_28_2306,
  rs_R009_ueqv_R009NYNYN_partial_28_2307,
  rs_R009_ueqv_R009NYNYN_partial_28_2308,
  rs_R009_ueqv_R009NYNYN_partial_28_2309,
  rs_R009_ueqv_R009NYNYN_partial_28_2310,
  rs_R009_ueqv_R009NYNYN_partial_28_2311,
  rs_R009_ueqv_R009NYNYN_partial_28_2312,
  rs_R009_ueqv_R009NYNYN_partial_28_2313,
  rs_R009_ueqv_R009NYNYN_partial_28_2314,
  rs_R009_ueqv_R009NYNYN_partial_28_2315,
  rs_R009_ueqv_R009NYNYN_partial_28_2316,
  rs_R009_ueqv_R009NYNYN_partial_28_2317,
  rs_R009_ueqv_R009NYNYN_partial_28_2318,
  rs_R009_ueqv_R009NYNYN_partial_28_2319,
  rs_R009_ueqv_R009NYNYN_partial_28_2320,
  rs_R009_ueqv_R009NYNYN_partial_28_2321,
  rs_R009_ueqv_R009NYNYN_partial_28_2322,
  rs_R009_ueqv_R009NYNYN_partial_28_2323,
  rs_R009_ueqv_R009NYNYN_partial_28_2324,
  rs_R009_ueqv_R009NYNYN_partial_28_2325,
  rs_R009_ueqv_R009NYNYN_partial_28_2326,
  rs_R009_ueqv_R009NYNYN_partial_28_2327,
  rs_R009_ueqv_R009NYNYN_partial_28_2328,
  rs_R009_ueqv_R009NYNYN_partial_28_2329,
  rs_R009_ueqv_R009NYNYN_partial_28_2330,
  rs_R009_ueqv_R009NYNYN_partial_28_2331,
  rs_R009_ueqv_R009NYNYN_partial_28_2332,
  rs_R009_ueqv_R009NYNYN_partial_28_2333,
  rs_R009_ueqv_R009NYNYN_partial_28_2334,
  rs_R009_ueqv_R009NYNYN_partial_28_2335,
  rs_R009_ueqv_R009NYNYN_partial_28_2336,
  rs_R009_ueqv_R009NYNYN_partial_28_2337,
  rs_R009_ueqv_R009NYNYN_partial_28_2338,
  rs_R009_ueqv_R009NYNYN_partial_28_2339,
  rs_R009_ueqv_R009NYNYN_partial_28_2340,
  rs_R009_ueqv_R009NYNYN_partial_28_2341,
  rs_R009_ueqv_R009NYNYN_partial_28_2342,
  rs_R009_ueqv_R009NYNYN_partial_28_2343,
  rs_R009_ueqv_R009NYNYN_partial_28_2344,
  rs_R009_ueqv_R009NYNYN_partial_28_2345,
  rs_R009_ueqv_R009NYNYN_partial_28_2346,
  rs_R009_ueqv_R009NYNYN_partial_28_2347,
  rs_R009_ueqv_R009NYNYN_partial_28_2348,
  rs_R009_ueqv_R009NYNYN_partial_28_2349,
  rs_R009_ueqv_R009NYNYN_partial_28_2350,
  rs_R009_ueqv_R009NYNYN_partial_28_2351,
  rs_R009_ueqv_R009NYNYN_partial_28_2352,
  rs_R009_ueqv_R009NYNYN_partial_28_2353,
  rs_R009_ueqv_R009NYNYN_partial_28_2354,
  rs_R009_ueqv_R009NYNYN_partial_28_2355,
  rs_R009_ueqv_R009NYNYN_partial_28_2356,
  rs_R009_ueqv_R009NYNYN_partial_28_2357,
  rs_R009_ueqv_R009NYNYN_partial_28_2358,
  rs_R009_ueqv_R009NYNYN_partial_28_2359,
  rs_R009_ueqv_R009NYNYN_partial_28_2360,
  rs_R009_ueqv_R009NYNYN_partial_28_2361,
  rs_R009_ueqv_R009NYNYN_partial_28_2362,
  rs_R009_ueqv_R009NYNYN_partial_28_2363,
  rs_R009_ueqv_R009NYNYN_partial_28_2364,
  rs_R009_ueqv_R009NYNYN_partial_28_2365,
  rs_R009_ueqv_R009NYNYN_partial_28_2366,
  rs_R009_ueqv_R009NYNYN_partial_28_2367,
  rs_R009_ueqv_R009NYNYN_partial_28_2368,
  rs_R009_ueqv_R009NYNYN_partial_28_2369,
  rs_R009_ueqv_R009NYNYN_partial_28_2370,
  rs_R009_ueqv_R009NYNYN_partial_28_2371,
  rs_R009_ueqv_R009NYNYN_partial_28_2372,
  rs_R009_ueqv_R009NYNYN_partial_28_2373,
  rs_R009_ueqv_R009NYNYN_partial_28_2374,
  rs_R009_ueqv_R009NYNYN_partial_28_2375,
  rs_R009_ueqv_R009NYNYN_partial_28_2376,
  rs_R009_ueqv_R009NYNYN_partial_28_2377,
  rs_R009_ueqv_R009NYNYN_partial_28_2378,
  rs_R009_ueqv_R009NYNYN_partial_28_2379,
  rs_R009_ueqv_R009NYNYN_partial_28_2380,
  rs_R009_ueqv_R009NYNYN_partial_28_2381,
  rs_R009_ueqv_R009NYNYN_partial_28_2382,
  rs_R009_ueqv_R009NYNYN_partial_28_2383,
  rs_R009_ueqv_R009NYNYN_partial_28_2384,
  rs_R009_ueqv_R009NYNYN_partial_28_2385,
  rs_R009_ueqv_R009NYNYN_partial_28_2386,
  rs_R009_ueqv_R009NYNYN_partial_28_2387,
  rs_R009_ueqv_R009NYNYN_partial_28_2388,
  rs_R009_ueqv_R009NYNYN_partial_28_2389,
  rs_R009_ueqv_R009NYNYN_partial_28_2390,
  rs_R009_ueqv_R009NYNYN_partial_28_2391,
  rs_R009_ueqv_R009NYNYN_partial_28_2392,
  rs_R009_ueqv_R009NYNYN_partial_28_2393,
  rs_R009_ueqv_R009NYNYN_partial_28_2394,
  rs_R009_ueqv_R009NYNYN_partial_28_2395,
  rs_R009_ueqv_R009NYNYN_partial_28_2396,
  rs_R009_ueqv_R009NYNYN_partial_28_2397,
  rs_R009_ueqv_R009NYNYN_partial_28_2398,
  rs_R009_ueqv_R009NYNYN_partial_28_2399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_2300_2399 : Poly :=
[
  term ((-1244639333360497992903087736609315506780781627395055954906263941691412864854543623 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(11, 1), (12, 1), (13, 1)],
  term ((4966863279540171460490795999628693464080695418178495264206428602804018880834149917 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 326931641052630084959521587482643718313324787947187373328678175790387875) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((805575310559664872264 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7529595018684979518054892 : Rat) / 180389165002186130208015) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((525905096241549761925756143857906828598607699650822805552947001337694771294127511 : Rat) / 155744452269504883858476800105500195389238809129158472287601312637747858896000) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1518515038843259999973992 : Rat) / 28482499737187283717055) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 653863282105260169919043174965287436626649575894374746657356351580775750) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-402787655279832436132 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3701467792506590855391760 : Rat) / 108233499001311678124809) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2799489730243137442256 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-503133504104619930762407150475443956691858252317770681883916768 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1399744865121568721128 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((9460455277475048209127473191035868224203806084966957189064932100811226847792547948569 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((345340588092232720583988338 : Rat) / 3788172465045908734368315) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27979793785126478573100211378452865462275223987936 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-9461193315707740565139311721725296741765537180909233667189912154540001404586349676569 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(11, 1), (12, 1), (15, 1)],
  term ((-172670294046116360291994169 : Rat) / 3788172465045908734368315) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((22976363729865058244159475068589837498619760868781269297161261965553 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(11, 1), (12, 2), (13, 1)],
  term ((-7987730859583081484431869046324115717676118390332784181020368006689 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-53420852007311482365724 : Rat) / 4339258264657398321155) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((-26805306499882649602368 : Rat) / 619894037808199760165) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((3874721704128967262474 : Rat) / 228382013929336753745) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2466330295650284597490192952190089705512861764815599752735900477489020629395933537 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-43858415323204988970271648 : Rat) / 757634493009181746873663) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2466330295650284597490192952190089705512861764815599752735900477489020629395933537 : Rat) / 1183657837248237117324423680801801484958214949381604389385769976046883727609600) [(11, 1), (12, 2), (15, 1)],
  term ((21929207661602494485135824 : Rat) / 757634493009181746873663) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 3), (14, 1), (15, 1)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-494130539801094265859537255076078965976364 : Rat) / 366362731255999520076045075707090734125) [(11, 1), (12, 3), (15, 1)],
  term ((-13402653249941324801184 : Rat) / 619894037808199760165) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1698761872597014807692802808089306612083153067286755620009534193275737653526720925264621 : Rat) / 54176492673986712154785801639770774687131481519175785543942446111656286966182435840000) [(11, 1), (13, 1)],
  term ((2175727104702349907817350896777613079070438859313996586477209024145534315676323307167 : Rat) / 2225699468968560150968960956936244577966072038747909682184313901388158152094480000) [(11, 1), (13, 1), (14, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((283777586443729206188998329866 : Rat) / 19944728028466709486449178475) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-74343862429101155411148707518876288906770404429412376505427253309774535973393753815487641 : Rat) / 40632369505490034116089351229828081015348611139381839157956834583742215224636826880000) [(11, 1), (13, 1), (14, 2)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1016464044907976979221904333641 : Rat) / 39889456056933418972898356950) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((25087411598134628641652791552630797303879897452598333404205521101722394393109 : Rat) / 564937875738944786810053303170008345245425233572739781111955887765790248000) [(11, 1), (13, 1), (15, 2)],
  term ((7270226249481828733767 : Rat) / 8678516529314796642310) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5649823850806659311147094563 : Rat) / 7597991629892079804361591800) [(11, 1), (13, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-30722115867500611237084971499105526737464261462125381903960100351886706331161 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-1975072468241206005666 : Rat) / 867851652931479664231) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((307014490016558807295758366552018388525717606192108295240224184201467453803083 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116000) [(11, 1), (13, 2), (15, 1)],
  term ((448300739201857163621 : Rat) / 313681320336679396710) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1682957631478948164607032460896975001422275692623340330720821808 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3)],
  term ((-6731830525915792658428129843587900005689102770493361322883287232 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(11, 1), (13, 3), (14, 2)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term ((699872432560784360564 : Rat) / 4339258264657398321155) [(11, 1), (13, 3), (16, 1)],
  term ((-83653771750178383909865217905968924100290303561036872116017642309447098431475854399 : Rat) / 154348981977170120099104847976554913638551229399361212375904404876513638080291840) [(11, 1), (14, 1), (15, 1)],
  term ((-10530699400527789568897453 : Rat) / 757634493009181746873663) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24422919971301380716660253243145728993972434068533771918872241233275935890353923 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(11, 1), (14, 2), (15, 1)],
  term ((-494737446544837898093 : Rat) / 14244047806555643860) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((170165883702096987553505063900290928335796774192856510703396608907080720330799446143 : Rat) / 245974473270390629640007725859051655200878453226073645220564788647830498932736000) [(11, 1), (15, 1)],
  term ((947525219018491235206148683 : Rat) / 60610759440734539749893040) [(11, 1), (15, 1), (16, 1)],
  term ((434335491906405559929902693944382756278484910794418220817847920857561437002962610309 : Rat) / 1074475605708960072881567358520945658328448570430025363813117055842559107907680000) [(11, 2)],
  term ((-20476973959062948816814289961399827167689704965126044270688473514 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(11, 2), (12, 1)],
  term ((7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-473602887992978106816 : Rat) / 619894037808199760165) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3512157401358461500788959803102558196348826887794732098977557004 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((236801443996489053408 : Rat) / 619894037808199760165) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41176012174760931316966287950303328886304141626061897879629882553 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(11, 2), (12, 1), (14, 1)],
  term ((991649783809192082048 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-29231861588716896688923964752436753294775664507958 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 2), (12, 1), (14, 2)],
  term ((-495824891904596041024 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (16, 1)],
  term ((33035071414078347364790310258779166255574394455489455620032360999 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 2)],
  term ((-66070142828156694729580620517558332511148788910978911240064721998 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(11, 2), (12, 2), (14, 1)],
  term ((-6834273048115425478704 : Rat) / 619894037808199760165) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((3417136524057712739352 : Rat) / 619894037808199760165) [(11, 2), (12, 2), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((504984557474518959549284318182743549934417339602785525592147664803223289713 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(11, 2), (13, 1), (15, 1)],
  term ((-6536316760139080821514 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-209951078118216260751732133307157162732173287666752827310150678938 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2)],
  term ((839804312472865043006928533228628650928693150667011309240602715752 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(11, 2), (13, 2), (14, 2)],
  term ((32341578489797639781184 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (14, 2), (16, 1)],
  term ((-8085394622449409945296 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (16, 1)],
  term ((3615891347775200879361204178051421166709124563321889364401251382 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(11, 2), (14, 1)],
  term ((-1675626212046442669488 : Rat) / 619894037808199760165) [(11, 2), (14, 1), (16, 1)],
  term ((-12778224202682698377746706469752752569011797085531600639720983481748332386180800408081 : Rat) / 7789948141389960528391363349276856022881252135617683887645098654858553532330680000) [(11, 2), (14, 2)],
  term ((-455717440000599035433291108988 : Rat) / 19944728028466709486449178475) [(11, 2), (14, 2), (16, 1)],
  term ((140885506565779881719230152007 : Rat) / 19944728028466709486449178475) [(11, 2), (16, 1)],
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (14, 2)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (14, 2), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (16, 1)],
  term ((7644882646952604482600940998649050973272391799495199688911181363727947038683661839583 : Rat) / 12833795504798077313124497211597235943110191139831318329515380765711859110932480000) [(12, 1)],
  term ((57708451208518744291780943128857132071832683011200952568539758243549975896329882867 : Rat) / 13781159105104475008848647140763831574870645482085822533562893292545860542883200) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((67392311588838222055228007 : Rat) / 1082334990013116781248090) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 16452835425462135228669201288780436785934500803656198200708073584) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((188909391519882 : Rat) / 7342292683791569) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-31976621769347293522707445535402697094937328459307623181008547219363723453086941 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-999380710823140750469 : Rat) / 12819643025900079474) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-538064020834889292604025523883819658245060218114547742528286857280801285432145318997 : Rat) / 363174075240400282586129054062482149737767598586732264413892717356502677835980800) [(12, 1), (13, 1), (15, 1)],
  term ((-352863359050813040949765443 : Rat) / 30305379720367269874946520) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(12, 1), (13, 1), (15, 3)],
  term ((-94454695759941 : Rat) / 7342292683791569) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3121519723404661252915792738889510818932137099234169888147834059074981205297246017 : Rat) / 7748442870339865466822532528943519760971447259004076926501225144403295084352000) [(12, 1), (13, 2)],
  term ((-213810375625430822015241502770565478661079805041658636175475336434616969994109012781 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(12, 1), (13, 2), (14, 1)],
  term ((-54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-4203476630192060293306 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((80133243119879400532098121 : Rat) / 7576344930091817468736630) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((26080757546136617736612470914580359804610051125025445745375947819586507634555875553 : Rat) / 12693172859964648034465859208598265924222962944026415491439506979976450500024000) [(12, 1), (13, 2), (14, 2)],
  term ((11892949135528766494445087 : Rat) / 199377498160310986019385) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((54997630890701244183114152536087158786724971774754168726762778701 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(12, 1), (13, 2), (15, 2)],
  term ((2101738315096030146653 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17005515371940331329253043 : Rat) / 841816103343535274304070) [(12, 1), (13, 2), (16, 1)],
  term ((1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((-713121541216565089227724062502274746662137120584 : Rat) / 1354520779047503116208002444856180344466756464819) [(12, 1), (13, 3), (15, 1)],
  term ((-42780183304796012078215946771744365524772411876017441641385133649424746955436627114369 : Rat) / 38501386514394231939373491634791707829330573419493954988546142297135577332797440000) [(12, 1), (14, 1)],
  term ((-898197020651578365874340513120226610234544980398554891229495603182441270553834739 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(12, 1), (14, 1), (15, 2)],
  term ((-16912594220871062803249 : Rat) / 256392860518001589480) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-175547729773121189795317477 : Rat) / 5399633642509113474448800) [(12, 1), (14, 1), (16, 1)],
  term ((-3089112576919614817389699220149940314861938920953756492081954532942935276665343923129 : Rat) / 19250693257197115969686745817395853914665286709746977494273071148567788666398720000) [(12, 1), (14, 2)],
  term ((2660418806983641878405443 : Rat) / 2699816821254556737224400) [(12, 1), (14, 2), (16, 1)],
  term ((898197020651578365874340513120226610234544980398554891229495603182441270553834739 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(12, 1), (15, 2)],
  term ((16912594220871062803249 : Rat) / 512785721036003178960) [(12, 1), (15, 2), (16, 1)],
  term ((4116364546812798759926477 : Rat) / 257125411548053022592800) [(12, 1), (16, 1)],
  term ((-72821029123185350327643396424704466062099336673149994180142062791978114179399281 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(12, 2)],
  term ((-100540744777092714314212130268686855430433409843005638049889142428620082878566859601 : Rat) / 34452897762761187522121617851909578937176613705214556333907233231364651357208000) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-251742009710251229374912556 : Rat) / 3788172465045908734368315) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-97547919765736176 : Rat) / 7342292683791569) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((909549496501771672099757943892304891335795231224530482136999677552497233357837375207 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(12, 2), (13, 1), (15, 1)],
  term ((138453189997881475291346218 : Rat) / 3788172465045908734368315) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-269559411458958486271453060816625839134251721626253250303078627871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 2), (13, 2)],
  term ((269617918683623902466249105240951148269501142769119893094983293031 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 2), (13, 2), (14, 1)],
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(12, 2), (13, 2), (14, 2)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 2), (13, 2), (16, 1)],
  term ((72821029123185350327643396424704466062099336673149994180142062791978114179399281 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(12, 2), (14, 1)],
  term ((31831775383570285047726987101568455130993842273548729582484326976420100749469341 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(12, 2), (14, 1), (15, 2)],
  term ((999545628721937607455 : Rat) / 12819643025900079474) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((1958467394146948091371 : Rat) / 256392860518001589480) [(12, 2), (14, 1), (16, 1)],
  term ((-31831775383570285047726987101568455130993842273548729582484326976420100749469341 : Rat) / 26116799969064056396264748090348465492694731664288397088960888819112452403200) [(12, 2), (15, 2)],
  term ((-999545628721937607455 : Rat) / 25639286051800158948) [(12, 2), (15, 2), (16, 1)],
  term ((-1958467394146948091371 : Rat) / 512785721036003178960) [(12, 2), (16, 1)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 2861174405024546055681939974840980005772867184957098717020255129175334400) [(12, 3)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(12, 3), (13, 1), (14, 1), (15, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((959541265129155854369091337903367459817163 : Rat) / 791343499512958963364257363527315985710) [(12, 3), (13, 1), (15, 1)],
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 1430587202512273027840969987420490002886433592478549358510127564587667200) [(12, 3), (14, 1)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(12, 3), (14, 1), (15, 2)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-25554335901564559274 : Rat) / 6409821512950039737) [(12, 3), (14, 1), (16, 1)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 86377385983676209950513306766097293126156129219195040553717386316) [(12, 3), (15, 2)],
  term ((-48773959882868088 : Rat) / 7342292683791569) [(12, 3), (15, 2), (16, 1)],
  term ((12777167950782279637 : Rat) / 6409821512950039737) [(12, 3), (16, 1)],
  term ((-670878372993146077751918682980706132997298194067520117512978186486076122033610739 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(13, 1), (14, 1), (15, 1)],
  term ((670878372993146077751918682980706132997298194067520117512978186486076122033610739 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 2300 through 2399. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_2300_2399_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_2300_2399
      rs_R009_ueqv_R009NYNYN_block_28_2300_2399 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
