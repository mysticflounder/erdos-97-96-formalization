/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:1200-1299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1200 : Poly :=
[
  term ((512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(3, 1), (14, 1), (15, 3)]
]

/-- Partial product 1200 for generator 9. -/
def ep_Q1_009_partial_09_1200 : Poly :=
[
  term ((512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(3, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 9. -/
theorem ep_Q1_009_partial_09_1200_valid :
    mulPoly ep_Q1_009_coefficient_09_1200
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1201 : Poly :=
[
  term ((-2416572556881639 : Rat) / 2790413914924826) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1201 for generator 9. -/
def ep_Q1_009_partial_09_1201 : Poly :=
[
  term ((-2416572556881639 : Rat) / 1395206957462413) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((2416572556881639 : Rat) / 2790413914924826) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 9. -/
theorem ep_Q1_009_partial_09_1201_valid :
    mulPoly ep_Q1_009_coefficient_09_1201
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1202 : Poly :=
[
  term ((-4739701457213438327179242416506545197751099333367866790658520803653217991335081206205325799865032020055462479089839 : Rat) / 9806970526069505855098480732258809153696108613682764276840729196869976229821558508701842557454851558488583114240) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 1202 for generator 9. -/
def ep_Q1_009_partial_09_1202 : Poly :=
[
  term ((-4739701457213438327179242416506545197751099333367866790658520803653217991335081206205325799865032020055462479089839 : Rat) / 4903485263034752927549240366129404576848054306841382138420364598434988114910779254350921278727425779244291557120) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((4739701457213438327179242416506545197751099333367866790658520803653217991335081206205325799865032020055462479089839 : Rat) / 9806970526069505855098480732258809153696108613682764276840729196869976229821558508701842557454851558488583114240) [(3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 9. -/
theorem ep_Q1_009_partial_09_1202_valid :
    mulPoly ep_Q1_009_coefficient_09_1202
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1203 : Poly :=
[
  term ((-95960379023393184831217 : Rat) / 2031704557077638197839) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1203 for generator 9. -/
def ep_Q1_009_partial_09_1203 : Poly :=
[
  term ((-191920758046786369662434 : Rat) / 2031704557077638197839) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((95960379023393184831217 : Rat) / 2031704557077638197839) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 9. -/
theorem ep_Q1_009_partial_09_1203_valid :
    mulPoly ep_Q1_009_coefficient_09_1203
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1204 : Poly :=
[
  term ((2515038857013211159877130668423434828857314744657316093282682633174320242904946857163345337144303147 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(3, 1), (14, 3), (15, 1)]
]

/-- Partial product 1204 for generator 9. -/
def ep_Q1_009_partial_09_1204 : Poly :=
[
  term ((2515038857013211159877130668423434828857314744657316093282682633174320242904946857163345337144303147 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((-2515038857013211159877130668423434828857314744657316093282682633174320242904946857163345337144303147 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 9. -/
theorem ep_Q1_009_partial_09_1204_valid :
    mulPoly ep_Q1_009_coefficient_09_1204
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1205 : Poly :=
[
  term ((-3606881054837723 : Rat) / 2790413914924826) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 1205 for generator 9. -/
def ep_Q1_009_partial_09_1205 : Poly :=
[
  term ((-3606881054837723 : Rat) / 1395206957462413) [(2, 1), (3, 1), (14, 3), (15, 1), (16, 1)],
  term ((3606881054837723 : Rat) / 2790413914924826) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 9. -/
theorem ep_Q1_009_partial_09_1205_valid :
    mulPoly ep_Q1_009_coefficient_09_1205
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1206 : Poly :=
[
  term ((11 : Rat) / 51) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1206 for generator 9. -/
def ep_Q1_009_partial_09_1206 : Poly :=
[
  term ((22 : Rat) / 51) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 51) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 9. -/
theorem ep_Q1_009_partial_09_1206_valid :
    mulPoly ep_Q1_009_coefficient_09_1206
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1207 : Poly :=
[
  term ((-98 : Rat) / 51) [(3, 2), (4, 1), (6, 1), (16, 1)]
]

/-- Partial product 1207 for generator 9. -/
def ep_Q1_009_partial_09_1207 : Poly :=
[
  term ((-196 : Rat) / 51) [(2, 1), (3, 2), (4, 1), (6, 1), (16, 1)],
  term ((98 : Rat) / 51) [(3, 2), (4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 9. -/
theorem ep_Q1_009_partial_09_1207_valid :
    mulPoly ep_Q1_009_coefficient_09_1207
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1208 : Poly :=
[
  term ((8 : Rat) / 3) [(3, 2), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 1208 for generator 9. -/
def ep_Q1_009_partial_09_1208 : Poly :=
[
  term ((16 : Rat) / 3) [(2, 1), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 2), (4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 9. -/
theorem ep_Q1_009_partial_09_1208_valid :
    mulPoly ep_Q1_009_coefficient_09_1208
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1209 : Poly :=
[
  term ((4 : Rat) / 17) [(3, 2), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 1209 for generator 9. -/
def ep_Q1_009_partial_09_1209 : Poly :=
[
  term ((8 : Rat) / 17) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 17) [(3, 2), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 9. -/
theorem ep_Q1_009_partial_09_1209_valid :
    mulPoly ep_Q1_009_coefficient_09_1209
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1210 : Poly :=
[
  term ((-13 : Rat) / 51) [(3, 2), (4, 1), (16, 1)]
]

/-- Partial product 1210 for generator 9. -/
def ep_Q1_009_partial_09_1210 : Poly :=
[
  term ((-26 : Rat) / 51) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((13 : Rat) / 51) [(3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 9. -/
theorem ep_Q1_009_partial_09_1210_valid :
    mulPoly ep_Q1_009_coefficient_09_1210
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1211 : Poly :=
[
  term ((98 : Rat) / 51) [(3, 2), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 1211 for generator 9. -/
def ep_Q1_009_partial_09_1211 : Poly :=
[
  term ((196 : Rat) / 51) [(2, 1), (3, 2), (6, 1), (14, 1), (16, 1)],
  term ((-98 : Rat) / 51) [(3, 2), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 9. -/
theorem ep_Q1_009_partial_09_1211_valid :
    mulPoly ep_Q1_009_coefficient_09_1211
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1212 : Poly :=
[
  term ((-14 : Rat) / 51) [(3, 2), (6, 1), (16, 1)]
]

/-- Partial product 1212 for generator 9. -/
def ep_Q1_009_partial_09_1212 : Poly :=
[
  term ((-28 : Rat) / 51) [(2, 1), (3, 2), (6, 1), (16, 1)],
  term ((14 : Rat) / 51) [(3, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 9. -/
theorem ep_Q1_009_partial_09_1212_valid :
    mulPoly ep_Q1_009_coefficient_09_1212
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1213 : Poly :=
[
  term ((-8 : Rat) / 3) [(3, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1213 for generator 9. -/
def ep_Q1_009_partial_09_1213 : Poly :=
[
  term ((-16 : Rat) / 3) [(2, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(3, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 9. -/
theorem ep_Q1_009_partial_09_1213_valid :
    mulPoly ep_Q1_009_coefficient_09_1213
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1214 : Poly :=
[
  term ((89 : Rat) / 51) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 1214 for generator 9. -/
def ep_Q1_009_partial_09_1214 : Poly :=
[
  term ((178 : Rat) / 51) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((-89 : Rat) / 51) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 9. -/
theorem ep_Q1_009_partial_09_1214_valid :
    mulPoly ep_Q1_009_coefficient_09_1214
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1215 : Poly :=
[
  term ((-22 : Rat) / 51) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 1215 for generator 9. -/
def ep_Q1_009_partial_09_1215 : Poly :=
[
  term ((-44 : Rat) / 51) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((22 : Rat) / 51) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 9. -/
theorem ep_Q1_009_partial_09_1215_valid :
    mulPoly ep_Q1_009_coefficient_09_1215
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1216 : Poly :=
[
  term ((-4 : Rat) / 17) [(3, 2), (14, 2), (16, 1)]
]

/-- Partial product 1216 for generator 9. -/
def ep_Q1_009_partial_09_1216 : Poly :=
[
  term ((-8 : Rat) / 17) [(2, 1), (3, 2), (14, 2), (16, 1)],
  term ((4 : Rat) / 17) [(3, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 9. -/
theorem ep_Q1_009_partial_09_1216_valid :
    mulPoly ep_Q1_009_coefficient_09_1216
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1217 : Poly :=
[
  term ((6665508769782225911526809681252548248550089155338644662396835717401273080965148805962542236876782711 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(4, 1)]
]

/-- Partial product 1217 for generator 9. -/
def ep_Q1_009_partial_09_1217 : Poly :=
[
  term ((6665508769782225911526809681252548248550089155338644662396835717401273080965148805962542236876782711 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(2, 1), (4, 1)],
  term ((-6665508769782225911526809681252548248550089155338644662396835717401273080965148805962542236876782711 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 9. -/
theorem ep_Q1_009_partial_09_1217_valid :
    mulPoly ep_Q1_009_coefficient_09_1217
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1218 : Poly :=
[
  term ((-260292604586091816333069709667370181574594917392195857712728965804652125 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(4, 1), (5, 1), (7, 1)]
]

/-- Partial product 1218 for generator 9. -/
def ep_Q1_009_partial_09_1218 : Poly :=
[
  term ((-520585209172183632666139419334740363149189834784391715425457931609304250 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(2, 1), (4, 1), (5, 1), (7, 1)],
  term ((260292604586091816333069709667370181574594917392195857712728965804652125 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(4, 1), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 9. -/
theorem ep_Q1_009_partial_09_1218_valid :
    mulPoly ep_Q1_009_coefficient_09_1218
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1219 : Poly :=
[
  term ((691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(4, 1), (5, 1), (7, 1), (8, 1)]
]

/-- Partial product 1219 for generator 9. -/
def ep_Q1_009_partial_09_1219 : Poly :=
[
  term ((1382622841003198424848389404623544347485523955810635444990585480853541500 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1)],
  term ((-691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(4, 1), (5, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 9. -/
theorem ep_Q1_009_partial_09_1219_valid :
    mulPoly ep_Q1_009_coefficient_09_1219
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1220 : Poly :=
[
  term ((1899322590510256120078457259397682358719731022539252843595365729762431415128634716942530727913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (5, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 1220 for generator 9. -/
def ep_Q1_009_partial_09_1220 : Poly :=
[
  term ((1899322590510256120078457259397682358719731022539252843595365729762431415128634716942530727913 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-1899322590510256120078457259397682358719731022539252843595365729762431415128634716942530727913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (5, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 9. -/
theorem ep_Q1_009_partial_09_1220_valid :
    mulPoly ep_Q1_009_coefficient_09_1220
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1221 : Poly :=
[
  term ((-47951989410799248229566606367526186312437687039091070073847936964091409983588262025626809649550108807387097 : Rat) / 60427551781762153398026243508839843323261872648190187418209457116231336251472854428905921571931112199912960) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 1221 for generator 9. -/
def ep_Q1_009_partial_09_1221 : Poly :=
[
  term ((-47951989410799248229566606367526186312437687039091070073847936964091409983588262025626809649550108807387097 : Rat) / 30213775890881076699013121754419921661630936324095093709104728558115668125736427214452960785965556099956480) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((47951989410799248229566606367526186312437687039091070073847936964091409983588262025626809649550108807387097 : Rat) / 60427551781762153398026243508839843323261872648190187418209457116231336251472854428905921571931112199912960) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 9. -/
theorem ep_Q1_009_partial_09_1221_valid :
    mulPoly ep_Q1_009_coefficient_09_1221
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1222 : Poly :=
[
  term ((-6468810930309754647790 : Rat) / 4676338877845046513121) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1222 for generator 9. -/
def ep_Q1_009_partial_09_1222 : Poly :=
[
  term ((-12937621860619509295580 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((6468810930309754647790 : Rat) / 4676338877845046513121) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 9. -/
theorem ep_Q1_009_partial_09_1222_valid :
    mulPoly ep_Q1_009_coefficient_09_1222
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1223 : Poly :=
[
  term ((42957421548548565318080393395565600000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 3)]
]

/-- Partial product 1223 for generator 9. -/
def ep_Q1_009_partial_09_1223 : Poly :=
[
  term ((85914843097097130636160786791131200000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-42957421548548565318080393395565600000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 9. -/
theorem ep_Q1_009_partial_09_1223_valid :
    mulPoly ep_Q1_009_coefficient_09_1223
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1224 : Poly :=
[
  term ((2777728529547829886770651732613583637288722972033195146046343205644365670951863560773868366403097550274965727691 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

/-- Partial product 1224 for generator 9. -/
def ep_Q1_009_partial_09_1224 : Poly :=
[
  term ((2777728529547829886770651732613583637288722972033195146046343205644365670951863560773868366403097550274965727691 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-2777728529547829886770651732613583637288722972033195146046343205644365670951863560773868366403097550274965727691 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 9. -/
theorem ep_Q1_009_partial_09_1224_valid :
    mulPoly ep_Q1_009_coefficient_09_1224
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1225 : Poly :=
[
  term ((601663159156702116265 : Rat) / 290243508153948313977) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1225 for generator 9. -/
def ep_Q1_009_partial_09_1225 : Poly :=
[
  term ((1203326318313404232530 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-601663159156702116265 : Rat) / 290243508153948313977) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 9. -/
theorem ep_Q1_009_partial_09_1225_valid :
    mulPoly ep_Q1_009_coefficient_09_1225
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1226 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(4, 1), (5, 1), (7, 2), (8, 1), (15, 1)]
]

/-- Partial product 1226 for generator 9. -/
def ep_Q1_009_partial_09_1226 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(2, 1), (4, 1), (5, 1), (7, 2), (8, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(4, 1), (5, 1), (7, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 9. -/
theorem ep_Q1_009_partial_09_1226_valid :
    mulPoly ep_Q1_009_coefficient_09_1226
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1227 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(4, 1), (5, 1), (7, 2), (9, 1)]
]

/-- Partial product 1227 for generator 9. -/
def ep_Q1_009_partial_09_1227 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 26352598964624767439079257402424330703751718762625763213139493374379635761531299232546528) [(2, 1), (4, 1), (5, 1), (7, 2), (9, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(4, 1), (5, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 9. -/
theorem ep_Q1_009_partial_09_1227_valid :
    mulPoly ep_Q1_009_coefficient_09_1227
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1228 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(4, 1), (5, 1), (7, 2), (9, 1), (15, 2)]
]

/-- Partial product 1228 for generator 9. -/
def ep_Q1_009_partial_09_1228 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (4, 1), (5, 1), (7, 2), (9, 1), (15, 2)],
  term ((17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(4, 1), (5, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 9. -/
theorem ep_Q1_009_partial_09_1228_valid :
    mulPoly ep_Q1_009_coefficient_09_1228
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1229 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(4, 1), (5, 1), (7, 2), (15, 1)]
]

/-- Partial product 1229 for generator 9. -/
def ep_Q1_009_partial_09_1229 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 71127226839798258620171651408820819679857539344337066133505774783606462488685112759250608386912) [(2, 1), (4, 1), (5, 1), (7, 2), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(4, 1), (5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 9. -/
theorem ep_Q1_009_partial_09_1229_valid :
    mulPoly ep_Q1_009_coefficient_09_1229
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1230 : Poly :=
[
  term ((-8610450 : Rat) / 1178831) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 1230 for generator 9. -/
def ep_Q1_009_partial_09_1230 : Poly :=
[
  term ((-17220900 : Rat) / 1178831) [(2, 1), (4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((8610450 : Rat) / 1178831) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 9. -/
theorem ep_Q1_009_partial_09_1230_valid :
    mulPoly ep_Q1_009_coefficient_09_1230
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1231 : Poly :=
[
  term ((-5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1231 for generator 9. -/
def ep_Q1_009_partial_09_1231 : Poly :=
[
  term ((-11180646279552047561052588587169404997582936403965598197001051884709320 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 9. -/
theorem ep_Q1_009_partial_09_1231_valid :
    mulPoly ep_Q1_009_coefficient_09_1231
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1232 : Poly :=
[
  term ((243104193749389931519207466073826 : Rat) / 10306817152083683685026217919314591) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1232 for generator 9. -/
def ep_Q1_009_partial_09_1232 : Poly :=
[
  term ((486208387498779863038414932147652 : Rat) / 10306817152083683685026217919314591) [(2, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-243104193749389931519207466073826 : Rat) / 10306817152083683685026217919314591) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 9. -/
theorem ep_Q1_009_partial_09_1232_valid :
    mulPoly ep_Q1_009_coefficient_09_1232
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1233 : Poly :=
[
  term ((-1858270008476681653237415456451161897153225004976611054851633940361802168565982824577076375485 : Rat) / 2548581412886900104484673164475628982223697651511604794018182973603713509889671119673377630208) [(4, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 1233 for generator 9. -/
def ep_Q1_009_partial_09_1233 : Poly :=
[
  term ((-1858270008476681653237415456451161897153225004976611054851633940361802168565982824577076375485 : Rat) / 1274290706443450052242336582237814491111848825755802397009091486801856754944835559836688815104) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((1858270008476681653237415456451161897153225004976611054851633940361802168565982824577076375485 : Rat) / 2548581412886900104484673164475628982223697651511604794018182973603713509889671119673377630208) [(4, 1), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 9. -/
theorem ep_Q1_009_partial_09_1233_valid :
    mulPoly ep_Q1_009_coefficient_09_1233
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1234 : Poly :=
[
  term ((38325228471872977767350572872804 : Rat) / 3435605717361227895008739306438197) [(4, 1), (5, 1), (8, 1), (15, 3)]
]

/-- Partial product 1234 for generator 9. -/
def ep_Q1_009_partial_09_1234 : Poly :=
[
  term ((76650456943745955534701145745608 : Rat) / 3435605717361227895008739306438197) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 3)],
  term ((-38325228471872977767350572872804 : Rat) / 3435605717361227895008739306438197) [(4, 1), (5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 9. -/
theorem ep_Q1_009_partial_09_1234_valid :
    mulPoly ep_Q1_009_coefficient_09_1234
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1235 : Poly :=
[
  term ((-135952807196583722803440994942039489416563266935814460176238960863615825198334137766214412431235340921787835151663 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(4, 1), (5, 1), (9, 1)]
]

/-- Partial product 1235 for generator 9. -/
def ep_Q1_009_partial_09_1235 : Poly :=
[
  term ((-135952807196583722803440994942039489416563266935814460176238960863615825198334137766214412431235340921787835151663 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(2, 1), (4, 1), (5, 1), (9, 1)],
  term ((135952807196583722803440994942039489416563266935814460176238960863615825198334137766214412431235340921787835151663 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(4, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 9. -/
theorem ep_Q1_009_partial_09_1235_valid :
    mulPoly ep_Q1_009_coefficient_09_1235
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1236 : Poly :=
[
  term ((56435728441323002712738707211283028146048262450834503093316493877409040695069844943425202160427771514997118335287 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(4, 1), (5, 1), (9, 1), (14, 1)]
]

/-- Partial product 1236 for generator 9. -/
def ep_Q1_009_partial_09_1236 : Poly :=
[
  term ((56435728441323002712738707211283028146048262450834503093316493877409040695069844943425202160427771514997118335287 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1)],
  term ((-56435728441323002712738707211283028146048262450834503093316493877409040695069844943425202160427771514997118335287 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(4, 1), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 9. -/
theorem ep_Q1_009_partial_09_1236_valid :
    mulPoly ep_Q1_009_coefficient_09_1236
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1237 : Poly :=
[
  term ((-112692175289882397036035 : Rat) / 18705355511380186052484) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1237 for generator 9. -/
def ep_Q1_009_partial_09_1237 : Poly :=
[
  term ((-112692175289882397036035 : Rat) / 9352677755690093026242) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((112692175289882397036035 : Rat) / 18705355511380186052484) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 9. -/
theorem ep_Q1_009_partial_09_1237_valid :
    mulPoly ep_Q1_009_coefficient_09_1237
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1238 : Poly :=
[
  term ((4097778529130243798195415673526174602908214111157355769238789955609285573811629901280899393536426220667608788331673 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(4, 1), (5, 1), (9, 1), (15, 2)]
]

/-- Partial product 1238 for generator 9. -/
def ep_Q1_009_partial_09_1238 : Poly :=
[
  term ((4097778529130243798195415673526174602908214111157355769238789955609285573811629901280899393536426220667608788331673 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2)],
  term ((-4097778529130243798195415673526174602908214111157355769238789955609285573811629901280899393536426220667608788331673 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(4, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 9. -/
theorem ep_Q1_009_partial_09_1238_valid :
    mulPoly ep_Q1_009_coefficient_09_1238
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1239 : Poly :=
[
  term ((-126692606909265850999 : Rat) / 91692919173432284571) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1239 for generator 9. -/
def ep_Q1_009_partial_09_1239 : Poly :=
[
  term ((-253385213818531701998 : Rat) / 91692919173432284571) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((126692606909265850999 : Rat) / 91692919173432284571) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 9. -/
theorem ep_Q1_009_partial_09_1239_valid :
    mulPoly ep_Q1_009_coefficient_09_1239
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1240 : Poly :=
[
  term ((223899956830693889380583 : Rat) / 37410711022760372104968) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 1240 for generator 9. -/
def ep_Q1_009_partial_09_1240 : Poly :=
[
  term ((223899956830693889380583 : Rat) / 18705355511380186052484) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-223899956830693889380583 : Rat) / 37410711022760372104968) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 9. -/
theorem ep_Q1_009_partial_09_1240_valid :
    mulPoly ep_Q1_009_coefficient_09_1240
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1241 : Poly :=
[
  term ((187770740465786264067010099449315908097627923568156744056605099410999517081 : Rat) / 854948848162063589918356820950239939961873722574683856003726662714487969920) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 1241 for generator 9. -/
def ep_Q1_009_partial_09_1241 : Poly :=
[
  term ((187770740465786264067010099449315908097627923568156744056605099410999517081 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-187770740465786264067010099449315908097627923568156744056605099410999517081 : Rat) / 854948848162063589918356820950239939961873722574683856003726662714487969920) [(4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 9. -/
theorem ep_Q1_009_partial_09_1241_valid :
    mulPoly ep_Q1_009_coefficient_09_1241
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1242 : Poly :=
[
  term ((-218916119703947931482783029893000 : Rat) / 24049240021528595265061175145067379) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 1242 for generator 9. -/
def ep_Q1_009_partial_09_1242 : Poly :=
[
  term ((-437832239407895862965566059786000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((218916119703947931482783029893000 : Rat) / 24049240021528595265061175145067379) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 9. -/
theorem ep_Q1_009_partial_09_1242_valid :
    mulPoly ep_Q1_009_coefficient_09_1242
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1243 : Poly :=
[
  term ((57756593283594773412478927035600 : Rat) / 24049240021528595265061175145067379) [(4, 1), (5, 1), (13, 2), (15, 1)]
]

/-- Partial product 1243 for generator 9. -/
def ep_Q1_009_partial_09_1243 : Poly :=
[
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1)],
  term ((-57756593283594773412478927035600 : Rat) / 24049240021528595265061175145067379) [(4, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 9. -/
theorem ep_Q1_009_partial_09_1243_valid :
    mulPoly ep_Q1_009_coefficient_09_1243
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1244 : Poly :=
[
  term ((166307833493769086879610806285297927408148391607336941 : Rat) / 380095939772830506191081675904475632233816246516369856) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1244 for generator 9. -/
def ep_Q1_009_partial_09_1244 : Poly :=
[
  term ((166307833493769086879610806285297927408148391607336941 : Rat) / 190047969886415253095540837952237816116908123258184928) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-166307833493769086879610806285297927408148391607336941 : Rat) / 380095939772830506191081675904475632233816246516369856) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 9. -/
theorem ep_Q1_009_partial_09_1244_valid :
    mulPoly ep_Q1_009_coefficient_09_1244
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1245 : Poly :=
[
  term ((-2521378683271929 : Rat) / 5580827829849652) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1245 for generator 9. -/
def ep_Q1_009_partial_09_1245 : Poly :=
[
  term ((-2521378683271929 : Rat) / 2790413914924826) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2521378683271929 : Rat) / 5580827829849652) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 9. -/
theorem ep_Q1_009_partial_09_1245_valid :
    mulPoly ep_Q1_009_coefficient_09_1245
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1246 : Poly :=
[
  term ((-209369452135609765055545604862057204219339323178029623044338499404385725741643341339056335262860610886573778489247 : Rat) / 8405974736631005018655840627650407846025235954585226523006339311602836768418478721744436477818444192990214097920) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 1246 for generator 9. -/
def ep_Q1_009_partial_09_1246 : Poly :=
[
  term ((-209369452135609765055545604862057204219339323178029623044338499404385725741643341339056335262860610886573778489247 : Rat) / 4202987368315502509327920313825203923012617977292613261503169655801418384209239360872218238909222096495107048960) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((209369452135609765055545604862057204219339323178029623044338499404385725741643341339056335262860610886573778489247 : Rat) / 8405974736631005018655840627650407846025235954585226523006339311602836768418478721744436477818444192990214097920) [(4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 9. -/
theorem ep_Q1_009_partial_09_1246_valid :
    mulPoly ep_Q1_009_coefficient_09_1246
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1247 : Poly :=
[
  term ((-2173786975831356609539 : Rat) / 1160974032615793255908) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1247 for generator 9. -/
def ep_Q1_009_partial_09_1247 : Poly :=
[
  term ((-2173786975831356609539 : Rat) / 580487016307896627954) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2173786975831356609539 : Rat) / 1160974032615793255908) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 9. -/
theorem ep_Q1_009_partial_09_1247_valid :
    mulPoly ep_Q1_009_coefficient_09_1247
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1248 : Poly :=
[
  term ((116645975160420362222498983356693491577652917267736609381440868236980745281856664853064130711729493 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(4, 1), (5, 1), (15, 3)]
]

/-- Partial product 1248 for generator 9. -/
def ep_Q1_009_partial_09_1248 : Poly :=
[
  term ((116645975160420362222498983356693491577652917267736609381440868236980745281856664853064130711729493 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((-116645975160420362222498983356693491577652917267736609381440868236980745281856664853064130711729493 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(4, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 9. -/
theorem ep_Q1_009_partial_09_1248_valid :
    mulPoly ep_Q1_009_coefficient_09_1248
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1249 : Poly :=
[
  term ((-185917799624427 : Rat) / 1395206957462413) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 1249 for generator 9. -/
def ep_Q1_009_partial_09_1249 : Poly :=
[
  term ((-371835599248854 : Rat) / 1395206957462413) [(2, 1), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((185917799624427 : Rat) / 1395206957462413) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 9. -/
theorem ep_Q1_009_partial_09_1249_valid :
    mulPoly ep_Q1_009_coefficient_09_1249
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1250 : Poly :=
[
  term ((-3681521917764129676000858457528697309727513548536947033094590765813906785886180151732162716323664171 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (6, 1)]
]

/-- Partial product 1250 for generator 9. -/
def ep_Q1_009_partial_09_1250 : Poly :=
[
  term ((-3681521917764129676000858457528697309727513548536947033094590765813906785886180151732162716323664171 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (4, 1), (6, 1)],
  term ((3681521917764129676000858457528697309727513548536947033094590765813906785886180151732162716323664171 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 9. -/
theorem ep_Q1_009_partial_09_1250_valid :
    mulPoly ep_Q1_009_coefficient_09_1250
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1251 : Poly :=
[
  term ((-950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1251 for generator 9. -/
def ep_Q1_009_partial_09_1251 : Poly :=
[
  term ((-950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 9. -/
theorem ep_Q1_009_partial_09_1251_valid :
    mulPoly ep_Q1_009_coefficient_09_1251
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1252 : Poly :=
[
  term ((734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 592933476704057267379283291554547440834413672159079672295638600923541804634454232732296880) [(4, 1), (6, 1), (7, 1), (9, 1)]
]

/-- Partial product 1252 for generator 9. -/
def ep_Q1_009_partial_09_1252 : Poly :=
[
  term ((734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 592933476704057267379283291554547440834413672159079672295638600923541804634454232732296880) [(4, 1), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 9. -/
theorem ep_Q1_009_partial_09_1252_valid :
    mulPoly ep_Q1_009_coefficient_09_1252
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1253 : Poly :=
[
  term ((-178702873641962031723214436525552896000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 1253 for generator 9. -/
def ep_Q1_009_partial_09_1253 : Poly :=
[
  term ((-357405747283924063446428873051105792000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((178702873641962031723214436525552896000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 9. -/
theorem ep_Q1_009_partial_09_1253_valid :
    mulPoly ep_Q1_009_coefficient_09_1253
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1254 : Poly :=
[
  term ((-17646730080031024522734252361308530593817874018138551367175022834236353610165323954579074062548355 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(4, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 1254 for generator 9. -/
def ep_Q1_009_partial_09_1254 : Poly :=
[
  term ((-17646730080031024522734252361308530593817874018138551367175022834236353610165323954579074062548355 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((17646730080031024522734252361308530593817874018138551367175022834236353610165323954579074062548355 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(4, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 9. -/
theorem ep_Q1_009_partial_09_1254_valid :
    mulPoly ep_Q1_009_coefficient_09_1254
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1255 : Poly :=
[
  term ((-29849560 : Rat) / 3536493) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1255 for generator 9. -/
def ep_Q1_009_partial_09_1255 : Poly :=
[
  term ((-59699120 : Rat) / 3536493) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((29849560 : Rat) / 3536493) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 9. -/
theorem ep_Q1_009_partial_09_1255_valid :
    mulPoly ep_Q1_009_coefficient_09_1255
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1256 : Poly :=
[
  term ((-2181003996286826896504686117089062117087480340450882141844986068669943344696021096300867392057337 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (6, 1), (8, 1)]
]

/-- Partial product 1256 for generator 9. -/
def ep_Q1_009_partial_09_1256 : Poly :=
[
  term ((-2181003996286826896504686117089062117087480340450882141844986068669943344696021096300867392057337 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (4, 1), (6, 1), (8, 1)],
  term ((2181003996286826896504686117089062117087480340450882141844986068669943344696021096300867392057337 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 9. -/
theorem ep_Q1_009_partial_09_1256_valid :
    mulPoly ep_Q1_009_coefficient_09_1256
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1257 : Poly :=
[
  term ((104037071812059217812790321770403862069874001210608441093877586344216972156009911836268223423373 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1257 for generator 9. -/
def ep_Q1_009_partial_09_1257 : Poly :=
[
  term ((104037071812059217812790321770403862069874001210608441093877586344216972156009911836268223423373 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-104037071812059217812790321770403862069874001210608441093877586344216972156009911836268223423373 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 9. -/
theorem ep_Q1_009_partial_09_1257_valid :
    mulPoly ep_Q1_009_coefficient_09_1257
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1258 : Poly :=
[
  term ((-11781003871033560947811772049295848 : Rat) / 30920451456251051055078653757943773) [(4, 1), (6, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1258 for generator 9. -/
def ep_Q1_009_partial_09_1258 : Poly :=
[
  term ((-23562007742067121895623544098591696 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((11781003871033560947811772049295848 : Rat) / 30920451456251051055078653757943773) [(4, 1), (6, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 9. -/
theorem ep_Q1_009_partial_09_1258_valid :
    mulPoly ep_Q1_009_coefficient_09_1258
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1259 : Poly :=
[
  term ((2175262734946835637546518968806123512443794595821531550981312056162127037893418466049012299606499 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(4, 1), (6, 1), (8, 1), (15, 2)]
]

/-- Partial product 1259 for generator 9. -/
def ep_Q1_009_partial_09_1259 : Poly :=
[
  term ((2175262734946835637546518968806123512443794595821531550981312056162127037893418466049012299606499 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-2175262734946835637546518968806123512443794595821531550981312056162127037893418466049012299606499 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(4, 1), (6, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 9. -/
theorem ep_Q1_009_partial_09_1259_valid :
    mulPoly ep_Q1_009_coefficient_09_1259
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1260 : Poly :=
[
  term ((-414699260097944341630278559899131687110692884807242078893550734750628204244497722866469369158235793128614438953 : Rat) / 165692346985591824617387959701238850392384054801337493900730331412706324001538566844060036950235109652161336320) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1260 for generator 9. -/
def ep_Q1_009_partial_09_1260 : Poly :=
[
  term ((-414699260097944341630278559899131687110692884807242078893550734750628204244497722866469369158235793128614438953 : Rat) / 82846173492795912308693979850619425196192027400668746950365165706353162000769283422030018475117554826080668160) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((414699260097944341630278559899131687110692884807242078893550734750628204244497722866469369158235793128614438953 : Rat) / 165692346985591824617387959701238850392384054801337493900730331412706324001538566844060036950235109652161336320) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 9. -/
theorem ep_Q1_009_partial_09_1260_valid :
    mulPoly ep_Q1_009_coefficient_09_1260
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1261 : Poly :=
[
  term ((2631767106486489395402009230829862003200 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1261 for generator 9. -/
def ep_Q1_009_partial_09_1261 : Poly :=
[
  term ((5263534212972978790804018461659724006400 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2631767106486489395402009230829862003200 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 9. -/
theorem ep_Q1_009_partial_09_1261_valid :
    mulPoly ep_Q1_009_coefficient_09_1261
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1262 : Poly :=
[
  term ((315326207296458212491 : Rat) / 4676338877845046513121) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1262 for generator 9. -/
def ep_Q1_009_partial_09_1262 : Poly :=
[
  term ((630652414592916424982 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-315326207296458212491 : Rat) / 4676338877845046513121) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 9. -/
theorem ep_Q1_009_partial_09_1262_valid :
    mulPoly ep_Q1_009_coefficient_09_1262
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1263 : Poly :=
[
  term ((-67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1263 for generator 9. -/
def ep_Q1_009_partial_09_1263 : Poly :=
[
  term ((-67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 289961607224785693080428929477167988186672095902340614326278079972236067002692491977105064662911441891282338560) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 9. -/
theorem ep_Q1_009_partial_09_1263_valid :
    mulPoly ep_Q1_009_coefficient_09_1263
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1264 : Poly :=
[
  term ((94757543894363475692710 : Rat) / 1558779625948348837707) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1264 for generator 9. -/
def ep_Q1_009_partial_09_1264 : Poly :=
[
  term ((189515087788726951385420 : Rat) / 1558779625948348837707) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94757543894363475692710 : Rat) / 1558779625948348837707) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 9. -/
theorem ep_Q1_009_partial_09_1264_valid :
    mulPoly ep_Q1_009_coefficient_09_1264
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1265 : Poly :=
[
  term ((241097003185479902346796074349870859180170044921562683655948520325927349010250852555248029049784430152129121536072667 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1265 for generator 9. -/
def ep_Q1_009_partial_09_1265 : Poly :=
[
  term ((241097003185479902346796074349870859180170044921562683655948520325927349010250852555248029049784430152129121536072667 : Rat) / 1182753395869900842075069603337368223813435479185647365836888288206750917303982674774611558760015771474540658986240) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-241097003185479902346796074349870859180170044921562683655948520325927349010250852555248029049784430152129121536072667 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 9. -/
theorem ep_Q1_009_partial_09_1265_valid :
    mulPoly ep_Q1_009_coefficient_09_1265
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1266 : Poly :=
[
  term ((-246458723520025115985314 : Rat) / 4676338877845046513121) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1266 for generator 9. -/
def ep_Q1_009_partial_09_1266 : Poly :=
[
  term ((-492917447040050231970628 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((246458723520025115985314 : Rat) / 4676338877845046513121) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 9. -/
theorem ep_Q1_009_partial_09_1266_valid :
    mulPoly ep_Q1_009_coefficient_09_1266
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1267 : Poly :=
[
  term ((30009261027758305550267779495550109228800 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (6, 1), (9, 1), (15, 3)]
]

/-- Partial product 1267 for generator 9. -/
def ep_Q1_009_partial_09_1267 : Poly :=
[
  term ((60018522055516611100535558991100218457600 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-30009261027758305550267779495550109228800 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 9. -/
theorem ep_Q1_009_partial_09_1267_valid :
    mulPoly ep_Q1_009_coefficient_09_1267
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1268 : Poly :=
[
  term ((4166217200954506615498974900172507962187319171790863356055288917095388245052284987354903469857323363570213174317 : Rat) / 19154239308729503623239220180192986628312712136099148978204549212636672323870231462308286245029006950173013895) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1268 for generator 9. -/
def ep_Q1_009_partial_09_1268 : Poly :=
[
  term ((8332434401909013230997949800345015924374638343581726712110577834190776490104569974709806939714646727140426348634 : Rat) / 19154239308729503623239220180192986628312712136099148978204549212636672323870231462308286245029006950173013895) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-4166217200954506615498974900172507962187319171790863356055288917095388245052284987354903469857323363570213174317 : Rat) / 19154239308729503623239220180192986628312712136099148978204549212636672323870231462308286245029006950173013895) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 9. -/
theorem ep_Q1_009_partial_09_1268_valid :
    mulPoly ep_Q1_009_coefficient_09_1268
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1269 : Poly :=
[
  term ((14685449110900832881109 : Rat) / 677234852359212732613) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1269 for generator 9. -/
def ep_Q1_009_partial_09_1269 : Poly :=
[
  term ((29370898221801665762218 : Rat) / 677234852359212732613) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14685449110900832881109 : Rat) / 677234852359212732613) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 9. -/
theorem ep_Q1_009_partial_09_1269_valid :
    mulPoly ep_Q1_009_coefficient_09_1269
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1270 : Poly :=
[
  term ((327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(4, 1), (6, 1), (13, 2), (15, 2)]
]

/-- Partial product 1270 for generator 9. -/
def ep_Q1_009_partial_09_1270 : Poly :=
[
  term ((655816801155656781973954268275200 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (6, 1), (13, 2), (15, 2)],
  term ((-327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(4, 1), (6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 9. -/
theorem ep_Q1_009_partial_09_1270_valid :
    mulPoly ep_Q1_009_coefficient_09_1270
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1271 : Poly :=
[
  term ((-584211232539439590500206591191903592942898220522191645 : Rat) / 142535977414811439821655628464178362087681092443638696) [(4, 1), (6, 1), (14, 1), (15, 2)]
]

/-- Partial product 1271 for generator 9. -/
def ep_Q1_009_partial_09_1271 : Poly :=
[
  term ((-584211232539439590500206591191903592942898220522191645 : Rat) / 71267988707405719910827814232089181043840546221819348) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((584211232539439590500206591191903592942898220522191645 : Rat) / 142535977414811439821655628464178362087681092443638696) [(4, 1), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 9. -/
theorem ep_Q1_009_partial_09_1271_valid :
    mulPoly ep_Q1_009_coefficient_09_1271
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1272 : Poly :=
[
  term ((7135641624820670 : Rat) / 1395206957462413) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1272 for generator 9. -/
def ep_Q1_009_partial_09_1272 : Poly :=
[
  term ((14271283249641340 : Rat) / 1395206957462413) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7135641624820670 : Rat) / 1395206957462413) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 9. -/
theorem ep_Q1_009_partial_09_1272_valid :
    mulPoly ep_Q1_009_coefficient_09_1272
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1273 : Poly :=
[
  term ((3627134487444759800956472352926293976998501013809364320311081433689410917501387829166092085062821870237457694902285 : Rat) / 1471045578910425878264772109838821373054416292052414641526109379530496434473233776305276383618227733773287467136) [(4, 1), (6, 1), (15, 2)]
]

/-- Partial product 1273 for generator 9. -/
def ep_Q1_009_partial_09_1273 : Poly :=
[
  term ((3627134487444759800956472352926293976998501013809364320311081433689410917501387829166092085062821870237457694902285 : Rat) / 735522789455212939132386054919410686527208146026207320763054689765248217236616888152638191809113866886643733568) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-3627134487444759800956472352926293976998501013809364320311081433689410917501387829166092085062821870237457694902285 : Rat) / 1471045578910425878264772109838821373054416292052414641526109379530496434473233776305276383618227733773287467136) [(4, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 9. -/
theorem ep_Q1_009_partial_09_1273_valid :
    mulPoly ep_Q1_009_coefficient_09_1273
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1274 : Poly :=
[
  term ((480734057849658854859839 : Rat) / 2031704557077638197839) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1274 for generator 9. -/
def ep_Q1_009_partial_09_1274 : Poly :=
[
  term ((961468115699317709719678 : Rat) / 2031704557077638197839) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-480734057849658854859839 : Rat) / 2031704557077638197839) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 9. -/
theorem ep_Q1_009_partial_09_1274_valid :
    mulPoly ep_Q1_009_coefficient_09_1274
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1275 : Poly :=
[
  term ((-5960986805 : Rat) / 99021804) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 1275 for generator 9. -/
def ep_Q1_009_partial_09_1275 : Poly :=
[
  term ((-5960986805 : Rat) / 49510902) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((5960986805 : Rat) / 99021804) [(4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 9. -/
theorem ep_Q1_009_partial_09_1275_valid :
    mulPoly ep_Q1_009_coefficient_09_1275
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1276 : Poly :=
[
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 1276 for generator 9. -/
def ep_Q1_009_partial_09_1276 : Poly :=
[
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 9. -/
theorem ep_Q1_009_partial_09_1276_valid :
    mulPoly ep_Q1_009_coefficient_09_1276
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1277 : Poly :=
[
  term ((-87948535929869059541639433593803275908655843123421884583128892995424408566665114432976146833 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(4, 1), (7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 1277 for generator 9. -/
def ep_Q1_009_partial_09_1277 : Poly :=
[
  term ((-87948535929869059541639433593803275908655843123421884583128892995424408566665114432976146833 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((87948535929869059541639433593803275908655843123421884583128892995424408566665114432976146833 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(4, 1), (7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 9. -/
theorem ep_Q1_009_partial_09_1277_valid :
    mulPoly ep_Q1_009_coefficient_09_1277
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1278 : Poly :=
[
  term ((-74254134370873556762179049408124269059975253592705120819128693828903722007838452953575366737 : Rat) / 74958276849614708955431563661047911241873460338576611588770087458932750290872679990393459712) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1278 for generator 9. -/
def ep_Q1_009_partial_09_1278 : Poly :=
[
  term ((-74254134370873556762179049408124269059975253592705120819128693828903722007838452953575366737 : Rat) / 37479138424807354477715781830523955620936730169288305794385043729466375145436339995196729856) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((74254134370873556762179049408124269059975253592705120819128693828903722007838452953575366737 : Rat) / 74958276849614708955431563661047911241873460338576611588770087458932750290872679990393459712) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 9. -/
theorem ep_Q1_009_partial_09_1278_valid :
    mulPoly ep_Q1_009_coefficient_09_1278
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1279 : Poly :=
[
  term ((293961627438581242295839395151351233560403119641491596737394978058407887751500399266370806454951 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1279 for generator 9. -/
def ep_Q1_009_partial_09_1279 : Poly :=
[
  term ((293961627438581242295839395151351233560403119641491596737394978058407887751500399266370806454951 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-293961627438581242295839395151351233560403119641491596737394978058407887751500399266370806454951 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 9. -/
theorem ep_Q1_009_partial_09_1279_valid :
    mulPoly ep_Q1_009_coefficient_09_1279
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1280 : Poly :=
[
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1280 for generator 9. -/
def ep_Q1_009_partial_09_1280 : Poly :=
[
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 9. -/
theorem ep_Q1_009_partial_09_1280_valid :
    mulPoly ep_Q1_009_coefficient_09_1280
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1281 : Poly :=
[
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1281 for generator 9. -/
def ep_Q1_009_partial_09_1281 : Poly :=
[
  term ((-327430788838880981122613390433216 : Rat) / 3435605717361227895008739306438197) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 9. -/
theorem ep_Q1_009_partial_09_1281_valid :
    mulPoly ep_Q1_009_coefficient_09_1281
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1282 : Poly :=
[
  term ((-363051580840316171452263039714281845774174867857210019314893222443854598895502649820859714965 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1282 for generator 9. -/
def ep_Q1_009_partial_09_1282 : Poly :=
[
  term ((-363051580840316171452263039714281845774174867857210019314893222443854598895502649820859714965 : Rat) / 79643169152715628265146036389863405694490551609737649813068217925116047184052222489793050944) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((363051580840316171452263039714281845774174867857210019314893222443854598895502649820859714965 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 9. -/
theorem ep_Q1_009_partial_09_1282_valid :
    mulPoly ep_Q1_009_coefficient_09_1282
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1283 : Poly :=
[
  term ((-118442104199701350372779634129952173482383933397968432787582320255678906869444830139277238127407 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1283 for generator 9. -/
def ep_Q1_009_partial_09_1283 : Poly :=
[
  term ((-118442104199701350372779634129952173482383933397968432787582320255678906869444830139277238127407 : Rat) / 1836477782815560369408073309695673825425899778295126983924867142743852382126380659764639762944) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((118442104199701350372779634129952173482383933397968432787582320255678906869444830139277238127407 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 9. -/
theorem ep_Q1_009_partial_09_1283_valid :
    mulPoly ep_Q1_009_coefficient_09_1283
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1284 : Poly :=
[
  term ((5193497788229046516335709879624196 : Rat) / 30920451456251051055078653757943773) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 1284 for generator 9. -/
def ep_Q1_009_partial_09_1284 : Poly :=
[
  term ((10386995576458093032671419759248392 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-5193497788229046516335709879624196 : Rat) / 30920451456251051055078653757943773) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 9. -/
theorem ep_Q1_009_partial_09_1284_valid :
    mulPoly ep_Q1_009_coefficient_09_1284
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1285 : Poly :=
[
  term ((30184656431896177787718046054603443398628549688665107812585111641289447785475340000767218541829 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1285 for generator 9. -/
def ep_Q1_009_partial_09_1285 : Poly :=
[
  term ((30184656431896177787718046054603443398628549688665107812585111641289447785475340000767218541829 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-30184656431896177787718046054603443398628549688665107812585111641289447785475340000767218541829 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 9. -/
theorem ep_Q1_009_partial_09_1285_valid :
    mulPoly ep_Q1_009_coefficient_09_1285
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1286 : Poly :=
[
  term ((14783830048379485389641895823959959645787888529496959251210558750786275549409270065248287700675 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (7, 1), (8, 1), (15, 3)]
]

/-- Partial product 1286 for generator 9. -/
def ep_Q1_009_partial_09_1286 : Poly :=
[
  term ((14783830048379485389641895823959959645787888529496959251210558750786275549409270065248287700675 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((-14783830048379485389641895823959959645787888529496959251210558750786275549409270065248287700675 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 9. -/
theorem ep_Q1_009_partial_09_1286_valid :
    mulPoly ep_Q1_009_coefficient_09_1286
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1287 : Poly :=
[
  term ((136423402818871017118715493329915519325236390238921560574220827810253845281518300356386674729667667920965994355107 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 1287 for generator 9. -/
def ep_Q1_009_partial_09_1287 : Poly :=
[
  term ((136423402818871017118715493329915519325236390238921560574220827810253845281518300356386674729667667920965994355107 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (4, 1), (7, 1), (9, 1)],
  term ((-136423402818871017118715493329915519325236390238921560574220827810253845281518300356386674729667667920965994355107 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(4, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 9. -/
theorem ep_Q1_009_partial_09_1287_valid :
    mulPoly ep_Q1_009_coefficient_09_1287
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1288 : Poly :=
[
  term ((-14596239316052108315827051249976452877158816130024870875264976000805275416607404611592461097484493484767300223403967 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1288 for generator 9. -/
def ep_Q1_009_partial_09_1288 : Poly :=
[
  term ((-14596239316052108315827051249976452877158816130024870875264976000805275416607404611592461097484493484767300223403967 : Rat) / 262834087971089076016682134074970716402985662041254970185975175157055759400885038838802568613336838105453479774720) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((14596239316052108315827051249976452877158816130024870875264976000805275416607404611592461097484493484767300223403967 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 9. -/
theorem ep_Q1_009_partial_09_1288_valid :
    mulPoly ep_Q1_009_coefficient_09_1288
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1289 : Poly :=
[
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1289 for generator 9. -/
def ep_Q1_009_partial_09_1289 : Poly :=
[
  term ((884119574637870216386 : Rat) / 30564306391144094857) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-442059787318935108193 : Rat) / 30564306391144094857) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 9. -/
theorem ep_Q1_009_partial_09_1289_valid :
    mulPoly ep_Q1_009_coefficient_09_1289
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1290 : Poly :=
[
  term ((-27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 1290 for generator 9. -/
def ep_Q1_009_partial_09_1290 : Poly :=
[
  term ((-54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 3)],
  term ((27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 9. -/
theorem ep_Q1_009_partial_09_1290_valid :
    mulPoly ep_Q1_009_coefficient_09_1290
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1291 : Poly :=
[
  term ((473423072409583225579005178825717340805033667363423884881285677114713249072234602298494242083701037315135489371 : Rat) / 165692346985591824617387959701238850392384054801337493900730331412706324001538566844060036950235109652161336320) [(4, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 1291 for generator 9. -/
def ep_Q1_009_partial_09_1291 : Poly :=
[
  term ((473423072409583225579005178825717340805033667363423884881285677114713249072234602298494242083701037315135489371 : Rat) / 82846173492795912308693979850619425196192027400668746950365165706353162000769283422030018475117554826080668160) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1)],
  term ((-473423072409583225579005178825717340805033667363423884881285677114713249072234602298494242083701037315135489371 : Rat) / 165692346985591824617387959701238850392384054801337493900730331412706324001538566844060036950235109652161336320) [(4, 1), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 9. -/
theorem ep_Q1_009_partial_09_1291_valid :
    mulPoly ep_Q1_009_coefficient_09_1291
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1292 : Poly :=
[
  term ((-3007019508398399572265627537689592000 : Rat) / 126124521490048037253665828678652650067) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1292 for generator 9. -/
def ep_Q1_009_partial_09_1292 : Poly :=
[
  term ((-6014039016796799144531255075379184000 : Rat) / 126124521490048037253665828678652650067) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((3007019508398399572265627537689592000 : Rat) / 126124521490048037253665828678652650067) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 9. -/
theorem ep_Q1_009_partial_09_1292_valid :
    mulPoly ep_Q1_009_coefficient_09_1292
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1293 : Poly :=
[
  term ((-315326207296458212491 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1293 for generator 9. -/
def ep_Q1_009_partial_09_1293 : Poly :=
[
  term ((-630652414592916424982 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((315326207296458212491 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 9. -/
theorem ep_Q1_009_partial_09_1293_valid :
    mulPoly ep_Q1_009_coefficient_09_1293
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1294 : Poly :=
[
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1294 for generator 9. -/
def ep_Q1_009_partial_09_1294 : Poly :=
[
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 295688348967475210518767400834342055953358869796411841459222072051687729325995668693652889690003942868635164746560) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 9. -/
theorem ep_Q1_009_partial_09_1294_valid :
    mulPoly ep_Q1_009_coefficient_09_1294
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1295 : Poly :=
[
  term ((8890284321793560101416 : Rat) / 1558779625948348837707) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1295 for generator 9. -/
def ep_Q1_009_partial_09_1295 : Poly :=
[
  term ((17780568643587120202832 : Rat) / 1558779625948348837707) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8890284321793560101416 : Rat) / 1558779625948348837707) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 9. -/
theorem ep_Q1_009_partial_09_1295_valid :
    mulPoly ep_Q1_009_coefficient_09_1295
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1296 : Poly :=
[
  term ((1889405998076909800760132781646099251635629370076806603580300032847809416526785710754626963594415516947590717107493 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1296 for generator 9. -/
def ep_Q1_009_partial_09_1296 : Poly :=
[
  term ((1889405998076909800760132781646099251635629370076806603580300032847809416526785710754626963594415516947590717107493 : Rat) / 78850226391326722805004640222491214920895698612376491055792552547116727820265511651640770584001051431636043932416) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1889405998076909800760132781646099251635629370076806603580300032847809416526785710754626963594415516947590717107493 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 9. -/
theorem ep_Q1_009_partial_09_1296_valid :
    mulPoly ep_Q1_009_coefficient_09_1296
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1297 : Poly :=
[
  term ((-20202042035070925656458 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1297 for generator 9. -/
def ep_Q1_009_partial_09_1297 : Poly :=
[
  term ((-40404084070141851312916 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20202042035070925656458 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 9. -/
theorem ep_Q1_009_partial_09_1297_valid :
    mulPoly ep_Q1_009_coefficient_09_1297
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1298 : Poly :=
[
  term ((-120280780335935982890625101507583680000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 1298 for generator 9. -/
def ep_Q1_009_partial_09_1298 : Poly :=
[
  term ((-240561560671871965781250203015167360000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 3)],
  term ((120280780335935982890625101507583680000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 9. -/
theorem ep_Q1_009_partial_09_1298_valid :
    mulPoly ep_Q1_009_coefficient_09_1298
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1299 : Poly :=
[
  term ((-76451612423403292602353752000434622997940825218509441183585974265268262297260934168018024023975624344496037628819 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1299 for generator 9. -/
def ep_Q1_009_partial_09_1299 : Poly :=
[
  term ((-76451612423403292602353752000434622997940825218509441183585974265268262297260934168018024023975624344496037628819 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 1)],
  term ((76451612423403292602353752000434622997940825218509441183585974265268262297260934168018024023975624344496037628819 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 9. -/
theorem ep_Q1_009_partial_09_1299_valid :
    mulPoly ep_Q1_009_coefficient_09_1299
        ep_Q1_009_generator_09_1200_1299 =
      ep_Q1_009_partial_09_1299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_1200_1299 : List Poly :=
[
  ep_Q1_009_partial_09_1200,
  ep_Q1_009_partial_09_1201,
  ep_Q1_009_partial_09_1202,
  ep_Q1_009_partial_09_1203,
  ep_Q1_009_partial_09_1204,
  ep_Q1_009_partial_09_1205,
  ep_Q1_009_partial_09_1206,
  ep_Q1_009_partial_09_1207,
  ep_Q1_009_partial_09_1208,
  ep_Q1_009_partial_09_1209,
  ep_Q1_009_partial_09_1210,
  ep_Q1_009_partial_09_1211,
  ep_Q1_009_partial_09_1212,
  ep_Q1_009_partial_09_1213,
  ep_Q1_009_partial_09_1214,
  ep_Q1_009_partial_09_1215,
  ep_Q1_009_partial_09_1216,
  ep_Q1_009_partial_09_1217,
  ep_Q1_009_partial_09_1218,
  ep_Q1_009_partial_09_1219,
  ep_Q1_009_partial_09_1220,
  ep_Q1_009_partial_09_1221,
  ep_Q1_009_partial_09_1222,
  ep_Q1_009_partial_09_1223,
  ep_Q1_009_partial_09_1224,
  ep_Q1_009_partial_09_1225,
  ep_Q1_009_partial_09_1226,
  ep_Q1_009_partial_09_1227,
  ep_Q1_009_partial_09_1228,
  ep_Q1_009_partial_09_1229,
  ep_Q1_009_partial_09_1230,
  ep_Q1_009_partial_09_1231,
  ep_Q1_009_partial_09_1232,
  ep_Q1_009_partial_09_1233,
  ep_Q1_009_partial_09_1234,
  ep_Q1_009_partial_09_1235,
  ep_Q1_009_partial_09_1236,
  ep_Q1_009_partial_09_1237,
  ep_Q1_009_partial_09_1238,
  ep_Q1_009_partial_09_1239,
  ep_Q1_009_partial_09_1240,
  ep_Q1_009_partial_09_1241,
  ep_Q1_009_partial_09_1242,
  ep_Q1_009_partial_09_1243,
  ep_Q1_009_partial_09_1244,
  ep_Q1_009_partial_09_1245,
  ep_Q1_009_partial_09_1246,
  ep_Q1_009_partial_09_1247,
  ep_Q1_009_partial_09_1248,
  ep_Q1_009_partial_09_1249,
  ep_Q1_009_partial_09_1250,
  ep_Q1_009_partial_09_1251,
  ep_Q1_009_partial_09_1252,
  ep_Q1_009_partial_09_1253,
  ep_Q1_009_partial_09_1254,
  ep_Q1_009_partial_09_1255,
  ep_Q1_009_partial_09_1256,
  ep_Q1_009_partial_09_1257,
  ep_Q1_009_partial_09_1258,
  ep_Q1_009_partial_09_1259,
  ep_Q1_009_partial_09_1260,
  ep_Q1_009_partial_09_1261,
  ep_Q1_009_partial_09_1262,
  ep_Q1_009_partial_09_1263,
  ep_Q1_009_partial_09_1264,
  ep_Q1_009_partial_09_1265,
  ep_Q1_009_partial_09_1266,
  ep_Q1_009_partial_09_1267,
  ep_Q1_009_partial_09_1268,
  ep_Q1_009_partial_09_1269,
  ep_Q1_009_partial_09_1270,
  ep_Q1_009_partial_09_1271,
  ep_Q1_009_partial_09_1272,
  ep_Q1_009_partial_09_1273,
  ep_Q1_009_partial_09_1274,
  ep_Q1_009_partial_09_1275,
  ep_Q1_009_partial_09_1276,
  ep_Q1_009_partial_09_1277,
  ep_Q1_009_partial_09_1278,
  ep_Q1_009_partial_09_1279,
  ep_Q1_009_partial_09_1280,
  ep_Q1_009_partial_09_1281,
  ep_Q1_009_partial_09_1282,
  ep_Q1_009_partial_09_1283,
  ep_Q1_009_partial_09_1284,
  ep_Q1_009_partial_09_1285,
  ep_Q1_009_partial_09_1286,
  ep_Q1_009_partial_09_1287,
  ep_Q1_009_partial_09_1288,
  ep_Q1_009_partial_09_1289,
  ep_Q1_009_partial_09_1290,
  ep_Q1_009_partial_09_1291,
  ep_Q1_009_partial_09_1292,
  ep_Q1_009_partial_09_1293,
  ep_Q1_009_partial_09_1294,
  ep_Q1_009_partial_09_1295,
  ep_Q1_009_partial_09_1296,
  ep_Q1_009_partial_09_1297,
  ep_Q1_009_partial_09_1298,
  ep_Q1_009_partial_09_1299
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_1200_1299 : Poly :=
[
  term ((512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-2416572556881639 : Rat) / 1395206957462413) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4739701457213438327179242416506545197751099333367866790658520803653217991335081206205325799865032020055462479089839 : Rat) / 4903485263034752927549240366129404576848054306841382138420364598434988114910779254350921278727425779244291557120) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-191920758046786369662434 : Rat) / 2031704557077638197839) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((2515038857013211159877130668423434828857314744657316093282682633174320242904946857163345337144303147 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((-3606881054837723 : Rat) / 1395206957462413) [(2, 1), (3, 1), (14, 3), (15, 1), (16, 1)],
  term ((22 : Rat) / 51) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 51) [(2, 1), (3, 2), (4, 1), (6, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 1), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((8 : Rat) / 17) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-26 : Rat) / 51) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((196 : Rat) / 51) [(2, 1), (3, 2), (6, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 51) [(2, 1), (3, 2), (6, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(2, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((178 : Rat) / 51) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((-44 : Rat) / 51) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 17) [(2, 1), (3, 2), (14, 2), (16, 1)],
  term ((6665508769782225911526809681252548248550089155338644662396835717401273080965148805962542236876782711 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(2, 1), (4, 1)],
  term ((-520585209172183632666139419334740363149189834784391715425457931609304250 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(2, 1), (4, 1), (5, 1), (7, 1)],
  term ((1382622841003198424848389404623544347485523955810635444990585480853541500 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1)],
  term ((1899322590510256120078457259397682358719731022539252843595365729762431415128634716942530727913 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-47951989410799248229566606367526186312437687039091070073847936964091409983588262025626809649550108807387097 : Rat) / 30213775890881076699013121754419921661630936324095093709104728558115668125736427214452960785965556099956480) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-12937621860619509295580 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((85914843097097130636160786791131200000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 3)],
  term ((2777728529547829886770651732613583637288722972033195146046343205644365670951863560773868366403097550274965727691 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2)],
  term ((1203326318313404232530 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(2, 1), (4, 1), (5, 1), (7, 2), (8, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 26352598964624767439079257402424330703751718762625763213139493374379635761531299232546528) [(2, 1), (4, 1), (5, 1), (7, 2), (9, 1)],
  term ((-34365937238838852254464314716452480000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (4, 1), (5, 1), (7, 2), (9, 1), (15, 2)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 71127226839798258620171651408820819679857539344337066133505774783606462488685112759250608386912) [(2, 1), (4, 1), (5, 1), (7, 2), (15, 1)],
  term ((-17220900 : Rat) / 1178831) [(2, 1), (4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-11180646279552047561052588587169404997582936403965598197001051884709320 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((486208387498779863038414932147652 : Rat) / 10306817152083683685026217919314591) [(2, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1858270008476681653237415456451161897153225004976611054851633940361802168565982824577076375485 : Rat) / 1274290706443450052242336582237814491111848825755802397009091486801856754944835559836688815104) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((76650456943745955534701145745608 : Rat) / 3435605717361227895008739306438197) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 3)],
  term ((-135952807196583722803440994942039489416563266935814460176238960863615825198334137766214412431235340921787835151663 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(2, 1), (4, 1), (5, 1), (9, 1)],
  term ((56435728441323002712738707211283028146048262450834503093316493877409040695069844943425202160427771514997118335287 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1)],
  term ((-112692175289882397036035 : Rat) / 9352677755690093026242) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((4097778529130243798195415673526174602908214111157355769238789955609285573811629901280899393536426220667608788331673 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2)],
  term ((-253385213818531701998 : Rat) / 91692919173432284571) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((223899956830693889380583 : Rat) / 18705355511380186052484) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((187770740465786264067010099449315908097627923568156744056605099410999517081 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-437832239407895862965566059786000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1)],
  term ((166307833493769086879610806285297927408148391607336941 : Rat) / 190047969886415253095540837952237816116908123258184928) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2521378683271929 : Rat) / 2790413914924826) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209369452135609765055545604862057204219339323178029623044338499404385725741643341339056335262860610886573778489247 : Rat) / 4202987368315502509327920313825203923012617977292613261503169655801418384209239360872218238909222096495107048960) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-2173786975831356609539 : Rat) / 580487016307896627954) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((116645975160420362222498983356693491577652917267736609381440868236980745281856664853064130711729493 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((-371835599248854 : Rat) / 1395206957462413) [(2, 1), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-3681521917764129676000858457528697309727513548536947033094590765813906785886180151732162716323664171 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (4, 1), (6, 1)],
  term ((-950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-357405747283924063446428873051105792000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-17646730080031024522734252361308530593817874018138551367175022834236353610165323954579074062548355 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-59699120 : Rat) / 3536493) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2181003996286826896504686117089062117087480340450882141844986068669943344696021096300867392057337 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (4, 1), (6, 1), (8, 1)],
  term ((104037071812059217812790321770403862069874001210608441093877586344216972156009911836268223423373 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-23562007742067121895623544098591696 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((2175262734946835637546518968806123512443794595821531550981312056162127037893418466049012299606499 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-414699260097944341630278559899131687110692884807242078893550734750628204244497722866469369158235793128614438953 : Rat) / 82846173492795912308693979850619425196192027400668746950365165706353162000769283422030018475117554826080668160) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((5263534212972978790804018461659724006400 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((630652414592916424982 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 289961607224785693080428929477167988186672095902340614326278079972236067002692491977105064662911441891282338560) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((189515087788726951385420 : Rat) / 1558779625948348837707) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((241097003185479902346796074349870859180170044921562683655948520325927349010250852555248029049784430152129121536072667 : Rat) / 1182753395869900842075069603337368223813435479185647365836888288206750917303982674774611558760015771474540658986240) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-492917447040050231970628 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((60018522055516611100535558991100218457600 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 3)],
  term ((8332434401909013230997949800345015924374638343581726712110577834190776490104569974709806939714646727140426348634 : Rat) / 19154239308729503623239220180192986628312712136099148978204549212636672323870231462308286245029006950173013895) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((29370898221801665762218 : Rat) / 677234852359212732613) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((655816801155656781973954268275200 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (6, 1), (13, 2), (15, 2)],
  term ((-584211232539439590500206591191903592942898220522191645 : Rat) / 71267988707405719910827814232089181043840546221819348) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((14271283249641340 : Rat) / 1395206957462413) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((3627134487444759800956472352926293976998501013809364320311081433689410917501387829166092085062821870237457694902285 : Rat) / 735522789455212939132386054919410686527208146026207320763054689765248217236616888152638191809113866886643733568) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((961468115699317709719678 : Rat) / 2031704557077638197839) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-5960986805 : Rat) / 49510902) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-87948535929869059541639433593803275908655843123421884583128892995424408566665114432976146833 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-74254134370873556762179049408124269059975253592705120819128693828903722007838452953575366737 : Rat) / 37479138424807354477715781830523955620936730169288305794385043729466375145436339995196729856) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((293961627438581242295839395151351233560403119641491596737394978058407887751500399266370806454951 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-327430788838880981122613390433216 : Rat) / 3435605717361227895008739306438197) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-363051580840316171452263039714281845774174867857210019314893222443854598895502649820859714965 : Rat) / 79643169152715628265146036389863405694490551609737649813068217925116047184052222489793050944) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-118442104199701350372779634129952173482383933397968432787582320255678906869444830139277238127407 : Rat) / 1836477782815560369408073309695673825425899778295126983924867142743852382126380659764639762944) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((10386995576458093032671419759248392 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((30184656431896177787718046054603443398628549688665107812585111641289447785475340000767218541829 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((14783830048379485389641895823959959645787888529496959251210558750786275549409270065248287700675 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((136423402818871017118715493329915519325236390238921560574220827810253845281518300356386674729667667920965994355107 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (4, 1), (7, 1), (9, 1)],
  term ((-14596239316052108315827051249976452877158816130024870875264976000805275416607404611592461097484493484767300223403967 : Rat) / 262834087971089076016682134074970716402985662041254970185975175157055759400885038838802568613336838105453479774720) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((884119574637870216386 : Rat) / 30564306391144094857) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 3)],
  term ((473423072409583225579005178825717340805033667363423884881285677114713249072234602298494242083701037315135489371 : Rat) / 82846173492795912308693979850619425196192027400668746950365165706353162000769283422030018475117554826080668160) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1)],
  term ((-6014039016796799144531255075379184000 : Rat) / 126124521490048037253665828678652650067) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-630652414592916424982 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 295688348967475210518767400834342055953358869796411841459222072051687729325995668693652889690003942868635164746560) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((17780568643587120202832 : Rat) / 1558779625948348837707) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1889405998076909800760132781646099251635629370076806603580300032847809416526785710754626963594415516947590717107493 : Rat) / 78850226391326722805004640222491214920895698612376491055792552547116727820265511651640770584001051431636043932416) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-40404084070141851312916 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240561560671871965781250203015167360000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-76451612423403292602353752000434622997940825218509441183585974265268262297260934168018024023975624344496037628819 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(3, 1), (14, 1), (15, 3)],
  term ((2416572556881639 : Rat) / 2790413914924826) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((4739701457213438327179242416506545197751099333367866790658520803653217991335081206205325799865032020055462479089839 : Rat) / 9806970526069505855098480732258809153696108613682764276840729196869976229821558508701842557454851558488583114240) [(3, 1), (14, 2), (15, 1)],
  term ((95960379023393184831217 : Rat) / 2031704557077638197839) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2515038857013211159877130668423434828857314744657316093282682633174320242904946857163345337144303147 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(3, 1), (14, 3), (15, 1)],
  term ((3606881054837723 : Rat) / 2790413914924826) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-11 : Rat) / 51) [(3, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 51) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 17) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((13 : Rat) / 51) [(3, 2), (4, 1), (16, 1)],
  term ((-98 : Rat) / 51) [(3, 2), (6, 1), (14, 1), (16, 1)],
  term ((14 : Rat) / 51) [(3, 2), (6, 1), (16, 1)],
  term ((8 : Rat) / 3) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-89 : Rat) / 51) [(3, 2), (12, 1), (16, 1)],
  term ((22 : Rat) / 51) [(3, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 17) [(3, 2), (14, 2), (16, 1)],
  term ((-6665508769782225911526809681252548248550089155338644662396835717401273080965148805962542236876782711 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(4, 1)],
  term ((260292604586091816333069709667370181574594917392195857712728965804652125 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(4, 1), (5, 1), (7, 1)],
  term ((-691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(4, 1), (5, 1), (7, 1), (8, 1)],
  term ((-1899322590510256120078457259397682358719731022539252843595365729762431415128634716942530727913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (5, 1), (7, 1), (8, 1), (15, 2)],
  term ((47951989410799248229566606367526186312437687039091070073847936964091409983588262025626809649550108807387097 : Rat) / 60427551781762153398026243508839843323261872648190187418209457116231336251472854428905921571931112199912960) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((6468810930309754647790 : Rat) / 4676338877845046513121) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-42957421548548565318080393395565600000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-2777728529547829886770651732613583637288722972033195146046343205644365670951863560773868366403097550274965727691 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-601663159156702116265 : Rat) / 290243508153948313977) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(4, 1), (5, 1), (7, 2), (8, 1), (15, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(4, 1), (5, 1), (7, 2), (9, 1)],
  term ((17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(4, 1), (5, 1), (7, 2), (9, 1), (15, 2)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((8610450 : Rat) / 1178831) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (5, 1), (8, 1), (13, 1)],
  term ((-243104193749389931519207466073826 : Rat) / 10306817152083683685026217919314591) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((1858270008476681653237415456451161897153225004976611054851633940361802168565982824577076375485 : Rat) / 2548581412886900104484673164475628982223697651511604794018182973603713509889671119673377630208) [(4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-38325228471872977767350572872804 : Rat) / 3435605717361227895008739306438197) [(4, 1), (5, 1), (8, 1), (15, 3)],
  term ((135952807196583722803440994942039489416563266935814460176238960863615825198334137766214412431235340921787835151663 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(4, 1), (5, 1), (9, 1)],
  term ((-56435728441323002712738707211283028146048262450834503093316493877409040695069844943425202160427771514997118335287 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term ((112692175289882397036035 : Rat) / 18705355511380186052484) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4097778529130243798195415673526174602908214111157355769238789955609285573811629901280899393536426220667608788331673 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((126692606909265850999 : Rat) / 91692919173432284571) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-223899956830693889380583 : Rat) / 37410711022760372104968) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-187770740465786264067010099449315908097627923568156744056605099410999517081 : Rat) / 854948848162063589918356820950239939961873722574683856003726662714487969920) [(4, 1), (5, 1), (13, 1)],
  term ((218916119703947931482783029893000 : Rat) / 24049240021528595265061175145067379) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-57756593283594773412478927035600 : Rat) / 24049240021528595265061175145067379) [(4, 1), (5, 1), (13, 2), (15, 1)],
  term ((-166307833493769086879610806285297927408148391607336941 : Rat) / 380095939772830506191081675904475632233816246516369856) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((2521378683271929 : Rat) / 5580827829849652) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((209369452135609765055545604862057204219339323178029623044338499404385725741643341339056335262860610886573778489247 : Rat) / 8405974736631005018655840627650407846025235954585226523006339311602836768418478721744436477818444192990214097920) [(4, 1), (5, 1), (15, 1)],
  term ((2173786975831356609539 : Rat) / 1160974032615793255908) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-116645975160420362222498983356693491577652917267736609381440868236980745281856664853064130711729493 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(4, 1), (5, 1), (15, 3)],
  term ((185917799624427 : Rat) / 1395206957462413) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((3681521917764129676000858457528697309727513548536947033094590765813906785886180151732162716323664171 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (6, 1)],
  term ((950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 592933476704057267379283291554547440834413672159079672295638600923541804634454232732296880) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((178702873641962031723214436525552896000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((17646730080031024522734252361308530593817874018138551367175022834236353610165323954579074062548355 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((29849560 : Rat) / 3536493) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((2181003996286826896504686117089062117087480340450882141844986068669943344696021096300867392057337 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (6, 1), (8, 1)],
  term ((-104037071812059217812790321770403862069874001210608441093877586344216972156009911836268223423373 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((11781003871033560947811772049295848 : Rat) / 30920451456251051055078653757943773) [(4, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2175262734946835637546518968806123512443794595821531550981312056162127037893418466049012299606499 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((414699260097944341630278559899131687110692884807242078893550734750628204244497722866469369158235793128614438953 : Rat) / 165692346985591824617387959701238850392384054801337493900730331412706324001538566844060036950235109652161336320) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-2631767106486489395402009230829862003200 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-315326207296458212491 : Rat) / 4676338877845046513121) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-94757543894363475692710 : Rat) / 1558779625948348837707) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-241097003185479902346796074349870859180170044921562683655948520325927349010250852555248029049784430152129121536072667 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((246458723520025115985314 : Rat) / 4676338877845046513121) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30009261027758305550267779495550109228800 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-4166217200954506615498974900172507962187319171790863356055288917095388245052284987354903469857323363570213174317 : Rat) / 19154239308729503623239220180192986628312712136099148978204549212636672323870231462308286245029006950173013895) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-14685449110900832881109 : Rat) / 677234852359212732613) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(4, 1), (6, 1), (13, 2), (15, 2)],
  term ((584211232539439590500206591191903592942898220522191645 : Rat) / 142535977414811439821655628464178362087681092443638696) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-7135641624820670 : Rat) / 1395206957462413) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3627134487444759800956472352926293976998501013809364320311081433689410917501387829166092085062821870237457694902285 : Rat) / 1471045578910425878264772109838821373054416292052414641526109379530496434473233776305276383618227733773287467136) [(4, 1), (6, 1), (15, 2)],
  term ((-480734057849658854859839 : Rat) / 2031704557077638197839) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((5960986805 : Rat) / 99021804) [(4, 1), (6, 1), (16, 1)],
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((87948535929869059541639433593803275908655843123421884583128892995424408566665114432976146833 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(4, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((74254134370873556762179049408124269059975253592705120819128693828903722007838452953575366737 : Rat) / 74958276849614708955431563661047911241873460338576611588770087458932750290872679990393459712) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-293961627438581242295839395151351233560403119641491596737394978058407887751500399266370806454951 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((363051580840316171452263039714281845774174867857210019314893222443854598895502649820859714965 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((118442104199701350372779634129952173482383933397968432787582320255678906869444830139277238127407 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-5193497788229046516335709879624196 : Rat) / 30920451456251051055078653757943773) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-30184656431896177787718046054603443398628549688665107812585111641289447785475340000767218541829 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-14783830048379485389641895823959959645787888529496959251210558750786275549409270065248287700675 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (7, 1), (8, 1), (15, 3)],
  term ((-136423402818871017118715493329915519325236390238921560574220827810253845281518300356386674729667667920965994355107 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(4, 1), (7, 1), (9, 1)],
  term ((14596239316052108315827051249976452877158816130024870875264976000805275416607404611592461097484493484767300223403967 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-442059787318935108193 : Rat) / 30564306391144094857) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 3)],
  term ((-473423072409583225579005178825717340805033667363423884881285677114713249072234602298494242083701037315135489371 : Rat) / 165692346985591824617387959701238850392384054801337493900730331412706324001538566844060036950235109652161336320) [(4, 1), (7, 1), (9, 1), (12, 1)],
  term ((3007019508398399572265627537689592000 : Rat) / 126124521490048037253665828678652650067) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((315326207296458212491 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8890284321793560101416 : Rat) / 1558779625948348837707) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1889405998076909800760132781646099251635629370076806603580300032847809416526785710754626963594415516947590717107493 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((20202042035070925656458 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((120280780335935982890625101507583680000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 3)],
  term ((76451612423403292602353752000434622997940825218509441183585974265268262297260934168018024023975624344496037628819 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1200 through 1299. -/
theorem ep_Q1_009_block_09_1200_1299_valid :
    checkProductSumEq ep_Q1_009_partials_09_1200_1299
      ep_Q1_009_block_09_1200_1299 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
