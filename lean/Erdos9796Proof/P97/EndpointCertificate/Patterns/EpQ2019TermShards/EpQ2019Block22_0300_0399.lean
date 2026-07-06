/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 22:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_22_0300_0399 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0300 : Poly :=
[
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 22. -/
def ep_Q2_019_partial_22_0300 : Poly :=
[
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 22. -/
theorem ep_Q2_019_partial_22_0300_valid :
    mulPoly ep_Q2_019_coefficient_22_0300
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0301 : Poly :=
[
  term ((-1048857498957415424382709894947523022809 : Rat) / 15465120107982175284106004793648262590) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 301 for generator 22. -/
def ep_Q2_019_partial_22_0301 : Poly :=
[
  term ((-1048857498957415424382709894947523022809 : Rat) / 7732560053991087642053002396824131295) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((1048857498957415424382709894947523022809 : Rat) / 15465120107982175284106004793648262590) [(6, 1), (8, 2), (14, 1), (16, 1)],
  term ((-1048857498957415424382709894947523022809 : Rat) / 7732560053991087642053002396824131295) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1048857498957415424382709894947523022809 : Rat) / 15465120107982175284106004793648262590) [(6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 22. -/
theorem ep_Q2_019_partial_22_0301_valid :
    mulPoly ep_Q2_019_coefficient_22_0301
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0302 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (14, 2), (16, 1)]
]

/-- Partial product 302 for generator 22. -/
def ep_Q2_019_partial_22_0302 : Poly :=
[
  term ((5719139080825200731392055042872179948026 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (8, 2), (14, 2), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 22. -/
theorem ep_Q2_019_partial_22_0302_valid :
    mulPoly ep_Q2_019_coefficient_22_0302
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0303 : Poly :=
[
  term ((-473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 303 for generator 22. -/
def ep_Q2_019_partial_22_0303 : Poly :=
[
  term ((-946034392295223839387946583872354673744 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-946034392295223839387946583872354673744 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 22. -/
theorem ep_Q2_019_partial_22_0303_valid :
    mulPoly ep_Q2_019_coefficient_22_0303
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0304 : Poly :=
[
  term ((11558923170259177561107368904581182429367 : Rat) / 701085444895191946212805550645387904080) [(6, 1), (16, 1)]
]

/-- Partial product 304 for generator 22. -/
def ep_Q2_019_partial_22_0304 : Poly :=
[
  term ((11558923170259177561107368904581182429367 : Rat) / 350542722447595973106402775322693952040) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-11558923170259177561107368904581182429367 : Rat) / 701085444895191946212805550645387904080) [(6, 1), (8, 2), (16, 1)],
  term ((11558923170259177561107368904581182429367 : Rat) / 350542722447595973106402775322693952040) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-11558923170259177561107368904581182429367 : Rat) / 701085444895191946212805550645387904080) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 22. -/
theorem ep_Q2_019_partial_22_0304_valid :
    mulPoly ep_Q2_019_coefficient_22_0304
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0305 : Poly :=
[
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (16, 1)]
]

/-- Partial product 305 for generator 22. -/
def ep_Q2_019_partial_22_0305 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (9, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (10, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 22. -/
theorem ep_Q2_019_partial_22_0305_valid :
    mulPoly ep_Q2_019_coefficient_22_0305
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0306 : Poly :=
[
  term ((115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (12, 1), (16, 1)]
]

/-- Partial product 306 for generator 22. -/
def ep_Q2_019_partial_22_0306 : Poly :=
[
  term ((230336035766574442747145319160638816 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (12, 1), (16, 1)],
  term ((230336035766574442747145319160638816 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 22. -/
theorem ep_Q2_019_partial_22_0306_valid :
    mulPoly ep_Q2_019_coefficient_22_0306
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0307 : Poly :=
[
  term ((-11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (14, 1), (16, 1)]
]

/-- Partial product 307 for generator 22. -/
def ep_Q2_019_partial_22_0307 : Poly :=
[
  term ((-22882067950809003524031896496563249184 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (14, 1), (16, 1)],
  term ((-22882067950809003524031896496563249184 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 22. -/
theorem ep_Q2_019_partial_22_0307_valid :
    mulPoly ep_Q2_019_coefficient_22_0307
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0308 : Poly :=
[
  term ((3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (16, 1)]
]

/-- Partial product 308 for generator 22. -/
def ep_Q2_019_partial_22_0308 : Poly :=
[
  term ((6452698058990762912868667893090862824 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (16, 1)],
  term ((6452698058990762912868667893090862824 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 22. -/
theorem ep_Q2_019_partial_22_0308_valid :
    mulPoly ep_Q2_019_coefficient_22_0308
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0309 : Poly :=
[
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (16, 1)]
]

/-- Partial product 309 for generator 22. -/
def ep_Q2_019_partial_22_0309 : Poly :=
[
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (8, 1), (10, 1), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (8, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (9, 1), (11, 1), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 22. -/
theorem ep_Q2_019_partial_22_0309_valid :
    mulPoly ep_Q2_019_coefficient_22_0309
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0310 : Poly :=
[
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 310 for generator 22. -/
def ep_Q2_019_partial_22_0310 : Poly :=
[
  term ((-237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 3), (16, 1)],
  term ((-237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 22. -/
theorem ep_Q2_019_partial_22_0310_valid :
    mulPoly ep_Q2_019_coefficient_22_0310
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0311 : Poly :=
[
  term ((426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 311 for generator 22. -/
def ep_Q2_019_partial_22_0311 : Poly :=
[
  term ((426405613655229668851375194115430692591 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((426405613655229668851375194115430692591 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 22. -/
theorem ep_Q2_019_partial_22_0311_valid :
    mulPoly ep_Q2_019_coefficient_22_0311
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0312 : Poly :=
[
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 22. -/
def ep_Q2_019_partial_22_0312 : Poly :=
[
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 22. -/
theorem ep_Q2_019_partial_22_0312_valid :
    mulPoly ep_Q2_019_coefficient_22_0312
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0313 : Poly :=
[
  term ((28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 313 for generator 22. -/
def ep_Q2_019_partial_22_0313 : Poly :=
[
  term ((56225065990804128413825689685487742784 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((56225065990804128413825689685487742784 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 22. -/
theorem ep_Q2_019_partial_22_0313_valid :
    mulPoly ep_Q2_019_coefficient_22_0313
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0314 : Poly :=
[
  term ((242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 314 for generator 22. -/
def ep_Q2_019_partial_22_0314 : Poly :=
[
  term ((484081506888101480886567360568315450192 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((484081506888101480886567360568315450192 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 22. -/
theorem ep_Q2_019_partial_22_0314_valid :
    mulPoly ep_Q2_019_coefficient_22_0314
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0315 : Poly :=
[
  term ((189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 22. -/
def ep_Q2_019_partial_22_0315 : Poly :=
[
  term ((379838595439972641340525496302957172638 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((379838595439972641340525496302957172638 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 22. -/
theorem ep_Q2_019_partial_22_0315_valid :
    mulPoly ep_Q2_019_coefficient_22_0315
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0316 : Poly :=
[
  term ((-4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 22. -/
def ep_Q2_019_partial_22_0316 : Poly :=
[
  term ((-4189570621696067458085407059354802710803 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4189570621696067458085407059354802710803 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 22. -/
theorem ep_Q2_019_partial_22_0316_valid :
    mulPoly ep_Q2_019_coefficient_22_0316
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0317 : Poly :=
[
  term ((192515992635071774925869242406449131824 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 317 for generator 22. -/
def ep_Q2_019_partial_22_0317 : Poly :=
[
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-192515992635071774925869242406449131824 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-192515992635071774925869242406449131824 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 22. -/
theorem ep_Q2_019_partial_22_0317_valid :
    mulPoly ep_Q2_019_coefficient_22_0317
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0318 : Poly :=
[
  term ((922489557693714272856653407795134914896 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 22. -/
def ep_Q2_019_partial_22_0318 : Poly :=
[
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-922489557693714272856653407795134914896 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-922489557693714272856653407795134914896 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 22. -/
theorem ep_Q2_019_partial_22_0318_valid :
    mulPoly ep_Q2_019_coefficient_22_0318
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0319 : Poly :=
[
  term ((1330533401616339573932627037090399336 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 319 for generator 22. -/
def ep_Q2_019_partial_22_0319 : Poly :=
[
  term ((2661066803232679147865254074180798672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1330533401616339573932627037090399336 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((2661066803232679147865254074180798672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1330533401616339573932627037090399336 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 22. -/
theorem ep_Q2_019_partial_22_0319_valid :
    mulPoly ep_Q2_019_coefficient_22_0319
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0320 : Poly :=
[
  term ((-385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 22. -/
def ep_Q2_019_partial_22_0320 : Poly :=
[
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 22. -/
theorem ep_Q2_019_partial_22_0320_valid :
    mulPoly ep_Q2_019_coefficient_22_0320
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0321 : Poly :=
[
  term ((-1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 22. -/
def ep_Q2_019_partial_22_0321 : Poly :=
[
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 22. -/
theorem ep_Q2_019_partial_22_0321_valid :
    mulPoly ep_Q2_019_coefficient_22_0321
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0322 : Poly :=
[
  term ((-150130647331965507336079811642010269976 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 322 for generator 22. -/
def ep_Q2_019_partial_22_0322 : Poly :=
[
  term ((-300261294663931014672159623284020539952 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((150130647331965507336079811642010269976 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-300261294663931014672159623284020539952 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((150130647331965507336079811642010269976 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 22. -/
theorem ep_Q2_019_partial_22_0322_valid :
    mulPoly ep_Q2_019_coefficient_22_0322
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0323 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 323 for generator 22. -/
def ep_Q2_019_partial_22_0323 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 22. -/
theorem ep_Q2_019_partial_22_0323_valid :
    mulPoly ep_Q2_019_coefficient_22_0323
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0324 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 22. -/
def ep_Q2_019_partial_22_0324 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 22. -/
theorem ep_Q2_019_partial_22_0324_valid :
    mulPoly ep_Q2_019_coefficient_22_0324
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0325 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 325 for generator 22. -/
def ep_Q2_019_partial_22_0325 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 22. -/
theorem ep_Q2_019_partial_22_0325_valid :
    mulPoly ep_Q2_019_coefficient_22_0325
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0326 : Poly :=
[
  term ((253468969228271111659299951501572472556 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 326 for generator 22. -/
def ep_Q2_019_partial_22_0326 : Poly :=
[
  term ((506937938456542223318599903003144945112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-253468969228271111659299951501572472556 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((506937938456542223318599903003144945112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-253468969228271111659299951501572472556 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 22. -/
theorem ep_Q2_019_partial_22_0326_valid :
    mulPoly ep_Q2_019_coefficient_22_0326
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0327 : Poly :=
[
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 22. -/
def ep_Q2_019_partial_22_0327 : Poly :=
[
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 22. -/
theorem ep_Q2_019_partial_22_0327_valid :
    mulPoly ep_Q2_019_coefficient_22_0327
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0328 : Poly :=
[
  term ((572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 328 for generator 22. -/
def ep_Q2_019_partial_22_0328 : Poly :=
[
  term ((572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 22. -/
theorem ep_Q2_019_partial_22_0328_valid :
    mulPoly ep_Q2_019_coefficient_22_0328
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0329 : Poly :=
[
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 22. -/
def ep_Q2_019_partial_22_0329 : Poly :=
[
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 22. -/
theorem ep_Q2_019_partial_22_0329_valid :
    mulPoly ep_Q2_019_coefficient_22_0329
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0330 : Poly :=
[
  term ((-5467276141822592731009817895276633039449 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 330 for generator 22. -/
def ep_Q2_019_partial_22_0330 : Poly :=
[
  term ((-5467276141822592731009817895276633039449 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((5467276141822592731009817895276633039449 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-5467276141822592731009817895276633039449 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((5467276141822592731009817895276633039449 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 22. -/
theorem ep_Q2_019_partial_22_0330_valid :
    mulPoly ep_Q2_019_coefficient_22_0330
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0331 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 331 for generator 22. -/
def ep_Q2_019_partial_22_0331 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 22. -/
theorem ep_Q2_019_partial_22_0331_valid :
    mulPoly ep_Q2_019_coefficient_22_0331
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0332 : Poly :=
[
  term ((218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 332 for generator 22. -/
def ep_Q2_019_partial_22_0332 : Poly :=
[
  term ((436816735701534275761720935990423648 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((436816735701534275761720935990423648 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 22. -/
theorem ep_Q2_019_partial_22_0332_valid :
    mulPoly ep_Q2_019_coefficient_22_0332
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0333 : Poly :=
[
  term ((253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 22. -/
def ep_Q2_019_partial_22_0333 : Poly :=
[
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 22. -/
theorem ep_Q2_019_partial_22_0333_valid :
    mulPoly ep_Q2_019_coefficient_22_0333
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0334 : Poly :=
[
  term ((-114926330427349391631530473496811636253 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 22. -/
def ep_Q2_019_partial_22_0334 : Poly :=
[
  term ((-229852660854698783263060946993623272506 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((114926330427349391631530473496811636253 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-229852660854698783263060946993623272506 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((114926330427349391631530473496811636253 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 22. -/
theorem ep_Q2_019_partial_22_0334_valid :
    mulPoly ep_Q2_019_coefficient_22_0334
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0335 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 22. -/
def ep_Q2_019_partial_22_0335 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 22. -/
theorem ep_Q2_019_partial_22_0335_valid :
    mulPoly ep_Q2_019_coefficient_22_0335
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0336 : Poly :=
[
  term ((13883317145914200933363960872519319128 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 336 for generator 22. -/
def ep_Q2_019_partial_22_0336 : Poly :=
[
  term ((27766634291828401866727921745038638256 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13883317145914200933363960872519319128 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((27766634291828401866727921745038638256 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13883317145914200933363960872519319128 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 22. -/
theorem ep_Q2_019_partial_22_0336_valid :
    mulPoly ep_Q2_019_coefficient_22_0336
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0337 : Poly :=
[
  term ((7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 22. -/
def ep_Q2_019_partial_22_0337 : Poly :=
[
  term ((15751443428454981306980812614989556384 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((15751443428454981306980812614989556384 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 22. -/
theorem ep_Q2_019_partial_22_0337_valid :
    mulPoly ep_Q2_019_coefficient_22_0337
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0338 : Poly :=
[
  term ((208603030341408196483167353515770323906 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 338 for generator 22. -/
def ep_Q2_019_partial_22_0338 : Poly :=
[
  term ((417206060682816392966334707031540647812 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-208603030341408196483167353515770323906 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((417206060682816392966334707031540647812 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-208603030341408196483167353515770323906 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 22. -/
theorem ep_Q2_019_partial_22_0338_valid :
    mulPoly ep_Q2_019_coefficient_22_0338
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0339 : Poly :=
[
  term ((-2037674428457603675482767503427883815743 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 22. -/
def ep_Q2_019_partial_22_0339 : Poly :=
[
  term ((-2037674428457603675482767503427883815743 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2037674428457603675482767503427883815743 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2037674428457603675482767503427883815743 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2037674428457603675482767503427883815743 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 22. -/
theorem ep_Q2_019_partial_22_0339_valid :
    mulPoly ep_Q2_019_coefficient_22_0339
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0340 : Poly :=
[
  term ((-18501298842772763309276636488131591011923 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 22. -/
def ep_Q2_019_partial_22_0340 : Poly :=
[
  term ((-18501298842772763309276636488131591011923 : Rat) / 175271361223797986553201387661346976020) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((18501298842772763309276636488131591011923 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-18501298842772763309276636488131591011923 : Rat) / 175271361223797986553201387661346976020) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18501298842772763309276636488131591011923 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 22. -/
theorem ep_Q2_019_partial_22_0340_valid :
    mulPoly ep_Q2_019_coefficient_22_0340
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0341 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 341 for generator 22. -/
def ep_Q2_019_partial_22_0341 : Poly :=
[
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 22. -/
theorem ep_Q2_019_partial_22_0341_valid :
    mulPoly ep_Q2_019_coefficient_22_0341
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0342 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 342 for generator 22. -/
def ep_Q2_019_partial_22_0342 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 22. -/
theorem ep_Q2_019_partial_22_0342_valid :
    mulPoly ep_Q2_019_coefficient_22_0342
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0343 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 22. -/
def ep_Q2_019_partial_22_0343 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 22. -/
theorem ep_Q2_019_partial_22_0343_valid :
    mulPoly ep_Q2_019_coefficient_22_0343
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0344 : Poly :=
[
  term ((-20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 344 for generator 22. -/
def ep_Q2_019_partial_22_0344 : Poly :=
[
  term ((-40117132903568716773619829219570272496 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-40117132903568716773619829219570272496 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 22. -/
theorem ep_Q2_019_partial_22_0344_valid :
    mulPoly ep_Q2_019_coefficient_22_0344
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0345 : Poly :=
[
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 345 for generator 22. -/
def ep_Q2_019_partial_22_0345 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 22. -/
theorem ep_Q2_019_partial_22_0345_valid :
    mulPoly ep_Q2_019_coefficient_22_0345
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0346 : Poly :=
[
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 22. -/
def ep_Q2_019_partial_22_0346 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 22. -/
theorem ep_Q2_019_partial_22_0346_valid :
    mulPoly ep_Q2_019_coefficient_22_0346
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0347 : Poly :=
[
  term ((-10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 347 for generator 22. -/
def ep_Q2_019_partial_22_0347 : Poly :=
[
  term ((-21647417037883484513335096307222572224 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((-21647417037883484513335096307222572224 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 22. -/
theorem ep_Q2_019_partial_22_0347_valid :
    mulPoly ep_Q2_019_coefficient_22_0347
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0348 : Poly :=
[
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 348 for generator 22. -/
def ep_Q2_019_partial_22_0348 : Poly :=
[
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 22. -/
theorem ep_Q2_019_partial_22_0348_valid :
    mulPoly ep_Q2_019_coefficient_22_0348
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0349 : Poly :=
[
  term ((121648986796167101083949292009726268376 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (16, 1)]
]

/-- Partial product 349 for generator 22. -/
def ep_Q2_019_partial_22_0349 : Poly :=
[
  term ((243297973592334202167898584019452536752 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-121648986796167101083949292009726268376 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (8, 2), (16, 1)],
  term ((243297973592334202167898584019452536752 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-121648986796167101083949292009726268376 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 22. -/
theorem ep_Q2_019_partial_22_0349_valid :
    mulPoly ep_Q2_019_coefficient_22_0349
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0350 : Poly :=
[
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 350 for generator 22. -/
def ep_Q2_019_partial_22_0350 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 3), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 22. -/
theorem ep_Q2_019_partial_22_0350_valid :
    mulPoly ep_Q2_019_coefficient_22_0350
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0351 : Poly :=
[
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 22. -/
def ep_Q2_019_partial_22_0351 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 22. -/
theorem ep_Q2_019_partial_22_0351_valid :
    mulPoly ep_Q2_019_coefficient_22_0351
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0352 : Poly :=
[
  term ((-1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 352 for generator 22. -/
def ep_Q2_019_partial_22_0352 : Poly :=
[
  term ((-3230279026284996057748315816743212284 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3230279026284996057748315816743212284 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 22. -/
theorem ep_Q2_019_partial_22_0352_valid :
    mulPoly ep_Q2_019_coefficient_22_0352
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0353 : Poly :=
[
  term ((6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 22. -/
def ep_Q2_019_partial_22_0353 : Poly :=
[
  term ((13553973298065694996640916889028624596538 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13553973298065694996640916889028624596538 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 22. -/
theorem ep_Q2_019_partial_22_0353_valid :
    mulPoly ep_Q2_019_coefficient_22_0353
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0354 : Poly :=
[
  term ((243557062242526294112781932665042711850561 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 22. -/
def ep_Q2_019_partial_22_0354 : Poly :=
[
  term ((243557062242526294112781932665042711850561 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-243557062242526294112781932665042711850561 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((243557062242526294112781932665042711850561 : Rat) / 5126687315796091106681140589094399048585) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-243557062242526294112781932665042711850561 : Rat) / 10253374631592182213362281178188798097170) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 22. -/
theorem ep_Q2_019_partial_22_0354_valid :
    mulPoly ep_Q2_019_coefficient_22_0354
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0355 : Poly :=
[
  term ((-2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 355 for generator 22. -/
def ep_Q2_019_partial_22_0355 : Poly :=
[
  term ((-2936817802379299007228050737620641103581 : Rat) / 157744225101418187897881248895212278418) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-2936817802379299007228050737620641103581 : Rat) / 157744225101418187897881248895212278418) [(8, 2), (10, 1), (11, 2), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 22. -/
theorem ep_Q2_019_partial_22_0355_valid :
    mulPoly ep_Q2_019_coefficient_22_0355
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0356 : Poly :=
[
  term ((-26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 356 for generator 22. -/
def ep_Q2_019_partial_22_0356 : Poly :=
[
  term ((-52369356708363263624046053854432563248 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-52369356708363263624046053854432563248 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 22. -/
theorem ep_Q2_019_partial_22_0356_valid :
    mulPoly ep_Q2_019_coefficient_22_0356
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0357 : Poly :=
[
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 357 for generator 22. -/
def ep_Q2_019_partial_22_0357 : Poly :=
[
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 22. -/
theorem ep_Q2_019_partial_22_0357_valid :
    mulPoly ep_Q2_019_coefficient_22_0357
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0358 : Poly :=
[
  term ((-17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 2), (16, 1)]
]

/-- Partial product 358 for generator 22. -/
def ep_Q2_019_partial_22_0358 : Poly :=
[
  term ((-35400130005276933484922765672029801344 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((-35400130005276933484922765672029801344 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 22. -/
theorem ep_Q2_019_partial_22_0358_valid :
    mulPoly ep_Q2_019_coefficient_22_0358
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0359 : Poly :=
[
  term ((-6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 22. -/
def ep_Q2_019_partial_22_0359 : Poly :=
[
  term ((-13473694300964342820428736283446473011578 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13473694300964342820428736283446473011578 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 22. -/
theorem ep_Q2_019_partial_22_0359_valid :
    mulPoly ep_Q2_019_coefficient_22_0359
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0360 : Poly :=
[
  term ((1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 22. -/
def ep_Q2_019_partial_22_0360 : Poly :=
[
  term ((1328559129644869579289846967333067294567 : Rat) / 34875423916980211610075786320370061555) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1328559129644869579289846967333067294567 : Rat) / 34875423916980211610075786320370061555) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 22. -/
theorem ep_Q2_019_partial_22_0360_valid :
    mulPoly ep_Q2_019_coefficient_22_0360
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0361 : Poly :=
[
  term ((-18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 361 for generator 22. -/
def ep_Q2_019_partial_22_0361 : Poly :=
[
  term ((-37727377225139558553878994788252913584 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-37727377225139558553878994788252913584 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 22. -/
theorem ep_Q2_019_partial_22_0361_valid :
    mulPoly ep_Q2_019_coefficient_22_0361
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0362 : Poly :=
[
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 362 for generator 22. -/
def ep_Q2_019_partial_22_0362 : Poly :=
[
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 22. -/
theorem ep_Q2_019_partial_22_0362_valid :
    mulPoly ep_Q2_019_coefficient_22_0362
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0363 : Poly :=
[
  term ((4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 363 for generator 22. -/
def ep_Q2_019_partial_22_0363 : Poly :=
[
  term ((4931968254107121451409235981817201246921 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((4931968254107121451409235981817201246921 : Rat) / 394360562753545469744703122238030696045) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 22. -/
theorem ep_Q2_019_partial_22_0363_valid :
    mulPoly ep_Q2_019_coefficient_22_0363
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0364 : Poly :=
[
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (14, 2), (16, 1)]
]

/-- Partial product 364 for generator 22. -/
def ep_Q2_019_partial_22_0364 : Poly :=
[
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(8, 2), (10, 1), (14, 2), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 22. -/
theorem ep_Q2_019_partial_22_0364_valid :
    mulPoly ep_Q2_019_coefficient_22_0364
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0365 : Poly :=
[
  term ((-5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 22. -/
def ep_Q2_019_partial_22_0365 : Poly :=
[
  term ((-11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 22. -/
theorem ep_Q2_019_partial_22_0365_valid :
    mulPoly ep_Q2_019_coefficient_22_0365
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0366 : Poly :=
[
  term ((-747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (16, 1)]
]

/-- Partial product 366 for generator 22. -/
def ep_Q2_019_partial_22_0366 : Poly :=
[
  term ((-747046076064874633477146758656963703539 : Rat) / 28422382901156430251870495296434644760) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (9, 2), (16, 1)],
  term ((-747046076064874633477146758656963703539 : Rat) / 28422382901156430251870495296434644760) [(8, 2), (10, 1), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 22. -/
theorem ep_Q2_019_partial_22_0366_valid :
    mulPoly ep_Q2_019_coefficient_22_0366
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0367 : Poly :=
[
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 367 for generator 22. -/
def ep_Q2_019_partial_22_0367 : Poly :=
[
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 22. -/
theorem ep_Q2_019_partial_22_0367_valid :
    mulPoly ep_Q2_019_coefficient_22_0367
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0368 : Poly :=
[
  term ((-95892786264741388292923622173557596784 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 368 for generator 22. -/
def ep_Q2_019_partial_22_0368 : Poly :=
[
  term ((-191785572529482776585847244347115193568 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((95892786264741388292923622173557596784 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191785572529482776585847244347115193568 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((95892786264741388292923622173557596784 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 22. -/
theorem ep_Q2_019_partial_22_0368_valid :
    mulPoly ep_Q2_019_coefficient_22_0368
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0369 : Poly :=
[
  term ((-2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 369 for generator 22. -/
def ep_Q2_019_partial_22_0369 : Poly :=
[
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 22. -/
theorem ep_Q2_019_partial_22_0369_valid :
    mulPoly ep_Q2_019_coefficient_22_0369
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0370 : Poly :=
[
  term ((-92142669818064605047171314591719247176 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 370 for generator 22. -/
def ep_Q2_019_partial_22_0370 : Poly :=
[
  term ((-184285339636129210094342629183438494352 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((92142669818064605047171314591719247176 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-184285339636129210094342629183438494352 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((92142669818064605047171314591719247176 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 22. -/
theorem ep_Q2_019_partial_22_0370_valid :
    mulPoly ep_Q2_019_coefficient_22_0370
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0371 : Poly :=
[
  term ((789852759527920718373022567953797549113 : Rat) / 26290704183569697982980208149202046403) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 371 for generator 22. -/
def ep_Q2_019_partial_22_0371 : Poly :=
[
  term ((1579705519055841436746045135907595098226 : Rat) / 26290704183569697982980208149202046403) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-789852759527920718373022567953797549113 : Rat) / 26290704183569697982980208149202046403) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((1579705519055841436746045135907595098226 : Rat) / 26290704183569697982980208149202046403) [(9, 2), (11, 2), (16, 1)],
  term ((-789852759527920718373022567953797549113 : Rat) / 26290704183569697982980208149202046403) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 22. -/
theorem ep_Q2_019_partial_22_0371_valid :
    mulPoly ep_Q2_019_coefficient_22_0371
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0372 : Poly :=
[
  term ((232724721986262506895622911622311224 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 372 for generator 22. -/
def ep_Q2_019_partial_22_0372 : Poly :=
[
  term ((465449443972525013791245823244622448 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-232724721986262506895622911622311224 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((465449443972525013791245823244622448 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-232724721986262506895622911622311224 : Rat) / 1251938294455699903951438483295335543) [(9, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 22. -/
theorem ep_Q2_019_partial_22_0372_valid :
    mulPoly ep_Q2_019_coefficient_22_0372
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0373 : Poly :=
[
  term ((6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 22. -/
def ep_Q2_019_partial_22_0373 : Poly :=
[
  term ((13553973298065694996640916889028624596538 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13553973298065694996640916889028624596538 : Rat) / 569631923977343456297904509899377672065) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 22. -/
theorem ep_Q2_019_partial_22_0373_valid :
    mulPoly ep_Q2_019_coefficient_22_0373
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0374 : Poly :=
[
  term ((-26975942967388811571292903450015998710087 : Rat) / 683558308772812147557485411879253206478) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 22. -/
def ep_Q2_019_partial_22_0374 : Poly :=
[
  term ((-26975942967388811571292903450015998710087 : Rat) / 341779154386406073778742705939626603239) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((26975942967388811571292903450015998710087 : Rat) / 683558308772812147557485411879253206478) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26975942967388811571292903450015998710087 : Rat) / 341779154386406073778742705939626603239) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((26975942967388811571292903450015998710087 : Rat) / 683558308772812147557485411879253206478) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 22. -/
theorem ep_Q2_019_partial_22_0374_valid :
    mulPoly ep_Q2_019_coefficient_22_0374
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0375 : Poly :=
[
  term ((-308818676455637421928725020026486840816 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 375 for generator 22. -/
def ep_Q2_019_partial_22_0375 : Poly :=
[
  term ((-617637352911274843857450040052973681632 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((308818676455637421928725020026486840816 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-617637352911274843857450040052973681632 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((308818676455637421928725020026486840816 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 22. -/
theorem ep_Q2_019_partial_22_0375_valid :
    mulPoly ep_Q2_019_coefficient_22_0375
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0376 : Poly :=
[
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 376 for generator 22. -/
def ep_Q2_019_partial_22_0376 : Poly :=
[
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 22. -/
theorem ep_Q2_019_partial_22_0376_valid :
    mulPoly ep_Q2_019_coefficient_22_0376
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0377 : Poly :=
[
  term ((2080243468957800303230393371939183077683 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 377 for generator 22. -/
def ep_Q2_019_partial_22_0377 : Poly :=
[
  term ((4160486937915600606460786743878366155366 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2080243468957800303230393371939183077683 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((4160486937915600606460786743878366155366 : Rat) / 43817840305949496638300346915336744005) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2080243468957800303230393371939183077683 : Rat) / 43817840305949496638300346915336744005) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 22. -/
theorem ep_Q2_019_partial_22_0377_valid :
    mulPoly ep_Q2_019_coefficient_22_0377
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0378 : Poly :=
[
  term ((-7578335305401954826986289305654878315047 : Rat) / 1464767804513168887623183025455542585310) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 22. -/
def ep_Q2_019_partial_22_0378 : Poly :=
[
  term ((-7578335305401954826986289305654878315047 : Rat) / 732383902256584443811591512727771292655) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7578335305401954826986289305654878315047 : Rat) / 1464767804513168887623183025455542585310) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7578335305401954826986289305654878315047 : Rat) / 732383902256584443811591512727771292655) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7578335305401954826986289305654878315047 : Rat) / 1464767804513168887623183025455542585310) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 22. -/
theorem ep_Q2_019_partial_22_0378_valid :
    mulPoly ep_Q2_019_coefficient_22_0378
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0379 : Poly :=
[
  term ((-7042174247300716702851541041666364196014 : Rat) / 5126687315796091106681140589094399048585) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 22. -/
def ep_Q2_019_partial_22_0379 : Poly :=
[
  term ((-14084348494601433405703082083332728392028 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7042174247300716702851541041666364196014 : Rat) / 5126687315796091106681140589094399048585) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-14084348494601433405703082083332728392028 : Rat) / 5126687315796091106681140589094399048585) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7042174247300716702851541041666364196014 : Rat) / 5126687315796091106681140589094399048585) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 22. -/
theorem ep_Q2_019_partial_22_0379_valid :
    mulPoly ep_Q2_019_coefficient_22_0379
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0380 : Poly :=
[
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 380 for generator 22. -/
def ep_Q2_019_partial_22_0380 : Poly :=
[
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 22. -/
theorem ep_Q2_019_partial_22_0380_valid :
    mulPoly ep_Q2_019_coefficient_22_0380
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0381 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 381 for generator 22. -/
def ep_Q2_019_partial_22_0381 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 4), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 22. -/
theorem ep_Q2_019_partial_22_0381_valid :
    mulPoly ep_Q2_019_coefficient_22_0381
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0382 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 22. -/
def ep_Q2_019_partial_22_0382 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 22. -/
theorem ep_Q2_019_partial_22_0382_valid :
    mulPoly ep_Q2_019_coefficient_22_0382
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0383 : Poly :=
[
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(9, 2), (16, 1)]
]

/-- Partial product 383 for generator 22. -/
def ep_Q2_019_partial_22_0383 : Poly :=
[
  term ((-237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(8, 2), (9, 2), (16, 1)],
  term ((-237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(9, 3), (11, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 22. -/
theorem ep_Q2_019_partial_22_0383_valid :
    mulPoly ep_Q2_019_coefficient_22_0383
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0384 : Poly :=
[
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 384 for generator 22. -/
def ep_Q2_019_partial_22_0384 : Poly :=
[
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 22. -/
theorem ep_Q2_019_partial_22_0384_valid :
    mulPoly ep_Q2_019_coefficient_22_0384
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0385 : Poly :=
[
  term ((-13404636887143910461625534969483750790074 : Rat) / 569631923977343456297904509899377672065) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 22. -/
def ep_Q2_019_partial_22_0385 : Poly :=
[
  term ((-26809273774287820923251069938967501580148 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13404636887143910461625534969483750790074 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26809273774287820923251069938967501580148 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13404636887143910461625534969483750790074 : Rat) / 569631923977343456297904509899377672065) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 22. -/
theorem ep_Q2_019_partial_22_0385_valid :
    mulPoly ep_Q2_019_coefficient_22_0385
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0386 : Poly :=
[
  term ((209790787795095498990462002583222610209 : Rat) / 33507760233961379782229677052904568945) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 22. -/
def ep_Q2_019_partial_22_0386 : Poly :=
[
  term ((419581575590190997980924005166445220418 : Rat) / 33507760233961379782229677052904568945) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-209790787795095498990462002583222610209 : Rat) / 33507760233961379782229677052904568945) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((419581575590190997980924005166445220418 : Rat) / 33507760233961379782229677052904568945) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-209790787795095498990462002583222610209 : Rat) / 33507760233961379782229677052904568945) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 22. -/
theorem ep_Q2_019_partial_22_0386_valid :
    mulPoly ep_Q2_019_coefficient_22_0386
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0387 : Poly :=
[
  term ((29736495187866092658266230853862720222 : Rat) / 1184265954214851260494603970684776865) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 387 for generator 22. -/
def ep_Q2_019_partial_22_0387 : Poly :=
[
  term ((59472990375732185316532461707725440444 : Rat) / 1184265954214851260494603970684776865) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29736495187866092658266230853862720222 : Rat) / 1184265954214851260494603970684776865) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((59472990375732185316532461707725440444 : Rat) / 1184265954214851260494603970684776865) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-29736495187866092658266230853862720222 : Rat) / 1184265954214851260494603970684776865) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 22. -/
theorem ep_Q2_019_partial_22_0387_valid :
    mulPoly ep_Q2_019_coefficient_22_0387
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0388 : Poly :=
[
  term ((260887948162738881074275274469822165826 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 388 for generator 22. -/
def ep_Q2_019_partial_22_0388 : Poly :=
[
  term ((521775896325477762148550548939644331652 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-260887948162738881074275274469822165826 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((521775896325477762148550548939644331652 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-260887948162738881074275274469822165826 : Rat) / 43817840305949496638300346915336744005) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 22. -/
theorem ep_Q2_019_partial_22_0388_valid :
    mulPoly ep_Q2_019_coefficient_22_0388
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0389 : Poly :=
[
  term ((51878091212619742025556825329310636262942 : Rat) / 569631923977343456297904509899377672065) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 22. -/
def ep_Q2_019_partial_22_0389 : Poly :=
[
  term ((103756182425239484051113650658621272525884 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51878091212619742025556825329310636262942 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((103756182425239484051113650658621272525884 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-51878091212619742025556825329310636262942 : Rat) / 569631923977343456297904509899377672065) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 22. -/
theorem ep_Q2_019_partial_22_0389_valid :
    mulPoly ep_Q2_019_coefficient_22_0389
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0390 : Poly :=
[
  term ((105263268146110987992684965430996159695491 : Rat) / 1051628167342787919319208325968081856120) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 390 for generator 22. -/
def ep_Q2_019_partial_22_0390 : Poly :=
[
  term ((105263268146110987992684965430996159695491 : Rat) / 525814083671393959659604162984040928060) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-105263268146110987992684965430996159695491 : Rat) / 1051628167342787919319208325968081856120) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((105263268146110987992684965430996159695491 : Rat) / 525814083671393959659604162984040928060) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105263268146110987992684965430996159695491 : Rat) / 1051628167342787919319208325968081856120) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 22. -/
theorem ep_Q2_019_partial_22_0390_valid :
    mulPoly ep_Q2_019_coefficient_22_0390
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0391 : Poly :=
[
  term ((-19632920749401589105160755027447113457675 : Rat) / 1261953800811345503183049991161698227344) [(11, 2), (16, 1)]
]

/-- Partial product 391 for generator 22. -/
def ep_Q2_019_partial_22_0391 : Poly :=
[
  term ((-19632920749401589105160755027447113457675 : Rat) / 630976900405672751591524995580849113672) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((19632920749401589105160755027447113457675 : Rat) / 1261953800811345503183049991161698227344) [(8, 2), (11, 2), (16, 1)],
  term ((-19632920749401589105160755027447113457675 : Rat) / 630976900405672751591524995580849113672) [(9, 1), (11, 3), (16, 1)],
  term ((19632920749401589105160755027447113457675 : Rat) / 1261953800811345503183049991161698227344) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 22. -/
theorem ep_Q2_019_partial_22_0391_valid :
    mulPoly ep_Q2_019_coefficient_22_0391
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0392 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 22. -/
def ep_Q2_019_partial_22_0392 : Poly :=
[
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 22. -/
theorem ep_Q2_019_partial_22_0392_valid :
    mulPoly ep_Q2_019_coefficient_22_0392
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0393 : Poly :=
[
  term ((1572321184466920436420191149918892208 : Rat) / 1251938294455699903951438483295335543) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 22. -/
def ep_Q2_019_partial_22_0393 : Poly :=
[
  term ((3144642368933840872840382299837784416 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1572321184466920436420191149918892208 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3144642368933840872840382299837784416 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1572321184466920436420191149918892208 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 22. -/
theorem ep_Q2_019_partial_22_0393_valid :
    mulPoly ep_Q2_019_coefficient_22_0393
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0394 : Poly :=
[
  term ((-8119799588004041653906807969900782552 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 394 for generator 22. -/
def ep_Q2_019_partial_22_0394 : Poly :=
[
  term ((-16239599176008083307813615939801565104 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((8119799588004041653906807969900782552 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-16239599176008083307813615939801565104 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((8119799588004041653906807969900782552 : Rat) / 6259691472278499519757192416476677715) [(9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 22. -/
theorem ep_Q2_019_partial_22_0394_valid :
    mulPoly ep_Q2_019_coefficient_22_0394
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0395 : Poly :=
[
  term ((-506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 22. -/
def ep_Q2_019_partial_22_0395 : Poly :=
[
  term ((-1013364273073703996528784994550684736 : Rat) / 178848327779385700564491211899333649) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1013364273073703996528784994550684736 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 22. -/
theorem ep_Q2_019_partial_22_0395_valid :
    mulPoly ep_Q2_019_coefficient_22_0395
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0396 : Poly :=
[
  term ((-112774291059777916842345584761239000386 : Rat) / 8763568061189899327660069383067348801) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 396 for generator 22. -/
def ep_Q2_019_partial_22_0396 : Poly :=
[
  term ((-225548582119555833684691169522478000772 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((112774291059777916842345584761239000386 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-225548582119555833684691169522478000772 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((112774291059777916842345584761239000386 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 22. -/
theorem ep_Q2_019_partial_22_0396_valid :
    mulPoly ep_Q2_019_coefficient_22_0396
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0397 : Poly :=
[
  term ((22330326853621274371460262989678757328 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 397 for generator 22. -/
def ep_Q2_019_partial_22_0397 : Poly :=
[
  term ((44660653707242548742920525979357514656 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-22330326853621274371460262989678757328 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (12, 1), (14, 2), (16, 1)],
  term ((44660653707242548742920525979357514656 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-22330326853621274371460262989678757328 : Rat) / 6259691472278499519757192416476677715) [(9, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 22. -/
theorem ep_Q2_019_partial_22_0397_valid :
    mulPoly ep_Q2_019_coefficient_22_0397
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0398 : Poly :=
[
  term ((-126931049630423412006682188490501068966659 : Rat) / 3417791543864060737787427059396266032390) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 398 for generator 22. -/
def ep_Q2_019_partial_22_0398 : Poly :=
[
  term ((-126931049630423412006682188490501068966659 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((126931049630423412006682188490501068966659 : Rat) / 3417791543864060737787427059396266032390) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-126931049630423412006682188490501068966659 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((126931049630423412006682188490501068966659 : Rat) / 3417791543864060737787427059396266032390) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 22. -/
theorem ep_Q2_019_partial_22_0398_valid :
    mulPoly ep_Q2_019_coefficient_22_0398
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 22. -/
def ep_Q2_019_coefficient_22_0399 : Poly :=
[
  term ((606357712425158308422750034290083503412 : Rat) / 43817840305949496638300346915336744005) [(12, 1), (16, 1)]
]

/-- Partial product 399 for generator 22. -/
def ep_Q2_019_partial_22_0399 : Poly :=
[
  term ((1212715424850316616845500068580167006824 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-606357712425158308422750034290083503412 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (12, 1), (16, 1)],
  term ((1212715424850316616845500068580167006824 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-606357712425158308422750034290083503412 : Rat) / 43817840305949496638300346915336744005) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 22. -/
theorem ep_Q2_019_partial_22_0399_valid :
    mulPoly ep_Q2_019_coefficient_22_0399
        ep_Q2_019_generator_22_0300_0399 =
      ep_Q2_019_partial_22_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_22_0300_0399 : List Poly :=
[
  ep_Q2_019_partial_22_0300,
  ep_Q2_019_partial_22_0301,
  ep_Q2_019_partial_22_0302,
  ep_Q2_019_partial_22_0303,
  ep_Q2_019_partial_22_0304,
  ep_Q2_019_partial_22_0305,
  ep_Q2_019_partial_22_0306,
  ep_Q2_019_partial_22_0307,
  ep_Q2_019_partial_22_0308,
  ep_Q2_019_partial_22_0309,
  ep_Q2_019_partial_22_0310,
  ep_Q2_019_partial_22_0311,
  ep_Q2_019_partial_22_0312,
  ep_Q2_019_partial_22_0313,
  ep_Q2_019_partial_22_0314,
  ep_Q2_019_partial_22_0315,
  ep_Q2_019_partial_22_0316,
  ep_Q2_019_partial_22_0317,
  ep_Q2_019_partial_22_0318,
  ep_Q2_019_partial_22_0319,
  ep_Q2_019_partial_22_0320,
  ep_Q2_019_partial_22_0321,
  ep_Q2_019_partial_22_0322,
  ep_Q2_019_partial_22_0323,
  ep_Q2_019_partial_22_0324,
  ep_Q2_019_partial_22_0325,
  ep_Q2_019_partial_22_0326,
  ep_Q2_019_partial_22_0327,
  ep_Q2_019_partial_22_0328,
  ep_Q2_019_partial_22_0329,
  ep_Q2_019_partial_22_0330,
  ep_Q2_019_partial_22_0331,
  ep_Q2_019_partial_22_0332,
  ep_Q2_019_partial_22_0333,
  ep_Q2_019_partial_22_0334,
  ep_Q2_019_partial_22_0335,
  ep_Q2_019_partial_22_0336,
  ep_Q2_019_partial_22_0337,
  ep_Q2_019_partial_22_0338,
  ep_Q2_019_partial_22_0339,
  ep_Q2_019_partial_22_0340,
  ep_Q2_019_partial_22_0341,
  ep_Q2_019_partial_22_0342,
  ep_Q2_019_partial_22_0343,
  ep_Q2_019_partial_22_0344,
  ep_Q2_019_partial_22_0345,
  ep_Q2_019_partial_22_0346,
  ep_Q2_019_partial_22_0347,
  ep_Q2_019_partial_22_0348,
  ep_Q2_019_partial_22_0349,
  ep_Q2_019_partial_22_0350,
  ep_Q2_019_partial_22_0351,
  ep_Q2_019_partial_22_0352,
  ep_Q2_019_partial_22_0353,
  ep_Q2_019_partial_22_0354,
  ep_Q2_019_partial_22_0355,
  ep_Q2_019_partial_22_0356,
  ep_Q2_019_partial_22_0357,
  ep_Q2_019_partial_22_0358,
  ep_Q2_019_partial_22_0359,
  ep_Q2_019_partial_22_0360,
  ep_Q2_019_partial_22_0361,
  ep_Q2_019_partial_22_0362,
  ep_Q2_019_partial_22_0363,
  ep_Q2_019_partial_22_0364,
  ep_Q2_019_partial_22_0365,
  ep_Q2_019_partial_22_0366,
  ep_Q2_019_partial_22_0367,
  ep_Q2_019_partial_22_0368,
  ep_Q2_019_partial_22_0369,
  ep_Q2_019_partial_22_0370,
  ep_Q2_019_partial_22_0371,
  ep_Q2_019_partial_22_0372,
  ep_Q2_019_partial_22_0373,
  ep_Q2_019_partial_22_0374,
  ep_Q2_019_partial_22_0375,
  ep_Q2_019_partial_22_0376,
  ep_Q2_019_partial_22_0377,
  ep_Q2_019_partial_22_0378,
  ep_Q2_019_partial_22_0379,
  ep_Q2_019_partial_22_0380,
  ep_Q2_019_partial_22_0381,
  ep_Q2_019_partial_22_0382,
  ep_Q2_019_partial_22_0383,
  ep_Q2_019_partial_22_0384,
  ep_Q2_019_partial_22_0385,
  ep_Q2_019_partial_22_0386,
  ep_Q2_019_partial_22_0387,
  ep_Q2_019_partial_22_0388,
  ep_Q2_019_partial_22_0389,
  ep_Q2_019_partial_22_0390,
  ep_Q2_019_partial_22_0391,
  ep_Q2_019_partial_22_0392,
  ep_Q2_019_partial_22_0393,
  ep_Q2_019_partial_22_0394,
  ep_Q2_019_partial_22_0395,
  ep_Q2_019_partial_22_0396,
  ep_Q2_019_partial_22_0397,
  ep_Q2_019_partial_22_0398,
  ep_Q2_019_partial_22_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_22_0300_0399 : Poly :=
[
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1048857498957415424382709894947523022809 : Rat) / 7732560053991087642053002396824131295) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-946034392295223839387946583872354673744 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((11558923170259177561107368904581182429367 : Rat) / 350542722447595973106402775322693952040) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((1048857498957415424382709894947523022809 : Rat) / 15465120107982175284106004793648262590) [(6, 1), (8, 2), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (8, 2), (14, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-11558923170259177561107368904581182429367 : Rat) / 701085444895191946212805550645387904080) [(6, 1), (8, 2), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1048857498957415424382709894947523022809 : Rat) / 7732560053991087642053002396824131295) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-946034392295223839387946583872354673744 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11558923170259177561107368904581182429367 : Rat) / 350542722447595973106402775322693952040) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((1048857498957415424382709894947523022809 : Rat) / 15465120107982175284106004793648262590) [(6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (9, 2), (14, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-11558923170259177561107368904581182429367 : Rat) / 701085444895191946212805550645387904080) [(6, 1), (9, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (9, 2), (16, 1)],
  term ((230336035766574442747145319160638816 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-22882067950809003524031896496563249184 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((6452698058990762912868667893090862824 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (10, 1), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (12, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (14, 1), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 3), (16, 1)],
  term ((230336035766574442747145319160638816 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-22882067950809003524031896496563249184 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((6452698058990762912868667893090862824 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 2), (12, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 2), (14, 1), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (9, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (8, 1), (10, 1), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (8, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (9, 1), (11, 1), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (9, 2), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2661066803232679147865254074180798672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-300261294663931014672159623284020539952 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((56225065990804128413825689685487742784 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((484081506888101480886567360568315450192 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((379838595439972641340525496302957172638 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4189570621696067458085407059354802710803 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((426405613655229668851375194115430692591 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-126779703949227588928189832576841628859 : Rat) / 5155040035994058428035334931216087530) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 3), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((506937938456542223318599903003144945112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5467276141822592731009817895276633039449 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((436816735701534275761720935990423648 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-229852660854698783263060946993623272506 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((27766634291828401866727921745038638256 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((15751443428454981306980812614989556384 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((417206060682816392966334707031540647812 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2037674428457603675482767503427883815743 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18501298842772763309276636488131591011923 : Rat) / 175271361223797986553201387661346976020) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-192515992635071774925869242406449131824 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-922489557693714272856653407795134914896 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1330533401616339573932627037090399336 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((150130647331965507336079811642010269976 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((426405613655229668851375194115430692591 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((56225065990804128413825689685487742784 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((484081506888101480886567360568315450192 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((379838595439972641340525496302957172638 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4189570621696067458085407059354802710803 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-253468969228271111659299951501572472556 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((5467276141822592731009817895276633039449 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114926330427349391631530473496811636253 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-13883317145914200933363960872519319128 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-208603030341408196483167353515770323906 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((2037674428457603675482767503427883815743 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((18501298842772763309276636488131591011923 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 3), (9, 1), (16, 1)],
  term ((-426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 3), (11, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 3), (12, 1), (15, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 3), (13, 1), (14, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 3), (13, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 3), (14, 1), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 3), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((436816735701534275761720935990423648 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-229852660854698783263060946993623272506 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((27766634291828401866727921745038638256 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15751443428454981306980812614989556384 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((417206060682816392966334707031540647812 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2037674428457603675482767503427883815743 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18501298842772763309276636488131591011923 : Rat) / 175271361223797986553201387661346976020) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((506937938456542223318599903003144945112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5467276141822592731009817895276633039449 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-234841501605642357624243172982306881852 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-768460338267953761916843540693790452624 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-3708932315581619039756324340186098795968 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((372828121171084110988780483173677312005 : Rat) / 105162816734278791931920832596808185612) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114926330427349391631530473496811636253 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-13883317145914200933363960872519319128 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-208603030341408196483167353515770323906 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((2037674428457603675482767503427883815743 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((18501298842772763309276636488131591011923 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-384919095911488029790271722181119337584 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-1849549865182176163914889282661930452256 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1330533401616339573932627037090399336 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 3), (12, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((150130647331965507336079811642010269976 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 3), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 4), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 4), (15, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40117132903568716773619829219570272496 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-21647417037883484513335096307222572224 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((243297973592334202167898584019452536752 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-40117132903568716773619829219570272496 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((-121648986796167101083949292009726268376 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (8, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 3), (9, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 3), (9, 1), (15, 1), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 3), (16, 1)],
  term ((-21647417037883484513335096307222572224 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((243297973592334202167898584019452536752 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-121648986796167101083949292009726268376 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 2), (16, 1)],
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 3), (13, 1), (16, 1)],
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-191785572529482776585847244347115193568 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-184285339636129210094342629183438494352 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1579705519055841436746045135907595098226 : Rat) / 26290704183569697982980208149202046403) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((465449443972525013791245823244622448 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((13553973298065694996640916889028624596538 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26975942967388811571292903450015998710087 : Rat) / 341779154386406073778742705939626603239) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-617637352911274843857450040052973681632 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4160486937915600606460786743878366155366 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7578335305401954826986289305654878315047 : Rat) / 732383902256584443811591512727771292655) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14084348494601433405703082083332728392028 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-52369356708363263624046053854432563248 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-35400130005276933484922765672029801344 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-13473694300964342820428736283446473011578 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1328559129644869579289846967333067294567 : Rat) / 34875423916980211610075786320370061555) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37727377225139558553878994788252913584 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4931968254107121451409235981817201246921 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-747046076064874633477146758656963703539 : Rat) / 28422382901156430251870495296434644760) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3230279026284996057748315816743212284 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13553973298065694996640916889028624596538 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((243557062242526294112781932665042711850561 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2936817802379299007228050737620641103581 : Rat) / 157744225101418187897881248895212278418) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((107507528230205613634320345245936345874 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-135091006266376252858968335305627633979441 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 2), (14, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (9, 2), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-26809273774287820923251069938967501580148 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((419581575590190997980924005166445220418 : Rat) / 33507760233961379782229677052904568945) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((59472990375732185316532461707725440444 : Rat) / 1184265954214851260494603970684776865) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((521775896325477762148550548939644331652 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((103756182425239484051113650658621272525884 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((105263268146110987992684965430996159695491 : Rat) / 525814083671393959659604162984040928060) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19632920749401589105160755027447113457675 : Rat) / 630976900405672751591524995580849113672) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3144642368933840872840382299837784416 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16239599176008083307813615939801565104 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1013364273073703996528784994550684736 : Rat) / 178848327779385700564491211899333649) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-225548582119555833684691169522478000772 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((44660653707242548742920525979357514656 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-126931049630423412006682188490501068966659 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1212715424850316616845500068580167006824 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((95892786264741388292923622173557596784 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((92142669818064605047171314591719247176 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-789852759527920718373022567953797549113 : Rat) / 26290704183569697982980208149202046403) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-232724721986262506895622911622311224 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26975942967388811571292903450015998710087 : Rat) / 683558308772812147557485411879253206478) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((308818676455637421928725020026486840816 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2080243468957800303230393371939183077683 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((7578335305401954826986289305654878315047 : Rat) / 1464767804513168887623183025455542585310) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7042174247300716702851541041666364196014 : Rat) / 5126687315796091106681140589094399048585) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(8, 2), (9, 2), (16, 1)],
  term ((-3230279026284996057748315816743212284 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13553973298065694996640916889028624596538 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((243557062242526294112781932665042711850561 : Rat) / 5126687315796091106681140589094399048585) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2936817802379299007228050737620641103581 : Rat) / 157744225101418187897881248895212278418) [(8, 2), (10, 1), (11, 2), (16, 1)],
  term ((-52369356708363263624046053854432563248 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-35400130005276933484922765672029801344 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((-13473694300964342820428736283446473011578 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1328559129644869579289846967333067294567 : Rat) / 34875423916980211610075786320370061555) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37727377225139558553878994788252913584 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4931968254107121451409235981817201246921 : Rat) / 394360562753545469744703122238030696045) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(8, 2), (10, 1), (14, 2), (16, 1)],
  term ((-11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-747046076064874633477146758656963703539 : Rat) / 28422382901156430251870495296434644760) [(8, 2), (10, 1), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((13404636887143910461625534969483750790074 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209790787795095498990462002583222610209 : Rat) / 33507760233961379782229677052904568945) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29736495187866092658266230853862720222 : Rat) / 1184265954214851260494603970684776865) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-260887948162738881074275274469822165826 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-51878091212619742025556825329310636262942 : Rat) / 569631923977343456297904509899377672065) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105263268146110987992684965430996159695491 : Rat) / 1051628167342787919319208325968081856120) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((19632920749401589105160755027447113457675 : Rat) / 1261953800811345503183049991161698227344) [(8, 2), (11, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1572321184466920436420191149918892208 : Rat) / 1251938294455699903951438483295335543) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8119799588004041653906807969900782552 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((112774291059777916842345584761239000386 : Rat) / 8763568061189899327660069383067348801) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-22330326853621274371460262989678757328 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (12, 1), (14, 2), (16, 1)],
  term ((126931049630423412006682188490501068966659 : Rat) / 3417791543864060737787427059396266032390) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-606357712425158308422750034290083503412 : Rat) / 43817840305949496638300346915336744005) [(8, 2), (12, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 3), (9, 1), (13, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 3), (9, 1), (15, 1), (16, 1)],
  term ((1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-243557062242526294112781932665042711850561 : Rat) / 10253374631592182213362281178188798097170) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 3), (11, 2), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 3), (12, 1), (14, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 3), (12, 1), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 3), (12, 2), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 3), (13, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 3), (14, 1), (15, 2), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 3), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 3), (14, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 3), (15, 2), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 3), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3144642368933840872840382299837784416 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16239599176008083307813615939801565104 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1013364273073703996528784994550684736 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-225548582119555833684691169522478000772 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((44660653707242548742920525979357514656 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-126931049630423412006682188490501068966659 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1212715424850316616845500068580167006824 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-26809273774287820923251069938967501580148 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((419581575590190997980924005166445220418 : Rat) / 33507760233961379782229677052904568945) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((59472990375732185316532461707725440444 : Rat) / 1184265954214851260494603970684776865) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((521775896325477762148550548939644331652 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((103756182425239484051113650658621272525884 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((105263268146110987992684965430996159695491 : Rat) / 525814083671393959659604162984040928060) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-19632920749401589105160755027447113457675 : Rat) / 630976900405672751591524995580849113672) [(9, 1), (11, 3), (16, 1)],
  term ((4661087912096012619023870478742986016 : Rat) / 6259691472278499519757192416476677715) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((26958610185209605458266451858512375386612 : Rat) / 569631923977343456297904509899377672065) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-145579045014493928304978079381824346671094 : Rat) / 1708895771932030368893713529698133016195) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4188437086507419647643100741857789056374 : Rat) / 43817840305949496638300346915336744005) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((779919797950572345077302293881708797908 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-519951168051391362018915453103379874571807 : Rat) / 5126687315796091106681140589094399048585) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4217942245655139998960338308475512055260373 : Rat) / 41013498526368728853449124712755192388680) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-191785572529482776585847244347115193568 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-184285339636129210094342629183438494352 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((95458785664081978068970921551011678172523 : Rat) / 1261953800811345503183049991161698227344) [(9, 2), (11, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1572321184466920436420191149918892208 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8119799588004041653906807969900782552 : Rat) / 6259691472278499519757192416476677715) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((506682136536851998264392497275342368 : Rat) / 178848327779385700564491211899333649) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((112774291059777916842345584761239000386 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-22330326853621274371460262989678757328 : Rat) / 6259691472278499519757192416476677715) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((126931049630423412006682188490501068966659 : Rat) / 3417791543864060737787427059396266032390) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-606357712425158308422750034290083503412 : Rat) / 43817840305949496638300346915336744005) [(9, 2), (12, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((95892786264741388292923622173557596784 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((92142669818064605047171314591719247176 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-3984104145930684593148639614612719087037 : Rat) / 131453520917848489914901040746010232015) [(9, 3), (11, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-232724721986262506895622911622311224 : Rat) / 1251938294455699903951438483295335543) [(9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26975942967388811571292903450015998710087 : Rat) / 683558308772812147557485411879253206478) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((308818676455637421928725020026486840816 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2080243468957800303230393371939183077683 : Rat) / 43817840305949496638300346915336744005) [(9, 3), (13, 1), (16, 1)],
  term ((7578335305401954826986289305654878315047 : Rat) / 1464767804513168887623183025455542585310) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((7042174247300716702851541041666364196014 : Rat) / 5126687315796091106681140589094399048585) [(9, 3), (15, 1), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 3), (15, 3), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 4), (11, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 300 through 399. -/
theorem ep_Q2_019_block_22_0300_0399_valid :
    checkProductSumEq ep_Q2_019_partials_22_0300_0399
      ep_Q2_019_block_22_0300_0399 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
