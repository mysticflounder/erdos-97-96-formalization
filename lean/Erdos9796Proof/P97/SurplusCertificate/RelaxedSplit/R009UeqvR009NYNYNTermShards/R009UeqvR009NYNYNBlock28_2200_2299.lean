/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:2200-2299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 2200 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2200 : Poly :=
[
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2200 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2200 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2200 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2200
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2200 := by
  native_decide

/-- Coefficient term 2201 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2201 : Poly :=
[
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2201 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2201 : Poly :=
[
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2201 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2201
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2201 := by
  native_decide

/-- Coefficient term 2202 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2202 : Poly :=
[
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 2202 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2202 : Poly :=
[
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2202 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2202
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2202 := by
  native_decide

/-- Coefficient term 2203 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2203 : Poly :=
[
  term ((85352682241758103692698282480707796871242842282952537080036675082 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 2203 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2203 : Poly :=
[
  term ((170705364483516207385396564961415593742485684565905074160073350164 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-85352682241758103692698282480707796871242842282952537080036675082 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2203 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2203
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2203 := by
  native_decide

/-- Coefficient term 2204 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2204 : Poly :=
[
  term ((475880786208854109712 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2204 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2204 : Poly :=
[
  term ((951761572417708219424 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-475880786208854109712 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2204 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2204
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2204 := by
  native_decide

/-- Coefficient term 2205 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2205 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 3), (15, 1)]
]

/-- Partial product 2205 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2205 : Poly :=
[
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2205 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2205
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2205 := by
  native_decide

/-- Coefficient term 2206 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2206 : Poly :=
[
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 2206 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2206 : Poly :=
[
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2206 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2206
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2206 := by
  native_decide

/-- Coefficient term 2207 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2207 : Poly :=
[
  term ((654803195242135000124636974415372955193907524120857523478827760123 : Rat) / 3333902299396672091067754820796365673250825536837432424854853050) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 2207 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2207 : Poly :=
[
  term ((-654803195242135000124636974415372955193907524120857523478827760123 : Rat) / 3333902299396672091067754820796365673250825536837432424854853050) [(10, 1), (11, 1), (13, 1)],
  term ((654803195242135000124636974415372955193907524120857523478827760123 : Rat) / 1666951149698336045533877410398182836625412768418716212427426525) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2207 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2207
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2207 := by
  native_decide

/-- Coefficient term 2208 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2208 : Poly :=
[
  term ((-561180032393960252849893212571166637640555361557856549243523556321 : Rat) / 13335609197586688364271019283185462693003302147349729699419412200) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2208 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2208 : Poly :=
[
  term ((561180032393960252849893212571166637640555361557856549243523556321 : Rat) / 13335609197586688364271019283185462693003302147349729699419412200) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-561180032393960252849893212571166637640555361557856549243523556321 : Rat) / 6667804598793344182135509641592731346501651073674864849709706100) [(10, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2208 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2208
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2208 := by
  native_decide

/-- Coefficient term 2209 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2209 : Poly :=
[
  term ((-25078248818610712138952 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2209 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2209 : Poly :=
[
  term ((25078248818610712138952 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-50156497637221424277904 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2209 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2209
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2209 := by
  native_decide

/-- Coefficient term 2210 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2210 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 2210 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2210 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2210 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2210
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2210 := by
  native_decide

/-- Coefficient term 2211 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2211 : Poly :=
[
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2211 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2211 : Poly :=
[
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2211 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2211
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2211 := by
  native_decide

/-- Coefficient term 2212 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2212 : Poly :=
[
  term ((-20091802855744905771128 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2212 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2212 : Poly :=
[
  term ((-40183605711489811542256 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((20091802855744905771128 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2212 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2212
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2212 := by
  native_decide

/-- Coefficient term 2213 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2213 : Poly :=
[
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 2213 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2213 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2213 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2213
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2213 := by
  native_decide

/-- Coefficient term 2214 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2214 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2214 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2214 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2214 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2214
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2214 := by
  native_decide

/-- Coefficient term 2215 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2215 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 2215 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2215 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2215 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2215
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2215 := by
  native_decide

/-- Coefficient term 2216 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2216 : Poly :=
[
  term ((260201540992734 : Rat) / 7342292683791569) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2216 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2216 : Poly :=
[
  term ((-260201540992734 : Rat) / 7342292683791569) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((520403081985468 : Rat) / 7342292683791569) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2216 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2216
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2216 := by
  native_decide

/-- Coefficient term 2217 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2217 : Poly :=
[
  term ((590756316224114399396571756695605368336904889889624234047199390256725711306258049 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 2217 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2217 : Poly :=
[
  term ((590756316224114399396571756695605368336904889889624234047199390256725711306258049 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-590756316224114399396571756695605368336904889889624234047199390256725711306258049 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2217 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2217
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2217 := by
  native_decide

/-- Coefficient term 2218 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2218 : Poly :=
[
  term ((1105602644582604818177378 : Rat) / 541167495006558390624045) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2218 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2218 : Poly :=
[
  term ((2211205289165209636354756 : Rat) / 541167495006558390624045) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1105602644582604818177378 : Rat) / 541167495006558390624045) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2218 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2218
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2218 := by
  native_decide

/-- Coefficient term 2219 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2219 : Poly :=
[
  term ((30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2)]
]

/-- Partial product 2219 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2219 : Poly :=
[
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2219 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2219
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2219 := by
  native_decide

/-- Coefficient term 2220 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2220 : Poly :=
[
  term ((-2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 2220 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2220 : Poly :=
[
  term ((2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 2), (12, 1)],
  term ((-5916206860908596375990271594053921019575594249206398149648813032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2220 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2220
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2220 := by
  native_decide

/-- Coefficient term 2221 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2221 : Poly :=
[
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 2221 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2221 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2221 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2221
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2221 := by
  native_decide

/-- Coefficient term 2222 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2222 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 2222 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2222 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2222 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2222
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2222 := by
  native_decide

/-- Coefficient term 2223 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2223 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2223 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2223 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2223 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2223
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2223 := by
  native_decide

/-- Coefficient term 2224 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2224 : Poly :=
[
  term ((115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (14, 1)]
]

/-- Partial product 2224 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2224 : Poly :=
[
  term ((-115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (14, 1)],
  term ((230077174676892411380632536971819459065214 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2224 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2224
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2224 := by
  native_decide

/-- Coefficient term 2225 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2225 : Poly :=
[
  term ((386732133305706905464 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 2225 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2225 : Poly :=
[
  term ((-386732133305706905464 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((773464266611413810928 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2225 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2225
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2225 := by
  native_decide

/-- Coefficient term 2226 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2226 : Poly :=
[
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 2226 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2226 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2226 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2226
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2226 := by
  native_decide

/-- Coefficient term 2227 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2227 : Poly :=
[
  term ((558762630446759574886215073346366642685617062525828576641963605010832309154057035609 : Rat) / 458349839457074189754446328985615569396792540708261368911263598775423539676160000) [(10, 1), (12, 1)]
]

/-- Partial product 2227 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2227 : Poly :=
[
  term ((-558762630446759574886215073346366642685617062525828576641963605010832309154057035609 : Rat) / 458349839457074189754446328985615569396792540708261368911263598775423539676160000) [(10, 1), (12, 1)],
  term ((558762630446759574886215073346366642685617062525828576641963605010832309154057035609 : Rat) / 229174919728537094877223164492807784698396270354130684455631799387711769838080000) [(10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2227 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2227
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2227 := by
  native_decide

/-- Coefficient term 2228 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2228 : Poly :=
[
  term ((-26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2228 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2228 : Poly :=
[
  term ((26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2228 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2228
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2228 := by
  native_decide

/-- Coefficient term 2229 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2229 : Poly :=
[
  term ((-11258877421666116 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2229 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2229 : Poly :=
[
  term ((11258877421666116 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22517754843332232 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2229 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2229
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2229 := by
  native_decide

/-- Coefficient term 2230 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2230 : Poly :=
[
  term ((1769464091148144084519998246776805911201048946334819285995198113537389157027408603 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2230 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2230 : Poly :=
[
  term ((1769464091148144084519998246776805911201048946334819285995198113537389157027408603 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1769464091148144084519998246776805911201048946334819285995198113537389157027408603 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2230 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2230
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2230 := by
  native_decide

/-- Coefficient term 2231 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2231 : Poly :=
[
  term ((33324421192748685376771318 : Rat) / 3788172465045908734368315) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2231 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2231 : Poly :=
[
  term ((66648842385497370753542636 : Rat) / 3788172465045908734368315) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33324421192748685376771318 : Rat) / 3788172465045908734368315) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2231 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2231
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2231 := by
  native_decide

/-- Coefficient term 2232 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2232 : Poly :=
[
  term ((-152224928520031000427640394430458367335781 : Rat) / 452196285435976550493861350587037706120) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 2232 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2232 : Poly :=
[
  term ((152224928520031000427640394430458367335781 : Rat) / 452196285435976550493861350587037706120) [(10, 1), (12, 1), (13, 2)],
  term ((-152224928520031000427640394430458367335781 : Rat) / 226098142717988275246930675293518853060) [(10, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2232 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2232
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2232 := by
  native_decide

/-- Coefficient term 2233 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2233 : Poly :=
[
  term ((204419487604739878725275330082999918882029 : Rat) / 4748060997077753780185544181163895914260) [(10, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2233 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2233 : Poly :=
[
  term ((-204419487604739878725275330082999918882029 : Rat) / 4748060997077753780185544181163895914260) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((204419487604739878725275330082999918882029 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2233 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2233
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2233 := by
  native_decide

/-- Coefficient term 2234 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2234 : Poly :=
[
  term ((8438863492518247175876 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2234 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2234 : Poly :=
[
  term ((-8438863492518247175876 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((16877726985036494351752 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2234 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2234
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2234 := by
  native_decide

/-- Coefficient term 2235 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2235 : Poly :=
[
  term ((-3142081528016468740882 : Rat) / 619894037808199760165) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 2235 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2235 : Poly :=
[
  term ((-6284163056032937481764 : Rat) / 619894037808199760165) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3142081528016468740882 : Rat) / 619894037808199760165) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2235 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2235
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2235 := by
  native_decide

/-- Coefficient term 2236 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2236 : Poly :=
[
  term ((-6553429267312230916713800556285456340596186768201700057911017325575016695418323 : Rat) / 8861225436737785284214949392669270429643615134587720438300966620651844480000) [(10, 1), (12, 1), (14, 1)]
]

/-- Partial product 2236 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2236 : Poly :=
[
  term ((6553429267312230916713800556285456340596186768201700057911017325575016695418323 : Rat) / 8861225436737785284214949392669270429643615134587720438300966620651844480000) [(10, 1), (12, 1), (14, 1)],
  term ((-6553429267312230916713800556285456340596186768201700057911017325575016695418323 : Rat) / 4430612718368892642107474696334635214821807567293860219150483310325922240000) [(10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2236 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2236
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2236 := by
  native_decide

/-- Coefficient term 2237 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2237 : Poly :=
[
  term ((-2175393491265273866092111 : Rat) / 168738551328409796076525) [(10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 2237 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2237 : Poly :=
[
  term ((2175393491265273866092111 : Rat) / 168738551328409796076525) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4350786982530547732184222 : Rat) / 168738551328409796076525) [(10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2237 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2237
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2237 := by
  native_decide

/-- Coefficient term 2238 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2238 : Poly :=
[
  term ((-54510833225814682651809497921413983621411320888935181470723937740081689369894941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 2238 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2238 : Poly :=
[
  term ((-54510833225814682651809497921413983621411320888935181470723937740081689369894941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((54510833225814682651809497921413983621411320888935181470723937740081689369894941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2238 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2238
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2238 := by
  native_decide

/-- Coefficient term 2239 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2239 : Poly :=
[
  term ((-1133086525475186679851 : Rat) / 64098215129500397370) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2239 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2239 : Poly :=
[
  term ((-1133086525475186679851 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1133086525475186679851 : Rat) / 64098215129500397370) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2239 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2239
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2239 := by
  native_decide

/-- Coefficient term 2240 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2240 : Poly :=
[
  term ((10608721138856764523333779 : Rat) / 449969470209092789537400) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 2240 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2240 : Poly :=
[
  term ((10608721138856764523333779 : Rat) / 224984735104546394768700) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10608721138856764523333779 : Rat) / 449969470209092789537400) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2240 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2240
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2240 := by
  native_decide

/-- Coefficient term 2241 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2241 : Poly :=
[
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 5890653186815241879345170536437311776591197145499909123276995854184512000) [(10, 1), (12, 2)]
]

/-- Partial product 2241 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2241 : Poly :=
[
  term ((-537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 5890653186815241879345170536437311776591197145499909123276995854184512000) [(10, 1), (12, 2)],
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 2945326593407620939672585268218655888295598572749954561638497927092256000) [(10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2241 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2241
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2241 := by
  native_decide

/-- Coefficient term 2242 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2242 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2242 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2242 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2242 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2242
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2242 := by
  native_decide

/-- Coefficient term 2243 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2243 : Poly :=
[
  term ((850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2243 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2243 : Poly :=
[
  term ((-850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2243 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2243
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2243 := by
  native_decide

/-- Coefficient term 2244 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2244 : Poly :=
[
  term ((1166185134765392598059968923315217218921903410198012344406395989488728861229 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 2244 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2244 : Poly :=
[
  term ((1166185134765392598059968923315217218921903410198012344406395989488728861229 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1166185134765392598059968923315217218921903410198012344406395989488728861229 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2244 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2244
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2244 := by
  native_decide

/-- Coefficient term 2245 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2245 : Poly :=
[
  term ((-6931071384935386508396 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2245 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2245 : Poly :=
[
  term ((-13862142769870773016792 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6931071384935386508396 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2245 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2245
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2245 := by
  native_decide

/-- Coefficient term 2246 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2246 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 2), (13, 2)]
]

/-- Partial product 2246 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2246 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 2), (13, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2246 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2246
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2246 := by
  native_decide

/-- Coefficient term 2247 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2247 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 2), (13, 2), (14, 1)]
]

/-- Partial product 2247 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2247 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 2), (13, 2), (14, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2247 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2247
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2247 := by
  native_decide

/-- Coefficient term 2248 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2248 : Poly :=
[
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2248 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2248 : Poly :=
[
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2248 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2248
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2248 := by
  native_decide

/-- Coefficient term 2249 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2249 : Poly :=
[
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (16, 1)]
]

/-- Partial product 2249 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2249 : Poly :=
[
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2249 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2249
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2249 := by
  native_decide

/-- Coefficient term 2250 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2250 : Poly :=
[
  term ((26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 2), (15, 2)]
]

/-- Partial product 2250 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2250 : Poly :=
[
  term ((26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2250 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2250
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2250 := by
  native_decide

/-- Coefficient term 2251 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2251 : Poly :=
[
  term ((11258877421666116 : Rat) / 7342292683791569) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 2251 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2251 : Poly :=
[
  term ((22517754843332232 : Rat) / 7342292683791569) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11258877421666116 : Rat) / 7342292683791569) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2251 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2251
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2251 := by
  native_decide

/-- Coefficient term 2252 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2252 : Poly :=
[
  term ((45325070388931547663 : Rat) / 32049107564750198685) [(10, 1), (12, 2), (16, 1)]
]

/-- Partial product 2252 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2252 : Poly :=
[
  term ((90650140777863095326 : Rat) / 32049107564750198685) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-45325070388931547663 : Rat) / 32049107564750198685) [(10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2252 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2252
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2252 := by
  native_decide

/-- Coefficient term 2253 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2253 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 3), (13, 1), (15, 1)]
]

/-- Partial product 2253 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2253 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 3), (13, 1), (14, 1), (15, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2253 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2253
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2253 := by
  native_decide

/-- Coefficient term 2254 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2254 : Poly :=
[
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2254 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2254 : Poly :=
[
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2254 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2254
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2254 := by
  native_decide

/-- Coefficient term 2255 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2255 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 3), (15, 2)]
]

/-- Partial product 2255 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2255 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 3), (14, 1), (15, 2)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2255 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2255
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2255 := by
  native_decide

/-- Coefficient term 2256 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2256 : Poly :=
[
  term ((-850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 3), (15, 2), (16, 1)]
]

/-- Partial product 2256 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2256 : Poly :=
[
  term ((-1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2256 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2256
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2256 := by
  native_decide

/-- Coefficient term 2257 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2257 : Poly :=
[
  term ((60739807416193265549704118339753438473687278451354746601012173401902342077642941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2257 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2257 : Poly :=
[
  term ((-60739807416193265549704118339753438473687278451354746601012173401902342077642941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((60739807416193265549704118339753438473687278451354746601012173401902342077642941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2257 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2257
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2257 := by
  native_decide

/-- Coefficient term 2258 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2258 : Poly :=
[
  term ((572808175251436535473 : Rat) / 32049107564750198685) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2258 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2258 : Poly :=
[
  term ((-572808175251436535473 : Rat) / 32049107564750198685) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1145616350502873070946 : Rat) / 32049107564750198685) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2258 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2258
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2258 := by
  native_decide

/-- Coefficient term 2259 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2259 : Poly :=
[
  term ((-19173997285955513609088663757224433571939623673081780633193089894950437143510880989 : Rat) / 12397508592543784746916052046309631617554315614406523082401960231045272134963200) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 2259 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2259 : Poly :=
[
  term ((-19173997285955513609088663757224433571939623673081780633193089894950437143510880989 : Rat) / 6198754296271892373458026023154815808777157807203261541200980115522636067481600) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((19173997285955513609088663757224433571939623673081780633193089894950437143510880989 : Rat) / 12397508592543784746916052046309631617554315614406523082401960231045272134963200) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2259 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2259
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2259 := by
  native_decide

/-- Coefficient term 2260 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2260 : Poly :=
[
  term ((-431997956567560939181489 : Rat) / 12170835229063160592348) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2260 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2260 : Poly :=
[
  term ((-431997956567560939181489 : Rat) / 6085417614531580296174) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((431997956567560939181489 : Rat) / 12170835229063160592348) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2260 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2260
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2260 := by
  native_decide

/-- Coefficient term 2261 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2261 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 2261 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2261 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2261 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2261
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2261 := by
  native_decide

/-- Coefficient term 2262 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2262 : Poly :=
[
  term ((-2020095442437435 : Rat) / 7342292683791569) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 2262 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2262 : Poly :=
[
  term ((-4040190884874870 : Rat) / 7342292683791569) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2262 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2262
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2262 := by
  native_decide

/-- Coefficient term 2263 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2263 : Poly :=
[
  term ((-937825848244141730737227180738438323828145252582136339767361703645246808857029579 : Rat) / 2367315674496474234648847361603602969916429898763208778771539952093767455219200) [(10, 1), (13, 2)]
]

/-- Partial product 2263 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2263 : Poly :=
[
  term ((937825848244141730737227180738438323828145252582136339767361703645246808857029579 : Rat) / 2367315674496474234648847361603602969916429898763208778771539952093767455219200) [(10, 1), (13, 2)],
  term ((-937825848244141730737227180738438323828145252582136339767361703645246808857029579 : Rat) / 1183657837248237117324423680801801484958214949381604389385769976046883727609600) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2263 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2263
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2263 := by
  native_decide

/-- Coefficient term 2264 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2264 : Poly :=
[
  term ((-2565166032535814678131699253700609458387329955923548332881591703279743833639641203 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 2264 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2264 : Poly :=
[
  term ((2565166032535814678131699253700609458387329955923548332881591703279743833639641203 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(10, 1), (13, 2), (14, 1)],
  term ((-2565166032535814678131699253700609458387329955923548332881591703279743833639641203 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2264 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2264
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2264 := by
  native_decide

/-- Coefficient term 2265 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2265 : Poly :=
[
  term ((-7959205072082630730031271 : Rat) / 1082334990013116781248090) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2265 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2265 : Poly :=
[
  term ((7959205072082630730031271 : Rat) / 1082334990013116781248090) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7959205072082630730031271 : Rat) / 541167495006558390624045) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2265 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2265
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2265 := by
  native_decide

/-- Coefficient term 2266 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2266 : Poly :=
[
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 2266 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2266 : Poly :=
[
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2266 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2266
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2266 := by
  native_decide

/-- Coefficient term 2267 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2267 : Poly :=
[
  term ((4534893515323182578033 : Rat) / 4339258264657398321155) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 2267 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2267 : Poly :=
[
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4534893515323182578033 : Rat) / 4339258264657398321155) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2267 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2267
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2267 := by
  native_decide

/-- Coefficient term 2268 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2268 : Poly :=
[
  term ((-5559016967441682131250575 : Rat) / 757634493009181746873663) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 2268 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2268 : Poly :=
[
  term ((-11118033934883364262501150 : Rat) / 757634493009181746873663) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5559016967441682131250575 : Rat) / 757634493009181746873663) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2268 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2268
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2268 := by
  native_decide

/-- Coefficient term 2269 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2269 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (13, 3), (15, 1)]
]

/-- Partial product 2269 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2269 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2269 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2269
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2269 := by
  native_decide

/-- Coefficient term 2270 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2270 : Poly :=
[
  term ((-20881398537527989706560884168440280057982279164421921684099696724153919763477543 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(10, 1), (14, 1)]
]

/-- Partial product 2270 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2270 : Poly :=
[
  term ((20881398537527989706560884168440280057982279164421921684099696724153919763477543 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(10, 1), (14, 1)],
  term ((-20881398537527989706560884168440280057982279164421921684099696724153919763477543 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2270 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2270
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2270 := by
  native_decide

/-- Coefficient term 2271 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2271 : Poly :=
[
  term ((58587093189391149107 : Rat) / 512785721036003178960) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 2271 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2271 : Poly :=
[
  term ((-58587093189391149107 : Rat) / 512785721036003178960) [(10, 1), (14, 1), (16, 1)],
  term ((58587093189391149107 : Rat) / 256392860518001589480) [(10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2271 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2271
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2271 := by
  native_decide

/-- Coefficient term 2272 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2272 : Poly :=
[
  term ((26532221146231813173147870891240256434479738869156365066477328025936526489393923 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(10, 1), (15, 2)]
]

/-- Partial product 2272 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2272 : Poly :=
[
  term ((26532221146231813173147870891240256434479738869156365066477328025936526489393923 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(10, 1), (14, 1), (15, 2)],
  term ((-26532221146231813173147870891240256434479738869156365066477328025936526489393923 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2272 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2272
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2272 := by
  native_decide

/-- Coefficient term 2273 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2273 : Poly :=
[
  term ((500752113501467712653 : Rat) / 28488095613111287720) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 2273 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2273 : Poly :=
[
  term ((500752113501467712653 : Rat) / 14244047806555643860) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-500752113501467712653 : Rat) / 28488095613111287720) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2273 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2273
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2273 := by
  native_decide

/-- Coefficient term 2274 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2274 : Poly :=
[
  term ((193236691403804421203 : Rat) / 256392860518001589480) [(10, 1), (16, 1)]
]

/-- Partial product 2274 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2274 : Poly :=
[
  term ((193236691403804421203 : Rat) / 128196430259000794740) [(10, 1), (14, 1), (16, 1)],
  term ((-193236691403804421203 : Rat) / 256392860518001589480) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2274 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2274
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2274 := by
  native_decide

/-- Coefficient term 2275 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2275 : Poly :=
[
  term ((-87960091092379404225540271075397210247674277365558140653893385144048546857451479 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 2)]
]

/-- Partial product 2275 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2275 : Poly :=
[
  term ((87960091092379404225540271075397210247674277365558140653893385144048546857451479 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 2)],
  term ((-87960091092379404225540271075397210247674277365558140653893385144048546857451479 : Rat) / 131810728371474556102697372215955397640948775126992341519726878482196186640000) [(10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2275 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2275
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2275 := by
  native_decide

/-- Coefficient term 2276 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2276 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2276 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2276 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2276 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2276
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2276 := by
  native_decide

/-- Coefficient term 2277 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2277 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2277 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2277 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2277 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2277
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2277 := by
  native_decide

/-- Coefficient term 2278 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2278 : Poly :=
[
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (11, 1), (13, 1)]
]

/-- Partial product 2278 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2278 : Poly :=
[
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (11, 1), (13, 1)],
  term ((-151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2278 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2278
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2278 := by
  native_decide

/-- Coefficient term 2279 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2279 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2279 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2279 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2279 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2279
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2279 := by
  native_decide

/-- Coefficient term 2280 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2280 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2280 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2280 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2280 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2280
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2280 := by
  native_decide

/-- Coefficient term 2281 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2281 : Poly :=
[
  term ((-115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 2281 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2281 : Poly :=
[
  term ((-230077174676892411380632536971819459065214 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2281 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2281
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2281 := by
  native_decide

/-- Coefficient term 2282 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2282 : Poly :=
[
  term ((-386732133305706905464 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2282 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2282 : Poly :=
[
  term ((-773464266611413810928 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((386732133305706905464 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2282 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2282
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2282 := by
  native_decide

/-- Coefficient term 2283 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2283 : Poly :=
[
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 2), (12, 1)]
]

/-- Partial product 2283 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2283 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 2), (12, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2283 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2283
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2283 := by
  native_decide

/-- Coefficient term 2284 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2284 : Poly :=
[
  term ((67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2284 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2284 : Poly :=
[
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2284 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2284
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2284 := by
  native_decide

/-- Coefficient term 2285 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2285 : Poly :=
[
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2285 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2285 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2285 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2285
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2285 := by
  native_decide

/-- Coefficient term 2286 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2286 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (12, 1), (15, 2)]
]

/-- Partial product 2286 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2286 : Poly :=
[
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2286 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2286_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2286
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2286 := by
  native_decide

/-- Coefficient term 2287 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2287 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2287 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2287 : Poly :=
[
  term ((-3852076819738752 : Rat) / 7342292683791569) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2287 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2287_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2287
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2287 := by
  native_decide

/-- Coefficient term 2288 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2288 : Poly :=
[
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2288 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2288 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2288 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2288_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2288
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2288 := by
  native_decide

/-- Coefficient term 2289 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2289 : Poly :=
[
  term ((1926038409869376 : Rat) / 7342292683791569) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2289 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2289 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2289 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2289_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2289
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2289 := by
  native_decide

/-- Coefficient term 2290 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2290 : Poly :=
[
  term ((75902096856507389720261662178859222197516572012792477596706421927 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 2290 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2290 : Poly :=
[
  term ((75902096856507389720261662178859222197516572012792477596706421927 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-75902096856507389720261662178859222197516572012792477596706421927 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2290 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2290_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2290
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2290 := by
  native_decide

/-- Coefficient term 2291 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2291 : Poly :=
[
  term ((6857977408873392399422 : Rat) / 13017774793972194963465) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2291 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2291 : Poly :=
[
  term ((13715954817746784798844 : Rat) / 13017774793972194963465) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6857977408873392399422 : Rat) / 13017774793972194963465) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2291 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2291_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2291
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2291 := by
  native_decide

/-- Coefficient term 2292 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2292 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (13, 2)]
]

/-- Partial product 2292 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2292 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (13, 2)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2292 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2292_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2292
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2292 := by
  native_decide

/-- Coefficient term 2293 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2293 : Poly :=
[
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (14, 1)]
]

/-- Partial product 2293 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2293 : Poly :=
[
  term ((67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (14, 1)],
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2293 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2293_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2293
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2293 := by
  native_decide

/-- Coefficient term 2294 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2294 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2294 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2294 : Poly :=
[
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2294 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2294_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2294
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2294 := by
  native_decide

/-- Coefficient term 2295 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2295 : Poly :=
[
  term ((-29491541664817720313569061444266888007709350674358234144332987305444625057289 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (14, 1)]
]

/-- Partial product 2295 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2295 : Poly :=
[
  term ((29491541664817720313569061444266888007709350674358234144332987305444625057289 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (14, 1)],
  term ((-58983083329635440627138122888533776015418701348716468288665974610889250114578 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2295 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2295_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2295
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2295 := by
  native_decide

/-- Coefficient term 2296 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2296 : Poly :=
[
  term ((-193453605839690619005248 : Rat) / 24105507332629970868075) [(10, 2), (14, 1), (16, 1)]
]

/-- Partial product 2296 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2296 : Poly :=
[
  term ((193453605839690619005248 : Rat) / 24105507332629970868075) [(10, 2), (14, 1), (16, 1)],
  term ((-386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2296 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2296_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2296
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2296 := by
  native_decide

/-- Coefficient term 2297 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2297 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 2), (15, 2)]
]

/-- Partial product 2297 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2297 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 2), (14, 1), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2297 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2297_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2297
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2297 := by
  native_decide

/-- Coefficient term 2298 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2298 : Poly :=
[
  term ((-260201540992734 : Rat) / 7342292683791569) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 2298 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2298 : Poly :=
[
  term ((-520403081985468 : Rat) / 7342292683791569) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((260201540992734 : Rat) / 7342292683791569) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2298 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2298_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2298
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2298 := by
  native_decide

/-- Coefficient term 2299 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2299 : Poly :=
[
  term ((-852763403309160255146498 : Rat) / 168738551328409796076525) [(10, 2), (16, 1)]
]

/-- Partial product 2299 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2299 : Poly :=
[
  term ((-1705526806618320510292996 : Rat) / 168738551328409796076525) [(10, 2), (14, 1), (16, 1)],
  term ((852763403309160255146498 : Rat) / 168738551328409796076525) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2299 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2299_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2299
        rs_R009_ueqv_R009NYNYN_generator_28_2200_2299 =
      rs_R009_ueqv_R009NYNYN_partial_28_2299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_2200_2299 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_2200,
  rs_R009_ueqv_R009NYNYN_partial_28_2201,
  rs_R009_ueqv_R009NYNYN_partial_28_2202,
  rs_R009_ueqv_R009NYNYN_partial_28_2203,
  rs_R009_ueqv_R009NYNYN_partial_28_2204,
  rs_R009_ueqv_R009NYNYN_partial_28_2205,
  rs_R009_ueqv_R009NYNYN_partial_28_2206,
  rs_R009_ueqv_R009NYNYN_partial_28_2207,
  rs_R009_ueqv_R009NYNYN_partial_28_2208,
  rs_R009_ueqv_R009NYNYN_partial_28_2209,
  rs_R009_ueqv_R009NYNYN_partial_28_2210,
  rs_R009_ueqv_R009NYNYN_partial_28_2211,
  rs_R009_ueqv_R009NYNYN_partial_28_2212,
  rs_R009_ueqv_R009NYNYN_partial_28_2213,
  rs_R009_ueqv_R009NYNYN_partial_28_2214,
  rs_R009_ueqv_R009NYNYN_partial_28_2215,
  rs_R009_ueqv_R009NYNYN_partial_28_2216,
  rs_R009_ueqv_R009NYNYN_partial_28_2217,
  rs_R009_ueqv_R009NYNYN_partial_28_2218,
  rs_R009_ueqv_R009NYNYN_partial_28_2219,
  rs_R009_ueqv_R009NYNYN_partial_28_2220,
  rs_R009_ueqv_R009NYNYN_partial_28_2221,
  rs_R009_ueqv_R009NYNYN_partial_28_2222,
  rs_R009_ueqv_R009NYNYN_partial_28_2223,
  rs_R009_ueqv_R009NYNYN_partial_28_2224,
  rs_R009_ueqv_R009NYNYN_partial_28_2225,
  rs_R009_ueqv_R009NYNYN_partial_28_2226,
  rs_R009_ueqv_R009NYNYN_partial_28_2227,
  rs_R009_ueqv_R009NYNYN_partial_28_2228,
  rs_R009_ueqv_R009NYNYN_partial_28_2229,
  rs_R009_ueqv_R009NYNYN_partial_28_2230,
  rs_R009_ueqv_R009NYNYN_partial_28_2231,
  rs_R009_ueqv_R009NYNYN_partial_28_2232,
  rs_R009_ueqv_R009NYNYN_partial_28_2233,
  rs_R009_ueqv_R009NYNYN_partial_28_2234,
  rs_R009_ueqv_R009NYNYN_partial_28_2235,
  rs_R009_ueqv_R009NYNYN_partial_28_2236,
  rs_R009_ueqv_R009NYNYN_partial_28_2237,
  rs_R009_ueqv_R009NYNYN_partial_28_2238,
  rs_R009_ueqv_R009NYNYN_partial_28_2239,
  rs_R009_ueqv_R009NYNYN_partial_28_2240,
  rs_R009_ueqv_R009NYNYN_partial_28_2241,
  rs_R009_ueqv_R009NYNYN_partial_28_2242,
  rs_R009_ueqv_R009NYNYN_partial_28_2243,
  rs_R009_ueqv_R009NYNYN_partial_28_2244,
  rs_R009_ueqv_R009NYNYN_partial_28_2245,
  rs_R009_ueqv_R009NYNYN_partial_28_2246,
  rs_R009_ueqv_R009NYNYN_partial_28_2247,
  rs_R009_ueqv_R009NYNYN_partial_28_2248,
  rs_R009_ueqv_R009NYNYN_partial_28_2249,
  rs_R009_ueqv_R009NYNYN_partial_28_2250,
  rs_R009_ueqv_R009NYNYN_partial_28_2251,
  rs_R009_ueqv_R009NYNYN_partial_28_2252,
  rs_R009_ueqv_R009NYNYN_partial_28_2253,
  rs_R009_ueqv_R009NYNYN_partial_28_2254,
  rs_R009_ueqv_R009NYNYN_partial_28_2255,
  rs_R009_ueqv_R009NYNYN_partial_28_2256,
  rs_R009_ueqv_R009NYNYN_partial_28_2257,
  rs_R009_ueqv_R009NYNYN_partial_28_2258,
  rs_R009_ueqv_R009NYNYN_partial_28_2259,
  rs_R009_ueqv_R009NYNYN_partial_28_2260,
  rs_R009_ueqv_R009NYNYN_partial_28_2261,
  rs_R009_ueqv_R009NYNYN_partial_28_2262,
  rs_R009_ueqv_R009NYNYN_partial_28_2263,
  rs_R009_ueqv_R009NYNYN_partial_28_2264,
  rs_R009_ueqv_R009NYNYN_partial_28_2265,
  rs_R009_ueqv_R009NYNYN_partial_28_2266,
  rs_R009_ueqv_R009NYNYN_partial_28_2267,
  rs_R009_ueqv_R009NYNYN_partial_28_2268,
  rs_R009_ueqv_R009NYNYN_partial_28_2269,
  rs_R009_ueqv_R009NYNYN_partial_28_2270,
  rs_R009_ueqv_R009NYNYN_partial_28_2271,
  rs_R009_ueqv_R009NYNYN_partial_28_2272,
  rs_R009_ueqv_R009NYNYN_partial_28_2273,
  rs_R009_ueqv_R009NYNYN_partial_28_2274,
  rs_R009_ueqv_R009NYNYN_partial_28_2275,
  rs_R009_ueqv_R009NYNYN_partial_28_2276,
  rs_R009_ueqv_R009NYNYN_partial_28_2277,
  rs_R009_ueqv_R009NYNYN_partial_28_2278,
  rs_R009_ueqv_R009NYNYN_partial_28_2279,
  rs_R009_ueqv_R009NYNYN_partial_28_2280,
  rs_R009_ueqv_R009NYNYN_partial_28_2281,
  rs_R009_ueqv_R009NYNYN_partial_28_2282,
  rs_R009_ueqv_R009NYNYN_partial_28_2283,
  rs_R009_ueqv_R009NYNYN_partial_28_2284,
  rs_R009_ueqv_R009NYNYN_partial_28_2285,
  rs_R009_ueqv_R009NYNYN_partial_28_2286,
  rs_R009_ueqv_R009NYNYN_partial_28_2287,
  rs_R009_ueqv_R009NYNYN_partial_28_2288,
  rs_R009_ueqv_R009NYNYN_partial_28_2289,
  rs_R009_ueqv_R009NYNYN_partial_28_2290,
  rs_R009_ueqv_R009NYNYN_partial_28_2291,
  rs_R009_ueqv_R009NYNYN_partial_28_2292,
  rs_R009_ueqv_R009NYNYN_partial_28_2293,
  rs_R009_ueqv_R009NYNYN_partial_28_2294,
  rs_R009_ueqv_R009NYNYN_partial_28_2295,
  rs_R009_ueqv_R009NYNYN_partial_28_2296,
  rs_R009_ueqv_R009NYNYN_partial_28_2297,
  rs_R009_ueqv_R009NYNYN_partial_28_2298,
  rs_R009_ueqv_R009NYNYN_partial_28_2299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_2200_2299 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 2)],
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((170705364483516207385396564961415593742485684565905074160073350164 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((951761572417708219424 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-85352682241758103692698282480707796871242842282952537080036675082 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-475880786208854109712 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-654803195242135000124636974415372955193907524120857523478827760123 : Rat) / 3333902299396672091067754820796365673250825536837432424854853050) [(10, 1), (11, 1), (13, 1)],
  term ((165703016980886864395628257368404293691194730129277621059261303923 : Rat) / 381017405645333953264886265233870362657237204209992277126268920) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15105356892879099403304 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-561180032393960252849893212571166637640555361557856549243523556321 : Rat) / 6667804598793344182135509641592731346501651073674864849709706100) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-50156497637221424277904 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((20091802855744905771128 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((578782697072603184864854432051407315085535801886892742915286039903203286286845549 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((15344188996271779729605202 : Rat) / 3788172465045908734368315) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((520403081985468 : Rat) / 7342292683791569) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-590756316224114399396571756695605368336904889889624234047199390256725711306258049 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 1), (11, 1), (15, 1)],
  term ((-1105602644582604818177378 : Rat) / 541167495006558390624045) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2)],
  term ((2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 2), (12, 1)],
  term ((-5916206860908596375990271594053921019575594249206398149648813032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1830603107646692570888402721086996837419 : Rat) / 37899592888551674490625352659354213875) [(10, 1), (11, 2), (14, 1)],
  term ((-1018202650629677714552 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((230077174676892411380632536971819459065214 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (14, 2)],
  term ((773464266611413810928 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (16, 1)],
  term ((-558762630446759574886215073346366642685617062525828576641963605010832309154057035609 : Rat) / 458349839457074189754446328985615569396792540708261368911263598775423539676160000) [(10, 1), (12, 1)],
  term ((3137580670941273422472206327497550065401579052714217786109177273172630034348158603 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((72457732234064106068334296 : Rat) / 3788172465045908734368315) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-22517754843332232 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1769464091148144084519998246776805911201048946334819285995198113537389157027408603 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33324421192748685376771318 : Rat) / 3788172465045908734368315) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((152224928520031000427640394430458367335781 : Rat) / 452196285435976550493861350587037706120) [(10, 1), (12, 1), (13, 2)],
  term ((-340114298652539088770572361312262563293343 : Rat) / 474806099707775378018554418116389591426) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-28081257533841986858584 : Rat) / 2603554958794438992693) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((204419487604739878725275330082999918882029 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 2), (14, 2)],
  term ((16877726985036494351752 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((3142081528016468740882 : Rat) / 619894037808199760165) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((2184755361332500097024635577600175914611028126548719234019090827289211322826287951751 : Rat) / 687524759185611284631669493478423354095188811062392053366895398163135309514240000) [(10, 1), (12, 1), (14, 1)],
  term ((-54510833225814682651809497921413983621411320888935181470723937740081689369894941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1133086525475186679851 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((40527737381631389034369781 : Rat) / 674954205313639184306100) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6553429267312230916713800556285456340596186768201700057911017325575016695418323 : Rat) / 4430612718368892642107474696334635214821807567293860219150483310325922240000) [(10, 1), (12, 1), (14, 2)],
  term ((-4350786982530547732184222 : Rat) / 168738551328409796076525) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((54510833225814682651809497921413983621411320888935181470723937740081689369894941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(10, 1), (12, 1), (15, 2)],
  term ((1133086525475186679851 : Rat) / 64098215129500397370) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10608721138856764523333779 : Rat) / 449969470209092789537400) [(10, 1), (12, 1), (16, 1)],
  term ((-537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 5890653186815241879345170536437311776591197145499909123276995854184512000) [(10, 1), (12, 2)],
  term ((1785115926956378249331280993401174429214935706923985447129130255155809934001 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-15369934877453633684272 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 2), (13, 1), (14, 2), (15, 1)],
  term ((1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1166185134765392598059968923315217218921903410198012344406395989488728861229 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((6931071384935386508396 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 2), (13, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 2), (13, 2), (14, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 2), (13, 2), (14, 2)],
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (14, 2), (16, 1)],
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 2945326593407620939672585268218655888295598572749954561638497927092256000) [(10, 1), (12, 2), (14, 1)],
  term ((26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((22517754843332232 : Rat) / 7342292683791569) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((90650140777863095326 : Rat) / 32049107564750198685) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-26623534868418684602854075859661726696118920589345175872463372202625 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 2), (15, 2)],
  term ((-11258877421666116 : Rat) / 7342292683791569) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-45325070388931547663 : Rat) / 32049107564750198685) [(10, 1), (12, 2), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 3), (13, 1), (14, 1), (15, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 3), (13, 1), (15, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 3), (14, 1), (15, 2)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 3), (15, 2)],
  term ((850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 3), (15, 2), (16, 1)],
  term ((-1108964682778615794215173695049462016829149789237803449350658385826598184818084457663 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-673248162939702463393700059 : Rat) / 7576344930091817468736630) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-4040190884874870 : Rat) / 7342292683791569) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((60739807416193265549704118339753438473687278451354746601012173401902342077642941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((1145616350502873070946 : Rat) / 32049107564750198685) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((19173997285955513609088663757224433571939623673081780633193089894950437143510880989 : Rat) / 12397508592543784746916052046309631617554315614406523082401960231045272134963200) [(10, 1), (13, 1), (15, 1)],
  term ((431997956567560939181489 : Rat) / 12170835229063160592348) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(10, 1), (13, 1), (15, 3)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((937825848244141730737227180738438323828145252582136339767361703645246808857029579 : Rat) / 2367315674496474234648847361603602969916429898763208778771539952093767455219200) [(10, 1), (13, 2)],
  term ((-530990802171223493888609162497895540188349076746783341488804203736622552661376673 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (13, 2), (14, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-55465903844255227514792603 : Rat) / 7576344930091817468736630) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2565166032535814678131699253700609458387329955923548332881591703279743833639641203 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 1), (13, 2), (14, 2)],
  term ((-7959205072082630730031271 : Rat) / 541167495006558390624045) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(10, 1), (13, 2), (15, 2)],
  term ((-4534893515323182578033 : Rat) / 4339258264657398321155) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5559016967441682131250575 : Rat) / 757634493009181746873663) [(10, 1), (13, 2), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (13, 3), (15, 1)],
  term ((20881398537527989706560884168440280057982279164421921684099696724153919763477543 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(10, 1), (14, 1)],
  term ((26532221146231813173147870891240256434479738869156365066477328025936526489393923 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(10, 1), (14, 1), (15, 2)],
  term ((500752113501467712653 : Rat) / 14244047806555643860) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((47623978161721769047 : Rat) / 34185714735733545264) [(10, 1), (14, 1), (16, 1)],
  term ((-20881398537527989706560884168440280057982279164421921684099696724153919763477543 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(10, 1), (14, 2)],
  term ((58587093189391149107 : Rat) / 256392860518001589480) [(10, 1), (14, 2), (16, 1)],
  term ((-26532221146231813173147870891240256434479738869156365066477328025936526489393923 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(10, 1), (15, 2)],
  term ((-500752113501467712653 : Rat) / 28488095613111287720) [(10, 1), (15, 2), (16, 1)],
  term ((-193236691403804421203 : Rat) / 256392860518001589480) [(10, 1), (16, 1)],
  term ((87960091092379404225540271075397210247674277365558140653893385144048546857451479 : Rat) / 263621456742949112205394744431910795281897550253984683039453756964392373280000) [(10, 2)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (11, 1), (13, 1)],
  term ((5916206860908596375990271594053921019575594249206398149648813032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-230077174676892411380632536971819459065214 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-773464266611413810928 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (15, 1)],
  term ((386732133305706905464 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 2), (12, 1)],
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(10, 2), (12, 1), (14, 1)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (12, 1), (15, 2)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((10301117607624529191484 : Rat) / 13017774793972194963465) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-75902096856507389720261662178859222197516572012792477596706421927 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(10, 2), (13, 1), (15, 1)],
  term ((-6857977408873392399422 : Rat) / 13017774793972194963465) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (13, 2)],
  term ((19982554263443674640805533912975345584803096980093050516939662388 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 2), (13, 2), (14, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (14, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 2), (16, 1)],
  term ((-645407581867753217289756976602156069540055088811684253312299681655163281313 : Rat) / 3576468006280682569602424968551225007216083981196373396275318911469168000) [(10, 2), (14, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 2), (14, 1), (15, 2)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-66733440786417127684 : Rat) / 32049107564750198685) [(10, 2), (14, 1), (16, 1)],
  term ((-58983083329635440627138122888533776015418701348716468288665974610889250114578 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (14, 2)],
  term ((-386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (14, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 2), (15, 2)],
  term ((260201540992734 : Rat) / 7342292683791569) [(10, 2), (15, 2), (16, 1)],
  term ((852763403309160255146498 : Rat) / 168738551328409796076525) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 2200 through 2299. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_2200_2299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_2200_2299
      rs_R009_ueqv_R009NYNYN_block_28_2200_2299 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
