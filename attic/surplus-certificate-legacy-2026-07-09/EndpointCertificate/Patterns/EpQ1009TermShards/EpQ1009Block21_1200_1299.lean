/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 21:1200-1299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_21_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1200 : Poly :=
[
  term ((-374251758280452 : Rat) / 1395206957462413) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1200 for generator 21. -/
def ep_Q1_009_partial_21_1200 : Poly :=
[
  term ((374251758280452 : Rat) / 1395206957462413) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(10, 2), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 21. -/
theorem ep_Q1_009_partial_21_1200_valid :
    mulPoly ep_Q1_009_coefficient_21_1200
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1201 : Poly :=
[
  term ((-4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1201 for generator 21. -/
def ep_Q1_009_partial_21_1201 : Poly :=
[
  term ((4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(10, 1), (13, 1), (15, 1)],
  term ((-4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 21. -/
theorem ep_Q1_009_partial_21_1201_valid :
    mulPoly ep_Q1_009_coefficient_21_1201
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1202 : Poly :=
[
  term ((-477821805183413554845799 : Rat) / 16253636456621105582712) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1202 for generator 21. -/
def ep_Q1_009_partial_21_1202 : Poly :=
[
  term ((477821805183413554845799 : Rat) / 16253636456621105582712) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-477821805183413554845799 : Rat) / 8126818228310552791356) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 21. -/
theorem ep_Q1_009_partial_21_1202_valid :
    mulPoly ep_Q1_009_coefficient_21_1202
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1203 : Poly :=
[
  term ((-49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 1203 for generator 21. -/
def ep_Q1_009_partial_21_1203 : Poly :=
[
  term ((49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(10, 1), (13, 1), (15, 3)],
  term ((-49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 84767504241785923315468009566409936456260054225210591181618576064763964799995979122695246549257532) [(10, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 21. -/
theorem ep_Q1_009_partial_21_1203_valid :
    mulPoly ep_Q1_009_coefficient_21_1203
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1204 : Poly :=
[
  term ((350443603725930 : Rat) / 1395206957462413) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1204 for generator 21. -/
def ep_Q1_009_partial_21_1204 : Poly :=
[
  term ((-350443603725930 : Rat) / 1395206957462413) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((700887207451860 : Rat) / 1395206957462413) [(10, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 21. -/
theorem ep_Q1_009_partial_21_1204_valid :
    mulPoly ep_Q1_009_coefficient_21_1204
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1205 : Poly :=
[
  term ((-3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(10, 1), (13, 2)]
]

/-- Partial product 1205 for generator 21. -/
def ep_Q1_009_partial_21_1205 : Poly :=
[
  term ((3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(10, 1), (13, 2)],
  term ((-3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 21. -/
theorem ep_Q1_009_partial_21_1205_valid :
    mulPoly ep_Q1_009_coefficient_21_1205
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1206 : Poly :=
[
  term ((-629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1206 for generator 21. -/
def ep_Q1_009_partial_21_1206 : Poly :=
[
  term ((629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(10, 2), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 21. -/
theorem ep_Q1_009_partial_21_1206_valid :
    mulPoly ep_Q1_009_coefficient_21_1206
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1207 : Poly :=
[
  term ((516083107727604910814731057705200 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 1207 for generator 21. -/
def ep_Q1_009_partial_21_1207 : Poly :=
[
  term ((-516083107727604910814731057705200 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 2), (15, 2)],
  term ((1032166215455209821629462115410400 : Rat) / 24049240021528595265061175145067379) [(10, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 21. -/
theorem ep_Q1_009_partial_21_1207_valid :
    mulPoly ep_Q1_009_coefficient_21_1207
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1208 : Poly :=
[
  term ((-44443701 : Rat) / 8251817) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1208 for generator 21. -/
def ep_Q1_009_partial_21_1208 : Poly :=
[
  term ((44443701 : Rat) / 8251817) [(10, 1), (13, 2), (16, 1)],
  term ((-88887402 : Rat) / 8251817) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 21. -/
theorem ep_Q1_009_partial_21_1208_valid :
    mulPoly ep_Q1_009_coefficient_21_1208
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1209 : Poly :=
[
  term ((-81977100144457097746744283534400 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 3), (15, 1)]
]

/-- Partial product 1209 for generator 21. -/
def ep_Q1_009_partial_21_1209 : Poly :=
[
  term ((81977100144457097746744283534400 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 3), (15, 1)],
  term ((-163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(10, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 21. -/
theorem ep_Q1_009_partial_21_1209_valid :
    mulPoly ep_Q1_009_coefficient_21_1209
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1210 : Poly :=
[
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(10, 1), (14, 1)]
]

/-- Partial product 1210 for generator 21. -/
def ep_Q1_009_partial_21_1210 : Poly :=
[
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(10, 1), (14, 1)],
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 21. -/
theorem ep_Q1_009_partial_21_1210_valid :
    mulPoly ep_Q1_009_coefficient_21_1210
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1211 : Poly :=
[
  term ((-144735695470137805295006190575715841641656784028595437664952211571811922182817970229844360354851640088795277305213 : Rat) / 280199157887700167288528020921680261534174531819507550766877977053427892280615957391481215927281473099673803264) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1211 for generator 21. -/
def ep_Q1_009_partial_21_1211 : Poly :=
[
  term ((144735695470137805295006190575715841641656784028595437664952211571811922182817970229844360354851640088795277305213 : Rat) / 280199157887700167288528020921680261534174531819507550766877977053427892280615957391481215927281473099673803264) [(10, 1), (14, 1), (15, 2)],
  term ((-144735695470137805295006190575715841641656784028595437664952211571811922182817970229844360354851640088795277305213 : Rat) / 140099578943850083644264010460840130767087265909753775383438988526713946140307978695740607963640736549836901632) [(10, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 21. -/
theorem ep_Q1_009_partial_21_1211_valid :
    mulPoly ep_Q1_009_coefficient_21_1211
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1212 : Poly :=
[
  term ((-15190292528153575246319 : Rat) / 290243508153948313977) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1212 for generator 21. -/
def ep_Q1_009_partial_21_1212 : Poly :=
[
  term ((15190292528153575246319 : Rat) / 290243508153948313977) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-30380585056307150492638 : Rat) / 290243508153948313977) [(10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 21. -/
theorem ep_Q1_009_partial_21_1212_valid :
    mulPoly ep_Q1_009_coefficient_21_1212
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1213 : Poly :=
[
  term ((11273221283 : Rat) / 792174432) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1213 for generator 21. -/
def ep_Q1_009_partial_21_1213 : Poly :=
[
  term ((-11273221283 : Rat) / 792174432) [(10, 1), (14, 1), (16, 1)],
  term ((11273221283 : Rat) / 396087216) [(10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 21. -/
theorem ep_Q1_009_partial_21_1213_valid :
    mulPoly ep_Q1_009_coefficient_21_1213
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1214 : Poly :=
[
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(10, 1), (14, 2), (15, 2)]
]

/-- Partial product 1214 for generator 21. -/
def ep_Q1_009_partial_21_1214 : Poly :=
[
  term ((-21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(10, 1), (14, 2), (15, 2)],
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 31674661647735875515923472992039636019484687209697488) [(10, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 21. -/
theorem ep_Q1_009_partial_21_1214_valid :
    mulPoly ep_Q1_009_coefficient_21_1214
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1215 : Poly :=
[
  term ((-1404855237365801 : Rat) / 2790413914924826) [(10, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1215 for generator 21. -/
def ep_Q1_009_partial_21_1215 : Poly :=
[
  term ((1404855237365801 : Rat) / 2790413914924826) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1404855237365801 : Rat) / 1395206957462413) [(10, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 21. -/
theorem ep_Q1_009_partial_21_1215_valid :
    mulPoly ep_Q1_009_coefficient_21_1215
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1216 : Poly :=
[
  term ((-37537326888090675851095131162425639415486474777953926364374693987255362788992684204154288201714892768863137418650841 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(10, 1), (15, 2)]
]

/-- Partial product 1216 for generator 21. -/
def ep_Q1_009_partial_21_1216 : Poly :=
[
  term ((37537326888090675851095131162425639415486474777953926364374693987255362788992684204154288201714892768863137418650841 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(10, 1), (15, 2)],
  term ((-37537326888090675851095131162425639415486474777953926364374693987255362788992684204154288201714892768863137418650841 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 21. -/
theorem ep_Q1_009_partial_21_1216_valid :
    mulPoly ep_Q1_009_coefficient_21_1216
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1217 : Poly :=
[
  term ((-128481622970197795338470 : Rat) / 2031704557077638197839) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1217 for generator 21. -/
def ep_Q1_009_partial_21_1217 : Poly :=
[
  term ((128481622970197795338470 : Rat) / 2031704557077638197839) [(10, 1), (15, 2), (16, 1)],
  term ((-256963245940395590676940 : Rat) / 2031704557077638197839) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 21. -/
theorem ep_Q1_009_partial_21_1217_valid :
    mulPoly ep_Q1_009_coefficient_21_1217
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1218 : Poly :=
[
  term ((1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(10, 1), (15, 4)]
]

/-- Partial product 1218 for generator 21. -/
def ep_Q1_009_partial_21_1218 : Poly :=
[
  term ((-1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(10, 1), (15, 4)],
  term ((1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(10, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 21. -/
theorem ep_Q1_009_partial_21_1218_valid :
    mulPoly ep_Q1_009_coefficient_21_1218
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1219 : Poly :=
[
  term ((-2218871780438729 : Rat) / 1395206957462413) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 1219 for generator 21. -/
def ep_Q1_009_partial_21_1219 : Poly :=
[
  term ((2218871780438729 : Rat) / 1395206957462413) [(10, 1), (15, 4), (16, 1)],
  term ((-4437743560877458 : Rat) / 1395206957462413) [(10, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 21. -/
theorem ep_Q1_009_partial_21_1219_valid :
    mulPoly ep_Q1_009_coefficient_21_1219
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1220 : Poly :=
[
  term ((11273221283 : Rat) / 792174432) [(10, 1), (16, 1)]
]

/-- Partial product 1220 for generator 21. -/
def ep_Q1_009_partial_21_1220 : Poly :=
[
  term ((-11273221283 : Rat) / 792174432) [(10, 1), (16, 1)],
  term ((11273221283 : Rat) / 396087216) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 21. -/
theorem ep_Q1_009_partial_21_1220_valid :
    mulPoly ep_Q1_009_coefficient_21_1220
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1221 : Poly :=
[
  term ((3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1221 for generator 21. -/
def ep_Q1_009_partial_21_1221 : Poly :=
[
  term ((3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 21. -/
theorem ep_Q1_009_partial_21_1221_valid :
    mulPoly ep_Q1_009_coefficient_21_1221
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1222 : Poly :=
[
  term ((370760066562430964809138918712400 : Rat) / 24049240021528595265061175145067379) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1222 for generator 21. -/
def ep_Q1_009_partial_21_1222 : Poly :=
[
  term ((741520133124861929618277837424800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-370760066562430964809138918712400 : Rat) / 24049240021528595265061175145067379) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 21. -/
theorem ep_Q1_009_partial_21_1222_valid :
    mulPoly ep_Q1_009_coefficient_21_1222
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1223 : Poly :=
[
  term ((44443701 : Rat) / 8251817) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1223 for generator 21. -/
def ep_Q1_009_partial_21_1223 : Poly :=
[
  term ((88887402 : Rat) / 8251817) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-44443701 : Rat) / 8251817) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 21. -/
theorem ep_Q1_009_partial_21_1223_valid :
    mulPoly ep_Q1_009_coefficient_21_1223
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1224 : Poly :=
[
  term ((81977100144457097746744283534400 : Rat) / 24049240021528595265061175145067379) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1224 for generator 21. -/
def ep_Q1_009_partial_21_1224 : Poly :=
[
  term ((163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-81977100144457097746744283534400 : Rat) / 24049240021528595265061175145067379) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 21. -/
theorem ep_Q1_009_partial_21_1224_valid :
    mulPoly ep_Q1_009_coefficient_21_1224
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1225 : Poly :=
[
  term ((101435802465001905121116510111947922152526556451694132629879622046351421516401565734924426156406590792234486711 : Rat) / 12361727553869125027435059746544717420625346992037097827950498987651230541791880473153583055615359107338550144) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1225 for generator 21. -/
def ep_Q1_009_partial_21_1225 : Poly :=
[
  term ((101435802465001905121116510111947922152526556451694132629879622046351421516401565734924426156406590792234486711 : Rat) / 6180863776934562513717529873272358710312673496018548913975249493825615270895940236576791527807679553669275072) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-101435802465001905121116510111947922152526556451694132629879622046351421516401565734924426156406590792234486711 : Rat) / 12361727553869125027435059746544717420625346992037097827950498987651230541791880473153583055615359107338550144) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 21. -/
theorem ep_Q1_009_partial_21_1225_valid :
    mulPoly ep_Q1_009_coefficient_21_1225
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1226 : Poly :=
[
  term ((78975057702579975965 : Rat) / 34146295076935095762) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1226 for generator 21. -/
def ep_Q1_009_partial_21_1226 : Poly :=
[
  term ((78975057702579975965 : Rat) / 17073147538467547881) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78975057702579975965 : Rat) / 34146295076935095762) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 21. -/
theorem ep_Q1_009_partial_21_1226_valid :
    mulPoly ep_Q1_009_coefficient_21_1226
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1227 : Poly :=
[
  term ((4399144144023573910739064875461791759581100852700591455498933982854440057233892169522267079258281817586281376375557 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1227 for generator 21. -/
def ep_Q1_009_partial_21_1227 : Poly :=
[
  term ((4399144144023573910739064875461791759581100852700591455498933982854440057233892169522267079258281817586281376375557 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4399144144023573910739064875461791759581100852700591455498933982854440057233892169522267079258281817586281376375557 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 21. -/
theorem ep_Q1_009_partial_21_1227_valid :
    mulPoly ep_Q1_009_coefficient_21_1227
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1228 : Poly :=
[
  term ((159110616183533178107077 : Rat) / 5417878818873701860904) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1228 for generator 21. -/
def ep_Q1_009_partial_21_1228 : Poly :=
[
  term ((159110616183533178107077 : Rat) / 2708939409436850930452) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-159110616183533178107077 : Rat) / 5417878818873701860904) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 21. -/
theorem ep_Q1_009_partial_21_1228_valid :
    mulPoly ep_Q1_009_coefficient_21_1228
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1229 : Poly :=
[
  term ((-297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 1229 for generator 21. -/
def ep_Q1_009_partial_21_1229 : Poly :=
[
  term ((-595828648334699033529757152979336086055451592892156 : Rat) / 1979666352983492219745217062002477251217792950606093) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 21. -/
theorem ep_Q1_009_partial_21_1229_valid :
    mulPoly ep_Q1_009_coefficient_21_1229
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1230 : Poly :=
[
  term ((241067467079712 : Rat) / 1395206957462413) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1230 for generator 21. -/
def ep_Q1_009_partial_21_1230 : Poly :=
[
  term ((482134934159424 : Rat) / 1395206957462413) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-241067467079712 : Rat) / 1395206957462413) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 21. -/
theorem ep_Q1_009_partial_21_1230_valid :
    mulPoly ep_Q1_009_coefficient_21_1230
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1231 : Poly :=
[
  term ((-15370706277085705827514553162700 : Rat) / 3435605717361227895008739306438197) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1231 for generator 21. -/
def ep_Q1_009_partial_21_1231 : Poly :=
[
  term ((-30741412554171411655029106325400 : Rat) / 3435605717361227895008739306438197) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((15370706277085705827514553162700 : Rat) / 3435605717361227895008739306438197) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 21. -/
theorem ep_Q1_009_partial_21_1231_valid :
    mulPoly ep_Q1_009_coefficient_21_1231
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1232 : Poly :=
[
  term ((88596693946147847611729512602554900498488139019846751050096150615091537118379867985614468844421 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1232 for generator 21. -/
def ep_Q1_009_partial_21_1232 : Poly :=
[
  term ((88596693946147847611729512602554900498488139019846751050096150615091537118379867985614468844421 : Rat) / 15822794106311053294741574995606326411832715320244474457665479559912454579050713643477359916580) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-88596693946147847611729512602554900498488139019846751050096150615091537118379867985614468844421 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 21. -/
theorem ep_Q1_009_partial_21_1232_valid :
    mulPoly ep_Q1_009_coefficient_21_1232
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1233 : Poly :=
[
  term ((75040998379922199549188938195359906929721561734225315695823953223233628280835849516657257505147985 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1233 for generator 21. -/
def ep_Q1_009_partial_21_1233 : Poly :=
[
  term ((75040998379922199549188938195359906929721561734225315695823953223233628280835849516657257505147985 : Rat) / 84767504241785923315468009566409936456260054225210591181618576064763964799995979122695246549257532) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-75040998379922199549188938195359906929721561734225315695823953223233628280835849516657257505147985 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 21. -/
theorem ep_Q1_009_partial_21_1233_valid :
    mulPoly ep_Q1_009_coefficient_21_1233
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1234 : Poly :=
[
  term ((-591511070805642 : Rat) / 1395206957462413) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1234 for generator 21. -/
def ep_Q1_009_partial_21_1234 : Poly :=
[
  term ((-1183022141611284 : Rat) / 1395206957462413) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((591511070805642 : Rat) / 1395206957462413) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 21. -/
theorem ep_Q1_009_partial_21_1234_valid :
    mulPoly ep_Q1_009_coefficient_21_1234
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1235 : Poly :=
[
  term ((746239 : Rat) / 24755451) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1235 for generator 21. -/
def ep_Q1_009_partial_21_1235 : Poly :=
[
  term ((1492478 : Rat) / 24755451) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-746239 : Rat) / 24755451) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 21. -/
theorem ep_Q1_009_partial_21_1235_valid :
    mulPoly ep_Q1_009_coefficient_21_1235
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1236 : Poly :=
[
  term ((-354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 1236 for generator 21. -/
def ep_Q1_009_partial_21_1236 : Poly :=
[
  term ((-354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 106868606020257948739794602618779992495234215321835482000465832839310996240) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 21. -/
theorem ep_Q1_009_partial_21_1236_valid :
    mulPoly ep_Q1_009_coefficient_21_1236
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1237 : Poly :=
[
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(11, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1237 for generator 21. -/
def ep_Q1_009_partial_21_1237 : Poly :=
[
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 21. -/
theorem ep_Q1_009_partial_21_1237_valid :
    mulPoly ep_Q1_009_coefficient_21_1237
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1238 : Poly :=
[
  term ((374251758280452 : Rat) / 1395206957462413) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1238 for generator 21. -/
def ep_Q1_009_partial_21_1238 : Poly :=
[
  term ((748503516560904 : Rat) / 1395206957462413) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-374251758280452 : Rat) / 1395206957462413) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 21. -/
theorem ep_Q1_009_partial_21_1238_valid :
    mulPoly ep_Q1_009_coefficient_21_1238
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1239 : Poly :=
[
  term ((219568210273278840214859404875660 : Rat) / 24049240021528595265061175145067379) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1239 for generator 21. -/
def ep_Q1_009_partial_21_1239 : Poly :=
[
  term ((439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-219568210273278840214859404875660 : Rat) / 24049240021528595265061175145067379) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 21. -/
theorem ep_Q1_009_partial_21_1239_valid :
    mulPoly ep_Q1_009_coefficient_21_1239
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1240 : Poly :=
[
  term ((-126691882041433696517695710916800 : Rat) / 3435605717361227895008739306438197) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1240 for generator 21. -/
def ep_Q1_009_partial_21_1240 : Poly :=
[
  term ((-253383764082867393035391421833600 : Rat) / 3435605717361227895008739306438197) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((126691882041433696517695710916800 : Rat) / 3435605717361227895008739306438197) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 21. -/
theorem ep_Q1_009_partial_21_1240_valid :
    mulPoly ep_Q1_009_coefficient_21_1240
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1241 : Poly :=
[
  term ((629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1241 for generator 21. -/
def ep_Q1_009_partial_21_1241 : Poly :=
[
  term ((1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 21. -/
theorem ep_Q1_009_partial_21_1241_valid :
    mulPoly ep_Q1_009_coefficient_21_1241
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1242 : Poly :=
[
  term ((37539941087268348580026632543296522029177104015283618685784907592833017966582647294277436117840432758415700602735401 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1242 for generator 21. -/
def ep_Q1_009_partial_21_1242 : Poly :=
[
  term ((37539941087268348580026632543296522029177104015283618685784907592833017966582647294277436117840432758415700602735401 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-37539941087268348580026632543296522029177104015283618685784907592833017966582647294277436117840432758415700602735401 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 21. -/
theorem ep_Q1_009_partial_21_1242_valid :
    mulPoly ep_Q1_009_coefficient_21_1242
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1243 : Poly :=
[
  term ((513507313046569526049629 : Rat) / 8126818228310552791356) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1243 for generator 21. -/
def ep_Q1_009_partial_21_1243 : Poly :=
[
  term ((513507313046569526049629 : Rat) / 4063409114155276395678) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-513507313046569526049629 : Rat) / 8126818228310552791356) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 21. -/
theorem ep_Q1_009_partial_21_1243_valid :
    mulPoly ep_Q1_009_coefficient_21_1243
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1244 : Poly :=
[
  term ((-1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(11, 1), (14, 1), (15, 3)]
]

/-- Partial product 1244 for generator 21. -/
def ep_Q1_009_partial_21_1244 : Poly :=
[
  term ((-1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 21. -/
theorem ep_Q1_009_partial_21_1244_valid :
    mulPoly ep_Q1_009_coefficient_21_1244
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1245 : Poly :=
[
  term ((2218871780438729 : Rat) / 1395206957462413) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1245 for generator 21. -/
def ep_Q1_009_partial_21_1245 : Poly :=
[
  term ((4437743560877458 : Rat) / 1395206957462413) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2218871780438729 : Rat) / 1395206957462413) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 21. -/
theorem ep_Q1_009_partial_21_1245_valid :
    mulPoly ep_Q1_009_coefficient_21_1245
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1246 : Poly :=
[
  term ((144748144037650532575632387627481949325897875634927305862143704931705518266579699230430779003068497181902721038949 : Rat) / 280199157887700167288528020921680261534174531819507550766877977053427892280615957391481215927281473099673803264) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1246 for generator 21. -/
def ep_Q1_009_partial_21_1246 : Poly :=
[
  term ((144748144037650532575632387627481949325897875634927305862143704931705518266579699230430779003068497181902721038949 : Rat) / 140099578943850083644264010460840130767087265909753775383438988526713946140307978695740607963640736549836901632) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-144748144037650532575632387627481949325897875634927305862143704931705518266579699230430779003068497181902721038949 : Rat) / 280199157887700167288528020921680261534174531819507550766877977053427892280615957391481215927281473099673803264) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 21. -/
theorem ep_Q1_009_partial_21_1246_valid :
    mulPoly ep_Q1_009_coefficient_21_1246
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1247 : Poly :=
[
  term ((60701287422011207370383 : Rat) / 1160974032615793255908) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1247 for generator 21. -/
def ep_Q1_009_partial_21_1247 : Poly :=
[
  term ((60701287422011207370383 : Rat) / 580487016307896627954) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-60701287422011207370383 : Rat) / 1160974032615793255908) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 21. -/
theorem ep_Q1_009_partial_21_1247_valid :
    mulPoly ep_Q1_009_coefficient_21_1247
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1248 : Poly :=
[
  term ((-21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(11, 1), (14, 3), (15, 1)]
]

/-- Partial product 1248 for generator 21. -/
def ep_Q1_009_partial_21_1248 : Poly :=
[
  term ((-21098765420225759898486073251488458150010862660447631 : Rat) / 31674661647735875515923472992039636019484687209697488) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 21. -/
theorem ep_Q1_009_partial_21_1248_valid :
    mulPoly ep_Q1_009_coefficient_21_1248
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1249 : Poly :=
[
  term ((1404855237365801 : Rat) / 2790413914924826) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 1249 for generator 21. -/
def ep_Q1_009_partial_21_1249 : Poly :=
[
  term ((1404855237365801 : Rat) / 1395206957462413) [(10, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1404855237365801 : Rat) / 2790413914924826) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 21. -/
theorem ep_Q1_009_partial_21_1249_valid :
    mulPoly ep_Q1_009_coefficient_21_1249
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1250 : Poly :=
[
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(11, 1), (15, 1)]
]

/-- Partial product 1250 for generator 21. -/
def ep_Q1_009_partial_21_1250 : Poly :=
[
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(10, 1), (11, 1), (15, 1)],
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 21. -/
theorem ep_Q1_009_partial_21_1250_valid :
    mulPoly ep_Q1_009_coefficient_21_1250
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1251 : Poly :=
[
  term ((-11273221283 : Rat) / 792174432) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1251 for generator 21. -/
def ep_Q1_009_partial_21_1251 : Poly :=
[
  term ((-11273221283 : Rat) / 396087216) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((11273221283 : Rat) / 792174432) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 21. -/
theorem ep_Q1_009_partial_21_1251_valid :
    mulPoly ep_Q1_009_coefficient_21_1251
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1252 : Poly :=
[
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 1356280067868574773047488153062558983300160867603369458905897217036223436799935665963123944788120512) [(11, 1), (15, 3)]
]

/-- Partial product 1252 for generator 21. -/
def ep_Q1_009_partial_21_1252 : Poly :=
[
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(10, 1), (11, 1), (15, 3)],
  term ((60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 1356280067868574773047488153062558983300160867603369458905897217036223436799935665963123944788120512) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 21. -/
theorem ep_Q1_009_partial_21_1252_valid :
    mulPoly ep_Q1_009_coefficient_21_1252
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1253 : Poly :=
[
  term ((287857417009617 : Rat) / 5580827829849652) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1253 for generator 21. -/
def ep_Q1_009_partial_21_1253 : Poly :=
[
  term ((287857417009617 : Rat) / 2790413914924826) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-287857417009617 : Rat) / 5580827829849652) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 21. -/
theorem ep_Q1_009_partial_21_1253_valid :
    mulPoly ep_Q1_009_coefficient_21_1253
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1254 : Poly :=
[
  term ((-439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1254 for generator 21. -/
def ep_Q1_009_partial_21_1254 : Poly :=
[
  term ((-878272841093115360859437619502640 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 21. -/
theorem ep_Q1_009_partial_21_1254_valid :
    mulPoly ep_Q1_009_coefficient_21_1254
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1255 : Poly :=
[
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(11, 2), (14, 1)]
]

/-- Partial product 1255 for generator 21. -/
def ep_Q1_009_partial_21_1255 : Poly :=
[
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 2430381174729377786072305919325131736857505073189551276697417660402553023342189615638122483186688) [(10, 1), (11, 2), (14, 1)],
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 21. -/
theorem ep_Q1_009_partial_21_1255_valid :
    mulPoly ep_Q1_009_coefficient_21_1255
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1256 : Poly :=
[
  term ((60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 1256 for generator 21. -/
def ep_Q1_009_partial_21_1256 : Poly :=
[
  term ((60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 21. -/
theorem ep_Q1_009_partial_21_1256_valid :
    mulPoly ep_Q1_009_coefficient_21_1256
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1257 : Poly :=
[
  term ((-287857417009617 : Rat) / 2790413914924826) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1257 for generator 21. -/
def ep_Q1_009_partial_21_1257 : Poly :=
[
  term ((-287857417009617 : Rat) / 1395206957462413) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((287857417009617 : Rat) / 2790413914924826) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 21. -/
theorem ep_Q1_009_partial_21_1257_valid :
    mulPoly ep_Q1_009_coefficient_21_1257
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1258 : Poly :=
[
  term ((11273221283 : Rat) / 396087216) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1258 for generator 21. -/
def ep_Q1_009_partial_21_1258 : Poly :=
[
  term ((11273221283 : Rat) / 198043608) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-11273221283 : Rat) / 396087216) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 21. -/
theorem ep_Q1_009_partial_21_1258_valid :
    mulPoly ep_Q1_009_coefficient_21_1258
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1259 : Poly :=
[
  term ((-780297511356866431090643836346793151922959642660916941044772254296650347024175253007695501948563949 : Rat) / 5400847054954172857938457598500292748572233495976780614883150356450117829649310256973605518192640) [(12, 1)]
]

/-- Partial product 1259 for generator 21. -/
def ep_Q1_009_partial_21_1259 : Poly :=
[
  term ((-780297511356866431090643836346793151922959642660916941044772254296650347024175253007695501948563949 : Rat) / 2700423527477086428969228799250146374286116747988390307441575178225058914824655128486802759096320) [(10, 1), (12, 1)],
  term ((780297511356866431090643836346793151922959642660916941044772254296650347024175253007695501948563949 : Rat) / 5400847054954172857938457598500292748572233495976780614883150356450117829649310256973605518192640) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 21. -/
theorem ep_Q1_009_partial_21_1259_valid :
    mulPoly ep_Q1_009_coefficient_21_1259
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1260 : Poly :=
[
  term ((1618861416261790278003320635523640 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1260 for generator 21. -/
def ep_Q1_009_partial_21_1260 : Poly :=
[
  term ((3237722832523580556006641271047280 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1618861416261790278003320635523640 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 21. -/
theorem ep_Q1_009_partial_21_1260_valid :
    mulPoly ep_Q1_009_coefficient_21_1260
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1261 : Poly :=
[
  term ((-57756593283594773412478927035600 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1261 for generator 21. -/
def ep_Q1_009_partial_21_1261 : Poly :=
[
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((57756593283594773412478927035600 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 21. -/
theorem ep_Q1_009_partial_21_1261_valid :
    mulPoly ep_Q1_009_coefficient_21_1261
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1262 : Poly :=
[
  term ((3772263703415522863450848319088420227148509947807442100933342598841568775401357518165972166979520121 : Rat) / 59746870545430537240944187183409488531080333049243135552144850818229428490495494717770511045006080) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1262 for generator 21. -/
def ep_Q1_009_partial_21_1262 : Poly :=
[
  term ((3772263703415522863450848319088420227148509947807442100933342598841568775401357518165972166979520121 : Rat) / 29873435272715268620472093591704744265540166524621567776072425409114714245247747358885255522503040) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3772263703415522863450848319088420227148509947807442100933342598841568775401357518165972166979520121 : Rat) / 59746870545430537240944187183409488531080333049243135552144850818229428490495494717770511045006080) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 21. -/
theorem ep_Q1_009_partial_21_1262_valid :
    mulPoly ep_Q1_009_coefficient_21_1262
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1263 : Poly :=
[
  term ((329748103 : Rat) / 49510902) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1263 for generator 21. -/
def ep_Q1_009_partial_21_1263 : Poly :=
[
  term ((329748103 : Rat) / 24755451) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-329748103 : Rat) / 49510902) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 21. -/
theorem ep_Q1_009_partial_21_1263_valid :
    mulPoly ep_Q1_009_coefficient_21_1263
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1264 : Poly :=
[
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1264 for generator 21. -/
def ep_Q1_009_partial_21_1264 : Poly :=
[
  term ((462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 21. -/
theorem ep_Q1_009_partial_21_1264_valid :
    mulPoly ep_Q1_009_coefficient_21_1264
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1265 : Poly :=
[
  term ((139733693428051871159223210570000 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 2), (15, 2)]
]

/-- Partial product 1265 for generator 21. -/
def ep_Q1_009_partial_21_1265 : Poly :=
[
  term ((279467386856103742318446421140000 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-139733693428051871159223210570000 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 21. -/
theorem ep_Q1_009_partial_21_1265_valid :
    mulPoly ep_Q1_009_coefficient_21_1265
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1266 : Poly :=
[
  term ((98385714366661954722453642235433795840931079815251045778906156218131156138805446341857511129815621 : Rat) / 192887394819791887783516342803581883877579767713456450531541084158932779630332509177628768506880) [(12, 1), (14, 1)]
]

/-- Partial product 1266 for generator 21. -/
def ep_Q1_009_partial_21_1266 : Poly :=
[
  term ((98385714366661954722453642235433795840931079815251045778906156218131156138805446341857511129815621 : Rat) / 96443697409895943891758171401790941938789883856728225265770542079466389815166254588814384253440) [(10, 1), (12, 1), (14, 1)],
  term ((-98385714366661954722453642235433795840931079815251045778906156218131156138805446341857511129815621 : Rat) / 192887394819791887783516342803581883877579767713456450531541084158932779630332509177628768506880) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 21. -/
theorem ep_Q1_009_partial_21_1266_valid :
    mulPoly ep_Q1_009_coefficient_21_1266
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1267 : Poly :=
[
  term ((-1087359632367513029024537633172063414435094627314066128256330221189058247938017954175991888564668425 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1267 for generator 21. -/
def ep_Q1_009_partial_21_1267 : Poly :=
[
  term ((-1087359632367513029024537633172063414435094627314066128256330221189058247938017954175991888564668425 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1087359632367513029024537633172063414435094627314066128256330221189058247938017954175991888564668425 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 21. -/
theorem ep_Q1_009_partial_21_1267_valid :
    mulPoly ep_Q1_009_coefficient_21_1267
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1268 : Poly :=
[
  term ((3569316870191176 : Rat) / 1395206957462413) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1268 for generator 21. -/
def ep_Q1_009_partial_21_1268 : Poly :=
[
  term ((7138633740382352 : Rat) / 1395206957462413) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3569316870191176 : Rat) / 1395206957462413) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 21. -/
theorem ep_Q1_009_partial_21_1268_valid :
    mulPoly ep_Q1_009_coefficient_21_1268
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1269 : Poly :=
[
  term ((1558751803 : Rat) / 28291944) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1269 for generator 21. -/
def ep_Q1_009_partial_21_1269 : Poly :=
[
  term ((1558751803 : Rat) / 14145972) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1558751803 : Rat) / 28291944) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 21. -/
theorem ep_Q1_009_partial_21_1269_valid :
    mulPoly ep_Q1_009_coefficient_21_1269
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1270 : Poly :=
[
  term ((17608891583888888663779161945158367796556325091162908191022336563512979865222146352013966798681 : Rat) / 57866218445937566335054902841074565163273930314036935159462325247679833889099752753288630552064) [(12, 1), (14, 2)]
]

/-- Partial product 1270 for generator 21. -/
def ep_Q1_009_partial_21_1270 : Poly :=
[
  term ((17608891583888888663779161945158367796556325091162908191022336563512979865222146352013966798681 : Rat) / 28933109222968783167527451420537282581636965157018467579731162623839916944549876376644315276032) [(10, 1), (12, 1), (14, 2)],
  term ((-17608891583888888663779161945158367796556325091162908191022336563512979865222146352013966798681 : Rat) / 57866218445937566335054902841074565163273930314036935159462325247679833889099752753288630552064) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 21. -/
theorem ep_Q1_009_partial_21_1270_valid :
    mulPoly ep_Q1_009_coefficient_21_1270
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1271 : Poly :=
[
  term ((746239 : Rat) / 4715324) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 1271 for generator 21. -/
def ep_Q1_009_partial_21_1271 : Poly :=
[
  term ((746239 : Rat) / 2357662) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-746239 : Rat) / 4715324) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 21. -/
theorem ep_Q1_009_partial_21_1271_valid :
    mulPoly ep_Q1_009_coefficient_21_1271
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1272 : Poly :=
[
  term ((550801235718305965411650319129516409321739412809121510722169704685706357362423200037376271692304608710128452188619 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(12, 1), (15, 2)]
]

/-- Partial product 1272 for generator 21. -/
def ep_Q1_009_partial_21_1272 : Poly :=
[
  term ((550801235718305965411650319129516409321739412809121510722169704685706357362423200037376271692304608710128452188619 : Rat) / 408623771919562743962436697177450381404004525570115178201697049869582342909231604529243439893952148270357629760) [(10, 1), (12, 1), (15, 2)],
  term ((-550801235718305965411650319129516409321739412809121510722169704685706357362423200037376271692304608710128452188619 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 21. -/
theorem ep_Q1_009_partial_21_1272_valid :
    mulPoly ep_Q1_009_coefficient_21_1272
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1273 : Poly :=
[
  term ((126859104927347898122197 : Rat) / 2031704557077638197839) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1273 for generator 21. -/
def ep_Q1_009_partial_21_1273 : Poly :=
[
  term ((253718209854695796244394 : Rat) / 2031704557077638197839) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-126859104927347898122197 : Rat) / 2031704557077638197839) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 21. -/
theorem ep_Q1_009_partial_21_1273_valid :
    mulPoly ep_Q1_009_coefficient_21_1273
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1274 : Poly :=
[
  term ((297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(12, 1), (15, 4)]
]

/-- Partial product 1274 for generator 21. -/
def ep_Q1_009_partial_21_1274 : Poly :=
[
  term ((595828648334699033529757152979336086055451592892156 : Rat) / 1979666352983492219745217062002477251217792950606093) [(10, 1), (12, 1), (15, 4)],
  term ((-297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 21. -/
theorem ep_Q1_009_partial_21_1274_valid :
    mulPoly ep_Q1_009_coefficient_21_1274
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1275 : Poly :=
[
  term ((-241067467079712 : Rat) / 1395206957462413) [(12, 1), (15, 4), (16, 1)]
]

/-- Partial product 1275 for generator 21. -/
def ep_Q1_009_partial_21_1275 : Poly :=
[
  term ((-482134934159424 : Rat) / 1395206957462413) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((241067467079712 : Rat) / 1395206957462413) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 21. -/
theorem ep_Q1_009_partial_21_1275_valid :
    mulPoly ep_Q1_009_coefficient_21_1275
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1276 : Poly :=
[
  term ((-11261281459 : Rat) / 792174432) [(12, 1), (16, 1)]
]

/-- Partial product 1276 for generator 21. -/
def ep_Q1_009_partial_21_1276 : Poly :=
[
  term ((-11261281459 : Rat) / 396087216) [(10, 1), (12, 1), (16, 1)],
  term ((11261281459 : Rat) / 792174432) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 21. -/
theorem ep_Q1_009_partial_21_1276_valid :
    mulPoly ep_Q1_009_coefficient_21_1276
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1277 : Poly :=
[
  term ((8798861038591249031714568362563711356938905499811757066929896697554592710299927383850771921822441 : Rat) / 337552940934635803621153599906268296785764593498548788430196897278132364353081891060850344887040) [(12, 2)]
]

/-- Partial product 1277 for generator 21. -/
def ep_Q1_009_partial_21_1277 : Poly :=
[
  term ((8798861038591249031714568362563711356938905499811757066929896697554592710299927383850771921822441 : Rat) / 168776470467317901810576799953134148392882296749274394215098448639066182176540945530425172443520) [(10, 1), (12, 2)],
  term ((-8798861038591249031714568362563711356938905499811757066929896697554592710299927383850771921822441 : Rat) / 337552940934635803621153599906268296785764593498548788430196897278132364353081891060850344887040) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 21. -/
theorem ep_Q1_009_partial_21_1277_valid :
    mulPoly ep_Q1_009_coefficient_21_1277
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1278 : Poly :=
[
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1278 for generator 21. -/
def ep_Q1_009_partial_21_1278 : Poly :=
[
  term ((-231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 21. -/
theorem ep_Q1_009_partial_21_1278_valid :
    mulPoly ep_Q1_009_coefficient_21_1278
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1279 : Poly :=
[
  term ((326976842621641378512582312733800 : Rat) / 24049240021528595265061175145067379) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1279 for generator 21. -/
def ep_Q1_009_partial_21_1279 : Poly :=
[
  term ((653953685243282757025164625467600 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-326976842621641378512582312733800 : Rat) / 24049240021528595265061175145067379) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 21. -/
theorem ep_Q1_009_partial_21_1279_valid :
    mulPoly ep_Q1_009_coefficient_21_1279
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1280 : Poly :=
[
  term ((124987752539935891117635570029560512838700423253133384564004392964138558875161755465413399959301 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(12, 2), (14, 1)]
]

/-- Partial product 1280 for generator 21. -/
def ep_Q1_009_partial_21_1280 : Poly :=
[
  term ((124987752539935891117635570029560512838700423253133384564004392964138558875161755465413399959301 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(10, 1), (12, 2), (14, 1)],
  term ((-124987752539935891117635570029560512838700423253133384564004392964138558875161755465413399959301 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 21. -/
theorem ep_Q1_009_partial_21_1280_valid :
    mulPoly ep_Q1_009_coefficient_21_1280
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1281 : Poly :=
[
  term ((746239 : Rat) / 7072986) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1281 for generator 21. -/
def ep_Q1_009_partial_21_1281 : Poly :=
[
  term ((746239 : Rat) / 3536493) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-746239 : Rat) / 7072986) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 21. -/
theorem ep_Q1_009_partial_21_1281_valid :
    mulPoly ep_Q1_009_coefficient_21_1281
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1282 : Poly :=
[
  term ((-92486595945300036023858213846741572646780055775400565241677755164479358821033256988809400149357061 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(12, 2), (15, 2)]
]

/-- Partial product 1282 for generator 21. -/
def ep_Q1_009_partial_21_1282 : Poly :=
[
  term ((-92486595945300036023858213846741572646780055775400565241677755164479358821033256988809400149357061 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(10, 1), (12, 2), (15, 2)],
  term ((92486595945300036023858213846741572646780055775400565241677755164479358821033256988809400149357061 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 21. -/
theorem ep_Q1_009_partial_21_1282_valid :
    mulPoly ep_Q1_009_coefficient_21_1282
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1283 : Poly :=
[
  term ((217259312525190 : Rat) / 1395206957462413) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1283 for generator 21. -/
def ep_Q1_009_partial_21_1283 : Poly :=
[
  term ((434518625050380 : Rat) / 1395206957462413) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-217259312525190 : Rat) / 1395206957462413) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 21. -/
theorem ep_Q1_009_partial_21_1283_valid :
    mulPoly ep_Q1_009_coefficient_21_1283
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1284 : Poly :=
[
  term ((131838625 : Rat) / 49510902) [(12, 2), (16, 1)]
]

/-- Partial product 1284 for generator 21. -/
def ep_Q1_009_partial_21_1284 : Poly :=
[
  term ((131838625 : Rat) / 24755451) [(10, 1), (12, 2), (16, 1)],
  term ((-131838625 : Rat) / 49510902) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 21. -/
theorem ep_Q1_009_partial_21_1284_valid :
    mulPoly ep_Q1_009_coefficient_21_1284
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1285 : Poly :=
[
  term ((-570847694234859535050701915681103462099536925100267021400698782867518449557402706641824977420405062289171094186551 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1285 for generator 21. -/
def ep_Q1_009_partial_21_1285 : Poly :=
[
  term ((-570847694234859535050701915681103462099536925100267021400698782867518449557402706641824977420405062289171094186551 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((570847694234859535050701915681103462099536925100267021400698782867518449557402706641824977420405062289171094186551 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 21. -/
theorem ep_Q1_009_partial_21_1285_valid :
    mulPoly ep_Q1_009_coefficient_21_1285
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1286 : Poly :=
[
  term ((-484011645839913357301109 : Rat) / 16253636456621105582712) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1286 for generator 21. -/
def ep_Q1_009_partial_21_1286 : Poly :=
[
  term ((-484011645839913357301109 : Rat) / 8126818228310552791356) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((484011645839913357301109 : Rat) / 16253636456621105582712) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 21. -/
theorem ep_Q1_009_partial_21_1286_valid :
    mulPoly ep_Q1_009_coefficient_21_1286
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1287 : Poly :=
[
  term ((-16257699129022753148422988905576499438933215324842968123604528331121217706925206821919552475117065 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1287 for generator 21. -/
def ep_Q1_009_partial_21_1287 : Poly :=
[
  term ((-16257699129022753148422988905576499438933215324842968123604528331121217706925206821919552475117065 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((16257699129022753148422988905576499438933215324842968123604528331121217706925206821919552475117065 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 21. -/
theorem ep_Q1_009_partial_21_1287_valid :
    mulPoly ep_Q1_009_coefficient_21_1287
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1288 : Poly :=
[
  term ((107883175878972 : Rat) / 1395206957462413) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1288 for generator 21. -/
def ep_Q1_009_partial_21_1288 : Poly :=
[
  term ((215766351757944 : Rat) / 1395206957462413) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-107883175878972 : Rat) / 1395206957462413) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 21. -/
theorem ep_Q1_009_partial_21_1288_valid :
    mulPoly ep_Q1_009_coefficient_21_1288
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1289 : Poly :=
[
  term ((151948938466749193681756473578161473324727269518563309979258313609071874379261690915256020489188419 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1289 for generator 21. -/
def ep_Q1_009_partial_21_1289 : Poly :=
[
  term ((151948938466749193681756473578161473324727269518563309979258313609071874379261690915256020489188419 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-151948938466749193681756473578161473324727269518563309979258313609071874379261690915256020489188419 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 21. -/
theorem ep_Q1_009_partial_21_1289_valid :
    mulPoly ep_Q1_009_coefficient_21_1289
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1290 : Poly :=
[
  term ((-1783470560112176 : Rat) / 1395206957462413) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1290 for generator 21. -/
def ep_Q1_009_partial_21_1290 : Poly :=
[
  term ((-3566941120224352 : Rat) / 1395206957462413) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1783470560112176 : Rat) / 1395206957462413) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 21. -/
theorem ep_Q1_009_partial_21_1290_valid :
    mulPoly ep_Q1_009_coefficient_21_1290
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1291 : Poly :=
[
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(13, 1), (14, 3), (15, 1)]
]

/-- Partial product 1291 for generator 21. -/
def ep_Q1_009_partial_21_1291 : Poly :=
[
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 21. -/
theorem ep_Q1_009_partial_21_1291_valid :
    mulPoly ep_Q1_009_coefficient_21_1291
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1292 : Poly :=
[
  term ((-4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(13, 1), (15, 1)]
]

/-- Partial product 1292 for generator 21. -/
def ep_Q1_009_partial_21_1292 : Poly :=
[
  term ((-4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(10, 1), (13, 1), (15, 1)],
  term ((4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 21. -/
theorem ep_Q1_009_partial_21_1292_valid :
    mulPoly ep_Q1_009_coefficient_21_1292
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1293 : Poly :=
[
  term ((-477821805183413554845799 : Rat) / 32507272913242211165424) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1293 for generator 21. -/
def ep_Q1_009_partial_21_1293 : Poly :=
[
  term ((-477821805183413554845799 : Rat) / 16253636456621105582712) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((477821805183413554845799 : Rat) / 32507272913242211165424) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 21. -/
theorem ep_Q1_009_partial_21_1293_valid :
    mulPoly ep_Q1_009_coefficient_21_1293
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1294 : Poly :=
[
  term ((-49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(13, 1), (15, 3)]
]

/-- Partial product 1294 for generator 21. -/
def ep_Q1_009_partial_21_1294 : Poly :=
[
  term ((-49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(10, 1), (13, 1), (15, 3)],
  term ((49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 21. -/
theorem ep_Q1_009_partial_21_1294_valid :
    mulPoly ep_Q1_009_coefficient_21_1294
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1295 : Poly :=
[
  term ((175221801862965 : Rat) / 1395206957462413) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1295 for generator 21. -/
def ep_Q1_009_partial_21_1295 : Poly :=
[
  term ((350443603725930 : Rat) / 1395206957462413) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-175221801862965 : Rat) / 1395206957462413) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 21. -/
theorem ep_Q1_009_partial_21_1295_valid :
    mulPoly ep_Q1_009_coefficient_21_1295
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1296 : Poly :=
[
  term ((-3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 126582352850488426357932599964850611294661722561955795661323836479299636632405709147818879332640) [(13, 2)]
]

/-- Partial product 1296 for generator 21. -/
def ep_Q1_009_partial_21_1296 : Poly :=
[
  term ((-3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(10, 1), (13, 2)],
  term ((3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 126582352850488426357932599964850611294661722561955795661323836479299636632405709147818879332640) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 21. -/
theorem ep_Q1_009_partial_21_1296_valid :
    mulPoly ep_Q1_009_coefficient_21_1296
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1297 : Poly :=
[
  term ((40646255187112546818128429265041908890772985220223257785006708374455821827258096830545927229263 : Rat) / 86799327668906349502582354261611847744910895471055402739193487871519750833649629129932945828096) [(13, 2), (14, 1)]
]

/-- Partial product 1297 for generator 21. -/
def ep_Q1_009_partial_21_1297 : Poly :=
[
  term ((40646255187112546818128429265041908890772985220223257785006708374455821827258096830545927229263 : Rat) / 43399663834453174751291177130805923872455447735527701369596743935759875416824814564966472914048) [(10, 1), (13, 2), (14, 1)],
  term ((-40646255187112546818128429265041908890772985220223257785006708374455821827258096830545927229263 : Rat) / 86799327668906349502582354261611847744910895471055402739193487871519750833649629129932945828096) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 21. -/
theorem ep_Q1_009_partial_21_1297_valid :
    mulPoly ep_Q1_009_coefficient_21_1297
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1298 : Poly :=
[
  term ((-489999484954368561531676058398800 : Rat) / 24049240021528595265061175145067379) [(13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1298 for generator 21. -/
def ep_Q1_009_partial_21_1298 : Poly :=
[
  term ((-979998969908737123063352116797600 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((489999484954368561531676058398800 : Rat) / 24049240021528595265061175145067379) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 21. -/
theorem ep_Q1_009_partial_21_1298_valid :
    mulPoly ep_Q1_009_coefficient_21_1298
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1299 : Poly :=
[
  term ((746239 : Rat) / 7072986) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1299 for generator 21. -/
def ep_Q1_009_partial_21_1299 : Poly :=
[
  term ((746239 : Rat) / 3536493) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-746239 : Rat) / 7072986) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 21. -/
theorem ep_Q1_009_partial_21_1299_valid :
    mulPoly ep_Q1_009_coefficient_21_1299
        ep_Q1_009_generator_21_1200_1299 =
      ep_Q1_009_partial_21_1299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_21_1200_1299 : List Poly :=
[
  ep_Q1_009_partial_21_1200,
  ep_Q1_009_partial_21_1201,
  ep_Q1_009_partial_21_1202,
  ep_Q1_009_partial_21_1203,
  ep_Q1_009_partial_21_1204,
  ep_Q1_009_partial_21_1205,
  ep_Q1_009_partial_21_1206,
  ep_Q1_009_partial_21_1207,
  ep_Q1_009_partial_21_1208,
  ep_Q1_009_partial_21_1209,
  ep_Q1_009_partial_21_1210,
  ep_Q1_009_partial_21_1211,
  ep_Q1_009_partial_21_1212,
  ep_Q1_009_partial_21_1213,
  ep_Q1_009_partial_21_1214,
  ep_Q1_009_partial_21_1215,
  ep_Q1_009_partial_21_1216,
  ep_Q1_009_partial_21_1217,
  ep_Q1_009_partial_21_1218,
  ep_Q1_009_partial_21_1219,
  ep_Q1_009_partial_21_1220,
  ep_Q1_009_partial_21_1221,
  ep_Q1_009_partial_21_1222,
  ep_Q1_009_partial_21_1223,
  ep_Q1_009_partial_21_1224,
  ep_Q1_009_partial_21_1225,
  ep_Q1_009_partial_21_1226,
  ep_Q1_009_partial_21_1227,
  ep_Q1_009_partial_21_1228,
  ep_Q1_009_partial_21_1229,
  ep_Q1_009_partial_21_1230,
  ep_Q1_009_partial_21_1231,
  ep_Q1_009_partial_21_1232,
  ep_Q1_009_partial_21_1233,
  ep_Q1_009_partial_21_1234,
  ep_Q1_009_partial_21_1235,
  ep_Q1_009_partial_21_1236,
  ep_Q1_009_partial_21_1237,
  ep_Q1_009_partial_21_1238,
  ep_Q1_009_partial_21_1239,
  ep_Q1_009_partial_21_1240,
  ep_Q1_009_partial_21_1241,
  ep_Q1_009_partial_21_1242,
  ep_Q1_009_partial_21_1243,
  ep_Q1_009_partial_21_1244,
  ep_Q1_009_partial_21_1245,
  ep_Q1_009_partial_21_1246,
  ep_Q1_009_partial_21_1247,
  ep_Q1_009_partial_21_1248,
  ep_Q1_009_partial_21_1249,
  ep_Q1_009_partial_21_1250,
  ep_Q1_009_partial_21_1251,
  ep_Q1_009_partial_21_1252,
  ep_Q1_009_partial_21_1253,
  ep_Q1_009_partial_21_1254,
  ep_Q1_009_partial_21_1255,
  ep_Q1_009_partial_21_1256,
  ep_Q1_009_partial_21_1257,
  ep_Q1_009_partial_21_1258,
  ep_Q1_009_partial_21_1259,
  ep_Q1_009_partial_21_1260,
  ep_Q1_009_partial_21_1261,
  ep_Q1_009_partial_21_1262,
  ep_Q1_009_partial_21_1263,
  ep_Q1_009_partial_21_1264,
  ep_Q1_009_partial_21_1265,
  ep_Q1_009_partial_21_1266,
  ep_Q1_009_partial_21_1267,
  ep_Q1_009_partial_21_1268,
  ep_Q1_009_partial_21_1269,
  ep_Q1_009_partial_21_1270,
  ep_Q1_009_partial_21_1271,
  ep_Q1_009_partial_21_1272,
  ep_Q1_009_partial_21_1273,
  ep_Q1_009_partial_21_1274,
  ep_Q1_009_partial_21_1275,
  ep_Q1_009_partial_21_1276,
  ep_Q1_009_partial_21_1277,
  ep_Q1_009_partial_21_1278,
  ep_Q1_009_partial_21_1279,
  ep_Q1_009_partial_21_1280,
  ep_Q1_009_partial_21_1281,
  ep_Q1_009_partial_21_1282,
  ep_Q1_009_partial_21_1283,
  ep_Q1_009_partial_21_1284,
  ep_Q1_009_partial_21_1285,
  ep_Q1_009_partial_21_1286,
  ep_Q1_009_partial_21_1287,
  ep_Q1_009_partial_21_1288,
  ep_Q1_009_partial_21_1289,
  ep_Q1_009_partial_21_1290,
  ep_Q1_009_partial_21_1291,
  ep_Q1_009_partial_21_1292,
  ep_Q1_009_partial_21_1293,
  ep_Q1_009_partial_21_1294,
  ep_Q1_009_partial_21_1295,
  ep_Q1_009_partial_21_1296,
  ep_Q1_009_partial_21_1297,
  ep_Q1_009_partial_21_1298,
  ep_Q1_009_partial_21_1299
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_21_1200_1299 : Poly :=
[
  term ((3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((741520133124861929618277837424800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((88887402 : Rat) / 8251817) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((101435802465001905121116510111947922152526556451694132629879622046351421516401565734924426156406590792234486711 : Rat) / 6180863776934562513717529873272358710312673496018548913975249493825615270895940236576791527807679553669275072) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((78975057702579975965 : Rat) / 17073147538467547881) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4399144144023573910739064875461791759581100852700591455498933982854440057233892169522267079258281817586281376375557 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((159110616183533178107077 : Rat) / 2708939409436850930452) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-595828648334699033529757152979336086055451592892156 : Rat) / 1979666352983492219745217062002477251217792950606093) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((482134934159424 : Rat) / 1395206957462413) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-30741412554171411655029106325400 : Rat) / 3435605717361227895008739306438197) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((88596693946147847611729512602554900498488139019846751050096150615091537118379867985614468844421 : Rat) / 15822794106311053294741574995606326411832715320244474457665479559912454579050713643477359916580) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((75040998379922199549188938195359906929721561734225315695823953223233628280835849516657257505147985 : Rat) / 84767504241785923315468009566409936456260054225210591181618576064763964799995979122695246549257532) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1183022141611284 : Rat) / 1395206957462413) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1492478 : Rat) / 24755451) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 106868606020257948739794602618779992495234215321835482000465832839310996240) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((748503516560904 : Rat) / 1395206957462413) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-253383764082867393035391421833600 : Rat) / 3435605717361227895008739306438197) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((37539941087268348580026632543296522029177104015283618685784907592833017966582647294277436117840432758415700602735401 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((513507313046569526049629 : Rat) / 4063409114155276395678) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((4437743560877458 : Rat) / 1395206957462413) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((144748144037650532575632387627481949325897875634927305862143704931705518266579699230430779003068497181902721038949 : Rat) / 140099578943850083644264010460840130767087265909753775383438988526713946140307978695740607963640736549836901632) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((60701287422011207370383 : Rat) / 580487016307896627954) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21098765420225759898486073251488458150010862660447631 : Rat) / 31674661647735875515923472992039636019484687209697488) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((1404855237365801 : Rat) / 1395206957462413) [(10, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(10, 1), (11, 1), (15, 1)],
  term ((-11273221283 : Rat) / 396087216) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(10, 1), (11, 1), (15, 3)],
  term ((287857417009617 : Rat) / 2790413914924826) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-878272841093115360859437619502640 : Rat) / 24049240021528595265061175145067379) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 2430381174729377786072305919325131736857505073189551276697417660402553023342189615638122483186688) [(10, 1), (11, 2), (14, 1)],
  term ((60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-287857417009617 : Rat) / 1395206957462413) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((11273221283 : Rat) / 198043608) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-780297511356866431090643836346793151922959642660916941044772254296650347024175253007695501948563949 : Rat) / 2700423527477086428969228799250146374286116747988390307441575178225058914824655128486802759096320) [(10, 1), (12, 1)],
  term ((3237722832523580556006641271047280 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3772263703415522863450848319088420227148509947807442100933342598841568775401357518165972166979520121 : Rat) / 29873435272715268620472093591704744265540166524621567776072425409114714245247747358885255522503040) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((329748103 : Rat) / 24755451) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((279467386856103742318446421140000 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((98385714366661954722453642235433795840931079815251045778906156218131156138805446341857511129815621 : Rat) / 96443697409895943891758171401790941938789883856728225265770542079466389815166254588814384253440) [(10, 1), (12, 1), (14, 1)],
  term ((-1087359632367513029024537633172063414435094627314066128256330221189058247938017954175991888564668425 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((7138633740382352 : Rat) / 1395206957462413) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1558751803 : Rat) / 14145972) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((17608891583888888663779161945158367796556325091162908191022336563512979865222146352013966798681 : Rat) / 28933109222968783167527451420537282581636965157018467579731162623839916944549876376644315276032) [(10, 1), (12, 1), (14, 2)],
  term ((746239 : Rat) / 2357662) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((550801235718305965411650319129516409321739412809121510722169704685706357362423200037376271692304608710128452188619 : Rat) / 408623771919562743962436697177450381404004525570115178201697049869582342909231604529243439893952148270357629760) [(10, 1), (12, 1), (15, 2)],
  term ((253718209854695796244394 : Rat) / 2031704557077638197839) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((595828648334699033529757152979336086055451592892156 : Rat) / 1979666352983492219745217062002477251217792950606093) [(10, 1), (12, 1), (15, 4)],
  term ((-482134934159424 : Rat) / 1395206957462413) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-11261281459 : Rat) / 396087216) [(10, 1), (12, 1), (16, 1)],
  term ((8798861038591249031714568362563711356938905499811757066929896697554592710299927383850771921822441 : Rat) / 168776470467317901810576799953134148392882296749274394215098448639066182176540945530425172443520) [(10, 1), (12, 2)],
  term ((-231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((653953685243282757025164625467600 : Rat) / 24049240021528595265061175145067379) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((124987752539935891117635570029560512838700423253133384564004392964138558875161755465413399959301 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(10, 1), (12, 2), (14, 1)],
  term ((746239 : Rat) / 3536493) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-92486595945300036023858213846741572646780055775400565241677755164479358821033256988809400149357061 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(10, 1), (12, 2), (15, 2)],
  term ((434518625050380 : Rat) / 1395206957462413) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((131838625 : Rat) / 24755451) [(10, 1), (12, 2), (16, 1)],
  term ((-570847694234859535050701915681103462099536925100267021400698782867518449557402706641824977420405062289171094186551 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-484011645839913357301109 : Rat) / 8126818228310552791356) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16257699129022753148422988905576499438933215324842968123604528331121217706925206821919552475117065 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((590018110038396 : Rat) / 1395206957462413) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((151948938466749193681756473578161473324727269518563309979258313609071874379261690915256020489188419 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3566941120224352 : Rat) / 1395206957462413) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((40646255187112546818128429265041908890772985220223257785006708374455821827258096830545927229263 : Rat) / 43399663834453174751291177130805923872455447735527701369596743935759875416824814564966472914048) [(10, 1), (13, 2), (14, 1)],
  term ((-350265791526316690372452847828800 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((746239 : Rat) / 3536493) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-516083107727604910814731057705200 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 2), (15, 2)],
  term ((44443701 : Rat) / 8251817) [(10, 1), (13, 2), (16, 1)],
  term ((81977100144457097746744283534400 : Rat) / 24049240021528595265061175145067379) [(10, 1), (13, 3), (15, 1)],
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(10, 1), (14, 1)],
  term ((144735695470137805295006190575715841641656784028595437664952211571811922182817970229844360354851640088795277305213 : Rat) / 280199157887700167288528020921680261534174531819507550766877977053427892280615957391481215927281473099673803264) [(10, 1), (14, 1), (15, 2)],
  term ((15190292528153575246319 : Rat) / 290243508153948313977) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11273221283 : Rat) / 792174432) [(10, 1), (14, 1), (16, 1)],
  term ((-21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(10, 1), (14, 2), (15, 2)],
  term ((1404855237365801 : Rat) / 2790413914924826) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((37537326888090675851095131162425639415486474777953926364374693987255362788992684204154288201714892768863137418650841 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(10, 1), (15, 2)],
  term ((128481622970197795338470 : Rat) / 2031704557077638197839) [(10, 1), (15, 2), (16, 1)],
  term ((-1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(10, 1), (15, 4)],
  term ((2218871780438729 : Rat) / 1395206957462413) [(10, 1), (15, 4), (16, 1)],
  term ((-11273221283 : Rat) / 792174432) [(10, 1), (16, 1)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(10, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(10, 2), (13, 1), (15, 1)],
  term ((-477821805183413554845799 : Rat) / 8126818228310552791356) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 84767504241785923315468009566409936456260054225210591181618576064763964799995979122695246549257532) [(10, 2), (13, 1), (15, 3)],
  term ((700887207451860 : Rat) / 1395206957462413) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(10, 2), (13, 2)],
  term ((-1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(10, 2), (13, 2), (14, 1), (15, 2)],
  term ((1032166215455209821629462115410400 : Rat) / 24049240021528595265061175145067379) [(10, 2), (13, 2), (15, 2)],
  term ((-88887402 : Rat) / 8251817) [(10, 2), (13, 2), (16, 1)],
  term ((-163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(10, 2), (13, 3), (15, 1)],
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(10, 2), (14, 1)],
  term ((-144735695470137805295006190575715841641656784028595437664952211571811922182817970229844360354851640088795277305213 : Rat) / 140099578943850083644264010460840130767087265909753775383438988526713946140307978695740607963640736549836901632) [(10, 2), (14, 1), (15, 2)],
  term ((-30380585056307150492638 : Rat) / 290243508153948313977) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((11273221283 : Rat) / 396087216) [(10, 2), (14, 1), (16, 1)],
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 31674661647735875515923472992039636019484687209697488) [(10, 2), (14, 2), (15, 2)],
  term ((-1404855237365801 : Rat) / 1395206957462413) [(10, 2), (14, 2), (15, 2), (16, 1)],
  term ((-37537326888090675851095131162425639415486474777953926364374693987255362788992684204154288201714892768863137418650841 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(10, 2), (15, 2)],
  term ((-256963245940395590676940 : Rat) / 2031704557077638197839) [(10, 2), (15, 2), (16, 1)],
  term ((1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(10, 2), (15, 4)],
  term ((-4437743560877458 : Rat) / 1395206957462413) [(10, 2), (15, 4), (16, 1)],
  term ((11273221283 : Rat) / 396087216) [(10, 2), (16, 1)],
  term ((-3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(11, 1), (12, 1), (13, 1)],
  term ((-370760066562430964809138918712400 : Rat) / 24049240021528595265061175145067379) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-44443701 : Rat) / 8251817) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-81977100144457097746744283534400 : Rat) / 24049240021528595265061175145067379) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-101435802465001905121116510111947922152526556451694132629879622046351421516401565734924426156406590792234486711 : Rat) / 12361727553869125027435059746544717420625346992037097827950498987651230541791880473153583055615359107338550144) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-78975057702579975965 : Rat) / 34146295076935095762) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4399144144023573910739064875461791759581100852700591455498933982854440057233892169522267079258281817586281376375557 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(11, 1), (12, 1), (15, 1)],
  term ((-159110616183533178107077 : Rat) / 5417878818873701860904) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(11, 1), (12, 1), (15, 3)],
  term ((-241067467079712 : Rat) / 1395206957462413) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((15370706277085705827514553162700 : Rat) / 3435605717361227895008739306438197) [(11, 1), (12, 2), (15, 1)],
  term ((-88596693946147847611729512602554900498488139019846751050096150615091537118379867985614468844421 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(11, 1), (13, 1), (14, 1)],
  term ((-75040998379922199549188938195359906929721561734225315695823953223233628280835849516657257505147985 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((591511070805642 : Rat) / 1395206957462413) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-746239 : Rat) / 24755451) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(11, 1), (13, 1), (14, 2)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-374251758280452 : Rat) / 1395206957462413) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-219568210273278840214859404875660 : Rat) / 24049240021528595265061175145067379) [(11, 1), (13, 1), (15, 2)],
  term ((126691882041433696517695710916800 : Rat) / 3435605717361227895008739306438197) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-37539941087268348580026632543296522029177104015283618685784907592833017966582647294277436117840432758415700602735401 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(11, 1), (14, 1), (15, 1)],
  term ((-513507313046569526049629 : Rat) / 8126818228310552791356) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1410353667681533881119862538184900333757187048093856342722661650461337909955016075974718551391887653 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(11, 1), (14, 1), (15, 3)],
  term ((-2218871780438729 : Rat) / 1395206957462413) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-144748144037650532575632387627481949325897875634927305862143704931705518266579699230430779003068497181902721038949 : Rat) / 280199157887700167288528020921680261534174531819507550766877977053427892280615957391481215927281473099673803264) [(11, 1), (14, 2), (15, 1)],
  term ((-60701287422011207370383 : Rat) / 1160974032615793255908) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(11, 1), (14, 3), (15, 1)],
  term ((-1404855237365801 : Rat) / 2790413914924826) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(11, 1), (15, 1)],
  term ((11273221283 : Rat) / 792174432) [(11, 1), (15, 1), (16, 1)],
  term ((60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 1356280067868574773047488153062558983300160867603369458905897217036223436799935665963123944788120512) [(11, 1), (15, 3)],
  term ((-287857417009617 : Rat) / 5580827829849652) [(11, 1), (15, 3), (16, 1)],
  term ((439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(11, 2), (14, 1)],
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(11, 2), (14, 1), (15, 2)],
  term ((287857417009617 : Rat) / 2790413914924826) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11273221283 : Rat) / 396087216) [(11, 2), (14, 1), (16, 1)],
  term ((780297511356866431090643836346793151922959642660916941044772254296650347024175253007695501948563949 : Rat) / 5400847054954172857938457598500292748572233495976780614883150356450117829649310256973605518192640) [(12, 1)],
  term ((-1618861416261790278003320635523640 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((57756593283594773412478927035600 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3772263703415522863450848319088420227148509947807442100933342598841568775401357518165972166979520121 : Rat) / 59746870545430537240944187183409488531080333049243135552144850818229428490495494717770511045006080) [(12, 1), (13, 1), (15, 1)],
  term ((-329748103 : Rat) / 49510902) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 1), (15, 3)],
  term ((-139733693428051871159223210570000 : Rat) / 24049240021528595265061175145067379) [(12, 1), (13, 2), (15, 2)],
  term ((-98385714366661954722453642235433795840931079815251045778906156218131156138805446341857511129815621 : Rat) / 192887394819791887783516342803581883877579767713456450531541084158932779630332509177628768506880) [(12, 1), (14, 1)],
  term ((1087359632367513029024537633172063414435094627314066128256330221189058247938017954175991888564668425 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(12, 1), (14, 1), (15, 2)],
  term ((-3569316870191176 : Rat) / 1395206957462413) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1558751803 : Rat) / 28291944) [(12, 1), (14, 1), (16, 1)],
  term ((-17608891583888888663779161945158367796556325091162908191022336563512979865222146352013966798681 : Rat) / 57866218445937566335054902841074565163273930314036935159462325247679833889099752753288630552064) [(12, 1), (14, 2)],
  term ((-746239 : Rat) / 4715324) [(12, 1), (14, 2), (16, 1)],
  term ((-550801235718305965411650319129516409321739412809121510722169704685706357362423200037376271692304608710128452188619 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(12, 1), (15, 2)],
  term ((-126859104927347898122197 : Rat) / 2031704557077638197839) [(12, 1), (15, 2), (16, 1)],
  term ((-297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(12, 1), (15, 4)],
  term ((241067467079712 : Rat) / 1395206957462413) [(12, 1), (15, 4), (16, 1)],
  term ((11261281459 : Rat) / 792174432) [(12, 1), (16, 1)],
  term ((-8798861038591249031714568362563711356938905499811757066929896697554592710299927383850771921822441 : Rat) / 337552940934635803621153599906268296785764593498548788430196897278132364353081891060850344887040) [(12, 2)],
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-326976842621641378512582312733800 : Rat) / 24049240021528595265061175145067379) [(12, 2), (13, 1), (15, 1)],
  term ((-124987752539935891117635570029560512838700423253133384564004392964138558875161755465413399959301 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(12, 2), (14, 1)],
  term ((-746239 : Rat) / 7072986) [(12, 2), (14, 1), (16, 1)],
  term ((92486595945300036023858213846741572646780055775400565241677755164479358821033256988809400149357061 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(12, 2), (15, 2)],
  term ((-217259312525190 : Rat) / 1395206957462413) [(12, 2), (15, 2), (16, 1)],
  term ((-131838625 : Rat) / 49510902) [(12, 2), (16, 1)],
  term ((570847694234859535050701915681103462099536925100267021400698782867518449557402706641824977420405062289171094186551 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(13, 1), (14, 1), (15, 1)],
  term ((484011645839913357301109 : Rat) / 16253636456621105582712) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16257699129022753148422988905576499438933215324842968123604528331121217706925206821919552475117065 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(13, 1), (14, 1), (15, 3)],
  term ((-107883175878972 : Rat) / 1395206957462413) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-151948938466749193681756473578161473324727269518563309979258313609071874379261690915256020489188419 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(13, 1), (14, 2), (15, 1)],
  term ((1783470560112176 : Rat) / 1395206957462413) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(13, 1), (14, 3), (15, 1)],
  term ((4440462634341624474144432703765206208556750505881477332737924568921423164699562461535761683526997278763546044347173 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(13, 1), (15, 1)],
  term ((477821805183413554845799 : Rat) / 32507272913242211165424) [(13, 1), (15, 1), (16, 1)],
  term ((49528160118579918774143418779589052188483372366164502347242491432575251036167783928722699566736641 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(13, 1), (15, 3)],
  term ((-175221801862965 : Rat) / 1395206957462413) [(13, 1), (15, 3), (16, 1)],
  term ((3448498495079170278704654404819427516630666324235571814518843253137514756430521833699549230893719 : Rat) / 126582352850488426357932599964850611294661722561955795661323836479299636632405709147818879332640) [(13, 2)],
  term ((-40646255187112546818128429265041908890772985220223257785006708374455821827258096830545927229263 : Rat) / 86799327668906349502582354261611847744910895471055402739193487871519750833649629129932945828096) [(13, 2), (14, 1)],
  term ((489999484954368561531676058398800 : Rat) / 24049240021528595265061175145067379) [(13, 2), (14, 1), (15, 2)],
  term ((-746239 : Rat) / 7072986) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 1200 through 1299. -/
theorem ep_Q1_009_block_21_1200_1299_valid :
    checkProductSumEq ep_Q1_009_partials_21_1200_1299
      ep_Q1_009_block_21_1200_1299 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
