/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:2200-2239

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_2200_2239 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 2200 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2200 : Poly :=
[
  term ((271448882886580841584167652312367411723023426834982376073536120703114086192048740942484717805832606473093898978431 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(12, 2), (15, 2)]
]

/-- Partial product 2200 for generator 9. -/
def ep_Q1_009_partial_09_2200 : Poly :=
[
  term ((271448882886580841584167652312367411723023426834982376073536120703114086192048740942484717805832606473093898978431 : Rat) / 919403486819016173915482568649263358159010182532759150953818362206560271545771110190797739761392333608304666960) [(2, 1), (12, 2), (15, 2)],
  term ((-271448882886580841584167652312367411723023426834982376073536120703114086192048740942484717805832606473093898978431 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2200 for generator 9. -/
theorem ep_Q1_009_partial_09_2200_valid :
    mulPoly ep_Q1_009_coefficient_09_2200
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2200 := by
  native_decide

/-- Coefficient term 2201 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2201 : Poly :=
[
  term ((18350840510261102555777 : Rat) / 1354469704718425465226) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 2201 for generator 9. -/
def ep_Q1_009_partial_09_2201 : Poly :=
[
  term ((18350840510261102555777 : Rat) / 677234852359212732613) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-18350840510261102555777 : Rat) / 1354469704718425465226) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2201 for generator 9. -/
theorem ep_Q1_009_partial_09_2201_valid :
    mulPoly ep_Q1_009_coefficient_09_2201
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2201 := by
  native_decide

/-- Coefficient term 2202 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2202 : Poly :=
[
  term ((44443701 : Rat) / 8251817) [(12, 2), (16, 1)]
]

/-- Partial product 2202 for generator 9. -/
def ep_Q1_009_partial_09_2202 : Poly :=
[
  term ((88887402 : Rat) / 8251817) [(2, 1), (12, 2), (16, 1)],
  term ((-44443701 : Rat) / 8251817) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2202 for generator 9. -/
theorem ep_Q1_009_partial_09_2202_valid :
    mulPoly ep_Q1_009_coefficient_09_2202
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2202 := by
  native_decide

/-- Coefficient term 2203 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2203 : Poly :=
[
  term ((624693507223762857800391145686218872234234243011231214590914866153070238848749840547163634728124086105227857035869 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2203 for generator 9. -/
def ep_Q1_009_partial_09_2203 : Poly :=
[
  term ((624693507223762857800391145686218872234234243011231214590914866153070238848749840547163634728124086105227857035869 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-624693507223762857800391145686218872234234243011231214590914866153070238848749840547163634728124086105227857035869 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2203 for generator 9. -/
theorem ep_Q1_009_partial_09_2203_valid :
    mulPoly ep_Q1_009_coefficient_09_2203
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2203 := by
  native_decide

/-- Coefficient term 2204 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2204 : Poly :=
[
  term ((60728043340470494442431 : Rat) / 16253636456621105582712) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2204 for generator 9. -/
def ep_Q1_009_partial_09_2204 : Poly :=
[
  term ((60728043340470494442431 : Rat) / 8126818228310552791356) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60728043340470494442431 : Rat) / 16253636456621105582712) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2204 for generator 9. -/
theorem ep_Q1_009_partial_09_2204_valid :
    mulPoly ep_Q1_009_coefficient_09_2204
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2204 := by
  native_decide

/-- Coefficient term 2205 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2205 : Poly :=
[
  term ((2393339635559739395143913381155004294961176636293511774951314417052694349033645673721862856527241875 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 1), (14, 1), (15, 3)]
]

/-- Partial product 2205 for generator 9. -/
def ep_Q1_009_partial_09_2205 : Poly :=
[
  term ((2393339635559739395143913381155004294961176636293511774951314417052694349033645673721862856527241875 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2393339635559739395143913381155004294961176636293511774951314417052694349033645673721862856527241875 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2205 for generator 9. -/
theorem ep_Q1_009_partial_09_2205_valid :
    mulPoly ep_Q1_009_coefficient_09_2205
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2205 := by
  native_decide

/-- Coefficient term 2206 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2206 : Poly :=
[
  term ((-3821065986242453 : Rat) / 1395206957462413) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 2206 for generator 9. -/
def ep_Q1_009_partial_09_2206 : Poly :=
[
  term ((-7642131972484906 : Rat) / 1395206957462413) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3821065986242453 : Rat) / 1395206957462413) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2206 for generator 9. -/
theorem ep_Q1_009_partial_09_2206_valid :
    mulPoly ep_Q1_009_coefficient_09_2206
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2206 := by
  native_decide

/-- Coefficient term 2207 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2207 : Poly :=
[
  term ((-5516988124273266981562858595502102362052581082536669062264512597839581720879964851690446704369319291101252019131863 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 2207 for generator 9. -/
def ep_Q1_009_partial_09_2207 : Poly :=
[
  term ((-5516988124273266981562858595502102362052581082536669062264512597839581720879964851690446704369319291101252019131863 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((5516988124273266981562858595502102362052581082536669062264512597839581720879964851690446704369319291101252019131863 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2207 for generator 9. -/
theorem ep_Q1_009_partial_09_2207_valid :
    mulPoly ep_Q1_009_coefficient_09_2207
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2207 := by
  native_decide

/-- Coefficient term 2208 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2208 : Poly :=
[
  term ((-80830975424179702932557 : Rat) / 2031704557077638197839) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2208 for generator 9. -/
def ep_Q1_009_partial_09_2208 : Poly :=
[
  term ((-161661950848359405865114 : Rat) / 2031704557077638197839) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((80830975424179702932557 : Rat) / 2031704557077638197839) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2208 for generator 9. -/
theorem ep_Q1_009_partial_09_2208_valid :
    mulPoly ep_Q1_009_coefficient_09_2208
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2208 := by
  native_decide

/-- Coefficient term 2209 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2209 : Poly :=
[
  term ((54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 1), (14, 3), (15, 1)]
]

/-- Partial product 2209 for generator 9. -/
def ep_Q1_009_partial_09_2209 : Poly :=
[
  term ((54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 1), (14, 3), (15, 1)],
  term ((-54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2209 for generator 9. -/
theorem ep_Q1_009_partial_09_2209_valid :
    mulPoly ep_Q1_009_coefficient_09_2209
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2209 := by
  native_decide

/-- Coefficient term 2210 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2210 : Poly :=
[
  term ((7922394401441 : Rat) / 82070997497789) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 2210 for generator 9. -/
def ep_Q1_009_partial_09_2210 : Poly :=
[
  term ((15844788802882 : Rat) / 82070997497789) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-7922394401441 : Rat) / 82070997497789) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2210 for generator 9. -/
theorem ep_Q1_009_partial_09_2210_valid :
    mulPoly ep_Q1_009_coefficient_09_2210
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2210 := by
  native_decide

/-- Coefficient term 2211 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2211 : Poly :=
[
  term ((2370344898059573862695006245384961635113248730267758289079293548244275190960825560166339058225944841865892328711567 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(13, 1), (15, 1)]
]

/-- Partial product 2211 for generator 9. -/
def ep_Q1_009_partial_09_2211 : Poly :=
[
  term ((2370344898059573862695006245384961635113248730267758289079293548244275190960825560166339058225944841865892328711567 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(2, 1), (13, 1), (15, 1)],
  term ((-2370344898059573862695006245384961635113248730267758289079293548244275190960825560166339058225944841865892328711567 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2211 for generator 9. -/
theorem ep_Q1_009_partial_09_2211_valid :
    mulPoly ep_Q1_009_coefficient_09_2211
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2211 := by
  native_decide

/-- Coefficient term 2212 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2212 : Poly :=
[
  term ((3988678611317850651189 : Rat) / 121750085817386558672) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2212 for generator 9. -/
def ep_Q1_009_partial_09_2212 : Poly :=
[
  term ((3988678611317850651189 : Rat) / 60875042908693279336) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3988678611317850651189 : Rat) / 121750085817386558672) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2212 for generator 9. -/
theorem ep_Q1_009_partial_09_2212_valid :
    mulPoly ep_Q1_009_coefficient_09_2212
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2212 := by
  native_decide

/-- Coefficient term 2213 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2213 : Poly :=
[
  term ((-302696437963762000426173786296872850071204206819419144895497247369248098807940636405286380496000307 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(13, 1), (15, 3)]
]

/-- Partial product 2213 for generator 9. -/
def ep_Q1_009_partial_09_2213 : Poly :=
[
  term ((-302696437963762000426173786296872850071204206819419144895497247369248098807940636405286380496000307 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(2, 1), (13, 1), (15, 3)],
  term ((302696437963762000426173786296872850071204206819419144895497247369248098807940636405286380496000307 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2213 for generator 9. -/
theorem ep_Q1_009_partial_09_2213_valid :
    mulPoly ep_Q1_009_coefficient_09_2213
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2213 := by
  native_decide

/-- Coefficient term 2214 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2214 : Poly :=
[
  term ((588348431390421 : Rat) / 2790413914924826) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 2214 for generator 9. -/
def ep_Q1_009_partial_09_2214 : Poly :=
[
  term ((588348431390421 : Rat) / 1395206957462413) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-588348431390421 : Rat) / 2790413914924826) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2214 for generator 9. -/
theorem ep_Q1_009_partial_09_2214_valid :
    mulPoly ep_Q1_009_coefficient_09_2214
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2214 := by
  native_decide

/-- Coefficient term 2215 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2215 : Poly :=
[
  term ((-3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 67510588186927160724230719981253659357152918699709757686039379455626472870616378212170068977408) [(13, 2)]
]

/-- Partial product 2215 for generator 9. -/
def ep_Q1_009_partial_09_2215 : Poly :=
[
  term ((-3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 33755294093463580362115359990626829678576459349854878843019689727813236435308189106085034488704) [(2, 1), (13, 2)],
  term ((3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 67510588186927160724230719981253659357152918699709757686039379455626472870616378212170068977408) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2215 for generator 9. -/
theorem ep_Q1_009_partial_09_2215_valid :
    mulPoly ep_Q1_009_coefficient_09_2215
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2215 := by
  native_decide

/-- Coefficient term 2216 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2216 : Poly :=
[
  term ((-7904206353586445795263060973455232435076822315009096017688476846338314868791907911223239847074409 : Rat) / 867993276689063495025823542616118477449108954710554027391934878715197508336496291299329458280960) [(13, 2), (14, 1)]
]

/-- Partial product 2216 for generator 9. -/
def ep_Q1_009_partial_09_2216 : Poly :=
[
  term ((-7904206353586445795263060973455232435076822315009096017688476846338314868791907911223239847074409 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(2, 1), (13, 2), (14, 1)],
  term ((7904206353586445795263060973455232435076822315009096017688476846338314868791907911223239847074409 : Rat) / 867993276689063495025823542616118477449108954710554027391934878715197508336496291299329458280960) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2216 for generator 9. -/
theorem ep_Q1_009_partial_09_2216_valid :
    mulPoly ep_Q1_009_coefficient_09_2216
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2216 := by
  native_decide

/-- Coefficient term 2217 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2217 : Poly :=
[
  term ((-615434188800838711148719200103418800049151360922120459245831958903985479976089807420315502046578293 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 2), (14, 1), (15, 2)]
]

/-- Partial product 2217 for generator 9. -/
def ep_Q1_009_partial_09_2217 : Poly :=
[
  term ((-615434188800838711148719200103418800049151360922120459245831958903985479976089807420315502046578293 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((615434188800838711148719200103418800049151360922120459245831958903985479976089807420315502046578293 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2217 for generator 9. -/
theorem ep_Q1_009_partial_09_2217_valid :
    mulPoly ep_Q1_009_coefficient_09_2217
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2217 := by
  native_decide

/-- Coefficient term 2218 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2218 : Poly :=
[
  term ((616527304875963 : Rat) / 1395206957462413) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2218 for generator 9. -/
def ep_Q1_009_partial_09_2218 : Poly :=
[
  term ((1233054609751926 : Rat) / 1395206957462413) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-616527304875963 : Rat) / 1395206957462413) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2218 for generator 9. -/
theorem ep_Q1_009_partial_09_2218_valid :
    mulPoly ep_Q1_009_coefficient_09_2218
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2218 := by
  native_decide

/-- Coefficient term 2219 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2219 : Poly :=
[
  term ((63324113 : Rat) / 14145972) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2219 for generator 9. -/
def ep_Q1_009_partial_09_2219 : Poly :=
[
  term ((63324113 : Rat) / 7072986) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-63324113 : Rat) / 14145972) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2219 for generator 9. -/
theorem ep_Q1_009_partial_09_2219_valid :
    mulPoly ep_Q1_009_coefficient_09_2219
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2219 := by
  native_decide

/-- Coefficient term 2220 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2220 : Poly :=
[
  term ((34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 71245737346838632493196401745853328330156143547890321333643888559540664160) [(13, 2), (14, 2)]
]

/-- Partial product 2220 for generator 9. -/
def ep_Q1_009_partial_09_2220 : Poly :=
[
  term ((34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 35622868673419316246598200872926664165078071773945160666821944279770332080) [(2, 1), (13, 2), (14, 2)],
  term ((-34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 71245737346838632493196401745853328330156143547890321333643888559540664160) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2220 for generator 9. -/
theorem ep_Q1_009_partial_09_2220_valid :
    mulPoly ep_Q1_009_coefficient_09_2220
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2220 := by
  native_decide

/-- Coefficient term 2221 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2221 : Poly :=
[
  term ((462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(13, 2), (14, 2), (15, 2)]
]

/-- Partial product 2221 for generator 9. -/
def ep_Q1_009_partial_09_2221 : Poly :=
[
  term ((924105492537516374599662832569600 : Rat) / 24049240021528595265061175145067379) [(2, 1), (13, 2), (14, 2), (15, 2)],
  term ((-462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2221 for generator 9. -/
theorem ep_Q1_009_partial_09_2221_valid :
    mulPoly ep_Q1_009_coefficient_09_2221
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2221 := by
  native_decide

/-- Coefficient term 2222 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2222 : Poly :=
[
  term ((-42924198741628601263321550951757336831353199853522108764472736853032788379818962877462146706022567 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 2), (15, 2)]
]

/-- Partial product 2222 for generator 9. -/
def ep_Q1_009_partial_09_2222 : Poly :=
[
  term ((-42924198741628601263321550951757336831353199853522108764472736853032788379818962877462146706022567 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 2), (15, 2)],
  term ((42924198741628601263321550951757336831353199853522108764472736853032788379818962877462146706022567 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2222 for generator 9. -/
theorem ep_Q1_009_partial_09_2222_valid :
    mulPoly ep_Q1_009_coefficient_09_2222
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2222 := by
  native_decide

/-- Coefficient term 2223 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2223 : Poly :=
[
  term ((93562939570113 : Rat) / 1395206957462413) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 2223 for generator 9. -/
def ep_Q1_009_partial_09_2223 : Poly :=
[
  term ((187125879140226 : Rat) / 1395206957462413) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-93562939570113 : Rat) / 1395206957462413) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2223 for generator 9. -/
theorem ep_Q1_009_partial_09_2223_valid :
    mulPoly ep_Q1_009_coefficient_09_2223
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2223 := by
  native_decide

/-- Coefficient term 2224 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2224 : Poly :=
[
  term ((-44443701 : Rat) / 8251817) [(13, 2), (16, 1)]
]

/-- Partial product 2224 for generator 9. -/
def ep_Q1_009_partial_09_2224 : Poly :=
[
  term ((-88887402 : Rat) / 8251817) [(2, 1), (13, 2), (16, 1)],
  term ((44443701 : Rat) / 8251817) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2224 for generator 9. -/
theorem ep_Q1_009_partial_09_2224_valid :
    mulPoly ep_Q1_009_coefficient_09_2224
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2224 := by
  native_decide

/-- Coefficient term 2225 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2225 : Poly :=
[
  term ((8384021605683112269553392634200 : Rat) / 24049240021528595265061175145067379) [(13, 3), (14, 1), (15, 1)]
]

/-- Partial product 2225 for generator 9. -/
def ep_Q1_009_partial_09_2225 : Poly :=
[
  term ((16768043211366224539106785268400 : Rat) / 24049240021528595265061175145067379) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((-8384021605683112269553392634200 : Rat) / 24049240021528595265061175145067379) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2225 for generator 9. -/
theorem ep_Q1_009_partial_09_2225_valid :
    mulPoly ep_Q1_009_coefficient_09_2225
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2225 := by
  native_decide

/-- Coefficient term 2226 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2226 : Poly :=
[
  term ((14904927298992199590317142460800 : Rat) / 3435605717361227895008739306438197) [(13, 3), (15, 1)]
]

/-- Partial product 2226 for generator 9. -/
def ep_Q1_009_partial_09_2226 : Poly :=
[
  term ((29809854597984399180634284921600 : Rat) / 3435605717361227895008739306438197) [(2, 1), (13, 3), (15, 1)],
  term ((-14904927298992199590317142460800 : Rat) / 3435605717361227895008739306438197) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2226 for generator 9. -/
theorem ep_Q1_009_partial_09_2226_valid :
    mulPoly ep_Q1_009_coefficient_09_2226
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2226 := by
  native_decide

/-- Coefficient term 2227 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2227 : Poly :=
[
  term ((-512105476403204557505524055168023394051345847205667901456992836300624492535333614482795375659597013 : Rat) / 675105881869271607242307199812536593571529186997097576860393794556264728706163782121700689774080) [(14, 1)]
]

/-- Partial product 2227 for generator 9. -/
def ep_Q1_009_partial_09_2227 : Poly :=
[
  term ((-512105476403204557505524055168023394051345847205667901456992836300624492535333614482795375659597013 : Rat) / 337552940934635803621153599906268296785764593498548788430196897278132364353081891060850344887040) [(2, 1), (14, 1)],
  term ((512105476403204557505524055168023394051345847205667901456992836300624492535333614482795375659597013 : Rat) / 675105881869271607242307199812536593571529186997097576860393794556264728706163782121700689774080) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2227 for generator 9. -/
theorem ep_Q1_009_partial_09_2227_valid :
    mulPoly ep_Q1_009_coefficient_09_2227
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2227 := by
  native_decide

/-- Coefficient term 2228 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2228 : Poly :=
[
  term ((14244918024182923738813248321761378538044923283083125727465211187886754864076090039284255104073597739758493810397937 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(14, 1), (15, 2)]
]

/-- Partial product 2228 for generator 9. -/
def ep_Q1_009_partial_09_2228 : Poly :=
[
  term ((14244918024182923738813248321761378538044923283083125727465211187886754864076090039284255104073597739758493810397937 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (14, 1), (15, 2)],
  term ((-14244918024182923738813248321761378538044923283083125727465211187886754864076090039284255104073597739758493810397937 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2228 for generator 9. -/
theorem ep_Q1_009_partial_09_2228_valid :
    mulPoly ep_Q1_009_coefficient_09_2228
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2228 := by
  native_decide

/-- Coefficient term 2229 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2229 : Poly :=
[
  term ((747802455937923891079793 : Rat) / 16253636456621105582712) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2229 for generator 9. -/
def ep_Q1_009_partial_09_2229 : Poly :=
[
  term ((747802455937923891079793 : Rat) / 8126818228310552791356) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-747802455937923891079793 : Rat) / 16253636456621105582712) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2229 for generator 9. -/
theorem ep_Q1_009_partial_09_2229_valid :
    mulPoly ep_Q1_009_coefficient_09_2229
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2229 := by
  native_decide

/-- Coefficient term 2230 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2230 : Poly :=
[
  term ((-2501988929 : Rat) / 33007268) [(14, 1), (16, 1)]
]

/-- Partial product 2230 for generator 9. -/
def ep_Q1_009_partial_09_2230 : Poly :=
[
  term ((-2501988929 : Rat) / 16503634) [(2, 1), (14, 1), (16, 1)],
  term ((2501988929 : Rat) / 33007268) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2230 for generator 9. -/
theorem ep_Q1_009_partial_09_2230_valid :
    mulPoly ep_Q1_009_coefficient_09_2230
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2230 := by
  native_decide

/-- Coefficient term 2231 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2231 : Poly :=
[
  term ((-5279452762073339277732173622940578026272706587242115473478484428224636204463466692300225571170625309 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(14, 2)]
]

/-- Partial product 2231 for generator 9. -/
def ep_Q1_009_partial_09_2231 : Poly :=
[
  term ((-5279452762073339277732173622940578026272706587242115473478484428224636204463466692300225571170625309 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(2, 1), (14, 2)],
  term ((5279452762073339277732173622940578026272706587242115473478484428224636204463466692300225571170625309 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2231 for generator 9. -/
theorem ep_Q1_009_partial_09_2231_valid :
    mulPoly ep_Q1_009_coefficient_09_2231
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2231 := by
  native_decide

/-- Coefficient term 2232 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2232 : Poly :=
[
  term ((-3874616525469790227709218886080897612126214165587653459418803393421441118723344202102494007503873685 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(14, 2), (15, 2)]
]

/-- Partial product 2232 for generator 9. -/
def ep_Q1_009_partial_09_2232 : Poly :=
[
  term ((-3874616525469790227709218886080897612126214165587653459418803393421441118723344202102494007503873685 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(2, 1), (14, 2), (15, 2)],
  term ((3874616525469790227709218886080897612126214165587653459418803393421441118723344202102494007503873685 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2232 for generator 9. -/
theorem ep_Q1_009_partial_09_2232_valid :
    mulPoly ep_Q1_009_coefficient_09_2232
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2232 := by
  native_decide

/-- Coefficient term 2233 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2233 : Poly :=
[
  term ((5399858220493087 : Rat) / 5580827829849652) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 2233 for generator 9. -/
def ep_Q1_009_partial_09_2233 : Poly :=
[
  term ((5399858220493087 : Rat) / 2790413914924826) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5399858220493087 : Rat) / 5580827829849652) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2233 for generator 9. -/
theorem ep_Q1_009_partial_09_2233_valid :
    mulPoly ep_Q1_009_coefficient_09_2233
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2233 := by
  native_decide

/-- Coefficient term 2234 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2234 : Poly :=
[
  term ((-2669242431 : Rat) / 66014536) [(14, 2), (16, 1)]
]

/-- Partial product 2234 for generator 9. -/
def ep_Q1_009_partial_09_2234 : Poly :=
[
  term ((-2669242431 : Rat) / 33007268) [(2, 1), (14, 2), (16, 1)],
  term ((2669242431 : Rat) / 66014536) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2234 for generator 9. -/
theorem ep_Q1_009_partial_09_2234_valid :
    mulPoly ep_Q1_009_coefficient_09_2234
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2234 := by
  native_decide

/-- Coefficient term 2235 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2235 : Poly :=
[
  term ((102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 204311885959781371981218348588725190702002262785057589100848524934791171454615802264621719946976074135178814880) [(15, 2)]
]

/-- Partial product 2235 for generator 9. -/
def ep_Q1_009_partial_09_2235 : Poly :=
[
  term ((102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 102155942979890685990609174294362595351001131392528794550424262467395585727307901132310859973488037067589407440) [(2, 1), (15, 2)],
  term ((-102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 204311885959781371981218348588725190702002262785057589100848524934791171454615802264621719946976074135178814880) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2235 for generator 9. -/
theorem ep_Q1_009_partial_09_2235_valid :
    mulPoly ep_Q1_009_coefficient_09_2235
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2235 := by
  native_decide

/-- Coefficient term 2236 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2236 : Poly :=
[
  term ((1579754602551774771241111 : Rat) / 32507272913242211165424) [(15, 2), (16, 1)]
]

/-- Partial product 2236 for generator 9. -/
def ep_Q1_009_partial_09_2236 : Poly :=
[
  term ((1579754602551774771241111 : Rat) / 16253636456621105582712) [(2, 1), (15, 2), (16, 1)],
  term ((-1579754602551774771241111 : Rat) / 32507272913242211165424) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2236 for generator 9. -/
theorem ep_Q1_009_partial_09_2236_valid :
    mulPoly ep_Q1_009_coefficient_09_2236
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2236 := by
  native_decide

/-- Coefficient term 2237 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2237 : Poly :=
[
  term ((-512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 1356280067868574773047488153062558983300160867603369458905897217036223436799935665963123944788120512) [(15, 4)]
]

/-- Partial product 2237 for generator 9. -/
def ep_Q1_009_partial_09_2237 : Poly :=
[
  term ((-512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(2, 1), (15, 4)],
  term ((512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 1356280067868574773047488153062558983300160867603369458905897217036223436799935665963123944788120512) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2237 for generator 9. -/
theorem ep_Q1_009_partial_09_2237_valid :
    mulPoly ep_Q1_009_coefficient_09_2237
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2237 := by
  native_decide

/-- Coefficient term 2238 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2238 : Poly :=
[
  term ((2416572556881639 : Rat) / 5580827829849652) [(15, 4), (16, 1)]
]

/-- Partial product 2238 for generator 9. -/
def ep_Q1_009_partial_09_2238 : Poly :=
[
  term ((2416572556881639 : Rat) / 2790413914924826) [(2, 1), (15, 4), (16, 1)],
  term ((-2416572556881639 : Rat) / 5580827829849652) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2238 for generator 9. -/
theorem ep_Q1_009_partial_09_2238_valid :
    mulPoly ep_Q1_009_coefficient_09_2238
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2238 := by
  native_decide

/-- Coefficient term 2239 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2239 : Poly :=
[
  term ((-37 : Rat) / 204) [(16, 1)]
]

/-- Partial product 2239 for generator 9. -/
def ep_Q1_009_partial_09_2239 : Poly :=
[
  term ((-37 : Rat) / 102) [(2, 1), (16, 1)],
  term ((37 : Rat) / 204) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2239 for generator 9. -/
theorem ep_Q1_009_partial_09_2239_valid :
    mulPoly ep_Q1_009_coefficient_09_2239
        ep_Q1_009_generator_09_2200_2239 =
      ep_Q1_009_partial_09_2239 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_2200_2239 : List Poly :=
[
  ep_Q1_009_partial_09_2200,
  ep_Q1_009_partial_09_2201,
  ep_Q1_009_partial_09_2202,
  ep_Q1_009_partial_09_2203,
  ep_Q1_009_partial_09_2204,
  ep_Q1_009_partial_09_2205,
  ep_Q1_009_partial_09_2206,
  ep_Q1_009_partial_09_2207,
  ep_Q1_009_partial_09_2208,
  ep_Q1_009_partial_09_2209,
  ep_Q1_009_partial_09_2210,
  ep_Q1_009_partial_09_2211,
  ep_Q1_009_partial_09_2212,
  ep_Q1_009_partial_09_2213,
  ep_Q1_009_partial_09_2214,
  ep_Q1_009_partial_09_2215,
  ep_Q1_009_partial_09_2216,
  ep_Q1_009_partial_09_2217,
  ep_Q1_009_partial_09_2218,
  ep_Q1_009_partial_09_2219,
  ep_Q1_009_partial_09_2220,
  ep_Q1_009_partial_09_2221,
  ep_Q1_009_partial_09_2222,
  ep_Q1_009_partial_09_2223,
  ep_Q1_009_partial_09_2224,
  ep_Q1_009_partial_09_2225,
  ep_Q1_009_partial_09_2226,
  ep_Q1_009_partial_09_2227,
  ep_Q1_009_partial_09_2228,
  ep_Q1_009_partial_09_2229,
  ep_Q1_009_partial_09_2230,
  ep_Q1_009_partial_09_2231,
  ep_Q1_009_partial_09_2232,
  ep_Q1_009_partial_09_2233,
  ep_Q1_009_partial_09_2234,
  ep_Q1_009_partial_09_2235,
  ep_Q1_009_partial_09_2236,
  ep_Q1_009_partial_09_2237,
  ep_Q1_009_partial_09_2238,
  ep_Q1_009_partial_09_2239
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_2200_2239 : Poly :=
[
  term ((271448882886580841584167652312367411723023426834982376073536120703114086192048740942484717805832606473093898978431 : Rat) / 919403486819016173915482568649263358159010182532759150953818362206560271545771110190797739761392333608304666960) [(2, 1), (12, 2), (15, 2)],
  term ((18350840510261102555777 : Rat) / 677234852359212732613) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((88887402 : Rat) / 8251817) [(2, 1), (12, 2), (16, 1)],
  term ((624693507223762857800391145686218872234234243011231214590914866153070238848749840547163634728124086105227857035869 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((60728043340470494442431 : Rat) / 8126818228310552791356) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2393339635559739395143913381155004294961176636293511774951314417052694349033645673721862856527241875 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-7642131972484906 : Rat) / 1395206957462413) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5516988124273266981562858595502102362052581082536669062264512597839581720879964851690446704369319291101252019131863 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-161661950848359405865114 : Rat) / 2031704557077638197839) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 1), (14, 3), (15, 1)],
  term ((15844788802882 : Rat) / 82070997497789) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((2370344898059573862695006245384961635113248730267758289079293548244275190960825560166339058225944841865892328711567 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(2, 1), (13, 1), (15, 1)],
  term ((3988678611317850651189 : Rat) / 60875042908693279336) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-302696437963762000426173786296872850071204206819419144895497247369248098807940636405286380496000307 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(2, 1), (13, 1), (15, 3)],
  term ((588348431390421 : Rat) / 1395206957462413) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 33755294093463580362115359990626829678576459349854878843019689727813236435308189106085034488704) [(2, 1), (13, 2)],
  term ((-7904206353586445795263060973455232435076822315009096017688476846338314868791907911223239847074409 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(2, 1), (13, 2), (14, 1)],
  term ((-615434188800838711148719200103418800049151360922120459245831958903985479976089807420315502046578293 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((1233054609751926 : Rat) / 1395206957462413) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((63324113 : Rat) / 7072986) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 35622868673419316246598200872926664165078071773945160666821944279770332080) [(2, 1), (13, 2), (14, 2)],
  term ((924105492537516374599662832569600 : Rat) / 24049240021528595265061175145067379) [(2, 1), (13, 2), (14, 2), (15, 2)],
  term ((-42924198741628601263321550951757336831353199853522108764472736853032788379818962877462146706022567 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (13, 2), (15, 2)],
  term ((187125879140226 : Rat) / 1395206957462413) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-88887402 : Rat) / 8251817) [(2, 1), (13, 2), (16, 1)],
  term ((16768043211366224539106785268400 : Rat) / 24049240021528595265061175145067379) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((29809854597984399180634284921600 : Rat) / 3435605717361227895008739306438197) [(2, 1), (13, 3), (15, 1)],
  term ((-512105476403204557505524055168023394051345847205667901456992836300624492535333614482795375659597013 : Rat) / 337552940934635803621153599906268296785764593498548788430196897278132364353081891060850344887040) [(2, 1), (14, 1)],
  term ((14244918024182923738813248321761378538044923283083125727465211187886754864076090039284255104073597739758493810397937 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (14, 1), (15, 2)],
  term ((747802455937923891079793 : Rat) / 8126818228310552791356) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2501988929 : Rat) / 16503634) [(2, 1), (14, 1), (16, 1)],
  term ((-5279452762073339277732173622940578026272706587242115473478484428224636204463466692300225571170625309 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(2, 1), (14, 2)],
  term ((-3874616525469790227709218886080897612126214165587653459418803393421441118723344202102494007503873685 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(2, 1), (14, 2), (15, 2)],
  term ((5399858220493087 : Rat) / 2790413914924826) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2669242431 : Rat) / 33007268) [(2, 1), (14, 2), (16, 1)],
  term ((102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 102155942979890685990609174294362595351001131392528794550424262467395585727307901132310859973488037067589407440) [(2, 1), (15, 2)],
  term ((1579754602551774771241111 : Rat) / 16253636456621105582712) [(2, 1), (15, 2), (16, 1)],
  term ((-512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(2, 1), (15, 4)],
  term ((2416572556881639 : Rat) / 2790413914924826) [(2, 1), (15, 4), (16, 1)],
  term ((-37 : Rat) / 102) [(2, 1), (16, 1)],
  term ((-271448882886580841584167652312367411723023426834982376073536120703114086192048740942484717805832606473093898978431 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(12, 2), (15, 2)],
  term ((-18350840510261102555777 : Rat) / 1354469704718425465226) [(12, 2), (15, 2), (16, 1)],
  term ((-44443701 : Rat) / 8251817) [(12, 2), (16, 1)],
  term ((-624693507223762857800391145686218872234234243011231214590914866153070238848749840547163634728124086105227857035869 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(13, 1), (14, 1), (15, 1)],
  term ((-60728043340470494442431 : Rat) / 16253636456621105582712) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2393339635559739395143913381155004294961176636293511774951314417052694349033645673721862856527241875 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 1), (14, 1), (15, 3)],
  term ((3821065986242453 : Rat) / 1395206957462413) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((5516988124273266981562858595502102362052581082536669062264512597839581720879964851690446704369319291101252019131863 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(13, 1), (14, 2), (15, 1)],
  term ((80830975424179702932557 : Rat) / 2031704557077638197839) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 1), (14, 3), (15, 1)],
  term ((-7922394401441 : Rat) / 82070997497789) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2370344898059573862695006245384961635113248730267758289079293548244275190960825560166339058225944841865892328711567 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(13, 1), (15, 1)],
  term ((-3988678611317850651189 : Rat) / 121750085817386558672) [(13, 1), (15, 1), (16, 1)],
  term ((302696437963762000426173786296872850071204206819419144895497247369248098807940636405286380496000307 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(13, 1), (15, 3)],
  term ((-588348431390421 : Rat) / 2790413914924826) [(13, 1), (15, 3), (16, 1)],
  term ((3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 67510588186927160724230719981253659357152918699709757686039379455626472870616378212170068977408) [(13, 2)],
  term ((7904206353586445795263060973455232435076822315009096017688476846338314868791907911223239847074409 : Rat) / 867993276689063495025823542616118477449108954710554027391934878715197508336496291299329458280960) [(13, 2), (14, 1)],
  term ((615434188800838711148719200103418800049151360922120459245831958903985479976089807420315502046578293 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 2), (14, 1), (15, 2)],
  term ((-616527304875963 : Rat) / 1395206957462413) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-63324113 : Rat) / 14145972) [(13, 2), (14, 1), (16, 1)],
  term ((-34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 71245737346838632493196401745853328330156143547890321333643888559540664160) [(13, 2), (14, 2)],
  term ((-462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(13, 2), (14, 2), (15, 2)],
  term ((42924198741628601263321550951757336831353199853522108764472736853032788379818962877462146706022567 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(13, 2), (15, 2)],
  term ((-93562939570113 : Rat) / 1395206957462413) [(13, 2), (15, 2), (16, 1)],
  term ((44443701 : Rat) / 8251817) [(13, 2), (16, 1)],
  term ((-8384021605683112269553392634200 : Rat) / 24049240021528595265061175145067379) [(13, 3), (14, 1), (15, 1)],
  term ((-14904927298992199590317142460800 : Rat) / 3435605717361227895008739306438197) [(13, 3), (15, 1)],
  term ((512105476403204557505524055168023394051345847205667901456992836300624492535333614482795375659597013 : Rat) / 675105881869271607242307199812536593571529186997097576860393794556264728706163782121700689774080) [(14, 1)],
  term ((-14244918024182923738813248321761378538044923283083125727465211187886754864076090039284255104073597739758493810397937 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(14, 1), (15, 2)],
  term ((-747802455937923891079793 : Rat) / 16253636456621105582712) [(14, 1), (15, 2), (16, 1)],
  term ((2501988929 : Rat) / 33007268) [(14, 1), (16, 1)],
  term ((5279452762073339277732173622940578026272706587242115473478484428224636204463466692300225571170625309 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(14, 2)],
  term ((3874616525469790227709218886080897612126214165587653459418803393421441118723344202102494007503873685 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(14, 2), (15, 2)],
  term ((-5399858220493087 : Rat) / 5580827829849652) [(14, 2), (15, 2), (16, 1)],
  term ((2669242431 : Rat) / 66014536) [(14, 2), (16, 1)],
  term ((-102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 204311885959781371981218348588725190702002262785057589100848524934791171454615802264621719946976074135178814880) [(15, 2)],
  term ((-1579754602551774771241111 : Rat) / 32507272913242211165424) [(15, 2), (16, 1)],
  term ((512717920825588767890241747334178288902329388082630309125094599929025008585523498681071678620300923 : Rat) / 1356280067868574773047488153062558983300160867603369458905897217036223436799935665963123944788120512) [(15, 4)],
  term ((-2416572556881639 : Rat) / 5580827829849652) [(15, 4), (16, 1)],
  term ((37 : Rat) / 204) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 2200 through 2239. -/
theorem ep_Q1_009_block_09_2200_2239_valid :
    checkProductSumEq ep_Q1_009_partials_09_2200_2239
      ep_Q1_009_block_09_2200_2239 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
