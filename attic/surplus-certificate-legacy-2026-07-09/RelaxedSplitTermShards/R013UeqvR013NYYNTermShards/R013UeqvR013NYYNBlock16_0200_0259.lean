/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NYYN, term block 16:200-259

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NYYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013NYYN`. -/
def rs_R013_ueqv_R013NYYN_generator_16_0200_0259 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0200 : Poly :=
[
  term ((33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0200 : Poly :=
[
  term ((66298575767239156133840421651644119797446762655509704352 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0200_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0200
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0201 : Poly :=
[
  term ((-657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0201 : Poly :=
[
  term ((-1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0201_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0201
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0202 : Poly :=
[
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0202 : Poly :=
[
  term ((1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0202_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0202
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0203 : Poly :=
[
  term ((-4379726730309691474571821425819055447658985967798 : Rat) / 41216912451360009078689742174293216302560138512535) [(4, 1), (16, 1)]
]

/-- Partial product 203 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0203 : Poly :=
[
  term ((-8759453460619382949143642851638110895317971935596 : Rat) / 41216912451360009078689742174293216302560138512535) [(4, 1), (6, 1), (16, 1)],
  term ((4379726730309691474571821425819055447658985967798 : Rat) / 41216912451360009078689742174293216302560138512535) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0203_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0203
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0204 : Poly :=
[
  term ((-13165899689128867949275206159697120796156820872434242176 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 204 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0204 : Poly :=
[
  term ((13165899689128867949275206159697120796156820872434242176 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-26331799378257735898550412319394241592313641744868484352 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0204_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0204
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0205 : Poly :=
[
  term ((52633306597394185365980514784667607394143355801154235232 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 205 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0205 : Poly :=
[
  term ((-52633306597394185365980514784667607394143355801154235232 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((105266613194788370731961029569335214788286711602308470464 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(5, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0205_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0205
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0206 : Poly :=
[
  term ((434192906949039695314550780297382366409581873376956958976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 206 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0206 : Poly :=
[
  term ((-434192906949039695314550780297382366409581873376956958976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0206_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0206
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0207 : Poly :=
[
  term ((2850291667798319588767616292188406885891767140321784304136 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0207 : Poly :=
[
  term ((-2850291667798319588767616292188406885891767140321784304136 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((5700583335596639177535232584376813771783534280643568608272 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0207_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0207
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0208 : Poly :=
[
  term ((13165899689128867949275206159697120796156820872434242176 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 208 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0208 : Poly :=
[
  term ((26331799378257735898550412319394241592313641744868484352 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-13165899689128867949275206159697120796156820872434242176 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0208_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0208
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0209 : Poly :=
[
  term ((-14766529363607995687370989686425657715547244075680972992 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 209 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0209 : Poly :=
[
  term ((-29533058727215991374741979372851315431094488151361945984 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((14766529363607995687370989686425657715547244075680972992 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0209_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0209
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0210 : Poly :=
[
  term ((-88332168168008697082880089770253422209759288769824512 : Rat) / 44526172555510313807607654140420358313696800300219199) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 210 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0210 : Poly :=
[
  term ((-176664336336017394165760179540506844419518577539649024 : Rat) / 44526172555510313807607654140420358313696800300219199) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((88332168168008697082880089770253422209759288769824512 : Rat) / 44526172555510313807607654140420358313696800300219199) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0210_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0210
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0211 : Poly :=
[
  term ((34279798369991541904189074584316659179436951166816407536 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 211 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0211 : Poly :=
[
  term ((68559596739983083808378149168633318358873902333632815072 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-34279798369991541904189074584316659179436951166816407536 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0211_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0211
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0212 : Poly :=
[
  term ((-1401378936692044817998192879709093514687827285675585073536 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0212 : Poly :=
[
  term ((-2802757873384089635996385759418187029375654571351170147072 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((1401378936692044817998192879709093514687827285675585073536 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0212_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0212
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0213 : Poly :=
[
  term ((-2694739115623610858805808630393567625306366265987105836896 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0213 : Poly :=
[
  term ((-5389478231247221717611617260787135250612732531974211673792 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2694739115623610858805808630393567625306366265987105836896 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0213_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0213
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0214 : Poly :=
[
  term ((-8602214696484109481169599815418942548199664654436682752 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 214 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0214 : Poly :=
[
  term ((-17204429392968218962339199630837885096399329308873365504 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((8602214696484109481169599815418942548199664654436682752 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0214_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0214
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0215 : Poly :=
[
  term ((463869345134959626907629744446158827088137663296 : Rat) / 532518248725581512644570312329369719671319619025) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 215 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0215 : Poly :=
[
  term ((927738690269919253815259488892317654176275326592 : Rat) / 532518248725581512644570312329369719671319619025) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-463869345134959626907629744446158827088137663296 : Rat) / 532518248725581512644570312329369719671319619025) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0215_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0215
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0216 : Poly :=
[
  term ((-2588255619564057208393809175420354588570403712418924206536 : Rat) / 1506614509382568247856145408367443675915840699091399886625) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 216 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0216 : Poly :=
[
  term ((-5176511239128114416787618350840709177140807424837848413072 : Rat) / 1506614509382568247856145408367443675915840699091399886625) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((2588255619564057208393809175420354588570403712418924206536 : Rat) / 1506614509382568247856145408367443675915840699091399886625) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0216_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0216
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0217 : Poly :=
[
  term ((290487126806226314525196628370835367583733848387966305984 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0217 : Poly :=
[
  term ((580974253612452629050393256741670735167467696775932611968 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-290487126806226314525196628370835367583733848387966305984 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0217_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0217
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0218 : Poly :=
[
  term ((-82485663885917401902226061634577374279767909677520174912 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 218 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0218 : Poly :=
[
  term ((-164971327771834803804452123269154748559535819355040349824 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((82485663885917401902226061634577374279767909677520174912 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0218_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0218
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0219 : Poly :=
[
  term ((41629229318856036431325696302492793542289145341419155982008 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 219 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0219 : Poly :=
[
  term ((83258458637712072862651392604985587084578290682838311964016 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-41629229318856036431325696302492793542289145341419155982008 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0219_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0219
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0220 : Poly :=
[
  term ((-6331502615081435055167728175994600074402521454218276136972 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0220 : Poly :=
[
  term ((-12663005230162870110335456351989200148805042908436552273944 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((6331502615081435055167728175994600074402521454218276136972 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0220_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0220
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0221 : Poly :=
[
  term ((1518516454104854345580720289526750294627807509065380384 : Rat) / 667892588332654707114114812106305374705452004503287985) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 221 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0221 : Poly :=
[
  term ((-1518516454104854345580720289526750294627807509065380384 : Rat) / 667892588332654707114114812106305374705452004503287985) [(5, 2), (6, 1), (16, 1)],
  term ((3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(5, 2), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0221_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0221
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0222 : Poly :=
[
  term ((-1518516454104854345580720289526750294627807509065380384 : Rat) / 222630862777551569038038270702101791568484001501095995) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 222 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0222 : Poly :=
[
  term ((-3037032908209708691161440579053500589255615018130760768 : Rat) / 222630862777551569038038270702101791568484001501095995) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((1518516454104854345580720289526750294627807509065380384 : Rat) / 222630862777551569038038270702101791568484001501095995) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0222_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0222
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0223 : Poly :=
[
  term ((-59591946281150090319927624531008766059555159911807495696 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 2), (16, 1)]
]

/-- Partial product 223 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0223 : Poly :=
[
  term ((-119183892562300180639855249062017532119110319823614991392 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 2), (6, 1), (16, 1)],
  term ((59591946281150090319927624531008766059555159911807495696 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0223_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0223
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0224 : Poly :=
[
  term ((-8774180302384907280228159472486458958714872545009138392 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 224 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0224 : Poly :=
[
  term ((8774180302384907280228159472486458958714872545009138392 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-17548360604769814560456318944972917917429745090018276784 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0224_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0224
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0225 : Poly :=
[
  term ((-166672607073947019936489830267316911595804664974790603688 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0225 : Poly :=
[
  term ((166672607073947019936489830267316911595804664974790603688 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-333345214147894039872979660534633823191609329949581207376 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0225_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0225
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0226 : Poly :=
[
  term ((-5335139020437588543816015112124638934769398394365292048368 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0226 : Poly :=
[
  term ((5335139020437588543816015112124638934769398394365292048368 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10670278040875177087632030224249277869538796788730584096736 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0226_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0226
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0227 : Poly :=
[
  term ((8774180302384907280228159472486458958714872545009138392 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 227 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0227 : Poly :=
[
  term ((17548360604769814560456318944972917917429745090018276784 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-8774180302384907280228159472486458958714872545009138392 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0227_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0227
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0228 : Poly :=
[
  term ((166672607073947019936489830267316911595804664974790603688 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 228 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0228 : Poly :=
[
  term ((333345214147894039872979660534633823191609329949581207376 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-166672607073947019936489830267316911595804664974790603688 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0228_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0228
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0229 : Poly :=
[
  term ((5335139020437588543816015112124638934769398394365292048368 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0229 : Poly :=
[
  term ((10670278040875177087632030224249277869538796788730584096736 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5335139020437588543816015112124638934769398394365292048368 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0229_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0229
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0230 : Poly :=
[
  term ((-58974405875570487027242351823484876948868226227440077272 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 230 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0230 : Poly :=
[
  term ((-117948811751140974054484703646969753897736452454880154544 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((58974405875570487027242351823484876948868226227440077272 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0230_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0230
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0231 : Poly :=
[
  term ((160970924114842504856835200957780210134148816062336791568 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 231 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0231 : Poly :=
[
  term ((321941848229685009713670401915560420268297632124673583136 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-160970924114842504856835200957780210134148816062336791568 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0231_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0231
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0232 : Poly :=
[
  term ((-1023318422421076068789139694568250187140513853115485772424 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0232 : Poly :=
[
  term ((-2046636844842152137578279389136500374281027706230971544848 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1023318422421076068789139694568250187140513853115485772424 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0232_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0232
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0233 : Poly :=
[
  term ((-15548612412363718212644484904221278134712459978197473424 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 233 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0233 : Poly :=
[
  term ((-31097224824727436425288969808442556269424919956394946848 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((15548612412363718212644484904221278134712459978197473424 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0233_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0233
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0234 : Poly :=
[
  term ((49395801379052895531760398199790837565427367413627533512 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 234 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0234 : Poly :=
[
  term ((98791602758105791063520796399581675130854734827255067024 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-49395801379052895531760398199790837565427367413627533512 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0234_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0234
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0235 : Poly :=
[
  term ((-500370077164152882403913413710168392350188759503385480368 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0235 : Poly :=
[
  term ((-1000740154328305764807826827420336784700377519006770960736 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((500370077164152882403913413710168392350188759503385480368 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0235_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0235
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0236 : Poly :=
[
  term ((9180950665244181943997606191983760497247295257928 : Rat) / 29440651750971435056206958695923725930400098937525) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0236 : Poly :=
[
  term ((18361901330488363887995212383967520994494590515856 : Rat) / 29440651750971435056206958695923725930400098937525) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9180950665244181943997606191983760497247295257928 : Rat) / 29440651750971435056206958695923725930400098937525) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0236_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0236
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0237 : Poly :=
[
  term ((-17025537591293671576104393011932030787385992242051533236 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 237 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0237 : Poly :=
[
  term ((-34051075182587343152208786023864061574771984484103066472 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((17025537591293671576104393011932030787385992242051533236 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0237_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0237
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0238 : Poly :=
[
  term ((-3832847376382047559571299276217903611593375049815430453532 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0238 : Poly :=
[
  term ((-7665694752764095119142598552435807223186750099630860907064 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3832847376382047559571299276217903611593375049815430453532 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0238_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0238
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0239 : Poly :=
[
  term ((-1998523210687014708995540658490811352624417264340947241768 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0239 : Poly :=
[
  term ((-3997046421374029417991081316981622705248834528681894483536 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1998523210687014708995540658490811352624417264340947241768 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0239_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0239
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0240 : Poly :=
[
  term ((-699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(9, 2), (16, 1)]
]

/-- Partial product 240 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0240 : Poly :=
[
  term ((-1398570887526174642560058489246961416856298271355904 : Rat) / 288518387159520063550828195220052514117920969587745) [(6, 1), (9, 2), (16, 1)],
  term ((699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0240_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0240
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0241 : Poly :=
[
  term ((-4980485034285542652512929215123813312057814929137824 : Rat) / 1442591935797600317754140976100262570589604847938725) [(10, 1), (16, 1)]
]

/-- Partial product 241 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0241 : Poly :=
[
  term ((-9960970068571085305025858430247626624115629858275648 : Rat) / 1442591935797600317754140976100262570589604847938725) [(6, 1), (10, 1), (16, 1)],
  term ((4980485034285542652512929215123813312057814929137824 : Rat) / 1442591935797600317754140976100262570589604847938725) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0241_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0241
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0242 : Poly :=
[
  term ((-321119739449137141027158102158647134249967076222974875376 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0242 : Poly :=
[
  term ((-642239478898274282054316204317294268499934152445949750752 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((321119739449137141027158102158647134249967076222974875376 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0242_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0242
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0243 : Poly :=
[
  term ((222900895541357447811140984273662520494572805206384887472 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 243 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0243 : Poly :=
[
  term ((445801791082714895622281968547325040989145610412769774944 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-222900895541357447811140984273662520494572805206384887472 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0243_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0243
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0244 : Poly :=
[
  term ((-398884921704669930544097903623417640727943473000151587752 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 244 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0244 : Poly :=
[
  term ((-797769843409339861088195807246835281455886946000303175504 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((398884921704669930544097903623417640727943473000151587752 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0244_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0244
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0245 : Poly :=
[
  term ((-143432121943214732921617036947423587017031532576496 : Rat) / 1442591935797600317754140976100262570589604847938725) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0245 : Poly :=
[
  term ((-286864243886429465843234073894847174034063065152992 : Rat) / 1442591935797600317754140976100262570589604847938725) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((143432121943214732921617036947423587017031532576496 : Rat) / 1442591935797600317754140976100262570589604847938725) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0245_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0245
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0246 : Poly :=
[
  term ((2293678845001209634243786050196387717768880164360525560136 : Rat) / 3515433855225992578331005952857368577136961631213266402125) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0246 : Poly :=
[
  term ((4587357690002419268487572100392775435537760328721051120272 : Rat) / 3515433855225992578331005952857368577136961631213266402125) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2293678845001209634243786050196387717768880164360525560136 : Rat) / 3515433855225992578331005952857368577136961631213266402125) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0246_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0246
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0247 : Poly :=
[
  term ((143260813894605339570438101395846467001274450368 : Rat) / 684666319790033373400161830137761068148839510175) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 247 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0247 : Poly :=
[
  term ((286521627789210679140876202791692934002548900736 : Rat) / 684666319790033373400161830137761068148839510175) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-143260813894605339570438101395846467001274450368 : Rat) / 684666319790033373400161830137761068148839510175) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0247_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0247
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0248 : Poly :=
[
  term ((-71630406947302669785219050697923233500637225184 : Rat) / 228222106596677791133387276712587022716279836725) [(11, 2), (16, 1)]
]

/-- Partial product 248 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0248 : Poly :=
[
  term ((-143260813894605339570438101395846467001274450368 : Rat) / 228222106596677791133387276712587022716279836725) [(6, 1), (11, 2), (16, 1)],
  term ((71630406947302669785219050697923233500637225184 : Rat) / 228222106596677791133387276712587022716279836725) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0248_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0248
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0249 : Poly :=
[
  term ((17750167484311313698379389565594831797171690961095277284112 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0249 : Poly :=
[
  term ((35500334968622627396758779131189663594343381922190554568224 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17750167484311313698379389565594831797171690961095277284112 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0249_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0249
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0250 : Poly :=
[
  term ((92907922926897403701327159319047598659173231401378001578912 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 250 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0250 : Poly :=
[
  term ((185815845853794807402654318638095197318346462802756003157824 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-92907922926897403701327159319047598659173231401378001578912 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0250_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0250
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0251 : Poly :=
[
  term ((-66589692661770443609385064754460960683494142160532 : Rat) / 33548649669711635296607929676750292339293135998575) [(12, 1), (16, 1)]
]

/-- Partial product 251 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0251 : Poly :=
[
  term ((-133179385323540887218770129508921921366988284321064 : Rat) / 33548649669711635296607929676750292339293135998575) [(6, 1), (12, 1), (16, 1)],
  term ((66589692661770443609385064754460960683494142160532 : Rat) / 33548649669711635296607929676750292339293135998575) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0251_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0251
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0252 : Poly :=
[
  term ((-27088875189403586095127465475462206448588712857718 : Rat) / 480863978599200105918046992033420856863201615979575) [(12, 2), (16, 1)]
]

/-- Partial product 252 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0252 : Poly :=
[
  term ((-54177750378807172190254930950924412897177425715436 : Rat) / 480863978599200105918046992033420856863201615979575) [(6, 1), (12, 2), (16, 1)],
  term ((27088875189403586095127465475462206448588712857718 : Rat) / 480863978599200105918046992033420856863201615979575) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0252_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0252
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0253 : Poly :=
[
  term ((-360342413635765840290265793791226154521293606744176786464 : Rat) / 4675248118328582949798803684744137622938164031523015895) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0253 : Poly :=
[
  term ((-720684827271531680580531587582452309042587213488353572928 : Rat) / 4675248118328582949798803684744137622938164031523015895) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((360342413635765840290265793791226154521293606744176786464 : Rat) / 4675248118328582949798803684744137622938164031523015895) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0253_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0253
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0254 : Poly :=
[
  term ((5846153083071984762631623009153553897580273089231902599648 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0254 : Poly :=
[
  term ((11692306166143969525263246018307107795160546178463805199296 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5846153083071984762631623009153553897580273089231902599648 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0254_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0254
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0255 : Poly :=
[
  term ((-571135045924685932249631913555844899286971668837922927632 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 255 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0255 : Poly :=
[
  term ((-1142270091849371864499263827111689798573943337675845855264 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((571135045924685932249631913555844899286971668837922927632 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0255_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0255
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0256 : Poly :=
[
  term ((8519449716850128032111222977036531882299445336649022409954 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(13, 2), (16, 1)]
]

/-- Partial product 256 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0256 : Poly :=
[
  term ((17038899433700256064222445954073063764598890673298044819908 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (13, 2), (16, 1)],
  term ((-8519449716850128032111222977036531882299445336649022409954 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0256_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0256
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0257 : Poly :=
[
  term ((-2321512227035522573541881243021361926544846277234004 : Rat) / 288518387159520063550828195220052514117920969587745) [(14, 1), (16, 1)]
]

/-- Partial product 257 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0257 : Poly :=
[
  term ((-4643024454071045147083762486042723853089692554468008 : Rat) / 288518387159520063550828195220052514117920969587745) [(6, 1), (14, 1), (16, 1)],
  term ((2321512227035522573541881243021361926544846277234004 : Rat) / 288518387159520063550828195220052514117920969587745) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0257_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0257
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0258 : Poly :=
[
  term ((-2729580916821267053439785694147112741809447994036536921704 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(15, 2), (16, 1)]
]

/-- Partial product 258 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0258 : Poly :=
[
  term ((-5459161833642534106879571388294225483618895988073073843408 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 1), (15, 2), (16, 1)],
  term ((2729580916821267053439785694147112741809447994036536921704 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0258_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0258
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0259 : Poly :=
[
  term ((288890272342578669546523757247379094903637857112304 : Rat) / 41216912451360009078689742174293216302560138512535) [(16, 1)]
]

/-- Partial product 259 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0259 : Poly :=
[
  term ((577780544685157339093047514494758189807275714224608 : Rat) / 41216912451360009078689742174293216302560138512535) [(6, 1), (16, 1)],
  term ((-288890272342578669546523757247379094903637857112304 : Rat) / 41216912451360009078689742174293216302560138512535) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0259_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0259
        rs_R013_ueqv_R013NYYN_generator_16_0200_0259 =
      rs_R013_ueqv_R013NYYN_partial_16_0259 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NYYN_partials_16_0200_0259 : List Poly :=
[
  rs_R013_ueqv_R013NYYN_partial_16_0200,
  rs_R013_ueqv_R013NYYN_partial_16_0201,
  rs_R013_ueqv_R013NYYN_partial_16_0202,
  rs_R013_ueqv_R013NYYN_partial_16_0203,
  rs_R013_ueqv_R013NYYN_partial_16_0204,
  rs_R013_ueqv_R013NYYN_partial_16_0205,
  rs_R013_ueqv_R013NYYN_partial_16_0206,
  rs_R013_ueqv_R013NYYN_partial_16_0207,
  rs_R013_ueqv_R013NYYN_partial_16_0208,
  rs_R013_ueqv_R013NYYN_partial_16_0209,
  rs_R013_ueqv_R013NYYN_partial_16_0210,
  rs_R013_ueqv_R013NYYN_partial_16_0211,
  rs_R013_ueqv_R013NYYN_partial_16_0212,
  rs_R013_ueqv_R013NYYN_partial_16_0213,
  rs_R013_ueqv_R013NYYN_partial_16_0214,
  rs_R013_ueqv_R013NYYN_partial_16_0215,
  rs_R013_ueqv_R013NYYN_partial_16_0216,
  rs_R013_ueqv_R013NYYN_partial_16_0217,
  rs_R013_ueqv_R013NYYN_partial_16_0218,
  rs_R013_ueqv_R013NYYN_partial_16_0219,
  rs_R013_ueqv_R013NYYN_partial_16_0220,
  rs_R013_ueqv_R013NYYN_partial_16_0221,
  rs_R013_ueqv_R013NYYN_partial_16_0222,
  rs_R013_ueqv_R013NYYN_partial_16_0223,
  rs_R013_ueqv_R013NYYN_partial_16_0224,
  rs_R013_ueqv_R013NYYN_partial_16_0225,
  rs_R013_ueqv_R013NYYN_partial_16_0226,
  rs_R013_ueqv_R013NYYN_partial_16_0227,
  rs_R013_ueqv_R013NYYN_partial_16_0228,
  rs_R013_ueqv_R013NYYN_partial_16_0229,
  rs_R013_ueqv_R013NYYN_partial_16_0230,
  rs_R013_ueqv_R013NYYN_partial_16_0231,
  rs_R013_ueqv_R013NYYN_partial_16_0232,
  rs_R013_ueqv_R013NYYN_partial_16_0233,
  rs_R013_ueqv_R013NYYN_partial_16_0234,
  rs_R013_ueqv_R013NYYN_partial_16_0235,
  rs_R013_ueqv_R013NYYN_partial_16_0236,
  rs_R013_ueqv_R013NYYN_partial_16_0237,
  rs_R013_ueqv_R013NYYN_partial_16_0238,
  rs_R013_ueqv_R013NYYN_partial_16_0239,
  rs_R013_ueqv_R013NYYN_partial_16_0240,
  rs_R013_ueqv_R013NYYN_partial_16_0241,
  rs_R013_ueqv_R013NYYN_partial_16_0242,
  rs_R013_ueqv_R013NYYN_partial_16_0243,
  rs_R013_ueqv_R013NYYN_partial_16_0244,
  rs_R013_ueqv_R013NYYN_partial_16_0245,
  rs_R013_ueqv_R013NYYN_partial_16_0246,
  rs_R013_ueqv_R013NYYN_partial_16_0247,
  rs_R013_ueqv_R013NYYN_partial_16_0248,
  rs_R013_ueqv_R013NYYN_partial_16_0249,
  rs_R013_ueqv_R013NYYN_partial_16_0250,
  rs_R013_ueqv_R013NYYN_partial_16_0251,
  rs_R013_ueqv_R013NYYN_partial_16_0252,
  rs_R013_ueqv_R013NYYN_partial_16_0253,
  rs_R013_ueqv_R013NYYN_partial_16_0254,
  rs_R013_ueqv_R013NYYN_partial_16_0255,
  rs_R013_ueqv_R013NYYN_partial_16_0256,
  rs_R013_ueqv_R013NYYN_partial_16_0257,
  rs_R013_ueqv_R013NYYN_partial_16_0258,
  rs_R013_ueqv_R013NYYN_partial_16_0259
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NYYN_block_16_0200_0259 : Poly :=
[
  term ((66298575767239156133840421651644119797446762655509704352 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-8759453460619382949143642851638110895317971935596 : Rat) / 41216912451360009078689742174293216302560138512535) [(4, 1), (6, 1), (16, 1)],
  term ((-33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (15, 2), (16, 1)],
  term ((4379726730309691474571821425819055447658985967798 : Rat) / 41216912451360009078689742174293216302560138512535) [(4, 1), (16, 1)],
  term ((26331799378257735898550412319394241592313641744868484352 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-29533058727215991374741979372851315431094488151361945984 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-176664336336017394165760179540506844419518577539649024 : Rat) / 44526172555510313807607654140420358313696800300219199) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((68559596739983083808378149168633318358873902333632815072 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2802757873384089635996385759418187029375654571351170147072 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-5389478231247221717611617260787135250612732531974211673792 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1346176567946450337687997823713588100080836145479707776 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((927738690269919253815259488892317654176275326592 : Rat) / 532518248725581512644570312329369719671319619025) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18108565740656658333295900276970840293735446708770102765584 : Rat) / 4519843528147704743568436225102331027747522097274199659875) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((580974253612452629050393256741670735167467696775932611968 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-164971327771834803804452123269154748559535819355040349824 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((5521617715384202211155789454979213647877913920630757000336 : Rat) / 70128721774928744246982055271162064344072460472845238425) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-22055105939537556713481632684044802543305660560834848557952 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-26331799378257735898550412319394241592313641744868484352 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((105266613194788370731961029569335214788286711602308470464 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((5700583335596639177535232584376813771783534280643568608272 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-13165899689128867949275206159697120796156820872434242176 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((14766529363607995687370989686425657715547244075680972992 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (7, 1), (16, 1)],
  term ((88332168168008697082880089770253422209759288769824512 : Rat) / 44526172555510313807607654140420358313696800300219199) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-34279798369991541904189074584316659179436951166816407536 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1401378936692044817998192879709093514687827285675585073536 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((2694739115623610858805808630393567625306366265987105836896 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((8602214696484109481169599815418942548199664654436682752 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (9, 1), (16, 1)],
  term ((-463869345134959626907629744446158827088137663296 : Rat) / 532518248725581512644570312329369719671319619025) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((2588255619564057208393809175420354588570403712418924206536 : Rat) / 1506614509382568247856145408367443675915840699091399886625) [(5, 1), (11, 1), (16, 1)],
  term ((-290487126806226314525196628370835367583733848387966305984 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((82485663885917401902226061634577374279767909677520174912 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41629229318856036431325696302492793542289145341419155982008 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(5, 1), (13, 1), (16, 1)],
  term ((6331502615081435055167728175994600074402521454218276136972 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(5, 1), (15, 1), (16, 1)],
  term ((-3037032908209708691161440579053500589255615018130760768 : Rat) / 222630862777551569038038270702101791568484001501095995) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-42258824944274817455919616836550427864083119122980631104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(5, 2), (6, 1), (16, 1)],
  term ((3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(5, 2), (6, 2), (16, 1)],
  term ((1518516454104854345580720289526750294627807509065380384 : Rat) / 222630862777551569038038270702101791568484001501095995) [(5, 2), (8, 1), (16, 1)],
  term ((59591946281150090319927624531008766059555159911807495696 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(5, 2), (16, 1)],
  term ((17548360604769814560456318944972917917429745090018276784 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((333345214147894039872979660534633823191609329949581207376 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((10670278040875177087632030224249277869538796788730584096736 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-117948811751140974054484703646969753897736452454880154544 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((321941848229685009713670401915560420268297632124673583136 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2046636844842152137578279389136500374281027706230971544848 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-31097224824727436425288969808442556269424919956394946848 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((98791602758105791063520796399581675130854734827255067024 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1000740154328305764807826827420336784700377519006770960736 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((18361901330488363887995212383967520994494590515856 : Rat) / 29440651750971435056206958695923725930400098937525) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1104076325061803044503472515200669242661052407010807328 : Rat) / 18448340931215121402320147857560534807132743254180406775) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2277443905798120006486716467033074221735908924918969296208 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((446030866354519708608311265047672076506854621894465854944 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1398570887526174642560058489246961416856298271355904 : Rat) / 288518387159520063550828195220052514117920969587745) [(6, 1), (9, 2), (16, 1)],
  term ((-9960970068571085305025858430247626624115629858275648 : Rat) / 1442591935797600317754140976100262570589604847938725) [(6, 1), (10, 1), (16, 1)],
  term ((-642239478898274282054316204317294268499934152445949750752 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((445801791082714895622281968547325040989145610412769774944 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-797769843409339861088195807246835281455886946000303175504 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-286864243886429465843234073894847174034063065152992 : Rat) / 1442591935797600317754140976100262570589604847938725) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4587357690002419268487572100392775435537760328721051120272 : Rat) / 3515433855225992578331005952857368577136961631213266402125) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((286521627789210679140876202791692934002548900736 : Rat) / 684666319790033373400161830137761068148839510175) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-143260813894605339570438101395846467001274450368 : Rat) / 228222106596677791133387276712587022716279836725) [(6, 1), (11, 2), (16, 1)],
  term ((35500334968622627396758779131189663594343381922190554568224 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((185815845853794807402654318638095197318346462802756003157824 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-133179385323540887218770129508921921366988284321064 : Rat) / 33548649669711635296607929676750292339293135998575) [(6, 1), (12, 1), (16, 1)],
  term ((-54177750378807172190254930950924412897177425715436 : Rat) / 480863978599200105918046992033420856863201615979575) [(6, 1), (12, 2), (16, 1)],
  term ((-720684827271531680580531587582452309042587213488353572928 : Rat) / 4675248118328582949798803684744137622938164031523015895) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11692306166143969525263246018307107795160546178463805199296 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1142270091849371864499263827111689798573943337675845855264 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((17038899433700256064222445954073063764598890673298044819908 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 1), (13, 2), (16, 1)],
  term ((-4643024454071045147083762486042723853089692554468008 : Rat) / 288518387159520063550828195220052514117920969587745) [(6, 1), (14, 1), (16, 1)],
  term ((-5459161833642534106879571388294225483618895988073073843408 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 1), (15, 2), (16, 1)],
  term ((577780544685157339093047514494758189807275714224608 : Rat) / 41216912451360009078689742174293216302560138512535) [(6, 1), (16, 1)],
  term ((-17548360604769814560456318944972917917429745090018276784 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-333345214147894039872979660534633823191609329949581207376 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-10670278040875177087632030224249277869538796788730584096736 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8774180302384907280228159472486458958714872545009138392 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-166672607073947019936489830267316911595804664974790603688 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-5335139020437588543816015112124638934769398394365292048368 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((58974405875570487027242351823484876948868226227440077272 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(7, 1), (11, 1), (16, 1)],
  term ((-160970924114842504856835200957780210134148816062336791568 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(7, 1), (13, 1), (16, 1)],
  term ((1023318422421076068789139694568250187140513853115485772424 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(7, 1), (15, 1), (16, 1)],
  term ((15548612412363718212644484904221278134712459978197473424 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-49395801379052895531760398199790837565427367413627533512 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((500370077164152882403913413710168392350188759503385480368 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9180950665244181943997606191983760497247295257928 : Rat) / 29440651750971435056206958695923725930400098937525) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((17025537591293671576104393011932030787385992242051533236 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(9, 1), (11, 1), (16, 1)],
  term ((3832847376382047559571299276217903611593375049815430453532 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(9, 1), (13, 1), (16, 1)],
  term ((1998523210687014708995540658490811352624417264340947241768 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(9, 1), (15, 1), (16, 1)],
  term ((699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(9, 2), (16, 1)],
  term ((4980485034285542652512929215123813312057814929137824 : Rat) / 1442591935797600317754140976100262570589604847938725) [(10, 1), (16, 1)],
  term ((321119739449137141027158102158647134249967076222974875376 : Rat) / 129138386518505849816241035002923743649929202779262847425) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-222900895541357447811140984273662520494572805206384887472 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((398884921704669930544097903623417640727943473000151587752 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(11, 1), (13, 1), (16, 1)],
  term ((143432121943214732921617036947423587017031532576496 : Rat) / 1442591935797600317754140976100262570589604847938725) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2293678845001209634243786050196387717768880164360525560136 : Rat) / 3515433855225992578331005952857368577136961631213266402125) [(11, 1), (15, 1), (16, 1)],
  term ((-143260813894605339570438101395846467001274450368 : Rat) / 684666319790033373400161830137761068148839510175) [(11, 2), (14, 1), (16, 1)],
  term ((71630406947302669785219050697923233500637225184 : Rat) / 228222106596677791133387276712587022716279836725) [(11, 2), (16, 1)],
  term ((-17750167484311313698379389565594831797171690961095277284112 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92907922926897403701327159319047598659173231401378001578912 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(12, 1), (15, 2), (16, 1)],
  term ((66589692661770443609385064754460960683494142160532 : Rat) / 33548649669711635296607929676750292339293135998575) [(12, 1), (16, 1)],
  term ((27088875189403586095127465475462206448588712857718 : Rat) / 480863978599200105918046992033420856863201615979575) [(12, 2), (16, 1)],
  term ((360342413635765840290265793791226154521293606744176786464 : Rat) / 4675248118328582949798803684744137622938164031523015895) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5846153083071984762631623009153553897580273089231902599648 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(13, 1), (15, 1), (16, 1)],
  term ((571135045924685932249631913555844899286971668837922927632 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(13, 2), (14, 1), (16, 1)],
  term ((-8519449716850128032111222977036531882299445336649022409954 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(13, 2), (16, 1)],
  term ((2321512227035522573541881243021361926544846277234004 : Rat) / 288518387159520063550828195220052514117920969587745) [(14, 1), (16, 1)],
  term ((2729580916821267053439785694147112741809447994036536921704 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(15, 2), (16, 1)],
  term ((-288890272342578669546523757247379094903637857112304 : Rat) / 41216912451360009078689742174293216302560138512535) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 200 through 259. -/
theorem rs_R013_ueqv_R013NYYN_block_16_0200_0259_valid :
    checkProductSumEq rs_R013_ueqv_R013NYYN_partials_16_0200_0259
      rs_R013_ueqv_R013NYYN_block_16_0200_0259 = true := by
  native_decide

end R013UeqvR013NYYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
