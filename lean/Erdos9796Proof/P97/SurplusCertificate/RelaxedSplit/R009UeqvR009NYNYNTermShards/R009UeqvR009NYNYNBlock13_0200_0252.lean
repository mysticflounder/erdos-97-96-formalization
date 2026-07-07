/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 13:200-252

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0200 : Poly :=
[
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(10, 1)]
]

/-- Partial product 200 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0200 : Poly :=
[
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(2, 1), (4, 1), (10, 1)],
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(2, 2), (10, 1)],
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(3, 1), (5, 1), (10, 1)],
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0200
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0201 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 201 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0201 : Poly :=
[
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0201
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0202 : Poly :=
[
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 202 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0202 : Poly :=
[
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0202
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0203 : Poly :=
[
  term ((4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 203 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0203 : Poly :=
[
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0203
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0204 : Poly :=
[
  term ((-898070297542561931728 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0204 : Poly :=
[
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0204
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0205 : Poly :=
[
  term ((254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 205 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0205 : Poly :=
[
  term ((508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0205
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0206 : Poly :=
[
  term ((-3389080530044619274216 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 206 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0206 : Poly :=
[
  term ((-6778161060089238548432 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3389080530044619274216 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6778161060089238548432 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3389080530044619274216 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0206
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0207 : Poly :=
[
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 207 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0207 : Poly :=
[
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0207
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0208 : Poly :=
[
  term ((265873209235941018268 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0208 : Poly :=
[
  term ((531746418471882036536 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-265873209235941018268 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((531746418471882036536 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-265873209235941018268 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0208
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0209 : Poly :=
[
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(10, 1), (12, 1)]
]

/-- Partial product 209 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0209 : Poly :=
[
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(2, 1), (4, 1), (10, 1), (12, 1)],
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(2, 2), (10, 1), (12, 1)],
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(3, 1), (5, 1), (10, 1), (12, 1)],
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(3, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0209
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0210 : Poly :=
[
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 210 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0210 : Poly :=
[
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0210
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0211 : Poly :=
[
  term ((294241217500957067036 : Rat) / 265668873346371325785) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0211 : Poly :=
[
  term ((588482435001914134072 : Rat) / 265668873346371325785) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((588482435001914134072 : Rat) / 265668873346371325785) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0211
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0212 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 212 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0212 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(2, 2), (10, 1), (12, 1), (13, 2)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(3, 2), (10, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0212
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0213 : Poly :=
[
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 213 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0213 : Poly :=
[
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(3, 2), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0213
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0214 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 214 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0214 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(2, 1), (4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(2, 2), (10, 1), (12, 1), (15, 2)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(3, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0214
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0215 : Poly :=
[
  term ((425212877599884 : Rat) / 7342292683791569) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0215 : Poly :=
[
  term ((850425755199768 : Rat) / 7342292683791569) [(2, 1), (4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(2, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((850425755199768 : Rat) / 7342292683791569) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0215
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0216 : Poly :=
[
  term ((180357882398208471038 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 216 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0216 : Poly :=
[
  term ((360715764796416942076 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-180357882398208471038 : Rat) / 32049107564750198685) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((360715764796416942076 : Rat) / 32049107564750198685) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-180357882398208471038 : Rat) / 32049107564750198685) [(3, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0216
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0217 : Poly :=
[
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 217 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0217 : Poly :=
[
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(3, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0217
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0218 : Poly :=
[
  term ((-17177503892073718576769 : Rat) / 13017774793972194963465) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0218 : Poly :=
[
  term ((-34355007784147437153538 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((17177503892073718576769 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34355007784147437153538 : Rat) / 13017774793972194963465) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((17177503892073718576769 : Rat) / 13017774793972194963465) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0218
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0219 : Poly :=
[
  term ((2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(10, 1), (13, 2)]
]

/-- Partial product 219 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0219 : Poly :=
[
  term ((2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (4, 1), (10, 1), (13, 2)],
  term ((-2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(2, 2), (10, 1), (13, 2)],
  term ((2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((-2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(3, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0219
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0220 : Poly :=
[
  term ((60099060073515959208218 : Rat) / 13017774793972194963465) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 220 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0220 : Poly :=
[
  term ((120198120147031918416436 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-60099060073515959208218 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((120198120147031918416436 : Rat) / 13017774793972194963465) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-60099060073515959208218 : Rat) / 13017774793972194963465) [(3, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0220
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0221 : Poly :=
[
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(10, 1), (15, 2)]
]

/-- Partial product 221 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0221 : Poly :=
[
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(2, 2), (10, 1), (15, 2)],
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0221
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0222 : Poly :=
[
  term ((642853742273919 : Rat) / 7342292683791569) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0222 : Poly :=
[
  term ((1285707484547838 : Rat) / 7342292683791569) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-642853742273919 : Rat) / 7342292683791569) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((1285707484547838 : Rat) / 7342292683791569) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-642853742273919 : Rat) / 7342292683791569) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0222
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0223 : Poly :=
[
  term ((-6640659926867398322 : Rat) / 3561011951638910965) [(10, 1), (16, 1)]
]

/-- Partial product 223 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0223 : Poly :=
[
  term ((-13281319853734796644 : Rat) / 3561011951638910965) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((6640659926867398322 : Rat) / 3561011951638910965) [(2, 2), (10, 1), (16, 1)],
  term ((-13281319853734796644 : Rat) / 3561011951638910965) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((6640659926867398322 : Rat) / 3561011951638910965) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0223
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0224 : Poly :=
[
  term ((598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 224 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0224 : Poly :=
[
  term ((1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(3, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0224
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0225 : Poly :=
[
  term ((100817297075197117213928 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0225 : Poly :=
[
  term ((201634594150394234427856 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-100817297075197117213928 : Rat) / 4339258264657398321155) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((201634594150394234427856 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-100817297075197117213928 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0225
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0226 : Poly :=
[
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 226 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0226 : Poly :=
[
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0226
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0227 : Poly :=
[
  term ((-7672300823653152858324 : Rat) / 867851652931479664231) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0227 : Poly :=
[
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0227
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0228 : Poly :=
[
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 1), (13, 1)]
]

/-- Partial product 228 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0228 : Poly :=
[
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(2, 2), (11, 1), (13, 1)],
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0228
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0229 : Poly :=
[
  term ((-311983928259755751459627059 : Rat) / 7576344930091817468736630) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 229 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0229 : Poly :=
[
  term ((-311983928259755751459627059 : Rat) / 3788172465045908734368315) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((311983928259755751459627059 : Rat) / 7576344930091817468736630) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-311983928259755751459627059 : Rat) / 3788172465045908734368315) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((311983928259755751459627059 : Rat) / 7576344930091817468736630) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0229
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0230 : Poly :=
[
  term ((7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(11, 1), (15, 1)]
]

/-- Partial product 230 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0230 : Poly :=
[
  term ((7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(2, 2), (11, 1), (15, 1)],
  term ((7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0230
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0231 : Poly :=
[
  term ((10641970077735154473528757 : Rat) / 1082334990013116781248090) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0231 : Poly :=
[
  term ((10641970077735154473528757 : Rat) / 541167495006558390624045) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10641970077735154473528757 : Rat) / 1082334990013116781248090) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((10641970077735154473528757 : Rat) / 541167495006558390624045) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10641970077735154473528757 : Rat) / 1082334990013116781248090) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0231
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0232 : Poly :=
[
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(11, 2)]
]

/-- Partial product 232 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0232 : Poly :=
[
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (4, 1), (11, 2)],
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(2, 2), (11, 2)],
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 1), (5, 1), (11, 2)],
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0232
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0233 : Poly :=
[
  term ((1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(11, 2), (12, 1)]
]

/-- Partial product 233 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0233 : Poly :=
[
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(2, 1), (4, 1), (11, 2), (12, 1)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(2, 2), (11, 2), (12, 1)],
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(3, 1), (5, 1), (11, 2), (12, 1)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(3, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0233
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0234 : Poly :=
[
  term ((-236801443996489053408 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 234 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0234 : Poly :=
[
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(2, 1), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(3, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0234
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0235 : Poly :=
[
  term ((332018839050788665058 : Rat) / 619894037808199760165) [(11, 2), (16, 1)]
]

/-- Partial product 235 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0235 : Poly :=
[
  term ((664037678101577330116 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-332018839050788665058 : Rat) / 619894037808199760165) [(2, 2), (11, 2), (16, 1)],
  term ((664037678101577330116 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-332018839050788665058 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0235
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0236 : Poly :=
[
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(12, 1)]
]

/-- Partial product 236 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0236 : Poly :=
[
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (4, 1), (12, 1)],
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 2), (12, 1)],
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 1), (5, 1), (12, 1)],
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0236
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0237 : Poly :=
[
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 237 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0237 : Poly :=
[
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0237
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0238 : Poly :=
[
  term ((1697620777324149364377 : Rat) / 123978807561639952033) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0238 : Poly :=
[
  term ((3395241554648298728754 : Rat) / 123978807561639952033) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1697620777324149364377 : Rat) / 123978807561639952033) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3395241554648298728754 : Rat) / 123978807561639952033) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1697620777324149364377 : Rat) / 123978807561639952033) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0238
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0239 : Poly :=
[
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 1), (13, 2)]
]

/-- Partial product 239 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0239 : Poly :=
[
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(2, 2), (12, 1), (13, 2)],
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(3, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0239
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0240 : Poly :=
[
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 240 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0240 : Poly :=
[
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(3, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0240
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0241 : Poly :=
[
  term ((-336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(12, 1), (15, 2)]
]

/-- Partial product 241 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0241 : Poly :=
[
  term ((-336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(2, 2), (12, 1), (15, 2)],
  term ((-336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0241
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0242 : Poly :=
[
  term ((-20220551851188249 : Rat) / 7342292683791569) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 242 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0242 : Poly :=
[
  term ((-40441103702376498 : Rat) / 7342292683791569) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-40441103702376498 : Rat) / 7342292683791569) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0242
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0243 : Poly :=
[
  term ((7616018693544851111189 : Rat) / 256392860518001589480) [(12, 1), (16, 1)]
]

/-- Partial product 243 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0243 : Poly :=
[
  term ((7616018693544851111189 : Rat) / 128196430259000794740) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-7616018693544851111189 : Rat) / 256392860518001589480) [(2, 2), (12, 1), (16, 1)],
  term ((7616018693544851111189 : Rat) / 128196430259000794740) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-7616018693544851111189 : Rat) / 256392860518001589480) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0243
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0244 : Poly :=
[
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 286117440502454605568193997484098000577286718495709871702025512917533440) [(12, 2)]
]

/-- Partial product 244 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0244 : Poly :=
[
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 143058720251227302784096998742049000288643359247854935851012756458766720) [(2, 1), (4, 1), (12, 2)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 286117440502454605568193997484098000577286718495709871702025512917533440) [(2, 2), (12, 2)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 143058720251227302784096998742049000288643359247854935851012756458766720) [(3, 1), (5, 1), (12, 2)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 286117440502454605568193997484098000577286718495709871702025512917533440) [(3, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0244
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0245 : Poly :=
[
  term ((-127771679507822796370 : Rat) / 6409821512950039737) [(12, 2), (16, 1)]
]

/-- Partial product 245 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0245 : Poly :=
[
  term ((-255543359015645592740 : Rat) / 6409821512950039737) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((127771679507822796370 : Rat) / 6409821512950039737) [(2, 2), (12, 2), (16, 1)],
  term ((-255543359015645592740 : Rat) / 6409821512950039737) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((127771679507822796370 : Rat) / 6409821512950039737) [(3, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0245
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0246 : Poly :=
[
  term ((68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 35482524592452901172208011029093083595069248137784186753081472385405434041446400) [(13, 1), (15, 1)]
]

/-- Partial product 246 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0246 : Poly :=
[
  term ((68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 17741262296226450586104005514546541797534624068892093376540736192702717020723200) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 35482524592452901172208011029093083595069248137784186753081472385405434041446400) [(2, 2), (13, 1), (15, 1)],
  term ((68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 17741262296226450586104005514546541797534624068892093376540736192702717020723200) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 35482524592452901172208011029093083595069248137784186753081472385405434041446400) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0246
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0247 : Poly :=
[
  term ((47802201747146869779978385 : Rat) / 1010179324012242329164884) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0247 : Poly :=
[
  term ((47802201747146869779978385 : Rat) / 505089662006121164582442) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47802201747146869779978385 : Rat) / 1010179324012242329164884) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((47802201747146869779978385 : Rat) / 505089662006121164582442) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47802201747146869779978385 : Rat) / 1010179324012242329164884) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0247
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0248 : Poly :=
[
  term ((5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(13, 2)]
]

/-- Partial product 248 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0248 : Poly :=
[
  term ((5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(2, 1), (4, 1), (13, 2)],
  term ((-5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(2, 2), (13, 2)],
  term ((5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (5, 1), (13, 2)],
  term ((-5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0248
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0249 : Poly :=
[
  term ((102309071486910047688976751 : Rat) / 7576344930091817468736630) [(13, 2), (16, 1)]
]

/-- Partial product 249 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0249 : Poly :=
[
  term ((102309071486910047688976751 : Rat) / 3788172465045908734368315) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-102309071486910047688976751 : Rat) / 7576344930091817468736630) [(2, 2), (13, 2), (16, 1)],
  term ((102309071486910047688976751 : Rat) / 3788172465045908734368315) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-102309071486910047688976751 : Rat) / 7576344930091817468736630) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0249
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0250 : Poly :=
[
  term ((67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(15, 2)]
]

/-- Partial product 250 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0250 : Poly :=
[
  term ((67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (4, 1), (15, 2)],
  term ((-67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 2), (15, 2)],
  term ((67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 1), (5, 1), (15, 2)],
  term ((-67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0250
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0251 : Poly :=
[
  term ((1292689846512013323191 : Rat) / 256392860518001589480) [(15, 2), (16, 1)]
]

/-- Partial product 251 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0251 : Poly :=
[
  term ((1292689846512013323191 : Rat) / 128196430259000794740) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-1292689846512013323191 : Rat) / 256392860518001589480) [(2, 2), (15, 2), (16, 1)],
  term ((1292689846512013323191 : Rat) / 128196430259000794740) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1292689846512013323191 : Rat) / 256392860518001589480) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0251
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0252 : Poly :=
[
  term ((-20126257392441760464887 : Rat) / 341857147357335452640) [(16, 1)]
]

/-- Partial product 252 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0252 : Poly :=
[
  term ((-20126257392441760464887 : Rat) / 170928573678667726320) [(2, 1), (4, 1), (16, 1)],
  term ((20126257392441760464887 : Rat) / 341857147357335452640) [(2, 2), (16, 1)],
  term ((-20126257392441760464887 : Rat) / 170928573678667726320) [(3, 1), (5, 1), (16, 1)],
  term ((20126257392441760464887 : Rat) / 341857147357335452640) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0252
        rs_R009_ueqv_R009NYNYN_generator_13_0200_0252 =
      rs_R009_ueqv_R009NYNYN_partial_13_0252 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_13_0200_0252 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_13_0200,
  rs_R009_ueqv_R009NYNYN_partial_13_0201,
  rs_R009_ueqv_R009NYNYN_partial_13_0202,
  rs_R009_ueqv_R009NYNYN_partial_13_0203,
  rs_R009_ueqv_R009NYNYN_partial_13_0204,
  rs_R009_ueqv_R009NYNYN_partial_13_0205,
  rs_R009_ueqv_R009NYNYN_partial_13_0206,
  rs_R009_ueqv_R009NYNYN_partial_13_0207,
  rs_R009_ueqv_R009NYNYN_partial_13_0208,
  rs_R009_ueqv_R009NYNYN_partial_13_0209,
  rs_R009_ueqv_R009NYNYN_partial_13_0210,
  rs_R009_ueqv_R009NYNYN_partial_13_0211,
  rs_R009_ueqv_R009NYNYN_partial_13_0212,
  rs_R009_ueqv_R009NYNYN_partial_13_0213,
  rs_R009_ueqv_R009NYNYN_partial_13_0214,
  rs_R009_ueqv_R009NYNYN_partial_13_0215,
  rs_R009_ueqv_R009NYNYN_partial_13_0216,
  rs_R009_ueqv_R009NYNYN_partial_13_0217,
  rs_R009_ueqv_R009NYNYN_partial_13_0218,
  rs_R009_ueqv_R009NYNYN_partial_13_0219,
  rs_R009_ueqv_R009NYNYN_partial_13_0220,
  rs_R009_ueqv_R009NYNYN_partial_13_0221,
  rs_R009_ueqv_R009NYNYN_partial_13_0222,
  rs_R009_ueqv_R009NYNYN_partial_13_0223,
  rs_R009_ueqv_R009NYNYN_partial_13_0224,
  rs_R009_ueqv_R009NYNYN_partial_13_0225,
  rs_R009_ueqv_R009NYNYN_partial_13_0226,
  rs_R009_ueqv_R009NYNYN_partial_13_0227,
  rs_R009_ueqv_R009NYNYN_partial_13_0228,
  rs_R009_ueqv_R009NYNYN_partial_13_0229,
  rs_R009_ueqv_R009NYNYN_partial_13_0230,
  rs_R009_ueqv_R009NYNYN_partial_13_0231,
  rs_R009_ueqv_R009NYNYN_partial_13_0232,
  rs_R009_ueqv_R009NYNYN_partial_13_0233,
  rs_R009_ueqv_R009NYNYN_partial_13_0234,
  rs_R009_ueqv_R009NYNYN_partial_13_0235,
  rs_R009_ueqv_R009NYNYN_partial_13_0236,
  rs_R009_ueqv_R009NYNYN_partial_13_0237,
  rs_R009_ueqv_R009NYNYN_partial_13_0238,
  rs_R009_ueqv_R009NYNYN_partial_13_0239,
  rs_R009_ueqv_R009NYNYN_partial_13_0240,
  rs_R009_ueqv_R009NYNYN_partial_13_0241,
  rs_R009_ueqv_R009NYNYN_partial_13_0242,
  rs_R009_ueqv_R009NYNYN_partial_13_0243,
  rs_R009_ueqv_R009NYNYN_partial_13_0244,
  rs_R009_ueqv_R009NYNYN_partial_13_0245,
  rs_R009_ueqv_R009NYNYN_partial_13_0246,
  rs_R009_ueqv_R009NYNYN_partial_13_0247,
  rs_R009_ueqv_R009NYNYN_partial_13_0248,
  rs_R009_ueqv_R009NYNYN_partial_13_0249,
  rs_R009_ueqv_R009NYNYN_partial_13_0250,
  rs_R009_ueqv_R009NYNYN_partial_13_0251,
  rs_R009_ueqv_R009NYNYN_partial_13_0252
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_13_0200_0252 : Poly :=
[
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(2, 1), (4, 1), (10, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-6778161060089238548432 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((531746418471882036536 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(2, 1), (4, 1), (10, 1), (12, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((588482435001914134072 : Rat) / 265668873346371325785) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 2)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(2, 1), (4, 1), (10, 1), (12, 1), (15, 2)],
  term ((850425755199768 : Rat) / 7342292683791569) [(2, 1), (4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((360715764796416942076 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-34355007784147437153538 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (4, 1), (10, 1), (13, 2)],
  term ((120198120147031918416436 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((1285707484547838 : Rat) / 7342292683791569) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13281319853734796644 : Rat) / 3561011951638910965) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((201634594150394234427856 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-311983928259755751459627059 : Rat) / 3788172465045908734368315) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((10641970077735154473528757 : Rat) / 541167495006558390624045) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (4, 1), (11, 2)],
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(2, 1), (4, 1), (11, 2), (12, 1)],
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(2, 1), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((664037678101577330116 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (4, 1), (12, 1)],
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((3395241554648298728754 : Rat) / 123978807561639952033) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-40441103702376498 : Rat) / 7342292683791569) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((7616018693544851111189 : Rat) / 128196430259000794740) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 143058720251227302784096998742049000288643359247854935851012756458766720) [(2, 1), (4, 1), (12, 2)],
  term ((-255543359015645592740 : Rat) / 6409821512950039737) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 17741262296226450586104005514546541797534624068892093376540736192702717020723200) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((47802201747146869779978385 : Rat) / 505089662006121164582442) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(2, 1), (4, 1), (13, 2)],
  term ((102309071486910047688976751 : Rat) / 3788172465045908734368315) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (4, 1), (15, 2)],
  term ((1292689846512013323191 : Rat) / 128196430259000794740) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-20126257392441760464887 : Rat) / 170928573678667726320) [(2, 1), (4, 1), (16, 1)],
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(2, 2), (10, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((3389080530044619274216 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-265873209235941018268 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(2, 2), (10, 1), (12, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(2, 2), (10, 1), (12, 1), (13, 2)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(2, 2), (10, 1), (12, 1), (15, 2)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(2, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-180357882398208471038 : Rat) / 32049107564750198685) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((17177503892073718576769 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(2, 2), (10, 1), (13, 2)],
  term ((-60099060073515959208218 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(2, 2), (10, 1), (15, 2)],
  term ((-642853742273919 : Rat) / 7342292683791569) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((6640659926867398322 : Rat) / 3561011951638910965) [(2, 2), (10, 1), (16, 1)],
  term ((-598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-100817297075197117213928 : Rat) / 4339258264657398321155) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(2, 2), (11, 1), (13, 1)],
  term ((311983928259755751459627059 : Rat) / 7576344930091817468736630) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(2, 2), (11, 1), (15, 1)],
  term ((-10641970077735154473528757 : Rat) / 1082334990013116781248090) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(2, 2), (11, 2)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(2, 2), (11, 2), (12, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((-332018839050788665058 : Rat) / 619894037808199760165) [(2, 2), (11, 2), (16, 1)],
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 2), (12, 1)],
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1697620777324149364377 : Rat) / 123978807561639952033) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(2, 2), (12, 1), (13, 2)],
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(2, 2), (12, 1), (15, 2)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7616018693544851111189 : Rat) / 256392860518001589480) [(2, 2), (12, 1), (16, 1)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 286117440502454605568193997484098000577286718495709871702025512917533440) [(2, 2), (12, 2)],
  term ((127771679507822796370 : Rat) / 6409821512950039737) [(2, 2), (12, 2), (16, 1)],
  term ((-68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 35482524592452901172208011029093083595069248137784186753081472385405434041446400) [(2, 2), (13, 1), (15, 1)],
  term ((-47802201747146869779978385 : Rat) / 1010179324012242329164884) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(2, 2), (13, 2)],
  term ((-102309071486910047688976751 : Rat) / 7576344930091817468736630) [(2, 2), (13, 2), (16, 1)],
  term ((-67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 2), (15, 2)],
  term ((-1292689846512013323191 : Rat) / 256392860518001589480) [(2, 2), (15, 2), (16, 1)],
  term ((20126257392441760464887 : Rat) / 341857147357335452640) [(2, 2), (16, 1)],
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(3, 1), (5, 1), (10, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-6778161060089238548432 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((531746418471882036536 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(3, 1), (5, 1), (10, 1), (12, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((588482435001914134072 : Rat) / 265668873346371325785) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2)],
  term ((850425755199768 : Rat) / 7342292683791569) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((360715764796416942076 : Rat) / 32049107564750198685) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-34355007784147437153538 : Rat) / 13017774793972194963465) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((120198120147031918416436 : Rat) / 13017774793972194963465) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((1285707484547838 : Rat) / 7342292683791569) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13281319853734796644 : Rat) / 3561011951638910965) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((201634594150394234427856 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15344601647306305716648 : Rat) / 867851652931479664231) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-311983928259755751459627059 : Rat) / 3788172465045908734368315) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((10641970077735154473528757 : Rat) / 541167495006558390624045) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 1), (5, 1), (11, 2)],
  term ((3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(3, 1), (5, 1), (11, 2), (12, 1)],
  term ((-473602887992978106816 : Rat) / 123978807561639952033) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((664037678101577330116 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 1), (5, 1), (12, 1)],
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((3395241554648298728754 : Rat) / 123978807561639952033) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-40441103702376498 : Rat) / 7342292683791569) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((7616018693544851111189 : Rat) / 128196430259000794740) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 143058720251227302784096998742049000288643359247854935851012756458766720) [(3, 1), (5, 1), (12, 2)],
  term ((-255543359015645592740 : Rat) / 6409821512950039737) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 17741262296226450586104005514546541797534624068892093376540736192702717020723200) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((47802201747146869779978385 : Rat) / 505089662006121164582442) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (5, 1), (13, 2)],
  term ((102309071486910047688976751 : Rat) / 3788172465045908734368315) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 1), (5, 1), (15, 2)],
  term ((1292689846512013323191 : Rat) / 128196430259000794740) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-20126257392441760464887 : Rat) / 170928573678667726320) [(3, 1), (5, 1), (16, 1)],
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(3, 2), (10, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((3389080530044619274216 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-265873209235941018268 : Rat) / 619894037808199760165) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(3, 2), (10, 1), (12, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(3, 2), (10, 1), (12, 1), (13, 2)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(3, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(3, 2), (10, 1), (12, 1), (15, 2)],
  term ((-425212877599884 : Rat) / 7342292683791569) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-180357882398208471038 : Rat) / 32049107564750198685) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((17177503892073718576769 : Rat) / 13017774793972194963465) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(3, 2), (10, 1), (13, 2)],
  term ((-60099060073515959208218 : Rat) / 13017774793972194963465) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(3, 2), (10, 1), (15, 2)],
  term ((-642853742273919 : Rat) / 7342292683791569) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((6640659926867398322 : Rat) / 3561011951638910965) [(3, 2), (10, 1), (16, 1)],
  term ((-598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-100817297075197117213928 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 2), (11, 1), (13, 1)],
  term ((311983928259755751459627059 : Rat) / 7576344930091817468736630) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7032382625504940954146929824008179393065915900510165121475795399979095400228057067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(3, 2), (11, 1), (15, 1)],
  term ((-10641970077735154473528757 : Rat) / 1082334990013116781248090) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(3, 2), (11, 2)],
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(3, 2), (11, 2), (12, 1)],
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((-332018839050788665058 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (16, 1)],
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 2), (12, 1)],
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1697620777324149364377 : Rat) / 123978807561639952033) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(3, 2), (12, 1), (13, 2)],
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((336717554448023350329742737117910006081853241578663218955651797047883 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(3, 2), (12, 1), (15, 2)],
  term ((20220551851188249 : Rat) / 7342292683791569) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7616018693544851111189 : Rat) / 256392860518001589480) [(3, 2), (12, 1), (16, 1)],
  term ((336487403876505088183980567896890267774628476855616550951128418017325489821 : Rat) / 286117440502454605568193997484098000577286718495709871702025512917533440) [(3, 2), (12, 2)],
  term ((127771679507822796370 : Rat) / 6409821512950039737) [(3, 2), (12, 2), (16, 1)],
  term ((-68227383522142463914562500718583232603543593619635963511226151123536503190000464141 : Rat) / 35482524592452901172208011029093083595069248137784186753081472385405434041446400) [(3, 2), (13, 1), (15, 1)],
  term ((-47802201747146869779978385 : Rat) / 1010179324012242329164884) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5120715783308441570937461035967036177156430364850731402952382812836736098966261693 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 2), (13, 2)],
  term ((-102309071486910047688976751 : Rat) / 7576344930091817468736630) [(3, 2), (13, 2), (16, 1)],
  term ((-67595446650340454526719196739730619958094255941895081663959324017412325798454941 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(3, 2), (15, 2)],
  term ((-1292689846512013323191 : Rat) / 256392860518001589480) [(3, 2), (15, 2), (16, 1)],
  term ((20126257392441760464887 : Rat) / 341857147357335452640) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 200 through 252. -/
theorem rs_R009_ueqv_R009NYNYN_block_13_0200_0252_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_13_0200_0252
      rs_R009_ueqv_R009NYNYN_block_13_0200_0252 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
