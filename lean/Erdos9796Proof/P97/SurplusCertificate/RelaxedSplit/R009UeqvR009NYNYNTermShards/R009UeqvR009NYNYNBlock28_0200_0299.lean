/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0200 : Poly :=
[
  term ((25943905781778190061324824861038604733249580807608 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2)]
]

/-- Partial product 200 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0200 : Poly :=
[
  term ((-25943905781778190061324824861038604733249580807608 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2)],
  term ((51887811563556380122649649722077209466499161615216 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0200
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0201 : Poly :=
[
  term ((64366110563275068430131081614900729129808749353522 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 201 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0201 : Poly :=
[
  term ((-64366110563275068430131081614900729129808749353522 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 2), (12, 1)],
  term ((128732221126550136860262163229801458259617498707044 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0201
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0202 : Poly :=
[
  term ((28590145790640211405350035654490891683012453982752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2), (14, 1)]
]

/-- Partial product 202 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0202 : Poly :=
[
  term ((-28590145790640211405350035654490891683012453982752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2), (14, 1)],
  term ((57180291581280422810700071308981783366024907965504 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0202
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0203 : Poly :=
[
  term ((-210287731035884667008224618846026910685559581570745217715655703661833953702215809 : Rat) / 153779183100053648786480267585281297247773570981491065106348024895895551080000) [(0, 1), (12, 1)]
]

/-- Partial product 203 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0203 : Poly :=
[
  term ((210287731035884667008224618846026910685559581570745217715655703661833953702215809 : Rat) / 153779183100053648786480267585281297247773570981491065106348024895895551080000) [(0, 1), (12, 1)],
  term ((-210287731035884667008224618846026910685559581570745217715655703661833953702215809 : Rat) / 76889591550026824393240133792640648623886785490745532553174012447947775540000) [(0, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0203
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0204 : Poly :=
[
  term ((-15223197461120125944175957093693498572292578099146 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 204 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0204 : Poly :=
[
  term ((15223197461120125944175957093693498572292578099146 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0204
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0205 : Poly :=
[
  term ((-23717798661982606280082910417130270740215419114917 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 205 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0205 : Poly :=
[
  term ((-47435597323965212560165820834260541480430838229834 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((23717798661982606280082910417130270740215419114917 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0205
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0206 : Poly :=
[
  term ((174001656056841881771564671250555038185561457422496 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 206 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0206 : Poly :=
[
  term ((-174001656056841881771564671250555038185561457422496 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2)],
  term ((348003312113683763543129342501110076371122914844992 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0206
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0207 : Poly :=
[
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 207 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0207 : Poly :=
[
  term ((-176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0207
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0208 : Poly :=
[
  term ((254973846901260874957790010318236726774851761884246014487117068526967198459100669 : Rat) / 230668774650080473179720401377921945871660356472236597659522037343843326620000) [(0, 1), (12, 1), (14, 1)]
]

/-- Partial product 208 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0208 : Poly :=
[
  term ((-254973846901260874957790010318236726774851761884246014487117068526967198459100669 : Rat) / 230668774650080473179720401377921945871660356472236597659522037343843326620000) [(0, 1), (12, 1), (14, 1)],
  term ((254973846901260874957790010318236726774851761884246014487117068526967198459100669 : Rat) / 115334387325040236589860200688960972935830178236118298829761018671921663310000) [(0, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0208
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0209 : Poly :=
[
  term ((3148892538306694232277032 : Rat) / 168738551328409796076525) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 209 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0209 : Poly :=
[
  term ((-3148892538306694232277032 : Rat) / 168738551328409796076525) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((6297785076613388464554064 : Rat) / 168738551328409796076525) [(0, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0209
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0210 : Poly :=
[
  term ((-53270987013687035398325736561710911119649079974444 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 210 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0210 : Poly :=
[
  term ((-106541974027374070796651473123421822239298159948888 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((53270987013687035398325736561710911119649079974444 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0210
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0211 : Poly :=
[
  term ((-1280751564785996738669476 : Rat) / 56246183776136598692175) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 211 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0211 : Poly :=
[
  term ((-2561503129571993477338952 : Rat) / 56246183776136598692175) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((1280751564785996738669476 : Rat) / 56246183776136598692175) [(0, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0211
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0212 : Poly :=
[
  term ((-37608159749921857696158205437808277867722791620423 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (12, 2)]
]

/-- Partial product 212 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0212 : Poly :=
[
  term ((37608159749921857696158205437808277867722791620423 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (12, 2)],
  term ((-75216319499843715392316410875616555735445583240846 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0212
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0213 : Poly :=
[
  term ((-176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 213 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0213 : Poly :=
[
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0213
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0214 : Poly :=
[
  term ((15223197461120125944175957093693498572292578099146 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 2), (15, 2)]
]

/-- Partial product 214 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0214 : Poly :=
[
  term ((30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-15223197461120125944175957093693498572292578099146 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0214
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0215 : Poly :=
[
  term ((53270987013687035398325736561710911119649079974444 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 215 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0215 : Poly :=
[
  term ((-53270987013687035398325736561710911119649079974444 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((106541974027374070796651473123421822239298159948888 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0215
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0216 : Poly :=
[
  term ((-302324753508625401896133933572635411435934754225971 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 216 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0216 : Poly :=
[
  term ((-604649507017250803792267867145270822871869508451942 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((302324753508625401896133933572635411435934754225971 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0216
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0217 : Poly :=
[
  term ((-733066219597425158349052650545698556329236911648531 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 2)]
]

/-- Partial product 217 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0217 : Poly :=
[
  term ((733066219597425158349052650545698556329236911648531 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 2)],
  term ((-1466132439194850316698105301091397112658473823297062 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0217
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0218 : Poly :=
[
  term ((6566359360787523431171620261304332023665510084386 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 218 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0218 : Poly :=
[
  term ((-6566359360787523431171620261304332023665510084386 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (13, 2), (14, 1)],
  term ((13132718721575046862343240522608664047331020168772 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0218
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0219 : Poly :=
[
  term ((-941749922160714650954087730844783855643448183484 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (14, 1)]
]

/-- Partial product 219 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0219 : Poly :=
[
  term ((941749922160714650954087730844783855643448183484 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (14, 1)],
  term ((-1883499844321429301908175461689567711286896366968 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0219
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0220 : Poly :=
[
  term ((-11202675471263204725862420367164552727534856737650 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (15, 2)]
]

/-- Partial product 220 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0220 : Poly :=
[
  term ((-22405350942526409451724840734329105455069713475300 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (14, 1), (15, 2)],
  term ((11202675471263204725862420367164552727534856737650 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0220
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0221 : Poly :=
[
  term ((222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 934650305641351711522767058448053468552469947085985580893283342197275904000) [(0, 2)]
]

/-- Partial product 221 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0221 : Poly :=
[
  term ((-222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 934650305641351711522767058448053468552469947085985580893283342197275904000) [(0, 2)],
  term ((222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 467325152820675855761383529224026734276234973542992790446641671098637952000) [(0, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0221
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0222 : Poly :=
[
  term ((338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 947921202476015934607268821955429481290537471689640548573309677684864000) [(0, 2), (14, 1)]
]

/-- Partial product 222 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0222 : Poly :=
[
  term ((-338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 947921202476015934607268821955429481290537471689640548573309677684864000) [(0, 2), (14, 1)],
  term ((338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 473960601238007967303634410977714740645268735844820274286654838842432000) [(0, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0222
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0223 : Poly :=
[
  term ((24477888681118632329 : Rat) / 3561011951638910965) [(0, 2), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0223 : Poly :=
[
  term ((-24477888681118632329 : Rat) / 3561011951638910965) [(0, 2), (14, 1), (16, 1)],
  term ((48955777362237264658 : Rat) / 3561011951638910965) [(0, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0223
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0224 : Poly :=
[
  term ((20066491802407213389 : Rat) / 7122023903277821930) [(0, 2), (16, 1)]
]

/-- Partial product 224 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0224 : Poly :=
[
  term ((20066491802407213389 : Rat) / 3561011951638910965) [(0, 2), (14, 1), (16, 1)],
  term ((-20066491802407213389 : Rat) / 7122023903277821930) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0224
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0225 : Poly :=
[
  term ((880426262789902085328455266732881985478459401324 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 225 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0225 : Poly :=
[
  term ((-880426262789902085328455266732881985478459401324 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1)],
  term ((1760852525579804170656910533465763970956918802648 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0225
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0226 : Poly :=
[
  term ((183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1)]
]

/-- Partial product 226 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0226 : Poly :=
[
  term ((-183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0226
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0227 : Poly :=
[
  term ((2200327557026874997711798872369759306709428641280 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1)]
]

/-- Partial product 227 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0227 : Poly :=
[
  term ((-2200327557026874997711798872369759306709428641280 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1)],
  term ((4400655114053749995423597744739518613418857282560 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0227
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0228 : Poly :=
[
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 228 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0228 : Poly :=
[
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0228
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0229 : Poly :=
[
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 229 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0229 : Poly :=
[
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0229
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0230 : Poly :=
[
  term ((-245819464995871850932 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 230 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0230 : Poly :=
[
  term ((-491638929991743701864 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((245819464995871850932 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0230
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0231 : Poly :=
[
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2)]
]

/-- Partial product 231 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0231 : Poly :=
[
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2)],
  term ((-2933770076035833330282398496493012408945904855040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0231
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0232 : Poly :=
[
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2), (16, 1)]
]

/-- Partial product 232 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0232 : Poly :=
[
  term ((-88402926265569820256 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0232
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0233 : Poly :=
[
  term ((-183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)]
]

/-- Partial product 233 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0233 : Poly :=
[
  term ((183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((-366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0233
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0234 : Poly :=
[
  term ((150535646955926494296 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 234 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0234 : Poly :=
[
  term ((-150535646955926494296 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((301071293911852988592 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0234
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0235 : Poly :=
[
  term ((161586012739122721828 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 235 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0235 : Poly :=
[
  term ((323172025478245443656 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-161586012739122721828 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0235
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0236 : Poly :=
[
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)]
]

/-- Partial product 236 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0236 : Poly :=
[
  term ((-2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((5153027906979264350992427651533900819536183170800 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0236
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0237 : Poly :=
[
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 237 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0237 : Poly :=
[
  term ((-498315127045142391624 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0237
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0238 : Poly :=
[
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)]
]

/-- Partial product 238 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0238 : Poly :=
[
  term ((-2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0238
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0239 : Poly :=
[
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0239 : Poly :=
[
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0239
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0240 : Poly :=
[
  term ((94441170427415024695468935016218069493670026188 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1)]
]

/-- Partial product 240 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0240 : Poly :=
[
  term ((-94441170427415024695468935016218069493670026188 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1)],
  term ((188882340854830049390937870032436138987340052376 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0240
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0241 : Poly :=
[
  term ((530083913144919770100679848137709154414453951096 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)]
]

/-- Partial product 241 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0241 : Poly :=
[
  term ((-530083913144919770100679848137709154414453951096 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)],
  term ((1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0241
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0242 : Poly :=
[
  term ((96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 242 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0242 : Poly :=
[
  term ((-96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0242
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0243 : Poly :=
[
  term ((100079185522522174953 : Rat) / 35422516446182843438) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 243 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0243 : Poly :=
[
  term ((100079185522522174953 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-100079185522522174953 : Rat) / 35422516446182843438) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0243
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0244 : Poly :=
[
  term ((-1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 2)]
]

/-- Partial product 244 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0244 : Poly :=
[
  term ((1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 2)],
  term ((-2120335652579679080402719392550836617657815804384 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0244
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0245 : Poly :=
[
  term ((-192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 2), (16, 1)]
]

/-- Partial product 245 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0245 : Poly :=
[
  term ((-384089174440954997768 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0245
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0246 : Poly :=
[
  term ((23998709208171830333243777342258732226842389868492 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 246 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0246 : Poly :=
[
  term ((47997418416343660666487554684517464453684779736984 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-23998709208171830333243777342258732226842389868492 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0246
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0247 : Poly :=
[
  term ((168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0247 : Poly :=
[
  term ((337058200434359369362 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0247
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0248 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (13, 2)]
]

/-- Partial product 248 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0248 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0248
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0249 : Poly :=
[
  term ((615384306217442200278115342664027408271232425776 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (14, 1)]
]

/-- Partial product 249 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0249 : Poly :=
[
  term ((-615384306217442200278115342664027408271232425776 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((1230768612434884400556230685328054816542464851552 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0249
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0250 : Poly :=
[
  term ((-11602254242445340919 : Rat) / 26100801591924200428) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 250 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0250 : Poly :=
[
  term ((11602254242445340919 : Rat) / 26100801591924200428) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-11602254242445340919 : Rat) / 13050400795962100214) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0250
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0251 : Poly :=
[
  term ((-38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (15, 2)]
]

/-- Partial product 251 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0251 : Poly :=
[
  term ((-77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)],
  term ((38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0251
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0252 : Poly :=
[
  term ((-168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 252 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0252 : Poly :=
[
  term ((-168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0252
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0253 : Poly :=
[
  term ((-4056891912283425511 : Rat) / 70845032892365686876) [(1, 1), (2, 1), (3, 1), (16, 1)]
]

/-- Partial product 253 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0253 : Poly :=
[
  term ((-4056891912283425511 : Rat) / 35422516446182843438) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((4056891912283425511 : Rat) / 70845032892365686876) [(1, 1), (2, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0253
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0254 : Poly :=
[
  term ((-73471204997220050333582277211567643434030389288280 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (8, 1), (11, 1)]
]

/-- Partial product 254 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0254 : Poly :=
[
  term ((73471204997220050333582277211567643434030389288280 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (8, 1), (11, 1)],
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0254
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0255 : Poly :=
[
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0255 : Poly :=
[
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0255
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0256 : Poly :=
[
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0256 : Poly :=
[
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0256
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0257 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (8, 1), (13, 1)]
]

/-- Partial product 257 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0257 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (8, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0257
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0258 : Poly :=
[
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0258 : Poly :=
[
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0258
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0259 : Poly :=
[
  term ((-26245477820214573809800489566722554623693926038204 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 259 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0259 : Poly :=
[
  term ((-52490955640429147619600979133445109247387852076408 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((26245477820214573809800489566722554623693926038204 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0259
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0260 : Poly :=
[
  term ((-22695920832002055236 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0260 : Poly :=
[
  term ((-45391841664004110472 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((22695920832002055236 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0260
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0261 : Poly :=
[
  term ((3186322267915905705778070514322712522112529726160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 261 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0261 : Poly :=
[
  term ((-3186322267915905705778070514322712522112529726160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1)],
  term ((6372644535831811411556141028645425044225059452320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0261
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0262 : Poly :=
[
  term ((-440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1)]
]

/-- Partial product 262 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0262 : Poly :=
[
  term ((440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-880978394474803589522623923612291898126028581440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0262
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0263 : Poly :=
[
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 263 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0263 : Poly :=
[
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0263
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0264 : Poly :=
[
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 264 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0264 : Poly :=
[
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0264
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0265 : Poly :=
[
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 265 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0265 : Poly :=
[
  term ((-366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1)],
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0265
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0266 : Poly :=
[
  term ((11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 266 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0266 : Poly :=
[
  term ((-11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0266
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0267 : Poly :=
[
  term ((40880684928629759962 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 267 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0267 : Poly :=
[
  term ((81761369857259519924 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-40880684928629759962 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0267
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0268 : Poly :=
[
  term ((-6115869039873338195953272462313587443822104683760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (12, 1)]
]

/-- Partial product 268 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0268 : Poly :=
[
  term ((6115869039873338195953272462313587443822104683760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (12, 1)],
  term ((-12231738079746676391906544924627174887644209367520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0268
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0269 : Poly :=
[
  term ((-91696149411131933377 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 269 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0269 : Poly :=
[
  term ((-183392298822263866754 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((91696149411131933377 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0269
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0270 : Poly :=
[
  term ((146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 270 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0270 : Poly :=
[
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0270
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0271 : Poly :=
[
  term ((1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0271 : Poly :=
[
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0271
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0272 : Poly :=
[
  term ((-293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 2)]
]

/-- Partial product 272 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0272 : Poly :=
[
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((-587318929649869059681749282408194598750685720960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0272
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0273 : Poly :=
[
  term ((-2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 273 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0273 : Poly :=
[
  term ((-4944164798979218360 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0273
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0274 : Poly :=
[
  term ((3406566866534606603158726495225785496644036871520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (14, 1)]
]

/-- Partial product 274 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0274 : Poly :=
[
  term ((-3406566866534606603158726495225785496644036871520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((6813133733069213206317452990451570993288073743040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0274
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0275 : Poly :=
[
  term ((-14278244075523424232 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 275 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0275 : Poly :=
[
  term ((14278244075523424232 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-28556488151046848464 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0275
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0276 : Poly :=
[
  term ((-27256676672843872427 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 276 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0276 : Poly :=
[
  term ((-54513353345687744854 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((27256676672843872427 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0276
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0277 : Poly :=
[
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (11, 1)]
]

/-- Partial product 277 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0277 : Poly :=
[
  term ((-52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0277
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0278 : Poly :=
[
  term ((-29371041068691165695687852935938891908958585756480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 278 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0278 : Poly :=
[
  term ((29371041068691165695687852935938891908958585756480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1)],
  term ((-58742082137382331391375705871877783817917171512960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0278
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0279 : Poly :=
[
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 279 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0279 : Poly :=
[
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0279
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0280 : Poly :=
[
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 280 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0280 : Poly :=
[
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0280
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0281 : Poly :=
[
  term ((-697889330848014356176 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 281 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0281 : Poly :=
[
  term ((-1395778661696028712352 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((697889330848014356176 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0281
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0282 : Poly :=
[
  term ((8247974902698546893587464384735026268246326613120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 282 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0282 : Poly :=
[
  term ((16495949805397093787174928769470052536492653226240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8247974902698546893587464384735026268246326613120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0282
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0283 : Poly :=
[
  term ((342022834705436272384 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0283 : Poly :=
[
  term ((684045669410872544768 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-342022834705436272384 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0283
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0284 : Poly :=
[
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 284 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0284 : Poly :=
[
  term ((-15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1)],
  term ((31399806626081691759085399280757225917629915225600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0284
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0285 : Poly :=
[
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 285 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0285 : Poly :=
[
  term ((780837930086939586496 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0285
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0286 : Poly :=
[
  term ((-1016644162501637801028678599438007625310143227520 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 286 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0286 : Poly :=
[
  term ((-2033288325003275602057357198876015250620286455040 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((1016644162501637801028678599438007625310143227520 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0286_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0286
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0287 : Poly :=
[
  term ((-173108750955342441560 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0287 : Poly :=
[
  term ((-346217501910684883120 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((173108750955342441560 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0287_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0287
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0288 : Poly :=
[
  term ((25539619630776342682198725562606524005323958199568 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1)]
]

/-- Partial product 288 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0288 : Poly :=
[
  term ((-25539619630776342682198725562606524005323958199568 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((51079239261552685364397451125213048010647916399136 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0288_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0288
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0289 : Poly :=
[
  term ((183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 289 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0289 : Poly :=
[
  term ((-183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0289_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0289
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0290 : Poly :=
[
  term ((-150535646955926494296 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 290 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0290 : Poly :=
[
  term ((150535646955926494296 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-301071293911852988592 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0290_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0290
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0291 : Poly :=
[
  term ((-724304397302688040 : Rat) / 623009083224321367) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 291 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0291 : Poly :=
[
  term ((-1448608794605376080 : Rat) / 623009083224321367) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((724304397302688040 : Rat) / 623009083224321367) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0291_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0291
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0292 : Poly :=
[
  term ((31832781956926068291557488225638426739163533784 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 292 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0292 : Poly :=
[
  term ((63665563913852136583114976451276853478327067568 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-31832781956926068291557488225638426739163533784 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0292_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0292
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0293 : Poly :=
[
  term ((-34775271231801123277 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0293 : Poly :=
[
  term ((-69550542463602246554 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((34775271231801123277 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0293_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0293
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0294 : Poly :=
[
  term ((778514032444475729820607749109588865264556065730460 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 294 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0294 : Poly :=
[
  term ((-778514032444475729820607749109588865264556065730460 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1)],
  term ((1557028064888951459641215498219177730529112131460920 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0294_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0294
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0295 : Poly :=
[
  term ((-1592359599967521650713576882786452475887581451998 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (12, 1)]
]

/-- Partial product 295 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0295 : Poly :=
[
  term ((1592359599967521650713576882786452475887581451998 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-3184719199935043301427153765572904951775162903996 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0295_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0295
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0296 : Poly :=
[
  term ((-31576522572843708596 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 296 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0296 : Poly :=
[
  term ((-63153045145687417192 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((31576522572843708596 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0296_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0296
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0297 : Poly :=
[
  term ((102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 297 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0297 : Poly :=
[
  term ((205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0297_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0297
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0298 : Poly :=
[
  term ((-41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0298 : Poly :=
[
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0298_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0298
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0299 : Poly :=
[
  term ((-205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 2)]
]

/-- Partial product 299 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0299 : Poly :=
[
  term ((205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-410158792619943160048358352389377995320189700932672 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0299_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0299
        rs_R009_ueqv_R009NYNYN_generator_28_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_28_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0200,
  rs_R009_ueqv_R009NYNYN_partial_28_0201,
  rs_R009_ueqv_R009NYNYN_partial_28_0202,
  rs_R009_ueqv_R009NYNYN_partial_28_0203,
  rs_R009_ueqv_R009NYNYN_partial_28_0204,
  rs_R009_ueqv_R009NYNYN_partial_28_0205,
  rs_R009_ueqv_R009NYNYN_partial_28_0206,
  rs_R009_ueqv_R009NYNYN_partial_28_0207,
  rs_R009_ueqv_R009NYNYN_partial_28_0208,
  rs_R009_ueqv_R009NYNYN_partial_28_0209,
  rs_R009_ueqv_R009NYNYN_partial_28_0210,
  rs_R009_ueqv_R009NYNYN_partial_28_0211,
  rs_R009_ueqv_R009NYNYN_partial_28_0212,
  rs_R009_ueqv_R009NYNYN_partial_28_0213,
  rs_R009_ueqv_R009NYNYN_partial_28_0214,
  rs_R009_ueqv_R009NYNYN_partial_28_0215,
  rs_R009_ueqv_R009NYNYN_partial_28_0216,
  rs_R009_ueqv_R009NYNYN_partial_28_0217,
  rs_R009_ueqv_R009NYNYN_partial_28_0218,
  rs_R009_ueqv_R009NYNYN_partial_28_0219,
  rs_R009_ueqv_R009NYNYN_partial_28_0220,
  rs_R009_ueqv_R009NYNYN_partial_28_0221,
  rs_R009_ueqv_R009NYNYN_partial_28_0222,
  rs_R009_ueqv_R009NYNYN_partial_28_0223,
  rs_R009_ueqv_R009NYNYN_partial_28_0224,
  rs_R009_ueqv_R009NYNYN_partial_28_0225,
  rs_R009_ueqv_R009NYNYN_partial_28_0226,
  rs_R009_ueqv_R009NYNYN_partial_28_0227,
  rs_R009_ueqv_R009NYNYN_partial_28_0228,
  rs_R009_ueqv_R009NYNYN_partial_28_0229,
  rs_R009_ueqv_R009NYNYN_partial_28_0230,
  rs_R009_ueqv_R009NYNYN_partial_28_0231,
  rs_R009_ueqv_R009NYNYN_partial_28_0232,
  rs_R009_ueqv_R009NYNYN_partial_28_0233,
  rs_R009_ueqv_R009NYNYN_partial_28_0234,
  rs_R009_ueqv_R009NYNYN_partial_28_0235,
  rs_R009_ueqv_R009NYNYN_partial_28_0236,
  rs_R009_ueqv_R009NYNYN_partial_28_0237,
  rs_R009_ueqv_R009NYNYN_partial_28_0238,
  rs_R009_ueqv_R009NYNYN_partial_28_0239,
  rs_R009_ueqv_R009NYNYN_partial_28_0240,
  rs_R009_ueqv_R009NYNYN_partial_28_0241,
  rs_R009_ueqv_R009NYNYN_partial_28_0242,
  rs_R009_ueqv_R009NYNYN_partial_28_0243,
  rs_R009_ueqv_R009NYNYN_partial_28_0244,
  rs_R009_ueqv_R009NYNYN_partial_28_0245,
  rs_R009_ueqv_R009NYNYN_partial_28_0246,
  rs_R009_ueqv_R009NYNYN_partial_28_0247,
  rs_R009_ueqv_R009NYNYN_partial_28_0248,
  rs_R009_ueqv_R009NYNYN_partial_28_0249,
  rs_R009_ueqv_R009NYNYN_partial_28_0250,
  rs_R009_ueqv_R009NYNYN_partial_28_0251,
  rs_R009_ueqv_R009NYNYN_partial_28_0252,
  rs_R009_ueqv_R009NYNYN_partial_28_0253,
  rs_R009_ueqv_R009NYNYN_partial_28_0254,
  rs_R009_ueqv_R009NYNYN_partial_28_0255,
  rs_R009_ueqv_R009NYNYN_partial_28_0256,
  rs_R009_ueqv_R009NYNYN_partial_28_0257,
  rs_R009_ueqv_R009NYNYN_partial_28_0258,
  rs_R009_ueqv_R009NYNYN_partial_28_0259,
  rs_R009_ueqv_R009NYNYN_partial_28_0260,
  rs_R009_ueqv_R009NYNYN_partial_28_0261,
  rs_R009_ueqv_R009NYNYN_partial_28_0262,
  rs_R009_ueqv_R009NYNYN_partial_28_0263,
  rs_R009_ueqv_R009NYNYN_partial_28_0264,
  rs_R009_ueqv_R009NYNYN_partial_28_0265,
  rs_R009_ueqv_R009NYNYN_partial_28_0266,
  rs_R009_ueqv_R009NYNYN_partial_28_0267,
  rs_R009_ueqv_R009NYNYN_partial_28_0268,
  rs_R009_ueqv_R009NYNYN_partial_28_0269,
  rs_R009_ueqv_R009NYNYN_partial_28_0270,
  rs_R009_ueqv_R009NYNYN_partial_28_0271,
  rs_R009_ueqv_R009NYNYN_partial_28_0272,
  rs_R009_ueqv_R009NYNYN_partial_28_0273,
  rs_R009_ueqv_R009NYNYN_partial_28_0274,
  rs_R009_ueqv_R009NYNYN_partial_28_0275,
  rs_R009_ueqv_R009NYNYN_partial_28_0276,
  rs_R009_ueqv_R009NYNYN_partial_28_0277,
  rs_R009_ueqv_R009NYNYN_partial_28_0278,
  rs_R009_ueqv_R009NYNYN_partial_28_0279,
  rs_R009_ueqv_R009NYNYN_partial_28_0280,
  rs_R009_ueqv_R009NYNYN_partial_28_0281,
  rs_R009_ueqv_R009NYNYN_partial_28_0282,
  rs_R009_ueqv_R009NYNYN_partial_28_0283,
  rs_R009_ueqv_R009NYNYN_partial_28_0284,
  rs_R009_ueqv_R009NYNYN_partial_28_0285,
  rs_R009_ueqv_R009NYNYN_partial_28_0286,
  rs_R009_ueqv_R009NYNYN_partial_28_0287,
  rs_R009_ueqv_R009NYNYN_partial_28_0288,
  rs_R009_ueqv_R009NYNYN_partial_28_0289,
  rs_R009_ueqv_R009NYNYN_partial_28_0290,
  rs_R009_ueqv_R009NYNYN_partial_28_0291,
  rs_R009_ueqv_R009NYNYN_partial_28_0292,
  rs_R009_ueqv_R009NYNYN_partial_28_0293,
  rs_R009_ueqv_R009NYNYN_partial_28_0294,
  rs_R009_ueqv_R009NYNYN_partial_28_0295,
  rs_R009_ueqv_R009NYNYN_partial_28_0296,
  rs_R009_ueqv_R009NYNYN_partial_28_0297,
  rs_R009_ueqv_R009NYNYN_partial_28_0298,
  rs_R009_ueqv_R009NYNYN_partial_28_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0200_0299 : Poly :=
[
  term ((-25943905781778190061324824861038604733249580807608 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2)],
  term ((-64366110563275068430131081614900729129808749353522 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 2), (12, 1)],
  term ((128732221126550136860262163229801458259617498707044 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((23297665772916168717299614067586317783486707632464 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2), (14, 1)],
  term ((57180291581280422810700071308981783366024907965504 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 2), (14, 2)],
  term ((210287731035884667008224618846026910685559581570745217715655703661833953702215809 : Rat) / 153779183100053648786480267585281297247773570981491065106348024895895551080000) [(0, 1), (12, 1)],
  term ((-32212399862845086615989863740567042908138260130688 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((23717798661982606280082910417130270740215419114917 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-174001656056841881771564671250555038185561457422496 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2)],
  term ((57049723297325207138217925000181979732970969646720 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-27682407500278589874451995839259920588485328331140052113565130609764658111429628 : Rat) / 7208399207815014786866262543060060808489386139757393676860063666995103956875) [(0, 1), (12, 1), (14, 1)],
  term ((-106541974027374070796651473123421822239298159948888 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1547628846717524952041984 : Rat) / 24105507332629970868075) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((254973846901260874957790010318236726774851761884246014487117068526967198459100669 : Rat) / 115334387325040236589860200688960972935830178236118298829761018671921663310000) [(0, 1), (12, 1), (14, 2)],
  term ((6297785076613388464554064 : Rat) / 168738551328409796076525) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((53270987013687035398325736561710911119649079974444 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (12, 1), (15, 2)],
  term ((1280751564785996738669476 : Rat) / 56246183776136598692175) [(0, 1), (12, 1), (16, 1)],
  term ((37608159749921857696158205437808277867722791620423 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (12, 2)],
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-75216319499843715392316410875616555735445583240846 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (12, 2), (14, 1)],
  term ((30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-15223197461120125944175957093693498572292578099146 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (12, 2), (15, 2)],
  term ((-1084088390140434122377199496200669022948711228221938 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((106541974027374070796651473123421822239298159948888 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((302324753508625401896133933572635411435934754225971 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 1), (15, 1)],
  term ((733066219597425158349052650545698556329236911648531 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 2)],
  term ((-1604025985771388308752709326578788085155449535069168 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 2), (14, 1)],
  term ((13132718721575046862343240522608664047331020168772 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (13, 2), (14, 2)],
  term ((941749922160714650954087730844783855643448183484 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (14, 1)],
  term ((-22405350942526409451724840734329105455069713475300 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (14, 1), (15, 2)],
  term ((-1883499844321429301908175461689567711286896366968 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (14, 2)],
  term ((11202675471263204725862420367164552727534856737650 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (15, 2)],
  term ((-222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 934650305641351711522767058448053468552469947085985580893283342197275904000) [(0, 2)],
  term ((131441795599175998766920933966543377561033142710737558202844032258693405551 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(0, 2), (14, 1)],
  term ((-882279375742283788 : Rat) / 712202390327782193) [(0, 2), (14, 1), (16, 1)],
  term ((338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 473960601238007967303634410977714740645268735844820274286654838842432000) [(0, 2), (14, 2)],
  term ((48955777362237264658 : Rat) / 3561011951638910965) [(0, 2), (14, 2), (16, 1)],
  term ((-20066491802407213389 : Rat) / 7122023903277821930) [(0, 2), (16, 1)],
  term ((-880426262789902085328455266732881985478459401324 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1)],
  term ((-183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-2200327557026874997711798872369759306709428641280 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1)],
  term ((3667212595044791662852998120616265511182381068800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1)],
  term ((-513739661558136156928 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 2)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((245819464995871850932 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2)],
  term ((-2933770076035833330282398496493012408945904855040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2), (14, 1)],
  term ((-88402926265569820256 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((550081889256718749427949718092439826677357160320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((172636378522318949360 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 2)],
  term ((301071293911852988592 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((-161586012739122721828 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((-2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((5153027906979264350992427651533900819536183170800 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-498315127045142391624 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-94441170427415024695468935016218069493670026188 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1)],
  term ((-341201572290089720709741978105273015427113898720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)],
  term ((604532005047416475229 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 2)],
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((-100079185522522174953 : Rat) / 35422516446182843438) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 2)],
  term ((-2120335652579679080402719392550836617657815804384 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (12, 2), (14, 1)],
  term ((-384089174440954997768 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (12, 2), (16, 1)],
  term ((47997418416343660666487554684517464453684779736984 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((337058200434359369362 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23998709208171830333243777342258732226842389868492 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (13, 2), (14, 1)],
  term ((39498904115943516219958454855232295265023668168 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)],
  term ((-168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((163646343834493520307 : Rat) / 495915230246559808132) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((1230768612434884400556230685328054816542464851552 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-11602254242445340919 : Rat) / 13050400795962100214) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)],
  term ((38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((4056891912283425511 : Rat) / 70845032892365686876) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((73471204997220050333582277211567643434030389288280 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (8, 1), (11, 1)],
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1)],
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (8, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)],
  term ((-52490955640429147619600979133445109247387852076408 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((-45391841664004110472 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((26245477820214573809800489566722554623693926038204 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((22695920832002055236 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3186322267915905705778070514322712522112529726160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1)],
  term ((440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1)],
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1247699653979282755807923735673918449244266688320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1)],
  term ((561279223217620411936 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2)],
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-40880684928629759962 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)],
  term ((6115869039873338195953272462313587443822104683760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (12, 1)],
  term ((-12231738079746676391906544924627174887644209367520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1)],
  term ((-183392298822263866754 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((91696149411131933377 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (12, 1), (16, 1)],
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((-587318929649869059681749282408194598750685720960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1)],
  term ((-4944164798979218360 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (9, 1), (13, 2), (16, 1)],
  term ((423725381328172115485344933345662792511574654400 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-40235109270164320622 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((6813133733069213206317452990451570993288073743040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((-28556488151046848464 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((27256676672843872427 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((29371041068691165695687852935938891908958585756480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1)],
  term ((-58008639618373373058805106247754530715680695299200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1373677930129636257288 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((697889330848014356176 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((16495949805397093787174928769470052536492653226240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((684045669410872544768 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8247974902698546893587464384735026268246326613120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-342022834705436272384 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1)],
  term ((31399806626081691759085399280757225917629915225600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((780837930086939586496 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2033288325003275602057357198876015250620286455040 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-346217501910684883120 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1016644162501637801028678599438007625310143227520 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((173108750955342441560 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25539619630776342682198725562606524005323958199568 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((50895878631800445781254801219182234735088797345696 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)],
  term ((-7249342272133860296 : Rat) / 6525200397981050107) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 2)],
  term ((-301071293911852988592 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((724304397302688040 : Rat) / 623009083224321367) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((63665563913852136583114976451276853478327067568 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-69550542463602246554 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31832781956926068291557488225638426739163533784 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((34775271231801123277 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-778514032444475729820607749109588865264556065730460 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1)],
  term ((1592359599967521650713576882786452475887581451998 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-3184719199935043301427153765572904951775162903996 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-63153045145687417192 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((31576522572843708596 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-410158792619943160048358352389377995320189700932672 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1)],
  term ((1557028064888951459641215498219177730529112131460920 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0200_0299
      rs_R009_ueqv_R009NYNYN_block_28_0200_0299 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
