/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:1300-1399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1300 : Poly :=
[
  term ((-368335641606755053426700800766691563200 : Rat) / 882871650430336260775660800750568550469) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1300 for generator 9. -/
def ep_Q1_009_partial_09_1300 : Poly :=
[
  term ((-736671283213510106853401601533383126400 : Rat) / 882871650430336260775660800750568550469) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((368335641606755053426700800766691563200 : Rat) / 882871650430336260775660800750568550469) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 9. -/
theorem ep_Q1_009_partial_09_1300_valid :
    mulPoly ep_Q1_009_coefficient_09_1300
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1301 : Poly :=
[
  term ((26991733456256791423825 : Rat) / 550157515040593707426) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1301 for generator 9. -/
def ep_Q1_009_partial_09_1301 : Poly :=
[
  term ((26991733456256791423825 : Rat) / 275078757520296853713) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-26991733456256791423825 : Rat) / 550157515040593707426) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 9. -/
theorem ep_Q1_009_partial_09_1301_valid :
    mulPoly ep_Q1_009_coefficient_09_1301
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1302 : Poly :=
[
  term ((86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(4, 1), (7, 1), (9, 1), (14, 2)]
]

/-- Partial product 1302 for generator 9. -/
def ep_Q1_009_partial_09_1302 : Poly :=
[
  term ((86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 2)],
  term ((-86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(4, 1), (7, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 9. -/
theorem ep_Q1_009_partial_09_1302_valid :
    mulPoly ep_Q1_009_coefficient_09_1302
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1303 : Poly :=
[
  term ((-19944005768419667345151 : Rat) / 519593208649449612569) [(4, 1), (7, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 1303 for generator 9. -/
def ep_Q1_009_partial_09_1303 : Poly :=
[
  term ((-39888011536839334690302 : Rat) / 519593208649449612569) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((19944005768419667345151 : Rat) / 519593208649449612569) [(4, 1), (7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 9. -/
theorem ep_Q1_009_partial_09_1303_valid :
    mulPoly ep_Q1_009_coefficient_09_1303
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1304 : Poly :=
[
  term ((-73504506915663873429529508055633524319298398235333517137472930353484720630796885185907825821542456705390096473669907 : Rat) / 946202716695920673660055682669894579050748383348517892669510630565400733843186139819689247008012617179632527188992) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 1304 for generator 9. -/
def ep_Q1_009_partial_09_1304 : Poly :=
[
  term ((-73504506915663873429529508055633524319298398235333517137472930353484720630796885185907825821542456705390096473669907 : Rat) / 473101358347960336830027841334947289525374191674258946334755315282700366921593069909844623504006308589816263594496) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2)],
  term ((73504506915663873429529508055633524319298398235333517137472930353484720630796885185907825821542456705390096473669907 : Rat) / 946202716695920673660055682669894579050748383348517892669510630565400733843186139819689247008012617179632527188992) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 9. -/
theorem ep_Q1_009_partial_09_1304_valid :
    mulPoly ep_Q1_009_coefficient_09_1304
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1305 : Poly :=
[
  term ((178690144943619549938737 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1305 for generator 9. -/
def ep_Q1_009_partial_09_1305 : Poly :=
[
  term ((357380289887239099877474 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-178690144943619549938737 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 9. -/
theorem ep_Q1_009_partial_09_1305_valid :
    mulPoly ep_Q1_009_coefficient_09_1305
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1306 : Poly :=
[
  term ((362560637869749891284598520258573664000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (15, 4)]
]

/-- Partial product 1306 for generator 9. -/
def ep_Q1_009_partial_09_1306 : Poly :=
[
  term ((725121275739499782569197040517147328000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 4)],
  term ((-362560637869749891284598520258573664000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 9. -/
theorem ep_Q1_009_partial_09_1306_valid :
    mulPoly ep_Q1_009_coefficient_09_1306
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1307 : Poly :=
[
  term ((-284999446083448505650579 : Rat) / 18705355511380186052484) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1307 for generator 9. -/
def ep_Q1_009_partial_09_1307 : Poly :=
[
  term ((-284999446083448505650579 : Rat) / 9352677755690093026242) [(2, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((284999446083448505650579 : Rat) / 18705355511380186052484) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 9. -/
theorem ep_Q1_009_partial_09_1307_valid :
    mulPoly ep_Q1_009_coefficient_09_1307
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1308 : Poly :=
[
  term ((6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 1308 for generator 9. -/
def ep_Q1_009_partial_09_1308 : Poly :=
[
  term ((6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 9. -/
theorem ep_Q1_009_partial_09_1308_valid :
    mulPoly ep_Q1_009_coefficient_09_1308
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1309 : Poly :=
[
  term ((1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1309 for generator 9. -/
def ep_Q1_009_partial_09_1309 : Poly :=
[
  term ((2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 9. -/
theorem ep_Q1_009_partial_09_1309_valid :
    mulPoly ep_Q1_009_coefficient_09_1309
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1310 : Poly :=
[
  term ((-28515952636599295872383366966584144473793112457091577292315114660438322757380092768196759273846366702871610231 : Rat) / 2918741227996876742588833551267502724314318039786536987154978927639873877923082889494595999242515344788268784) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 1310 for generator 9. -/
def ep_Q1_009_partial_09_1310 : Poly :=
[
  term ((-28515952636599295872383366966584144473793112457091577292315114660438322757380092768196759273846366702871610231 : Rat) / 1459370613998438371294416775633751362157159019893268493577489463819936938961541444747297999621257672394134392) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((28515952636599295872383366966584144473793112457091577292315114660438322757380092768196759273846366702871610231 : Rat) / 2918741227996876742588833551267502724314318039786536987154978927639873877923082889494595999242515344788268784) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 9. -/
theorem ep_Q1_009_partial_09_1310_valid :
    mulPoly ep_Q1_009_coefficient_09_1310
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1311 : Poly :=
[
  term ((53135522629288380707 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1311 for generator 9. -/
def ep_Q1_009_partial_09_1311 : Poly :=
[
  term ((106271045258576761414 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-53135522629288380707 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 9. -/
theorem ep_Q1_009_partial_09_1311_valid :
    mulPoly ep_Q1_009_coefficient_09_1311
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1312 : Poly :=
[
  term ((3580960609 : Rat) / 33007268) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 1312 for generator 9. -/
def ep_Q1_009_partial_09_1312 : Poly :=
[
  term ((3580960609 : Rat) / 16503634) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-3580960609 : Rat) / 33007268) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 9. -/
theorem ep_Q1_009_partial_09_1312_valid :
    mulPoly ep_Q1_009_coefficient_09_1312
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1313 : Poly :=
[
  term ((-775528449877708389176216324520866236036454562684579403225532671860059908696749542505448660006336053030224763365 : Rat) / 49446910215476500109740238986178869682501387968148391311801995950604922167167521892614332222461436429354200576) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1313 for generator 9. -/
def ep_Q1_009_partial_09_1313 : Poly :=
[
  term ((-775528449877708389176216324520866236036454562684579403225532671860059908696749542505448660006336053030224763365 : Rat) / 24723455107738250054870119493089434841250693984074195655900997975302461083583760946307166111230718214677100288) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((775528449877708389176216324520866236036454562684579403225532671860059908696749542505448660006336053030224763365 : Rat) / 49446910215476500109740238986178869682501387968148391311801995950604922167167521892614332222461436429354200576) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 9. -/
theorem ep_Q1_009_partial_09_1313_valid :
    mulPoly ep_Q1_009_coefficient_09_1313
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1314 : Poly :=
[
  term ((-174498691761936845089 : Rat) / 68292590153870191524) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1314 for generator 9. -/
def ep_Q1_009_partial_09_1314 : Poly :=
[
  term ((-174498691761936845089 : Rat) / 34146295076935095762) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((174498691761936845089 : Rat) / 68292590153870191524) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 9. -/
theorem ep_Q1_009_partial_09_1314_valid :
    mulPoly ep_Q1_009_coefficient_09_1314
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1315 : Poly :=
[
  term ((25290202919722149419570832653859948986401396762661141470483085862336245655936491563318985243836603 : Rat) / 151898823420586111629519119957820733553594067074346954793588603775159563958886850977382655199168) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 1315 for generator 9. -/
def ep_Q1_009_partial_09_1315 : Poly :=
[
  term ((25290202919722149419570832653859948986401396762661141470483085862336245655936491563318985243836603 : Rat) / 75949411710293055814759559978910366776797033537173477396794301887579781979443425488691327599584) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-25290202919722149419570832653859948986401396762661141470483085862336245655936491563318985243836603 : Rat) / 151898823420586111629519119957820733553594067074346954793588603775159563958886850977382655199168) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 9. -/
theorem ep_Q1_009_partial_09_1315_valid :
    mulPoly ep_Q1_009_coefficient_09_1315
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1316 : Poly :=
[
  term ((-9322974169853423731024427548924215133356194348236486328955503276169074825523636742060281712172917 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1316 for generator 9. -/
def ep_Q1_009_partial_09_1316 : Poly :=
[
  term ((-9322974169853423731024427548924215133356194348236486328955503276169074825523636742060281712172917 : Rat) / 21097058808414737726322099994141768549110287093659299276887306079883272772067618191303146555440) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((9322974169853423731024427548924215133356194348236486328955503276169074825523636742060281712172917 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 9. -/
theorem ep_Q1_009_partial_09_1316_valid :
    mulPoly ep_Q1_009_coefficient_09_1316
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1317 : Poly :=
[
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1317 for generator 9. -/
def ep_Q1_009_partial_09_1317 : Poly :=
[
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 9. -/
theorem ep_Q1_009_partial_09_1317_valid :
    mulPoly ep_Q1_009_coefficient_09_1317
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1318 : Poly :=
[
  term ((748503516560904 : Rat) / 1395206957462413) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1318 for generator 9. -/
def ep_Q1_009_partial_09_1318 : Poly :=
[
  term ((1497007033121808 : Rat) / 1395206957462413) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 9. -/
theorem ep_Q1_009_partial_09_1318_valid :
    mulPoly ep_Q1_009_coefficient_09_1318
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1319 : Poly :=
[
  term ((-177774804 : Rat) / 8251817) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1319 for generator 9. -/
def ep_Q1_009_partial_09_1319 : Poly :=
[
  term ((-355549608 : Rat) / 8251817) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((177774804 : Rat) / 8251817) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 9. -/
theorem ep_Q1_009_partial_09_1319_valid :
    mulPoly ep_Q1_009_coefficient_09_1319
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1320 : Poly :=
[
  term ((-182130017503188871343924792576317233947626287649960581275867349619308603562502781915870035564944848424697452237 : Rat) / 5003556390851788701580857516458576098824545211062634835122821018811212362153856381990735998701454876779889344) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 1320 for generator 9. -/
def ep_Q1_009_partial_09_1320 : Poly :=
[
  term ((-182130017503188871343924792576317233947626287649960581275867349619308603562502781915870035564944848424697452237 : Rat) / 2501778195425894350790428758229288049412272605531317417561410509405606181076928190995367999350727438389944672) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((182130017503188871343924792576317233947626287649960581275867349619308603562502781915870035564944848424697452237 : Rat) / 5003556390851788701580857516458576098824545211062634835122821018811212362153856381990735998701454876779889344) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 9. -/
theorem ep_Q1_009_partial_09_1320_valid :
    mulPoly ep_Q1_009_coefficient_09_1320
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1321 : Poly :=
[
  term ((-1817375927810606357056 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1321 for generator 9. -/
def ep_Q1_009_partial_09_1321 : Poly :=
[
  term ((-3634751855621212714112 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1817375927810606357056 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 9. -/
theorem ep_Q1_009_partial_09_1321_valid :
    mulPoly ep_Q1_009_coefficient_09_1321
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1322 : Poly :=
[
  term ((133331103 : Rat) / 8251817) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1322 for generator 9. -/
def ep_Q1_009_partial_09_1322 : Poly :=
[
  term ((266662206 : Rat) / 8251817) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-133331103 : Rat) / 8251817) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 9. -/
theorem ep_Q1_009_partial_09_1322_valid :
    mulPoly ep_Q1_009_coefficient_09_1322
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1323 : Poly :=
[
  term ((931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1323 for generator 9. -/
def ep_Q1_009_partial_09_1323 : Poly :=
[
  term ((1863115912374024948789642807600000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 9. -/
theorem ep_Q1_009_partial_09_1323_valid :
    mulPoly ep_Q1_009_coefficient_09_1323
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1324 : Poly :=
[
  term ((-1013535056331469572141565687334400 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 1324 for generator 9. -/
def ep_Q1_009_partial_09_1324 : Poly :=
[
  term ((-2027070112662939144283131374668800 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((1013535056331469572141565687334400 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 9. -/
theorem ep_Q1_009_partial_09_1324_valid :
    mulPoly ep_Q1_009_coefficient_09_1324
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1325 : Poly :=
[
  term ((-986973458752033908339311001150403698969447174316483152333026782884502718296703916157455277820899572588373972122329 : Rat) / 1730641857541677503840908364516260438887548578885193695913069858271172275850863266241501627786150275027397020160) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1325 for generator 9. -/
def ep_Q1_009_partial_09_1325 : Poly :=
[
  term ((-986973458752033908339311001150403698969447174316483152333026782884502718296703916157455277820899572588373972122329 : Rat) / 865320928770838751920454182258130219443774289442596847956534929135586137925431633120750813893075137513698510080) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((986973458752033908339311001150403698969447174316483152333026782884502718296703916157455277820899572588373972122329 : Rat) / 1730641857541677503840908364516260438887548578885193695913069858271172275850863266241501627786150275027397020160) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 9. -/
theorem ep_Q1_009_partial_09_1325_valid :
    mulPoly ep_Q1_009_coefficient_09_1325
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1326 : Poly :=
[
  term ((-7840719472645540203425 : Rat) / 159349377025697113556) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1326 for generator 9. -/
def ep_Q1_009_partial_09_1326 : Poly :=
[
  term ((-7840719472645540203425 : Rat) / 79674688512848556778) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((7840719472645540203425 : Rat) / 159349377025697113556) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 9. -/
theorem ep_Q1_009_partial_09_1326_valid :
    mulPoly ep_Q1_009_coefficient_09_1326
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1327 : Poly :=
[
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(4, 1), (7, 1), (14, 2), (15, 1)]
]

/-- Partial product 1327 for generator 9. -/
def ep_Q1_009_partial_09_1327 : Poly :=
[
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(4, 1), (7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 9. -/
theorem ep_Q1_009_partial_09_1327_valid :
    mulPoly ep_Q1_009_coefficient_09_1327
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1328 : Poly :=
[
  term ((-3755048164334233 : Rat) / 1395206957462413) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1328 for generator 9. -/
def ep_Q1_009_partial_09_1328 : Poly :=
[
  term ((-7510096328668466 : Rat) / 1395206957462413) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3755048164334233 : Rat) / 1395206957462413) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 9. -/
theorem ep_Q1_009_partial_09_1328_valid :
    mulPoly ep_Q1_009_coefficient_09_1328
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1329 : Poly :=
[
  term ((-267575235892329515992219890412858644991128081293046228638246096952999239237990466629965389464123339074386137845133 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 1329 for generator 9. -/
def ep_Q1_009_partial_09_1329 : Poly :=
[
  term ((-267575235892329515992219890412858644991128081293046228638246096952999239237990466629965389464123339074386137845133 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((267575235892329515992219890412858644991128081293046228638246096952999239237990466629965389464123339074386137845133 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 9. -/
theorem ep_Q1_009_partial_09_1329_valid :
    mulPoly ep_Q1_009_coefficient_09_1329
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1330 : Poly :=
[
  term ((9873992137790175418243 : Rat) / 2031704557077638197839) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1330 for generator 9. -/
def ep_Q1_009_partial_09_1330 : Poly :=
[
  term ((19747984275580350836486 : Rat) / 2031704557077638197839) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-9873992137790175418243 : Rat) / 2031704557077638197839) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 9. -/
theorem ep_Q1_009_partial_09_1330_valid :
    mulPoly ep_Q1_009_coefficient_09_1330
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1331 : Poly :=
[
  term ((22799335783156920267000905097884628341101342489669449173991800905603944558292944155107071413258593945998235976929 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(4, 1), (7, 1), (15, 3)]
]

/-- Partial product 1331 for generator 9. -/
def ep_Q1_009_partial_09_1331 : Poly :=
[
  term ((22799335783156920267000905097884628341101342489669449173991800905603944558292944155107071413258593945998235976929 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(2, 1), (4, 1), (7, 1), (15, 3)],
  term ((-22799335783156920267000905097884628341101342489669449173991800905603944558292944155107071413258593945998235976929 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 9. -/
theorem ep_Q1_009_partial_09_1331_valid :
    mulPoly ep_Q1_009_coefficient_09_1331
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1332 : Poly :=
[
  term ((6091475797045100656132 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 1332 for generator 9. -/
def ep_Q1_009_partial_09_1332 : Poly :=
[
  term ((12182951594090201312264 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-6091475797045100656132 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 9. -/
theorem ep_Q1_009_partial_09_1332_valid :
    mulPoly ep_Q1_009_coefficient_09_1332
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1333 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1333 for generator 9. -/
def ep_Q1_009_partial_09_1333 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(2, 1), (4, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 9. -/
theorem ep_Q1_009_partial_09_1333_valid :
    mulPoly ep_Q1_009_coefficient_09_1333
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1334 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(4, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1334 for generator 9. -/
def ep_Q1_009_partial_09_1334 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(2, 1), (4, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(4, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 9. -/
theorem ep_Q1_009_partial_09_1334_valid :
    mulPoly ep_Q1_009_coefficient_09_1334
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1335 : Poly :=
[
  term ((1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1335 for generator 9. -/
def ep_Q1_009_partial_09_1335 : Poly :=
[
  term ((1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 9. -/
theorem ep_Q1_009_partial_09_1335_valid :
    mulPoly ep_Q1_009_coefficient_09_1335
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1336 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(4, 1), (7, 2), (8, 1), (15, 2)]
]

/-- Partial product 1336 for generator 9. -/
def ep_Q1_009_partial_09_1336 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 34843886504313087366001390920565239991339616329260221793217345342238270643022847339284459788) [(2, 1), (4, 1), (7, 2), (8, 1), (15, 2)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(4, 1), (7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 9. -/
theorem ep_Q1_009_partial_09_1336_valid :
    mulPoly ep_Q1_009_coefficient_09_1336
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1337 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(4, 1), (7, 2), (9, 1), (11, 1)]
]

/-- Partial product 1337 for generator 9. -/
def ep_Q1_009_partial_09_1337 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(2, 1), (4, 1), (7, 2), (9, 1), (11, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(4, 1), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 9. -/
theorem ep_Q1_009_partial_09_1337_valid :
    mulPoly ep_Q1_009_coefficient_09_1337
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1338 : Poly :=
[
  term ((27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1338 for generator 9. -/
def ep_Q1_009_partial_09_1338 : Poly :=
[
  term ((54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (11, 1), (15, 2)],
  term ((-27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 9. -/
theorem ep_Q1_009_partial_09_1338_valid :
    mulPoly ep_Q1_009_coefficient_09_1338
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1339 : Poly :=
[
  term ((-282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(4, 1), (7, 2), (9, 1), (13, 1)]
]

/-- Partial product 1339 for generator 9. -/
def ep_Q1_009_partial_09_1339 : Poly :=
[
  term ((-282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1)],
  term ((282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(4, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 9. -/
theorem ep_Q1_009_partial_09_1339_valid :
    mulPoly ep_Q1_009_coefficient_09_1339
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1340 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(4, 1), (7, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1340 for generator 9. -/
def ep_Q1_009_partial_09_1340 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 59293347670405726737928329155454744083441367215907967229563860092354180463445423273229688) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1), (14, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(4, 1), (7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 9. -/
theorem ep_Q1_009_partial_09_1340_valid :
    mulPoly ep_Q1_009_coefficient_09_1340
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1341 : Poly :=
[
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1341 for generator 9. -/
def ep_Q1_009_partial_09_1341 : Poly :=
[
  term ((137463748955355409017857258865809920000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 9. -/
theorem ep_Q1_009_partial_09_1341_valid :
    mulPoly ep_Q1_009_coefficient_09_1341
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1342 : Poly :=
[
  term ((85914843097097130636160786791131200000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1342 for generator 9. -/
def ep_Q1_009_partial_09_1342 : Poly :=
[
  term ((171829686194194261272321573582262400000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1), (15, 2)],
  term ((-85914843097097130636160786791131200000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 9. -/
theorem ep_Q1_009_partial_09_1342_valid :
    mulPoly ep_Q1_009_coefficient_09_1342
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1343 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(4, 1), (7, 2), (9, 1), (15, 1)]
]

/-- Partial product 1343 for generator 9. -/
def ep_Q1_009_partial_09_1343 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 74116684588007158422410411444318430104301709019884959036954825115442725579306779091537110) [(2, 1), (4, 1), (7, 2), (9, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(4, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 9. -/
theorem ep_Q1_009_partial_09_1343_valid :
    mulPoly ep_Q1_009_coefficient_09_1343
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1344 : Poly :=
[
  term ((54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (15, 3)]
]

/-- Partial product 1344 for generator 9. -/
def ep_Q1_009_partial_09_1344 : Poly :=
[
  term ((109970999164284327214285807092647936000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (15, 3)],
  term ((-54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 9. -/
theorem ep_Q1_009_partial_09_1344_valid :
    mulPoly ep_Q1_009_coefficient_09_1344
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1345 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(4, 1), (7, 2), (11, 1), (15, 1)]
]

/-- Partial product 1345 for generator 9. -/
def ep_Q1_009_partial_09_1345 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(4, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 9. -/
theorem ep_Q1_009_partial_09_1345_valid :
    mulPoly ep_Q1_009_coefficient_09_1345
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1346 : Poly :=
[
  term ((4592240 : Rat) / 3536493) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1346 for generator 9. -/
def ep_Q1_009_partial_09_1346 : Poly :=
[
  term ((9184480 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4592240 : Rat) / 3536493) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 9. -/
theorem ep_Q1_009_partial_09_1346_valid :
    mulPoly ep_Q1_009_coefficient_09_1346
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1347 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1347 for generator 9. -/
def ep_Q1_009_partial_09_1347 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 9. -/
theorem ep_Q1_009_partial_09_1347_valid :
    mulPoly ep_Q1_009_coefficient_09_1347
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1348 : Poly :=
[
  term ((11480600 : Rat) / 3536493) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1348 for generator 9. -/
def ep_Q1_009_partial_09_1348 : Poly :=
[
  term ((22961200 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11480600 : Rat) / 3536493) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 9. -/
theorem ep_Q1_009_partial_09_1348_valid :
    mulPoly ep_Q1_009_coefficient_09_1348
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1349 : Poly :=
[
  term ((33936019384675047159104331464054866526572834650266444936875043911992987711856392220344373197208375 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

/-- Partial product 1349 for generator 9. -/
def ep_Q1_009_partial_09_1349 : Poly :=
[
  term ((33936019384675047159104331464054866526572834650266444936875043911992987711856392220344373197208375 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-33936019384675047159104331464054866526572834650266444936875043911992987711856392220344373197208375 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 9. -/
theorem ep_Q1_009_partial_09_1349_valid :
    mulPoly ep_Q1_009_coefficient_09_1349
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1350 : Poly :=
[
  term ((14350750 : Rat) / 3536493) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1350 for generator 9. -/
def ep_Q1_009_partial_09_1350 : Poly :=
[
  term ((28701500 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14350750 : Rat) / 3536493) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 9. -/
theorem ep_Q1_009_partial_09_1350_valid :
    mulPoly ep_Q1_009_coefficient_09_1350
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1351 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(4, 1), (7, 2), (15, 2)]
]

/-- Partial product 1351 for generator 9. -/
def ep_Q1_009_partial_09_1351 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 40009065097386520473846553917461711069919865881189599700096998315778635149885375927078467217638) [(2, 1), (4, 1), (7, 2), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(4, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 9. -/
theorem ep_Q1_009_partial_09_1351_valid :
    mulPoly ep_Q1_009_coefficient_09_1351
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1352 : Poly :=
[
  term ((9184480 : Rat) / 3536493) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 1352 for generator 9. -/
def ep_Q1_009_partial_09_1352 : Poly :=
[
  term ((18368960 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-9184480 : Rat) / 3536493) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 9. -/
theorem ep_Q1_009_partial_09_1352_valid :
    mulPoly ep_Q1_009_coefficient_09_1352
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1353 : Poly :=
[
  term ((976390223816369630520930218693158719175635403103009193419039281327133691946671671960064015124111 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (8, 1)]
]

/-- Partial product 1353 for generator 9. -/
def ep_Q1_009_partial_09_1353 : Poly :=
[
  term ((976390223816369630520930218693158719175635403103009193419039281327133691946671671960064015124111 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (4, 1), (8, 1)],
  term ((-976390223816369630520930218693158719175635403103009193419039281327133691946671671960064015124111 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 9. -/
theorem ep_Q1_009_partial_09_1353_valid :
    mulPoly ep_Q1_009_coefficient_09_1353
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1354 : Poly :=
[
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1354 for generator 9. -/
def ep_Q1_009_partial_09_1354 : Poly :=
[
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 9. -/
theorem ep_Q1_009_partial_09_1354_valid :
    mulPoly ep_Q1_009_coefficient_09_1354
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1355 : Poly :=
[
  term ((1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (11, 1), (15, 3)]
]

/-- Partial product 1355 for generator 9. -/
def ep_Q1_009_partial_09_1355 : Poly :=
[
  term ((2195554691886511800802423447905352 : Rat) / 10306817152083683685026217919314591) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 3)],
  term ((-1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 9. -/
theorem ep_Q1_009_partial_09_1355_valid :
    mulPoly ep_Q1_009_coefficient_09_1355
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1356 : Poly :=
[
  term ((-7829209808761082961904334362662937546863555378723940249036615234069835969386019662741411325491217 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(4, 1), (8, 1), (12, 1)]
]

/-- Partial product 1356 for generator 9. -/
def ep_Q1_009_partial_09_1356 : Poly :=
[
  term ((-7829209808761082961904334362662937546863555378723940249036615234069835969386019662741411325491217 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(2, 1), (4, 1), (8, 1), (12, 1)],
  term ((7829209808761082961904334362662937546863555378723940249036615234069835969386019662741411325491217 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(4, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 9. -/
theorem ep_Q1_009_partial_09_1356_valid :
    mulPoly ep_Q1_009_coefficient_09_1356
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1357 : Poly :=
[
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1357 for generator 9. -/
def ep_Q1_009_partial_09_1357 : Poly :=
[
  term ((2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 9. -/
theorem ep_Q1_009_partial_09_1357_valid :
    mulPoly ep_Q1_009_coefficient_09_1357
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1358 : Poly :=
[
  term ((-131112053913733932226432919563104685121564159259886379316561593035492388849792154751886579457175 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(4, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1358 for generator 9. -/
def ep_Q1_009_partial_09_1358 : Poly :=
[
  term ((-131112053913733932226432919563104685121564159259886379316561593035492388849792154751886579457175 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((131112053913733932226432919563104685121564159259886379316561593035492388849792154751886579457175 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(4, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 9. -/
theorem ep_Q1_009_partial_09_1358_valid :
    mulPoly ep_Q1_009_coefficient_09_1358
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1359 : Poly :=
[
  term ((4545593205562490766741505734624196 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1359 for generator 9. -/
def ep_Q1_009_partial_09_1359 : Poly :=
[
  term ((9091186411124981533483011469248392 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4545593205562490766741505734624196 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 9. -/
theorem ep_Q1_009_partial_09_1359_valid :
    mulPoly ep_Q1_009_coefficient_09_1359
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1360 : Poly :=
[
  term ((-645158049534047971432772891683816221112085093862725582633402519682273130095476957922484014921839 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1360 for generator 9. -/
def ep_Q1_009_partial_09_1360 : Poly :=
[
  term ((-645158049534047971432772891683816221112085093862725582633402519682273130095476957922484014921839 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((645158049534047971432772891683816221112085093862725582633402519682273130095476957922484014921839 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 9. -/
theorem ep_Q1_009_partial_09_1360_valid :
    mulPoly ep_Q1_009_coefficient_09_1360
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1361 : Poly :=
[
  term ((253122402766385423075319468019352 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (13, 1), (15, 3)]
]

/-- Partial product 1361 for generator 9. -/
def ep_Q1_009_partial_09_1361 : Poly :=
[
  term ((506244805532770846150638936038704 : Rat) / 10306817152083683685026217919314591) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-253122402766385423075319468019352 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 9. -/
theorem ep_Q1_009_partial_09_1361_valid :
    mulPoly ep_Q1_009_coefficient_09_1361
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1362 : Poly :=
[
  term ((5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (8, 1), (13, 2)]
]

/-- Partial product 1362 for generator 9. -/
def ep_Q1_009_partial_09_1362 : Poly :=
[
  term ((11180646279552047561052588587169404997582936403965598197001051884709320 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (4, 1), (8, 1), (13, 2)],
  term ((-5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 9. -/
theorem ep_Q1_009_partial_09_1362_valid :
    mulPoly ep_Q1_009_coefficient_09_1362
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1363 : Poly :=
[
  term ((4380096010803779710746264847295792027633432834801630985374273120792653123204688479662633988613003 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(4, 1), (8, 1), (14, 1)]
]

/-- Partial product 1363 for generator 9. -/
def ep_Q1_009_partial_09_1363 : Poly :=
[
  term ((4380096010803779710746264847295792027633432834801630985374273120792653123204688479662633988613003 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(2, 1), (4, 1), (8, 1), (14, 1)],
  term ((-4380096010803779710746264847295792027633432834801630985374273120792653123204688479662633988613003 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(4, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 9. -/
theorem ep_Q1_009_partial_09_1363_valid :
    mulPoly ep_Q1_009_coefficient_09_1363
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1364 : Poly :=
[
  term ((-635791529530705619861434552403281013221619654500031218648231851598819860085819416130605848107699 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1364 for generator 9. -/
def ep_Q1_009_partial_09_1364 : Poly :=
[
  term ((-635791529530705619861434552403281013221619654500031218648231851598819860085819416130605848107699 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((635791529530705619861434552403281013221619654500031218648231851598819860085819416130605848107699 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 9. -/
theorem ep_Q1_009_partial_09_1364_valid :
    mulPoly ep_Q1_009_coefficient_09_1364
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1365 : Poly :=
[
  term ((-155544188645471271528146102201220 : Rat) / 3435605717361227895008739306438197) [(4, 1), (8, 1), (14, 2), (15, 2)]
]

/-- Partial product 1365 for generator 9. -/
def ep_Q1_009_partial_09_1365 : Poly :=
[
  term ((-311088377290942543056292204402440 : Rat) / 3435605717361227895008739306438197) [(2, 1), (4, 1), (8, 1), (14, 2), (15, 2)],
  term ((155544188645471271528146102201220 : Rat) / 3435605717361227895008739306438197) [(4, 1), (8, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 9. -/
theorem ep_Q1_009_partial_09_1365_valid :
    mulPoly ep_Q1_009_coefficient_09_1365
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1366 : Poly :=
[
  term ((-5744795468673573018781516981383232501952331924229544316222892176667099556999305028180943334047407 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(4, 1), (8, 1), (15, 2)]
]

/-- Partial product 1366 for generator 9. -/
def ep_Q1_009_partial_09_1366 : Poly :=
[
  term ((-5744795468673573018781516981383232501952331924229544316222892176667099556999305028180943334047407 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((5744795468673573018781516981383232501952331924229544316222892176667099556999305028180943334047407 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 9. -/
theorem ep_Q1_009_partial_09_1366_valid :
    mulPoly ep_Q1_009_coefficient_09_1366
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1367 : Poly :=
[
  term ((2682401310908414394150713473097200 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (15, 4)]
]

/-- Partial product 1367 for generator 9. -/
def ep_Q1_009_partial_09_1367 : Poly :=
[
  term ((5364802621816828788301426946194400 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (8, 1), (15, 4)],
  term ((-2682401310908414394150713473097200 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 9. -/
theorem ep_Q1_009_partial_09_1367_valid :
    mulPoly ep_Q1_009_coefficient_09_1367
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1368 : Poly :=
[
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1368 for generator 9. -/
def ep_Q1_009_partial_09_1368 : Poly :=
[
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 9. -/
theorem ep_Q1_009_partial_09_1368_valid :
    mulPoly ep_Q1_009_coefficient_09_1368
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1369 : Poly :=
[
  term ((-442059787318935108193 : Rat) / 30564306391144094857) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1369 for generator 9. -/
def ep_Q1_009_partial_09_1369 : Poly :=
[
  term ((-884119574637870216386 : Rat) / 30564306391144094857) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 9. -/
theorem ep_Q1_009_partial_09_1369_valid :
    mulPoly ep_Q1_009_coefficient_09_1369
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1370 : Poly :=
[
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1370 for generator 9. -/
def ep_Q1_009_partial_09_1370 : Poly :=
[
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 9. -/
theorem ep_Q1_009_partial_09_1370_valid :
    mulPoly ep_Q1_009_coefficient_09_1370
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1371 : Poly :=
[
  term ((-24880280697155794952639 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1371 for generator 9. -/
def ep_Q1_009_partial_09_1371 : Poly :=
[
  term ((-49760561394311589905278 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24880280697155794952639 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 9. -/
theorem ep_Q1_009_partial_09_1371_valid :
    mulPoly ep_Q1_009_coefficient_09_1371
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1372 : Poly :=
[
  term ((33820501395974156835965194440374055627608283924653144101807503922062700344634684445911306428393926586167169433570189 : Rat) / 3784810866783682694640222730679578316202993533394071570678042522261602935372744559278756988032050468718530108755968) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1372 for generator 9. -/
def ep_Q1_009_partial_09_1372 : Poly :=
[
  term ((33820501395974156835965194440374055627608283924653144101807503922062700344634684445911306428393926586167169433570189 : Rat) / 1892405433391841347320111365339789158101496766697035785339021261130801467686372279639378494016025234359265054377984) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-33820501395974156835965194440374055627608283924653144101807503922062700344634684445911306428393926586167169433570189 : Rat) / 3784810866783682694640222730679578316202993533394071570678042522261602935372744559278756988032050468718530108755968) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 9. -/
theorem ep_Q1_009_partial_09_1372_valid :
    mulPoly ep_Q1_009_coefficient_09_1372
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1373 : Poly :=
[
  term ((-82048066482395094790007 : Rat) / 18705355511380186052484) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1373 for generator 9. -/
def ep_Q1_009_partial_09_1373 : Poly :=
[
  term ((-82048066482395094790007 : Rat) / 9352677755690093026242) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((82048066482395094790007 : Rat) / 18705355511380186052484) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 9. -/
theorem ep_Q1_009_partial_09_1373_valid :
    mulPoly ep_Q1_009_coefficient_09_1373
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1374 : Poly :=
[
  term ((-1599990399776891211459243956693449696000 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (9, 1), (12, 1), (15, 3)]
]

/-- Partial product 1374 for generator 9. -/
def ep_Q1_009_partial_09_1374 : Poly :=
[
  term ((-3199980799553782422918487913386899392000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 3)],
  term ((1599990399776891211459243956693449696000 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 9. -/
theorem ep_Q1_009_partial_09_1374_valid :
    mulPoly ep_Q1_009_coefficient_09_1374
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1375 : Poly :=
[
  term ((-26750907793335974215665840795874027188434545029687402034134496045683936295069779842060829262385510032171384007757 : Rat) / 1030974603465904686508191749252152846885945229874988850937877617679061571565128860363040229912574015613448314880) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 1375 for generator 9. -/
def ep_Q1_009_partial_09_1375 : Poly :=
[
  term ((-26750907793335974215665840795874027188434545029687402034134496045683936295069779842060829262385510032171384007757 : Rat) / 515487301732952343254095874626076423442972614937494425468938808839530785782564430181520114956287007806724157440) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((26750907793335974215665840795874027188434545029687402034134496045683936295069779842060829262385510032171384007757 : Rat) / 1030974603465904686508191749252152846885945229874988850937877617679061571565128860363040229912574015613448314880) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 9. -/
theorem ep_Q1_009_partial_09_1375_valid :
    mulPoly ep_Q1_009_coefficient_09_1375
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1376 : Poly :=
[
  term ((660309382737136251901002574525634120260046290543723000598743901601916698486210387705906318795865742592140645063 : Rat) / 19493217292422567602045642317792805928515771153098528694203568401494861647239831393418827876498248194371921920) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1376 for generator 9. -/
def ep_Q1_009_partial_09_1376 : Poly :=
[
  term ((660309382737136251901002574525634120260046290543723000598743901601916698486210387705906318795865742592140645063 : Rat) / 9746608646211283801022821158896402964257885576549264347101784200747430823619915696709413938249124097185960960) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-660309382737136251901002574525634120260046290543723000598743901601916698486210387705906318795865742592140645063 : Rat) / 19493217292422567602045642317792805928515771153098528694203568401494861647239831393418827876498248194371921920) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 9. -/
theorem ep_Q1_009_partial_09_1376_valid :
    mulPoly ep_Q1_009_coefficient_09_1376
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1377 : Poly :=
[
  term ((-10230669093430055681125 : Rat) / 550157515040593707426) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1377 for generator 9. -/
def ep_Q1_009_partial_09_1377 : Poly :=
[
  term ((-10230669093430055681125 : Rat) / 275078757520296853713) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((10230669093430055681125 : Rat) / 550157515040593707426) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 9. -/
theorem ep_Q1_009_partial_09_1377_valid :
    mulPoly ep_Q1_009_coefficient_09_1377
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1378 : Poly :=
[
  term ((-947940943453810401566051189442960237450077548034452695004459060949104288203127964757060623925923919783121434818759 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1378 for generator 9. -/
def ep_Q1_009_partial_09_1378 : Poly :=
[
  term ((-947940943453810401566051189442960237450077548034452695004459060949104288203127964757060623925923919783121434818759 : Rat) / 168964770838557263153581371905338317687633639883663909405269755458107273900568953539230222680002253067791522712320) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((947940943453810401566051189442960237450077548034452695004459060949104288203127964757060623925923919783121434818759 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 9. -/
theorem ep_Q1_009_partial_09_1378_valid :
    mulPoly ep_Q1_009_coefficient_09_1378
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1379 : Poly :=
[
  term ((-1932236966426175137170 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1379 for generator 9. -/
def ep_Q1_009_partial_09_1379 : Poly :=
[
  term ((-3864473932852350274340 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1932236966426175137170 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 9. -/
theorem ep_Q1_009_partial_09_1379_valid :
    mulPoly ep_Q1_009_coefficient_09_1379
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1380 : Poly :=
[
  term ((213786126711655990006307 : Rat) / 12470237007586790701656) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1380 for generator 9. -/
def ep_Q1_009_partial_09_1380 : Poly :=
[
  term ((213786126711655990006307 : Rat) / 6235118503793395350828) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-213786126711655990006307 : Rat) / 12470237007586790701656) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 9. -/
theorem ep_Q1_009_partial_09_1380_valid :
    mulPoly ep_Q1_009_coefficient_09_1380
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1381 : Poly :=
[
  term ((78092222728855943172904815402780866014517578266227395913006389910467619559144406887252806368089256185753666462208459 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1381 for generator 9. -/
def ep_Q1_009_partial_09_1381 : Poly :=
[
  term ((78092222728855943172904815402780866014517578266227395913006389910467619559144406887252806368089256185753666462208459 : Rat) / 394251131956633614025023201112456074604478493061882455278962762735583639101327558258203852920005257158180219662080) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-78092222728855943172904815402780866014517578266227395913006389910467619559144406887252806368089256185753666462208459 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 9. -/
theorem ep_Q1_009_partial_09_1381_valid :
    mulPoly ep_Q1_009_coefficient_09_1381
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1382 : Poly :=
[
  term ((-28976600259219870227477 : Rat) / 519593208649449612569) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1382 for generator 9. -/
def ep_Q1_009_partial_09_1382 : Poly :=
[
  term ((-57953200518439740454954 : Rat) / 519593208649449612569) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28976600259219870227477 : Rat) / 519593208649449612569) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 9. -/
theorem ep_Q1_009_partial_09_1382_valid :
    mulPoly ep_Q1_009_coefficient_09_1382
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1383 : Poly :=
[
  term ((-4795138797124381322989801107201524144000 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 1383 for generator 9. -/
def ep_Q1_009_partial_09_1383 : Poly :=
[
  term ((-9590277594248762645979602214403048288000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 3)],
  term ((4795138797124381322989801107201524144000 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 9. -/
theorem ep_Q1_009_partial_09_1383_valid :
    mulPoly ep_Q1_009_coefficient_09_1383
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1384 : Poly :=
[
  term ((-92590167461421981477873195299595089105793248240173947006288650673548484654704283057642784002842443957072206937 : Rat) / 115984642889914277232171571790867195274668838360936245730511231988894426801076996790842025865164576756512935424) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 1384 for generator 9. -/
def ep_Q1_009_partial_09_1384 : Poly :=
[
  term ((-92590167461421981477873195299595089105793248240173947006288650673548484654704283057642784002842443957072206937 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((92590167461421981477873195299595089105793248240173947006288650673548484654704283057642784002842443957072206937 : Rat) / 115984642889914277232171571790867195274668838360936245730511231988894426801076996790842025865164576756512935424) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 9. -/
theorem ep_Q1_009_partial_09_1384_valid :
    mulPoly ep_Q1_009_coefficient_09_1384
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1385 : Poly :=
[
  term ((8868662443558760125582 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1385 for generator 9. -/
def ep_Q1_009_partial_09_1385 : Poly :=
[
  term ((17737324887117520251164 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8868662443558760125582 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 9. -/
theorem ep_Q1_009_partial_09_1385_valid :
    mulPoly ep_Q1_009_coefficient_09_1385
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1386 : Poly :=
[
  term ((-107590025876766200621093544271968862000965817160970994113035693303666585660057831654364912163007671354690997980607901 : Rat) / 1051336351884356304066728536299882865611942648165019880743900700628223037603540155355210274453347352421813919098880) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 1386 for generator 9. -/
def ep_Q1_009_partial_09_1386 : Poly :=
[
  term ((-107590025876766200621093544271968862000965817160970994113035693303666585660057831654364912163007671354690997980607901 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((107590025876766200621093544271968862000965817160970994113035693303666585660057831654364912163007671354690997980607901 : Rat) / 1051336351884356304066728536299882865611942648165019880743900700628223037603540155355210274453347352421813919098880) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 9. -/
theorem ep_Q1_009_partial_09_1386_valid :
    mulPoly ep_Q1_009_coefficient_09_1386
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1387 : Poly :=
[
  term ((266536894229940929949536 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1387 for generator 9. -/
def ep_Q1_009_partial_09_1387 : Poly :=
[
  term ((533073788459881859899072 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-266536894229940929949536 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 9. -/
theorem ep_Q1_009_partial_09_1387_valid :
    mulPoly ep_Q1_009_coefficient_09_1387
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1388 : Poly :=
[
  term ((625354024485785986878683418436767200309067648513673902291620646010566726020449328953049116843384334602433573875699 : Rat) / 13914745833763539318530230627498449691922770343360557245139862214197069615340972644407194808941362017347537164544) [(4, 1), (9, 1), (15, 3)]
]

/-- Partial product 1388 for generator 9. -/
def ep_Q1_009_partial_09_1388 : Poly :=
[
  term ((625354024485785986878683418436767200309067648513673902291620646010566726020449328953049116843384334602433573875699 : Rat) / 6957372916881769659265115313749224845961385171680278622569931107098534807670486322203597404470681008673768582272) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-625354024485785986878683418436767200309067648513673902291620646010566726020449328953049116843384334602433573875699 : Rat) / 13914745833763539318530230627498449691922770343360557245139862214197069615340972644407194808941362017347537164544) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 9. -/
theorem ep_Q1_009_partial_09_1388_valid :
    mulPoly ep_Q1_009_coefficient_09_1388
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1389 : Poly :=
[
  term ((-5335446162790894304284 : Rat) / 275078757520296853713) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1389 for generator 9. -/
def ep_Q1_009_partial_09_1389 : Poly :=
[
  term ((-10670892325581788608568 : Rat) / 275078757520296853713) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((5335446162790894304284 : Rat) / 275078757520296853713) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 9. -/
theorem ep_Q1_009_partial_09_1389_valid :
    mulPoly ep_Q1_009_coefficient_09_1389
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1390 : Poly :=
[
  term ((-8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 1390 for generator 9. -/
def ep_Q1_009_partial_09_1390 : Poly :=
[
  term ((-16525372601631853683446885314225629651221401862278511294708192998249500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 9. -/
theorem ep_Q1_009_partial_09_1390_valid :
    mulPoly ep_Q1_009_coefficient_09_1390
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1391 : Poly :=
[
  term ((-1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1391 for generator 9. -/
def ep_Q1_009_partial_09_1391 : Poly :=
[
  term ((-2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 9. -/
theorem ep_Q1_009_partial_09_1391_valid :
    mulPoly ep_Q1_009_coefficient_09_1391
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1392 : Poly :=
[
  term ((-6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 1392 for generator 9. -/
def ep_Q1_009_partial_09_1392 : Poly :=
[
  term ((-6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 9. -/
theorem ep_Q1_009_partial_09_1392_valid :
    mulPoly ep_Q1_009_coefficient_09_1392
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1393 : Poly :=
[
  term ((-3580960609 : Rat) / 33007268) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1393 for generator 9. -/
def ep_Q1_009_partial_09_1393 : Poly :=
[
  term ((-3580960609 : Rat) / 16503634) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3580960609 : Rat) / 33007268) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 9. -/
theorem ep_Q1_009_partial_09_1393_valid :
    mulPoly ep_Q1_009_coefficient_09_1393
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1394 : Poly :=
[
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(4, 1), (11, 1), (15, 3)]
]

/-- Partial product 1394 for generator 9. -/
def ep_Q1_009_partial_09_1394 : Poly :=
[
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 9. -/
theorem ep_Q1_009_partial_09_1394_valid :
    mulPoly ep_Q1_009_coefficient_09_1394
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1395 : Poly :=
[
  term ((-2067140832184623 : Rat) / 1395206957462413) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1395 for generator 9. -/
def ep_Q1_009_partial_09_1395 : Poly :=
[
  term ((-4134281664369246 : Rat) / 1395206957462413) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((2067140832184623 : Rat) / 1395206957462413) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 9. -/
theorem ep_Q1_009_partial_09_1395_valid :
    mulPoly ep_Q1_009_coefficient_09_1395
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1396 : Poly :=
[
  term ((-1666097702648271588374955434797838498618082907793688638440682113977231316585720635372971419749460879 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(4, 1), (12, 1)]
]

/-- Partial product 1396 for generator 9. -/
def ep_Q1_009_partial_09_1396 : Poly :=
[
  term ((-1666097702648271588374955434797838498618082907793688638440682113977231316585720635372971419749460879 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(2, 1), (4, 1), (12, 1)],
  term ((1666097702648271588374955434797838498618082907793688638440682113977231316585720635372971419749460879 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 9. -/
theorem ep_Q1_009_partial_09_1396_valid :
    mulPoly ep_Q1_009_coefficient_09_1396
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1397 : Poly :=
[
  term ((-17435187413107022662436122266720154319223432804928678798652537081581751 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1397 for generator 9. -/
def ep_Q1_009_partial_09_1397 : Poly :=
[
  term ((-17435187413107022662436122266720154319223432804928678798652537081581751 : Rat) / 209546286314231272038812946311333318618106304552618592157776142822178424) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((17435187413107022662436122266720154319223432804928678798652537081581751 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 9. -/
theorem ep_Q1_009_partial_09_1397_valid :
    mulPoly ep_Q1_009_coefficient_09_1397
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1398 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(4, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1398 for generator 9. -/
def ep_Q1_009_partial_09_1398 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(4, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 9. -/
theorem ep_Q1_009_partial_09_1398_valid :
    mulPoly ep_Q1_009_coefficient_09_1398
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1399 : Poly :=
[
  term ((-662786495307469 : Rat) / 1395206957462413) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1399 for generator 9. -/
def ep_Q1_009_partial_09_1399 : Poly :=
[
  term ((-1325572990614938 : Rat) / 1395206957462413) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((662786495307469 : Rat) / 1395206957462413) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 9. -/
theorem ep_Q1_009_partial_09_1399_valid :
    mulPoly ep_Q1_009_coefficient_09_1399
        ep_Q1_009_generator_09_1300_1399 =
      ep_Q1_009_partial_09_1399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_1300_1399 : List Poly :=
[
  ep_Q1_009_partial_09_1300,
  ep_Q1_009_partial_09_1301,
  ep_Q1_009_partial_09_1302,
  ep_Q1_009_partial_09_1303,
  ep_Q1_009_partial_09_1304,
  ep_Q1_009_partial_09_1305,
  ep_Q1_009_partial_09_1306,
  ep_Q1_009_partial_09_1307,
  ep_Q1_009_partial_09_1308,
  ep_Q1_009_partial_09_1309,
  ep_Q1_009_partial_09_1310,
  ep_Q1_009_partial_09_1311,
  ep_Q1_009_partial_09_1312,
  ep_Q1_009_partial_09_1313,
  ep_Q1_009_partial_09_1314,
  ep_Q1_009_partial_09_1315,
  ep_Q1_009_partial_09_1316,
  ep_Q1_009_partial_09_1317,
  ep_Q1_009_partial_09_1318,
  ep_Q1_009_partial_09_1319,
  ep_Q1_009_partial_09_1320,
  ep_Q1_009_partial_09_1321,
  ep_Q1_009_partial_09_1322,
  ep_Q1_009_partial_09_1323,
  ep_Q1_009_partial_09_1324,
  ep_Q1_009_partial_09_1325,
  ep_Q1_009_partial_09_1326,
  ep_Q1_009_partial_09_1327,
  ep_Q1_009_partial_09_1328,
  ep_Q1_009_partial_09_1329,
  ep_Q1_009_partial_09_1330,
  ep_Q1_009_partial_09_1331,
  ep_Q1_009_partial_09_1332,
  ep_Q1_009_partial_09_1333,
  ep_Q1_009_partial_09_1334,
  ep_Q1_009_partial_09_1335,
  ep_Q1_009_partial_09_1336,
  ep_Q1_009_partial_09_1337,
  ep_Q1_009_partial_09_1338,
  ep_Q1_009_partial_09_1339,
  ep_Q1_009_partial_09_1340,
  ep_Q1_009_partial_09_1341,
  ep_Q1_009_partial_09_1342,
  ep_Q1_009_partial_09_1343,
  ep_Q1_009_partial_09_1344,
  ep_Q1_009_partial_09_1345,
  ep_Q1_009_partial_09_1346,
  ep_Q1_009_partial_09_1347,
  ep_Q1_009_partial_09_1348,
  ep_Q1_009_partial_09_1349,
  ep_Q1_009_partial_09_1350,
  ep_Q1_009_partial_09_1351,
  ep_Q1_009_partial_09_1352,
  ep_Q1_009_partial_09_1353,
  ep_Q1_009_partial_09_1354,
  ep_Q1_009_partial_09_1355,
  ep_Q1_009_partial_09_1356,
  ep_Q1_009_partial_09_1357,
  ep_Q1_009_partial_09_1358,
  ep_Q1_009_partial_09_1359,
  ep_Q1_009_partial_09_1360,
  ep_Q1_009_partial_09_1361,
  ep_Q1_009_partial_09_1362,
  ep_Q1_009_partial_09_1363,
  ep_Q1_009_partial_09_1364,
  ep_Q1_009_partial_09_1365,
  ep_Q1_009_partial_09_1366,
  ep_Q1_009_partial_09_1367,
  ep_Q1_009_partial_09_1368,
  ep_Q1_009_partial_09_1369,
  ep_Q1_009_partial_09_1370,
  ep_Q1_009_partial_09_1371,
  ep_Q1_009_partial_09_1372,
  ep_Q1_009_partial_09_1373,
  ep_Q1_009_partial_09_1374,
  ep_Q1_009_partial_09_1375,
  ep_Q1_009_partial_09_1376,
  ep_Q1_009_partial_09_1377,
  ep_Q1_009_partial_09_1378,
  ep_Q1_009_partial_09_1379,
  ep_Q1_009_partial_09_1380,
  ep_Q1_009_partial_09_1381,
  ep_Q1_009_partial_09_1382,
  ep_Q1_009_partial_09_1383,
  ep_Q1_009_partial_09_1384,
  ep_Q1_009_partial_09_1385,
  ep_Q1_009_partial_09_1386,
  ep_Q1_009_partial_09_1387,
  ep_Q1_009_partial_09_1388,
  ep_Q1_009_partial_09_1389,
  ep_Q1_009_partial_09_1390,
  ep_Q1_009_partial_09_1391,
  ep_Q1_009_partial_09_1392,
  ep_Q1_009_partial_09_1393,
  ep_Q1_009_partial_09_1394,
  ep_Q1_009_partial_09_1395,
  ep_Q1_009_partial_09_1396,
  ep_Q1_009_partial_09_1397,
  ep_Q1_009_partial_09_1398,
  ep_Q1_009_partial_09_1399
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_1300_1399 : Poly :=
[
  term ((-736671283213510106853401601533383126400 : Rat) / 882871650430336260775660800750568550469) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((26991733456256791423825 : Rat) / 275078757520296853713) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 2)],
  term ((-39888011536839334690302 : Rat) / 519593208649449612569) [(2, 1), (4, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-73504506915663873429529508055633524319298398235333517137472930353484720630796885185907825821542456705390096473669907 : Rat) / 473101358347960336830027841334947289525374191674258946334755315282700366921593069909844623504006308589816263594496) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2)],
  term ((357380289887239099877474 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((725121275739499782569197040517147328000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 4)],
  term ((-284999446083448505650579 : Rat) / 9352677755690093026242) [(2, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-28515952636599295872383366966584144473793112457091577292315114660438322757380092768196759273846366702871610231 : Rat) / 1459370613998438371294416775633751362157159019893268493577489463819936938961541444747297999621257672394134392) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((106271045258576761414 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3580960609 : Rat) / 16503634) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-775528449877708389176216324520866236036454562684579403225532671860059908696749542505448660006336053030224763365 : Rat) / 24723455107738250054870119493089434841250693984074195655900997975302461083583760946307166111230718214677100288) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-174498691761936845089 : Rat) / 34146295076935095762) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((25290202919722149419570832653859948986401396762661141470483085862336245655936491563318985243836603 : Rat) / 75949411710293055814759559978910366776797033537173477396794301887579781979443425488691327599584) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-9322974169853423731024427548924215133356194348236486328955503276169074825523636742060281712172917 : Rat) / 21097058808414737726322099994141768549110287093659299276887306079883272772067618191303146555440) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1497007033121808 : Rat) / 1395206957462413) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355549608 : Rat) / 8251817) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-182130017503188871343924792576317233947626287649960581275867349619308603562502781915870035564944848424697452237 : Rat) / 2501778195425894350790428758229288049412272605531317417561410509405606181076928190995367999350727438389944672) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-3634751855621212714112 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((266662206 : Rat) / 8251817) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((1863115912374024948789642807600000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2027070112662939144283131374668800 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-986973458752033908339311001150403698969447174316483152333026782884502718296703916157455277820899572588373972122329 : Rat) / 865320928770838751920454182258130219443774289442596847956534929135586137925431633120750813893075137513698510080) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-7840719472645540203425 : Rat) / 79674688512848556778) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-7510096328668466 : Rat) / 1395206957462413) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-267575235892329515992219890412858644991128081293046228638246096952999239237990466629965389464123339074386137845133 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((19747984275580350836486 : Rat) / 2031704557077638197839) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((22799335783156920267000905097884628341101342489669449173991800905603944558292944155107071413258593945998235976929 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(2, 1), (4, 1), (7, 1), (15, 3)],
  term ((12182951594090201312264 : Rat) / 290243508153948313977) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(2, 1), (4, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(2, 1), (4, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 34843886504313087366001390920565239991339616329260221793217345342238270643022847339284459788) [(2, 1), (4, 1), (7, 2), (8, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(2, 1), (4, 1), (7, 2), (9, 1), (11, 1)],
  term ((54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (11, 1), (15, 2)],
  term ((-282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 59293347670405726737928329155454744083441367215907967229563860092354180463445423273229688) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1), (14, 1)],
  term ((137463748955355409017857258865809920000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((171829686194194261272321573582262400000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (13, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 74116684588007158422410411444318430104301709019884959036954825115442725579306779091537110) [(2, 1), (4, 1), (7, 2), (9, 1), (15, 1)],
  term ((109970999164284327214285807092647936000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (4, 1), (7, 2), (9, 1), (15, 3)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((9184480 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((22961200 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((33936019384675047159104331464054866526572834650266444936875043911992987711856392220344373197208375 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((28701500 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 40009065097386520473846553917461711069919865881189599700096998315778635149885375927078467217638) [(2, 1), (4, 1), (7, 2), (15, 2)],
  term ((18368960 : Rat) / 3536493) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((976390223816369630520930218693158719175635403103009193419039281327133691946671671960064015124111 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (4, 1), (8, 1)],
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((2195554691886511800802423447905352 : Rat) / 10306817152083683685026217919314591) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 3)],
  term ((-7829209808761082961904334362662937546863555378723940249036615234069835969386019662741411325491217 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(2, 1), (4, 1), (8, 1), (12, 1)],
  term ((2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-131112053913733932226432919563104685121564159259886379316561593035492388849792154751886579457175 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((9091186411124981533483011469248392 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-645158049534047971432772891683816221112085093862725582633402519682273130095476957922484014921839 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((506244805532770846150638936038704 : Rat) / 10306817152083683685026217919314591) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 3)],
  term ((11180646279552047561052588587169404997582936403965598197001051884709320 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (4, 1), (8, 1), (13, 2)],
  term ((4380096010803779710746264847295792027633432834801630985374273120792653123204688479662633988613003 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(2, 1), (4, 1), (8, 1), (14, 1)],
  term ((-635791529530705619861434552403281013221619654500031218648231851598819860085819416130605848107699 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-311088377290942543056292204402440 : Rat) / 3435605717361227895008739306438197) [(2, 1), (4, 1), (8, 1), (14, 2), (15, 2)],
  term ((-5744795468673573018781516981383232501952331924229544316222892176667099556999305028180943334047407 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((5364802621816828788301426946194400 : Rat) / 30920451456251051055078653757943773) [(2, 1), (4, 1), (8, 1), (15, 4)],
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-884119574637870216386 : Rat) / 30564306391144094857) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-49760561394311589905278 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33820501395974156835965194440374055627608283924653144101807503922062700344634684445911306428393926586167169433570189 : Rat) / 1892405433391841347320111365339789158101496766697035785339021261130801467686372279639378494016025234359265054377984) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-82048066482395094790007 : Rat) / 9352677755690093026242) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3199980799553782422918487913386899392000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 3)],
  term ((-26750907793335974215665840795874027188434545029687402034134496045683936295069779842060829262385510032171384007757 : Rat) / 515487301732952343254095874626076423442972614937494425468938808839530785782564430181520114956287007806724157440) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((660309382737136251901002574525634120260046290543723000598743901601916698486210387705906318795865742592140645063 : Rat) / 9746608646211283801022821158896402964257885576549264347101784200747430823619915696709413938249124097185960960) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-10230669093430055681125 : Rat) / 275078757520296853713) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-947940943453810401566051189442960237450077548034452695004459060949104288203127964757060623925923919783121434818759 : Rat) / 168964770838557263153581371905338317687633639883663909405269755458107273900568953539230222680002253067791522712320) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3864473932852350274340 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((213786126711655990006307 : Rat) / 6235118503793395350828) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((78092222728855943172904815402780866014517578266227395913006389910467619559144406887252806368089256185753666462208459 : Rat) / 394251131956633614025023201112456074604478493061882455278962762735583639101327558258203852920005257158180219662080) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-57953200518439740454954 : Rat) / 519593208649449612569) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9590277594248762645979602214403048288000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-92590167461421981477873195299595089105793248240173947006288650673548484654704283057642784002842443957072206937 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((17737324887117520251164 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-107590025876766200621093544271968862000965817160970994113035693303666585660057831654364912163007671354690997980607901 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((533073788459881859899072 : Rat) / 4676338877845046513121) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((625354024485785986878683418436767200309067648513673902291620646010566726020449328953049116843384334602433573875699 : Rat) / 6957372916881769659265115313749224845961385171680278622569931107098534807670486322203597404470681008673768582272) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-10670892325581788608568 : Rat) / 275078757520296853713) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-16525372601631853683446885314225629651221401862278511294708192998249500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-3580960609 : Rat) / 16503634) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((-4134281664369246 : Rat) / 1395206957462413) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1666097702648271588374955434797838498618082907793688638440682113977231316585720635372971419749460879 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(2, 1), (4, 1), (12, 1)],
  term ((-17435187413107022662436122266720154319223432804928678798652537081581751 : Rat) / 209546286314231272038812946311333318618106304552618592157776142822178424) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1325572990614938 : Rat) / 1395206957462413) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((368335641606755053426700800766691563200 : Rat) / 882871650430336260775660800750568550469) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-26991733456256791423825 : Rat) / 550157515040593707426) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(4, 1), (7, 1), (9, 1), (14, 2)],
  term ((19944005768419667345151 : Rat) / 519593208649449612569) [(4, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((73504506915663873429529508055633524319298398235333517137472930353484720630796885185907825821542456705390096473669907 : Rat) / 946202716695920673660055682669894579050748383348517892669510630565400733843186139819689247008012617179632527188992) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-178690144943619549938737 : Rat) / 4676338877845046513121) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-362560637869749891284598520258573664000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (15, 4)],
  term ((284999446083448505650579 : Rat) / 18705355511380186052484) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((-6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (7, 1), (11, 1)],
  term ((-1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((28515952636599295872383366966584144473793112457091577292315114660438322757380092768196759273846366702871610231 : Rat) / 2918741227996876742588833551267502724314318039786536987154978927639873877923082889494595999242515344788268784) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-53135522629288380707 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3580960609 : Rat) / 33007268) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((775528449877708389176216324520866236036454562684579403225532671860059908696749542505448660006336053030224763365 : Rat) / 49446910215476500109740238986178869682501387968148391311801995950604922167167521892614332222461436429354200576) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((174498691761936845089 : Rat) / 68292590153870191524) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25290202919722149419570832653859948986401396762661141470483085862336245655936491563318985243836603 : Rat) / 151898823420586111629519119957820733553594067074346954793588603775159563958886850977382655199168) [(4, 1), (7, 1), (13, 1)],
  term ((9322974169853423731024427548924215133356194348236486328955503276169074825523636742060281712172917 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((177774804 : Rat) / 8251817) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((182130017503188871343924792576317233947626287649960581275867349619308603562502781915870035564944848424697452237 : Rat) / 5003556390851788701580857516458576098824545211062634835122821018811212362153856381990735998701454876779889344) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((1817375927810606357056 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-133331103 : Rat) / 8251817) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((1013535056331469572141565687334400 : Rat) / 24049240021528595265061175145067379) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((986973458752033908339311001150403698969447174316483152333026782884502718296703916157455277820899572588373972122329 : Rat) / 1730641857541677503840908364516260438887548578885193695913069858271172275850863266241501627786150275027397020160) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((7840719472645540203425 : Rat) / 159349377025697113556) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((3755048164334233 : Rat) / 1395206957462413) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((267575235892329515992219890412858644991128081293046228638246096952999239237990466629965389464123339074386137845133 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(4, 1), (7, 1), (15, 1)],
  term ((-9873992137790175418243 : Rat) / 2031704557077638197839) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-22799335783156920267000905097884628341101342489669449173991800905603944558292944155107071413258593945998235976929 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(4, 1), (7, 1), (15, 3)],
  term ((-6091475797045100656132 : Rat) / 290243508153948313977) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(4, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(4, 1), (7, 2), (8, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((-27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (11, 1), (15, 2)],
  term ((282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(4, 1), (7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-85914843097097130636160786791131200000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (13, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((-54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 2), (9, 1), (15, 3)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-4592240 : Rat) / 3536493) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-11480600 : Rat) / 3536493) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33936019384675047159104331464054866526572834650266444936875043911992987711856392220344373197208375 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-14350750 : Rat) / 3536493) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(4, 1), (7, 2), (15, 2)],
  term ((-9184480 : Rat) / 3536493) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-976390223816369630520930218693158719175635403103009193419039281327133691946671671960064015124111 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (8, 1)],
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((7829209808761082961904334362662937546863555378723940249036615234069835969386019662741411325491217 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(4, 1), (8, 1), (12, 1)],
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((131112053913733932226432919563104685121564159259886379316561593035492388849792154751886579457175 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-4545593205562490766741505734624196 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((645158049534047971432772891683816221112085093862725582633402519682273130095476957922484014921839 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-253122402766385423075319468019352 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (8, 1), (13, 2)],
  term ((-4380096010803779710746264847295792027633432834801630985374273120792653123204688479662633988613003 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(4, 1), (8, 1), (14, 1)],
  term ((635791529530705619861434552403281013221619654500031218648231851598819860085819416130605848107699 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((155544188645471271528146102201220 : Rat) / 3435605717361227895008739306438197) [(4, 1), (8, 1), (14, 2), (15, 2)],
  term ((5744795468673573018781516981383232501952331924229544316222892176667099556999305028180943334047407 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(4, 1), (8, 1), (15, 2)],
  term ((-2682401310908414394150713473097200 : Rat) / 30920451456251051055078653757943773) [(4, 1), (8, 1), (15, 4)],
  term ((-132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((24880280697155794952639 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33820501395974156835965194440374055627608283924653144101807503922062700344634684445911306428393926586167169433570189 : Rat) / 3784810866783682694640222730679578316202993533394071570678042522261602935372744559278756988032050468718530108755968) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((82048066482395094790007 : Rat) / 18705355511380186052484) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1599990399776891211459243956693449696000 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((26750907793335974215665840795874027188434545029687402034134496045683936295069779842060829262385510032171384007757 : Rat) / 1030974603465904686508191749252152846885945229874988850937877617679061571565128860363040229912574015613448314880) [(4, 1), (9, 1), (13, 1)],
  term ((-660309382737136251901002574525634120260046290543723000598743901601916698486210387705906318795865742592140645063 : Rat) / 19493217292422567602045642317792805928515771153098528694203568401494861647239831393418827876498248194371921920) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((10230669093430055681125 : Rat) / 550157515040593707426) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((947940943453810401566051189442960237450077548034452695004459060949104288203127964757060623925923919783121434818759 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((1932236966426175137170 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-213786126711655990006307 : Rat) / 12470237007586790701656) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-78092222728855943172904815402780866014517578266227395913006389910467619559144406887252806368089256185753666462208459 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((28976600259219870227477 : Rat) / 519593208649449612569) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4795138797124381322989801107201524144000 : Rat) / 15008818057315716433186233612759665357973) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((92590167461421981477873195299595089105793248240173947006288650673548484654704283057642784002842443957072206937 : Rat) / 115984642889914277232171571790867195274668838360936245730511231988894426801076996790842025865164576756512935424) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-8868662443558760125582 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((107590025876766200621093544271968862000965817160970994113035693303666585660057831654364912163007671354690997980607901 : Rat) / 1051336351884356304066728536299882865611942648165019880743900700628223037603540155355210274453347352421813919098880) [(4, 1), (9, 1), (15, 1)],
  term ((-266536894229940929949536 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-625354024485785986878683418436767200309067648513673902291620646010566726020449328953049116843384334602433573875699 : Rat) / 13914745833763539318530230627498449691922770343360557245139862214197069615340972644407194808941362017347537164544) [(4, 1), (9, 1), (15, 3)],
  term ((5335446162790894304284 : Rat) / 275078757520296853713) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 1), (11, 1), (13, 1)],
  term ((1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((6661836823949700104917106646498501637166921903876614020152910380196912421739718419926774672395624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(4, 1), (11, 1), (15, 1)],
  term ((3580960609 : Rat) / 33007268) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(4, 1), (11, 1), (15, 3)],
  term ((2067140832184623 : Rat) / 1395206957462413) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((1666097702648271588374955434797838498618082907793688638440682113977231316585720635372971419749460879 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(4, 1), (12, 1)],
  term ((17435187413107022662436122266720154319223432804928678798652537081581751 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((662786495307469 : Rat) / 1395206957462413) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1300 through 1399. -/
theorem ep_Q1_009_block_09_1300_1399_valid :
    checkProductSumEq ep_Q1_009_partials_09_1300_1399
      ep_Q1_009_block_09_1300_1399 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
